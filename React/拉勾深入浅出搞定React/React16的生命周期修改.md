对React15与16版本的生命周期进行探讨、对比和总结


虚拟DOM：核心算法的基石：生成虚拟DOM调用React.render方法实现转换 -> 组件更新再次生成新的虚拟DOM，然后借助didd算法定位两次虚拟DOM的差异，然后做定向更新

生命周期的本质：组件的灵魂与躯干

render函数的重要性，组件与虚拟DOM都围绕在它

### React15的生命周期
```
constructor()
componentWillReceiveProps()
shouldComponentUpdate()
componentWillMount()
componentWillUpdate()
componentDidUpdate()
componentDidMount()
render()
componentWillUnmount()
```
他们的执行顺序是这样的：
![image](https://user-images.githubusercontent.com/53267289/125733416-37a92aea-c127-4d0c-a58b-13c18224910d.png)

如果父组件导致组件重新渲染，即使props没有更改也会调用 componentReceiveProps；如果只想处理更改，要进行对比；由父组件的更新触发的


### React16的生命周期

很棒的一个流程链接：https://projects.wojtekmaj.pl/react-lifecycle-methods-diagram/

> 这里之所以特意将版本号精确到了小数点后面一位，是因为在React 16.4之后，React 生命周期在之前版本的基础上又经历了一次微调

```
constructor()
getDerivedStateFormProps()*
shouldComponentUpdate()
render()
componentDidMount()
getSnapshotBeforeUpdate()*
componentDidUpdate
componentWillUnmount()
```

#### getDerivedStateFormProps
- getDerivedStateFormProps是一个静态方法，内部是访问不到this的
- 该方法接收两个参数props，state，分别代表当前组件接收到的来自父组件的props和当前组件自身的state
- 需要一个对象格式的返回值，React会根据它来更新组件的state：非覆盖，针对某个属性的定向更新


### 15与16的对比
1. 挂载阶段，componentWillMount移除，getDerivedStateFormProps新增：getDerivedStateFromProps 这个 API，其设计的初衷不是试图替换掉 componentWillMount，而是试图替换掉 componentWillReceiveProps，因此它有且仅有一个用途：**使用 props 来派生/更新 state**
