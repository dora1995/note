
```
function _new(ctor, ...args) {
  // 如果不是函数不能继续
  if (typeof ctor !== 'function') {
     throw 'ctor must be a function';
  }
  // 1.新建一个空对象
  const obj = Object.create(null);
  // 2.将对象的原型指向函数的原型
  obj.__proto = ctor.prototype
  // 3.将对象代入函数的this中执行
  const res = ctor.apply(obj, [...args]);
  // 4.一些特性判断
  const isObject = typeof res === 'object' && res !== null;
  const isFunction = typeof res === 'function';
  return isObject || isFunction ? res : obj;
};

```
