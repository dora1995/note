文章链接：https://mp.weixin.qq.com/s/RZoi7DZHAjU_qP8XUCuXMQ

用chrome devtools的network只能分析http请求，看不到tcp层的；因此可以借助抓包工具：**WireShark**

我看一开始，在服务返回header：connection：close，查了一下：
```
在http1.1中request和reponse header中都有可能出现一个connection头字段，此header的含义是当client和server通信时对于长链接如何进行处理

在http1.1中，client和server都是默认对方支持长链接的，如果client使用http1.1协议，但又不希望使用长链接，则需要在header中指明connection的值为close；如果server方也不想支持长链接，则在response中也需要明确说明connection的值为close

不论request还是response的header中包含了值为close的connection，**都表明当前正在使用的tcp链接在请求处理完毕后会被断掉**。以后client再进行新的请求时就必须创建新的tcp链接了。 HTTP Connection的 close设置允许客户端或服务器中任何一方关闭底层的连接双方都会要求在处理请求后关闭它们的TCP连接
```

也就是为了更好的查看到tcp连接与断开的过程

<img width="904" alt="image" src="https://user-images.githubusercontent.com/53267289/164129452-f5862ee1-4860-4c86-910e-88f5bb9802b5.png">

- TCP 是从端口到端口的传输协议，所以开始是源端口和目的端口
- 接下来是序列号（sequence number），表示当前包的序号，后面是确认的序列号（acknowledgment number），表示我收到了序号为 xxx 的包
- 红框标出的部分是flags标识位，通过 0、1 表示有没有
- SYN：请求建立一个连接（说明这是链接的开始）
- ACK：表示 ack number 是否是有效的
- FIN：表示本端要断开链接了（说明这是链接的结束）

<img width="887" alt="image" src="https://user-images.githubusercontent.com/53267289/164131017-859c0df5-6be1-4c30-88e2-f187643f6ca6.png">

有 SYN 标志位的是连接的开始，有 FIN 标志位的是连接的结束

-------

三次握手：

<img width="626" alt="image" src="https://user-images.githubusercontent.com/53267289/164131362-35c35568-c38b-4dd9-9bc8-837f92dc7d93.png">

其中有一个端口是 4000，这个是服务的端口，那另一个端口 57454 明显就是浏览器的端口

- 首先是浏览器向服务器发送了一个 SYN 的 TCP 请求，表示希望建立连接，序列号 Seq 是 0（相对值）
- 然后服务器向浏览器发送了一个 SYN 的 TCP 请求，表示希望建立连接，ACK 是 1（相对值），代表现在的 ack number 是有效的：就是上个 TCP 数据包的 seq 加 1，TCP 连接中就是通过返回 seq number + 1 作为 ack number 来确认收到的
- 然后又返回了一个 seq number 给浏览器，相对值是 0
- 浏览器收到后返回了一个 TCP 数据包给服务器，ack number 自然是 1，代表收到了连接请求
- 这样浏览器和服务器各自向对方发送了 SYN 的建立连接请求，并且都收到了对方的确认，那么 TCP 连接就建立成功了

要记住的点：SYN，ACK，ack，seq

------

四次挥手：

<img width="590" alt="image" src="https://user-images.githubusercontent.com/53267289/164132423-b31c74dd-3425-4e27-bf2d-14e5d14f253a.png">

- 浏览器向服务器发送了有 FIN 标志位的数据包，表示要断开连接：告诉服务器要断开了
- 然后服务端返回了 ACK 的包表示确认：收到，但是要等我一下
- 中间还可能继续传输数据
- 服务端发送了 FIN 标志位的数据包给浏览器，表示要断开连接：我要断开啦
- 浏览器收到后也返回了 ACK 的包表示确认：收到，我也关闭
- ack，seq作用同上

要记住的点：FIN，ACK，ack，seq

------

相对值 ack = seq + 1

绝对值 ack number = seq number + segment len


Q：为什么握手时三次，挥手是四次呢
- 挥手是一个 FIN，一个 ACK，一个 FIN + ACK，一个 ACK；握手是一个 SYN，一个 ACK + SYN，一个 ACK；不过是因为握手时把 ACK 和 SYN 合并到一个数据包了而已
- tcp请求是没有时效性的，如果遇到网络问题很容易受影响

总之，我们知道了HTTP 的请求和响应是通过序列号关联在一起的。就算同一个 TCP 链接并行发送多个 HTTP 的请求和响应，它们也能找到各自对应的那个。就是通过这个 seq number 和 ack number

上面的是用单次连接，然后用一下http1.1的keep-alive
```
res.setHeader('Connection', 'keep-alive)
res.setHeader('Keep-alive', 'timeout=10')
```
这时候再发请求，就只会建立一次连接了，可以看到在一个 TCP 连接内发送了多次 http 请求响应

细心的同学会发现只是浏览器向服务器发送了 FIN 数据包，服务器没有发给浏览器 FIN 数据包。这是因为 keep-alive 的 header 只是控制的浏览器的断开连接的行为，服务器的断开连接逻辑是独立的

我们分别测试了 Connection：close 和 Connection：keep-alive 的情况，发现确实 keep-alive 能减少频繁的连接建立和断开，能复用同一个 TCP 链接
