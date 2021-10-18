21.`implement LastItem<T>`

```
// 请实现LastItem<T>用以返回tuple的最后一个type
type A = LastItem<[string, number, boolean]> // boolean
type B = LastItem<['B', 'F', 'E']> // 'E'
type C = LastItem<[]> // never
```

```
LastItem<T> = T extends [...infer B, infer A] ? A : never
```


22.`implement StringToTuple<T>`

```
// 请实现StringToTuple<T>将字符串拆散为tuple
type A = StringToTuple<'BFE.dev'> // ['B', 'F', 'E', '.', 'd', 'e','v']
type B = StringToTuple<''> // []
```

```
type StringToTuple<T extends string> = T extends `${infer F}${infer L}` ? [F, ...StringToTuple<L>] : []
```

23.`implement LengthOfTuple<T>`

```
// 请实现LengthOfTuple<T>返回tuple type的长度
type A = LengthOfTuple<['B', 'F', 'E']> // 3
type B = LengthOfTuple<[]> // 0
```

```
type LengthOfTuple<T extends any[]> = T['length']
```

24.`implement LengthOfString<T>`

```
// 请实现LengthOfString<T>用以返回字符串长度
type A = LengthOfString<'BFE.dev'> // 7
type B = LengthOfString<''> // 0
```

```
type StringToTuple<T> = T extends `${infer F}${infer L}` ? [F, ...StringToTuple<L>] : []
type LengthOfTuple<T extends any[]> = T['length']
type LengthOfString<T extends string> = LengthOfTuple<StringToTuple<T>>
```

25.`implement UnwrapPromise<T>`

```
// Implement UnwrapPromise<T> to return the resolved type of a promise.
type A = UnwrapPromise<Promise<string>> // string
type B = UnwrapPromise<Promise<null>> // null
type C = UnwrapPromise<null> // Error
```

```
type UnwrapPromise <T extends any> = T extends Promise<infer A> ? A : Error
```

26.`ReverseTuple<T>`

```
// Implement ReverseTuple<T> to reverse a tuple type
type A = ReverseTuple<[string, number, boolean]> // [boolean, number, string]
type B = ReverseTuple<[1,2,3]> // [3,2,1]
type C = ReverseTuple<[]> // []
```

```
type ReverseTuple<T extends any[]> = T extends [first: infer A, ...other: infer B] ? [...ReverseTuple<B>, A] : []
```

27.`Flat<T>`

```
// Implement Flat<T> to flatten a tuple type
type A = Flat<[1,2,3]> // [1,2,3]
type B = Flat<[1,[2,3], [4,[5,[6]]]]> // [1,2,3,4,5,6]
type C = Flat<[]> // []
```

```
type Flat<T extends any[]> = T extends [first: infer A, ...other: infer B] ? A extends any[] ? [...Flat<A>, ...Flat<B>] : [A, ...Flat<B>] : [] 
```

28.`IsEmptyType<T>`

```
// Implement IsEmptyType<T> to check if T is empty type {}
type A = IsEmptyType<string> // false
type B = IsEmptyType<{a: 3}> // false
type C = IsEmptyType<{}> // true
type D = IsEmptyType<any> // false
type E = IsEmptyType<object> // false
type F = IsEmptyType<Object> // false
```

```
type IsEmptyType<T> = T extends {[key:string]:string}? [keyof T] extends [never] ?  true : false : false  
```

29.`Shift<T>`

```
// 请实现Shift<T>来去掉tuple的第一个元素
type A = Shift<[1,2,3]> // [2,3]
type B = Shift<[1]> // []
type C = Shift<[]> // []
```

```
type Shift<T extends any[]> = T extends [infer A, ...infer B] ? [...B] : []
better: type Shift<T extends any[]> = T extends [any, ...infer S] ? [...S] : []
```

30.`IsAny<T>`

```
// 请实现IsAny<T>
type A = IsAny<string> // false
type B = IsAny<any> // true
type C = IsAny<unknown> // false
type D = IsAny<never> // false
```

```
暂不理解，后面做
```

31.`Push<T, I>`

```
type A = Push<[1,2,3], 4> // [1,2,3,4]
type B = Push<[1], 2> // [1, 2]
type C = Push<[], string> // [string]
```

```
type Push<T extends any[], I> = [...T, I]
```

32.`RepeatString<T, C>`

```
type A = RepeatString<'a', 3> // 'aaa'
type B = RepeatString<'a', 0> // ''
```

```
暂不理解，后面做
```

33.`TupleToString<T>`

```
type A = TupleToString<['a']> // 'a'
type B = TupleToString<['B', 'F', 'E']> // 'BFE'
type C = TupleToString<[]> // ''
```

```
type TupleToString<T extends string[]> = 
  T extends [infer U,...infer R] ? R extends string[] ? `${T[0]}${TupleToString<R>}` : `${T[0]}` : ''
```


