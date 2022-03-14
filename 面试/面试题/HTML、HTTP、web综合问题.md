### 1. 前端需要注意哪些SEO
- 合理的title、description、keywords：搜索对着三项的权重逐个减小，title值强调重点即可，重要关键词出现不要超过2次，而且要靠前，不同页面title要有所不同；description把页面内容高度概括，长度合适，不可过分堆砌关键词，不同页面description有所不同；keywords列举出重要关键词即可
- **语义化的HTML代码，符合W3C规范：语义化代码让搜索引擎容易理解网页**
- 重要内容HTML代码放在最前：搜索引擎抓取HTML顺序是从上到下，有的搜索引擎对抓取长度有限制，保证重要内容一定会被抓取
- **重要内容不要用js输出：爬虫不会执行js获取内容**
- **少用iframe：搜索引擎不会抓取iframe中的内容**
- 非装饰性图片必须加alt
- **提高网站速度：网站速度是搜索引擎排序的一个重要指标**

### 2. `<img>`的title和alt有什么区别
- 通常当鼠标滑动到元素上的时候显示
- alt是<img>的特有属性，是图片内容的等价描述，用于图片无法加载时显示、读屏器阅读图片。可提图片高可访问性，除了纯装饰图片外都必须设置有意义的值，搜索引擎会重点分析

### 3、从浏览器地址栏输入url到显示页面的步骤
https://github.com/dora1995/note/blob/main/%E9%9D%A2%E8%AF%95/%E4%BB%8E%E6%B5%8F%E8%A7%88%E5%99%A8%E5%9C%B0%E5%9D%80%E6%A0%8F%E8%BE%93%E5%85%A5url%E5%88%B0%E6%98%BE%E7%A4%BA%E9%A1%B5%E9%9D%A2%E7%9A%84%E8%BF%87%E7%A8%8B.md

### 4. 如何进行网站性能优化
https://github.com/dora1995/note/blob/main/%E9%9D%A2%E8%AF%95/%E5%89%8D%E7%AB%AF%E6%80%A7%E8%83%BD%E4%BC%98%E5%8C%96.md

### 5. Http状态码与含义
- 100 Continue 继续，一般在发送post请求时，已发送了http header之后服务端将返回此信息，表示确认，之后发送具体参数信息
- 200 OK 正常返回信息
- 201 Created 请求成功并且服务器创建了新的资源
- 202 Accepted 服务器已接受请求，但尚未处理
- 301 Moved Permanently 请求的网页已永久移动到新位置。
- 302 Found 临时性重定向。
- 303 See Other 临时性重定向，且总是使用 GET 请求新的 URI。
- 304 Not Modified 自从上次请求后，请求的网页未修改过。
- 400 Bad Request 服务器无法理解请求的格式，客户端不应当尝试再次使用相同的内容发起请求。
- 401 Unauthorized 请求未授权。
- 403 Forbidden 禁止访问。
- 404 Not Found 找不到如何与 URI 相匹配的资源。
- 500 Internal Server Error 最常见的服务器端错误。
- 503 Service Unavailable 服务器端暂时无法处理请求（可能是过载或维护）。

### 6. html5有哪些新特性
- **新增选择器 document.querySelector、document.querySelectorAll**
- **拖拽释放(Drag and drop) API**
- **媒体播放的 video 和 audio**
- **本地存储 localStorage 和 sessionStorage**
- 离线应用 manifest
- 桌面通知 Notifications
- **语意化标签 article、footer、header、nav、section**
- **增强表单控件 calendar、date、time、email、url、search**
- 地理位置 Geolocation
- **多任务 webworker**
- **全双工通信协议 websocket**
- **历史管理 history**
- 跨域资源共享(CORS) Access-Control-Allow-Origin
- 页面可见性改变事件 visibilitychange
- **跨窗口通信 PostMessage**
- Form Data 对象
- **绘画 canvas**
- `data-*` 为元素增加自定义属性

### 7. 请描述一下 cookies，sessionStorage 和 localStorage 的区别
cookie：
- 是网站为了标示用户身份而储存在用户本地终端上的数据
- 始终在同源的http请求中携带（即使不需要）
- 大小4k
- 可以设置过期时间，设置已经过去的时间删除cookie

