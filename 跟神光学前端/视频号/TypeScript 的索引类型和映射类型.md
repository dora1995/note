TypeScript 的索引类型和映射类型

```
interface Obj {
  a: string;
  b: number;
}

// 有人说他是一个对象类型，也确实可以
// 它也可以作为抽象类的

class A implements Obj {
  a: string;
  b: number;
  constructor () {
    this.a = '1'
    this.b = 2
  }
}

```

索引类型：可以用不同的方式声明约定一些变量

映射类型：生成新的索引类型

```
type a = '1' $ string  => string
type b = 1 & string => never
`

看ts提供的工具api，和源码
