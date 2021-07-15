对React15与16版本的生命周期进行探讨、对比和总结


虚拟DOM：核心算法的基石：生成虚拟DOM调用React.render方法实现转换 -> 组件更新再次生成新的虚拟DOM，然后借助didd算法定位两次虚拟DOM的差异，然后做定向更新

生命周期的本质：组件的灵魂与躯干

render函数的重要性，组件与虚拟DOM都围绕在它

React15的生命周期
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
