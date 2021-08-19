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

### 四、去除事件池

在React17以前，如果想要用异步的方式使用事件e，则必须先调用调用 e.persist() 才可以，这是因为 React 在旧浏览器中重用了不同事件的事件对象，以提高性能，并将所有事件字段在它们之前设置为 null
```
function FunctionComponent(props) {
  const [val, setVal] = useState("");

  const handleChange = e => {
    // setVal(e.target.value);
    
    // React 17以前，如果想用异步的方式使用事件e，必须要加上下面的e.persist()才可以
    // e.persist();
    // setVal(data => e.target.value);
  };
  return (
    <div className="border">
      <input type="text" value={val} onChange={handleChange} />
    </div>
  );
}
```

### 五、副作用清理事件
React17以前，当组件被卸载时，useEffect和useLayoutEffect的清理函数都是同步运行，但是对于大型应用程序来说，这不是理想选择，因为同步会减缓屏幕的过渡（例如，切换标签），因此React 17中的useEffect的清理函数异步执行，也就是说如果要卸载组件，则清理会在屏幕更新后运行。如果你某些情况下你仍然希望依靠同步执行，可以用 useLayoutEffect

**在React中的UseEffect中，若有使用到引用类型，最好先对其值进行保存，因为其是异步执行的，可能值会变更从而引发错误**

### 六、启发式更新算法更新

React 17中更新了启发式更新算法，具体表现为曾经用于标记fiber节点更新优先级的expirationTime换成了为lanes，前者为普通数字，而后者则为32位的二进制，了解二进制运算的都比较熟悉了，这种二进制的lanes是可以指定几个优先级的，而不是像以前expirationTime只能标记一个

之所以做这种改变，原因就是在于expirationTimes模型不能满足IO操作

