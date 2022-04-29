最近在写react的自定义hook，但总觉得不是很顺畅，或者说什么是最佳体验，于是看一下ahooks的代码，学习一下

先看state相关的
## State

### 1.useSetState
https://ahooks.js.org/zh-CN/hooks/use-set-state

实现与class组件的setState一样的效果，即可以单独更新对象中的某一个值；关键逻辑：劫持setState，对返回结果进行一次处理，简单版：

```
const useState = (initData) => {
  const [state, setState] = useState(initData)
  const setMergeState = useCallback((patch) => {
    setState((prevState) => {
      const newState = isFunction(patch) ? patch(prevState) : patch
      return newState ? { ...prevState, ...newState } : prevState
    })
  }, [])
  return [state, setMergeState]
}
```



### useInfiniteScroll

https://ahooks.js.org/zh-CN/hooks/use-infinite-scroll

可以理解为自动拼接数组数据
