参考资料：
1. https://juejin.cn/post/6894204813970997256
2. https://www.bilibili.com/video/BV12i4y1L7nq


### 一、新的JSX转换

在React17之前，若要使用JSX，则需要先引入React：`import React from 'react`，否则会报错，这是因为旧的JSX转换会把JSX转换为`React.createElement(...)`调用；除了增加学习成本，
还有无法做到性能调优和简化，如createElement里还要动态做children的拼接、依赖于React的导入等等

在React17，可以单独使用JSX而无需引入React，**这是因为新的JSX转换不会讲JSX转换为React.createElement，而是自动从React的pageage中引入新的入口函数并调用**

Q：是如何改变的，改变成什么样的方式（源码）

### 二、事件委托的变更

在React16或更早版本中，React会由于事件委托对大多数事件执行document.addEventListener()。但是一旦你只想要局部使用React，那么React中的事件也会影响全局：比如与React不相关的事件，也会被触发到

因此React17**不再将事件添加在document上，而是添加到渲染React树的根DOM上**；

![image](https://user-images.githubusercontent.com/53267289/130011244-26e0fce2-ac20-4125-910a-accfe2a40b8c.png)

自从其发布以来，React 一直自动进行事件委托。当触发 DOM 事件时，React 会找出调用的组件，然后 React 事件会在组件中向上 “冒泡”。这被称为事件委托。除了在大型应用程序上具有性能优势外，它还使添加类似于 replaying events 这样的新特性变得更加容易

### 三、事件系统的相关更改

React17中onScroll事件不再冒泡，以防止出现常见的混淆

React的onFocus和onBlur事件已在底层切换为原生的focusin和focusout事件。它们更接近React现有行为，有时还会提供额外的信息

捕获事件（例如，onClickCapture）现在使用的是实际浏览器中的捕获监听器

### 四、
