```
// 重载的三种写法

declare function fun (name: string): void;
declare function fun (age: number): void


interface func {
  (name: string): void;
  (age: number): void
}

type fun = ((name: string) => void) & (age: number) => void)
```

有时候要写的重载很多，有没有便利的方式，通过写一个数组直接生成，通过交叉的方式

```
type eventType = ['hello', 'world', 'yes']

type ReturnType = {
  hello: string;
  world: void;
  yes: number;
}

type TupleToIntersectionFunction<Tuple extends unknown[]> = 
  Tuple extends [infer First, ...infer Rest]
    ? First extends keyof ReturnType
      ? ((params: First) => ReturnType[First]) & TupleToIntersectionFunction<Rest>
      : never
    : {}
```

