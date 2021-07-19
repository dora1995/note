> React 的核心特征是“数据驱动视图”：React 的视图会随着数据的变化而变化

基于props的单向数据流：组件从概念上类似于javascript函数，它接受任意的入参并返回用于描述页面展示内容的react元素；所谓单向数据流，指的是当前组件的state以props的形式流动时，只能流向比自己层级更低的组件


props使用的三种场景：

父-子组件通讯：直接传递props即可
子-父组件通讯：因为props是单向的，子组件不能直接把自己的数据塞给父组件，但父组件可以传递给子组件一个绑定自身上下文的函数给予子组件调用
兄弟组件通讯：兄弟组件之间共享同一个父组件，这是重要的先决条件；然后通过兄弟1-父组件-兄弟2的方式进行交互

不推荐用props解决其他场景的需求：不是不能用，而是通过简单的props传递完成复杂的通信需求，往往会得不偿失，导致嵌套过多

可以使用其他方式来替代：
- 发布订阅模式驱动数据流（发布订阅模式学习一下）
- Context API：React 官方提供的一种组件树全局通信的方式

Context API：
- createContext
- Provider
- Consumer

Q：新的Context API解决了什么问题
A：之前的Context存在的问题：代码不够优雅与明确，一眼望去无法很快分辨谁是Provider，谁是Consumer，琐碎的属性设置使得体验不是很好；数据的更新可能无法通知到后代组件，即无法保持数据的一致性


Redux：
Redux是如何帮助React管理数据的：Redux主要由三部分组成：store、reducer和action，三者紧密协作，保持在整个工作过程中数据流是严格单向的

Redux 通过提供一个统一的状态容器，使得数据能够自由而有序地在任意组件之间穿梭，这就是 Redux 实现组件间通信的思路

从编码的角度理解Redux工作流：

1. 使用createStore完成store对象的创建
2. reducer的作用是将新的state返回给store，reducer一定是一个纯函数，最终返回一个state
3. action 的作用是通知 reducer “让改变发生”
4. 派发 action，靠的是 dispatch