localStorage/sessionStorage：
- 不会自动把数据发给服务器，仅在本地保存
- H5新特性
- session在页面关闭时清除，local永久存在
- 大小5m

### 8. iframe有那些缺点
- **iframe会阻塞主页面的Onload事件**
- **搜索引擎的检索程序无法解读这种页面，不利于SEO**
- iframe和主页面**共享连接池**，而浏览器对相同域的连接有限制，所以会影响页面的并行加载
- 使用iframe之前需要考虑这两个缺点。如果需要使用iframe，最好是通过javascript动态给iframe添加src属性值，这样可以绕开以上两个问题

### 9. 行内元素和块级元素有什么区别？
- 行内元素不可以设置宽高，不独占一行
- 块级元素可以设置宽高，独占一行

### 10. Canvas和SVG有什么区别？
- svg绘制出来的每一个图形的元素都是独立的DOM节点，能够方便的绑定事件或用来修改。canvas输出的是一整幅画布
- svg输出的图形是矢量图形，后期可以修改参数来自由放大缩小，不会失真和锯齿。而canvas输出标量画布，就像一张图片一样，放大会失真或者锯齿

### 11. viewport
```
 <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
// width            设置viewport宽度，为一个正整数，或字符串‘device-width’
// device-width     设备宽度
// height           设置viewport高度，一般设置了宽度，会自动解析出高度，可以不用设置
// initial-scale    默认缩放比例（初始缩放比例），为一个数字，可以带小数
// minimum-scale    允许用户最小缩放比例，为一个数字，可以带小数
// maximum-scale    允许用户最大缩放比例，为一个数字，可以带小数
// user-scalable    是否允许手动缩放
```
Q:怎样处理移动端1px被渲染成2px问题
A:
```
1.局部处理
- meta标签中的 viewport属性 ，initial-scale 设置为 1 
- rem 按照设计稿标准走，外加利用transform 的scale(0.5) 缩小一倍即可；
2.全局处理
- meta标签中的 viewport属性 ，initial-scale 设置为 0.5
- rem 按照设计稿标准走即可
```

### 12. div+css的布局较table布局有什么优点？
- 改版的时候更方便 只要改css文件。
- 页面加载速度更快、结构化清晰、页面显示简洁。
- 表现与结构相分离。
- 易于优化（seo）搜索引擎更友好，排名更容易靠前。

### 13. 你能描述一下渐进增强和优雅降级之间的不同吗
- 渐进增强：针对低版本浏览器进行构建页面，保证最基本的功能，然后再针对高级浏览器进行效果、交互等改进和追加功能达到更好的用户体验。
- 优雅降级：一开始就构建完整的功能，然后再针对低版本浏览器进行兼容。

区别：优雅降级是从复杂的现状开始，并试图减少用户体验的供给，而渐进增强则是从一个非常基础的，能够起作用的版本开始，并不断扩充，以适应未来环境的需要。降级（功能衰减）意味着往回看；而渐进增强则意味着朝前看，同时保证其根基处于安全地带

### 14. 为什么利用多个域名来存储网站资源会更有效？
- CDN缓存更方便
- 突破浏览器并发限制
- 节约cookie带宽
- 节约主域名的连接数，优化页面响应速度
- 防止不必要的安全问题

### 15. 简述一下src与href的区别
- src用于替换当前元素，href用于在当前文档和引用资源之间确立联系。
- src是source的缩写，指向外部资源的位置，指向的内容将会嵌入到文档中当前标签所在位置；在请求src资源时会将其指向的资源下载并应用到文档内，例如js脚本，img图片和frame等元素
- href是Hypertext Reference的缩写，指向网络资源所在位置，建立和当前元素（锚点）或当前文档（链接）之间的链接，如果我们在文档中添加
- `<link href="common.css" rel="stylesheet"/>`那么浏览器会识别该文档为css文件，就会并行下载资源并且不会停止对当前文档的处理。这也是为什么建议使用link方式来加载css，而不是使用@import方式

`<script src ="js.js"></script>`当浏览器解析到该元素时，会暂停其他资源的下载和处理，**直到将该资源加载、编译、执行完毕**，图片和框架等元素也如此，类似于将所指向资源嵌入当前标签内。这也是为什么将js脚本放在底部而不是头部

### 16. 知道的网页制作会用到的图片格式有哪些？

