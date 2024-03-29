### 模块化

在我们早期编写JavaScript时，我们只需要在script标签内写入代码就可以满足我们页面交互的需要。但随着时间的推移，原本的那种简单粗暴的编写方式所带来了一系列问题，如：页面复杂，逻辑混乱，可维护性差，全局变量暴露，为了解决这些问题提出了很种的解决方案，其中之一就是JavaScript模块化编程。总的来说，它有以下几个优点：

- 开发效率高，有利于多人协同开发。
- 职责单一，方便代码复用和维护 。
- 解决项目中的全局变量污染的问题。
- 解决文件依赖问题，无需关注引用文件的顺序。

在ES6标准发布后，module成为标准，标准的使用是以export指令导出接口，以import引入模块

而在node模块中，我们采用的是CommonJS规范，使用require引入模块，使用module.exports导出接口


参考：
- https://github.com/mqyqingfeng/Blog/issues/108
- https://juejin.cn/post/6844903520865386510
