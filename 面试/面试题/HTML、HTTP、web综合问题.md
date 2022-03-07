### 1. 前端需要注意哪些SEO
- 合理的title、description、keywords：搜索对着三项的权重逐个减小，title值强调重点即可，重要关键词出现不要超过2次，而且要靠前，不同页面title要有所不同；description把页面内容高度概括，长度合适，不可过分堆砌关键词，不同页面description有所不同；keywords列举出重要关键词即可
- **语义化的HTML代码，符合W3C规范：语义化代码让搜索引擎容易理解网页**
- 重要内容HTML代码放在最前：搜索引擎抓取HTML顺序是从上到下，有的搜索引擎对抓取长度有限制，保证重要内容一定会被抓取
- **重要内容不要用js输出：爬虫不会执行js获取内容**
- **少用iframe：搜索引擎不会抓取iframe中的内容**
- 非装饰性图片必须加alt
- **提高网站速度：网站速度是搜索引擎排序的一个重要指标**

### 2. <img>的title和alt有什么区别
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