png-8、png-24、jpeg、gif、svg，但是上面的那些都不是面试官想要的最后答案。面试官希望听到是Webp,Apng。（是否有关注新技术，新鲜事物）

- Webp：WebP格式，谷歌（google）开发的一种旨在加快图片加载速度的图片格式。图片压缩体积大约只有JPEG的2/3，并能节省大量的服务器带宽资源和数据空间。Facebook Ebay等知名网站已经开始测试并使用WebP格式。
- 在质量相同的情况下，WebP格式图像的体积要比JPEG格式图像小40%。
- Apng：全称是“Animated Portable Network Graphics”, 是PNG的位图动画扩展，可以实现png格式的动态图片效果。04年诞生，但一直得不到各大浏览器厂商的支持，直到日前得到 iOS safari 8的支持，有望代替GIF成为下一代动态图标准

### 17. 一个页面上有大量的图片（大型电商网站），加载很慢，你有哪些方法优化这些图片的加载，给用户更好的体验

- 图片懒加载，在页面上的未可视区域可以添加一个滚动事件，判断图片位置与浏览器顶端的距离与页面的距离，如果前者小于后者，优先加载。
- 如果为幻灯片、相册等，可以使用图片预加载技术，将当前展示图片的前一张和后一张优先下载。
- 如果图片为css图片，可以使用CSSsprite，SVGsprite，Iconfont、Base64等技术。
- 如果图片过大，可以使用特殊编码的图片，加载时会先加载一张压缩的特别厉害的缩略图，以提高用户体验。
- 如果图片展示区域小于图片的真实大小，则因在服务器端根据业务需要先行进行图片压缩，图片压缩后大小与展示一致。

### 18. 排序有哪些

- 直接插入
- 希尔排序
- 冒泡排序
- 快速排序
- 选择排序
- 堆排序
- 归并排序

### 19. HTTP request报文结构是怎样的

- 首行是Request-Line包括：请求方法，请求URI，协议版本，CRLF
- 首行之后是若干行请求头，包括general-header，request-header或者entity-header，每个一行以CRLF结束
- 请求头和消息实体之间有一个CRLF分隔
- 根据实际请求需要可能包含一个消息实体 一个请求报文例子如下：

```
GET /Protocols/rfc2616/rfc2616-sec5.html HTTP/1.1
Host: www.w3.org
Connection: keep-alive
Cache-Control: max-age=0
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36
Referer: https://www.google.com.hk/
Accept-Encoding: gzip,deflate,sdch
Accept-Language: zh-CN,zh;q=0.8,en;q=0.6
Cookie: authorstyle=yes
If-None-Match: "2cc8-3e3073913b100"
If-Modified-Since: Wed, 01 Sep 2004 13:24:52 GMT

name=qiu&age=25
```

### 20. HTTP response报文结构是怎样的
- 首行是状态行包括：HTTP版本，状态码，状态描述，后面跟一个CRLF
- 首行之后是若干行响应头，包括：通用头部，响应头部，实体头部
- 响应头部和响应实体之间用一个CRLF空行分隔
- 最后是一个可能的消息实体 响应报文例子如下：

```
HTTP/1.1 200 OK
Date: Tue, 08 Jul 2014 05:28:43 GMT
Server: Apache/2
Last-Modified: Wed, 01 Sep 2004 13:24:52 GMT
ETag: "40d7-3e3073913b100"
Accept-Ranges: bytes
Content-Length: 16599
Cache-Control: max-age=21600
Expires: Tue, 08 Jul 2014 11:28:43 GMT
P3P: policyref="http://www.w3.org/2001/05/P3P/p3p.xml"
Content-Type: text/html; charset=iso-8859-1

{"name": "qiu", "age": 25}
```

### 21. 请你谈谈Cookie的弊端

- cookie虽然在持久保存客户端数据提供了方便，分担了服务器存储的负担，但还是有很多局限性的
- 每个特定的域名下最多生成20个cookie？
- IE6或更低版本最多20个cookie，IE7和之后的版本最后可以有50个cookie，Firefox最多50个cookie，chrome和Safari没有做硬性限制？
- cookie 的最大大约为 4096 字节，为了兼容性，一般设置不超过 4095 字节
- 如果 cookie 被人拦截了，就可以取得所有的 session 信息
