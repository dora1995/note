### 1. css sprite是什么,有什么优缺点
概念：将多个小图片拼接到一个图片中。通过background-position和元素尺寸调节需要显示的背景图案。

优点：

- 减少HTTP请求数，极大地提高页面加载速度
- 增加图片信息重复度，提高压缩比，减少图片大小
- 更换风格方便，只需在一张或几张图片上修改颜色或样式即可实现


缺点：

- 图片合并麻烦
- 维护麻烦，修改一个图片可能需要从新布局整个图片，样式

### 2. display:none;与visibility: hidden;的区别

联系：它们都能让元素不可见

区别：

- display:none;会让元素完全从渲染树中消失，渲染的时候不占据任何空间；visibility: hidden;不会让元素从渲染树消失，渲染师元素继续占据空间，只是内容不可见
- display: none;是非继承属性，子孙节点消失由于元素从渲染树消失造成，通过修改子孙节点属性无法显示；visibility: hidden;是继承属性，子孙节点消失由于继承了hidden，通过设置visibility: visible;可以让子孙节点显式
- 修改常规流中元素的display通常会造成文档重排。修改visibility属性只会造成本元素的重绘。
- 读屏器不会读取display: none;元素内容；会读取visibility: hidden;元素内容

### 3. link与@import的区别
- link是HTML方式， @import是CSS方式
- link最大限度支持并行下载，@import过多嵌套导致串行下载，出现FOUC(文档样式短暂失效)
- link可以通过rel="alternate stylesheet"指定候选样式
- 浏览器对link支持早于@import，可以使用@import对老浏览器隐藏样式
- @import必须在样式规则之前，可以在css文件中引用其他文件
- 总体来说：link优于@import

### 4. 如何创建块级格式化上下文(block formatting context),BFC有什么用
BFC(Block Formatting Context)，块级格式化上下文，是一个独立的渲染区域，让处于 BFC 内部的元素与外部的元素相互隔离，使内外元素的定位不会相互影响

触发条件 (以下任意一条)

- float的值不为none
- overflow的值不为visible
- display的值为table-cell、tabble-caption和inline-block之一
- position的值不为static或则releative中的任何一个
- 在IE下, 可通过zoom:1 触发

BFC布局与普通文档流布局区别 

普通文档流布局:

- 浮动的元素是不会被父级计算高度
- 非浮动元素会覆盖浮动元素的位置
- margin会传递给父级元素
- 两个相邻元素上下的margin会重叠

BFC布局规则:

- 浮动的元素会被父级计算高度(父级元素触发了BFC)
- 非浮动元素不会覆盖浮动元素的位置(非浮动元素触发了BFC)
- margin不会传递给父级(父级触发BFC)
- 属于同一个BFC的两个相邻元素上下margin会重叠

开发中的应用

- 阻止margin重叠
- 可以包含浮动元素，清除内部浮动(清除浮动的原理是两个div都位于同一个BFC区域之中)
- 可以阻止元素被浮动元素覆盖

### 5. 清除浮动的几种方式，各自的优缺点
- 父级div定义height
- 结尾处加空div标签clear:both
- **父级div定义伪类:after和zoom**
- 父级div定义overflow:hidden
- 父级div也浮动，需要定义宽度
- 结尾处加br标签clear:both


比较好的是第3种方式，好多网站都这么用







