对于前端路由来说， hash 和 history 都可以用于前后端分离项目，且两者有各自的特点和各自的使用场景，在使用过程中主要要了解当前项目所处的场景，以便于更好地判断使用哪一种路由模式更佳

一、前端路由原理

1、SPA
SPA，即单页面应用(Single Page Application)。所谓单页Web应用，就是只有一张 Web 页面的应用。单页应用程序 (SPA) 是加载单个 HTML 页面并在用户与应用程序交互时动态更新该页面的 Web 应用程序。浏览器一开始会加载必需的 HTML 、 CSS 和 JavaScript ，所有的操作都在这张页面上完成，都由 JavaScript 来控制。
现如今，为了配合单页面 Web 应用快速发展的节奏，各类前端组件化技术栈层出不穷。近几年来，通过不断的版本迭代，vue和react两大技术栈脱颖而出，成为当下最受欢迎的两大技术栈。

2、什么时候需要路由
对于现代开发的项目来说，稍微复杂一点的SPA ，都需要用到路由


二、Hash模式

1、定义
hash 模式是一种把前端路由的路径用井号 # 拼接在真实 url 后面的模式。当井号 # 后面的路径发生变化时，浏览器并不会重新发起请求，而是会触发**onhashchange**事件


2、网页url组成部分

- location.protocal协议
- location.hostname主机名
- location.host主机
- location.port端口号
- location.patchname访问页面
- location.search搜索内容
- location.hash哈希值


（2）演示
下面用一个网址来演示以上属性：
//http://127.0.0.1:8001/01-hash.html?a=100&b=20#/aaa/bbb
location.protocal // 'http:'
localtion.hostname // '127.0.0.1'
location.host // '127.0.0.1:8001'
location.port //8001
location.pathname //'01-hash.html'
location.serach // '?a=100&b=20'
location.hash // '#/aaa/bbb'

3、hash的特点

- hash变化会触发网页跳转，即浏览器的前进和后退
- hash可以改变url，但是不会触发页面重新加载（hash的改变是记录在 window.history中），即不会刷新页面。也就是说，所有页面的跳转都是在客户端进行操作。这并不算是一次 http 请求，所以这种模式不利于SEO优化。hash只能修改#后面的部分，所以只能跳转到与当前url同文档的url
- hash 通过 window.onhashchange 的方式，来监听 hash 的改变，借此实现无刷新跳转的功能
- hash 永远不会提交到server端（可以理解为只在前端自生自灭）

三、History模式

1、定义
**history API 是H5提供的新特性，允许开发者直接更改前端路由，即更新浏览器 URL 地址而不重新发起请求**

2、与hash的区别
我们用一个例子来演示， hash 与 history 在浏览器下刷新时的区别

正常页面浏览

https://github.com/xxx 刷新页面

https://github.com/xxx/yyy 刷新页面

https://github.com/xxx/yyy/zzz 刷新页面

改造H5 history模式
https://github.com/xxx 刷新页面

https://github.com/xxx/yyy 前端跳转，不刷新页面

https://github.com/xxx/yyy/zzz 前端跳转，不刷新页面

3、history的API

下面阐述几种 HTML5 新增的 history API

- history.pushState
- history.replaceState
- history.state
- window.onpopstate


4、history的特点

- 新的 url 可以是与当前 url 同源的任意 url ，也可以是与当前 url 一样的地址，但是这样会导致的一个问题是，会把重复的这一次操作记录到栈当中。
- 通过 history.state ，添加任意类型的数据到记录中。
- 可以额外设置 title 属性，以便后续使用。
- 通过pushState 、 replaceState 来实现无刷新跳转的功能。

5、存在问题

对于 history 来说，确实解决了不少 hash 存在的问题，但是也带来了新的问题。具体如下：
使用 history 模式时，在对当前的页面进行刷新时，此时浏览器会重新发起请求。如果nginx没有匹配得到当前的url，就会出现 404 的页面；而对于hash模式来说，它虽然看着是改变了 url ，但不会被包括在 http 请求中。所以，它算是被用来指导浏览器的动作，并不影响服务器端。因此，改变 hash 并没有真正地改变 url ，所以页面路径还是之前的路径， nginx 也就不会拦截。

6、两者选择

下面我们再来介绍下在实际的项目中，如何对这两者进行选择。具体如下：

to B 的系统推荐用 hash ，相对简单且容易使用，且因为 hash 对 url 规范不敏感；
to C 的系统，可以考虑选择 H5 history ，但是需要服务端支持；

能先用简单的，就别用复杂的，要考虑成本和收益
