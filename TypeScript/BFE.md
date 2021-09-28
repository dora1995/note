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
