最近在写react的自定义hook，但总觉得不是很顺畅，或者说什么是最佳体验，于是看一下ahooks的代码，学习一下

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

### 2.useAsyncEffect
其实就是将异步函数包装了

里面有看到关于异步函数的处理：
- Symbol.asyncIterator
- `const result = await e.next()`
- cancleled

### 3.useControllableValue
就是从props中看看有没有对应字段，有的话就用它，没有再自己创建一个

### 4.useDeepCompareEffect
内部包装对deep的对比，只有深度对比不一样了才出发effect

### 5.useDocumentVisibility
document.visibilityState 页面可见

### 6.useEventEmitter
创建了一个eventbus - -

### 7.useInViewport

IntersectionObserver的使用

### 8.useKeyPress
可以参考一下对按键的响应设计

### 9.useLatest

其实就是多一层ref存储，这样子有些时候会因为闭包问题而拿到旧值的问题就不存在了

### 10.useLockFn

把函数进行包装，多了一个lock的状态，只有在函数执行完成的时候才可以下一次

这个好

### 11.useMemoizedFn

其实函数地址是会变的（如果直接使用的话），然后通过这个hook又包装了一下，返回一个固定的函数，这样子状态能拿到新的，地址又能不变

### 12.useReactive
通过Proxy让数据变成响应式的



整体看下来，其实没有太多的复杂的逻辑，但很多都不涉及异步或请求的，所以在数据变化方面没有太多坑



