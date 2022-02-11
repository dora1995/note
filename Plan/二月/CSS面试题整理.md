### 1. 如何画一个三角形
结合元素四个方向的边框宽度与颜色效果（边框的均分原理）

```css
div { 
  width:0px;
  height:0px;
  border-top:10px solid red; 
  border-right:10px solid transparent; 
  border-bottom:10px solid transparent; 
  border-left:10px solid transparent; 
}
```

### 2.盒子模型

（CSS3）box-sizing：border-box/content-box/(padding-box,firefox才有)

盒子模型有两种，分别是ie盒子模型和标准盒子模型

标准盒子模型的范围包括margin、border、padding、content，width为content的宽度值
ie盒子模型的范围也包括margin、border、padding、content，width包含content、padding、border三者的宽度和

![image](https://user-images.githubusercontent.com/53267289/153403558-858c7b9b-9ea1-4c3c-9259-5507341afa37.png)
![image](https://user-images.githubusercontent.com/53267289/153403635-bd1e3da6-045b-4b29-8c12-0a755efef093.png)

### 3.画一条0.5px的线

- 采用meta viewport的方式：`<meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />`;使用viewport标签，将其中content的width定义为设计图的尺寸宽度，然后在直接使用1px即可（不同屏幕宽度会自动进行缩放）
- 采用border-image的方式：`{ border: 1px solid transparent; border-image: url(xx.png) 2 repeat; border-image-width: 1px; }`；https://segmentfault.com/a/1190000010969367；缺点是改边框颜色就需要改变图片，比较麻烦
- 采用box-shadow的方法：`box-shadow: 0 0 0 0.5px black`；这种方式在chrome可以，但是firefox会出现边框消失的情况
- 采用transform: scale(0.5, 0.5)的方式

### 4.BFC(Block formatting Context块级格式化上下文)

https://juejin.cn/post/6844904178037293070

https://juejin.cn/post/6950082193632788493

BFC它决定了元素如何对其内容进行定位，以及与其它元素的关系和相互作用，当涉及到可视化布局时，Block Formatting Context提供了一个环境，HTML在这个环境中按照一定的规则进行布局

简单来说就是，BFC是一个完全独立的空间（布局环境），让空间里的子元素不会影响到外面的布局。那么怎么使用BFC呢，BFC可以看做是一个CSS元素属性

产生条件：
- 根元素
- 浮动元素（元素的float的值除none外）
- 绝对定位元素（元素的position为absolute或fixed）
- 行内块元素（元素的display为inline-block）
- overflow值不为visible的块元素
- 弹性元素（display为flex或inline-flex元素的直接子元素）
- 下面的不常见
- 表格单元格（元素的display为table-cell，HTML表格单元格默认为该值）
- 表格标题（元素的display为table-caption，HTML表格标题默认为该值）
- 匿名表格单元格元素（元素的display为table、table-row、table-row-group、table-header-group、table-footer-group（分别是HTML table、row、tbody、thead、tfoot的默认属性）或inline-table）
- 网格元素（display为grid或inline-grid 元素的直接子元素）

效果：
- 相处在同一个BFC的元素，垂直方向的边距会产生重叠
- BFC的区域不会与浮动元素的box重叠
- BFC是一个独立的容器，外面的元素不会影响里面的元素
- 计算BFC高度的时候浮动元素也会参与计算

应用场景：
- 防止子元素浮动导致父元素高度塌陷
- 去除外边距重叠

### 5.link标签和@import标签的区别
- link属于html标签，而@import是css提供的
- 页面被加载时，link会同时被加载，而@import引用的css会等到页面加载结束后加载
- link是html标签，因此没有兼容性，而@import只有IE5以上才能识别
- link方式样式的权重高于@import的

### 6.Flex

设为Flex布局以后，子元素的float、clear和vertical-align属性将失效

父元素：
- flex-direction：row | row-reverse | column | column-reverse
- flex-wrap：nowrap | wrap（换行，头在上） | wrap-reverse（换行，尾在上）
- flex-flow：flex-direction属性和flex-wrap属性的简写形式，默认值为row nowrap
- justify-content：flex-start | flex-end | center | space-between | space-around
- align-items：flex-start | flex-end | center | baseline | stretch （交叉轴）
- align-content：flex-start | flex-end | center | space-between | space-around | stretch

子元素：
- order：数值越小，排列越靠前
- flex-grow：定义项目的放大比例
- flex-shrink：定义项目的缩小比例
- flex-basis
- flex：flex-grow, flex-shrink 和 flex-basis的简写，默认值为0 1 auto；该属性有两个快捷值：auto (1 1 auto) 和 none (0 0 auto)
- align-self：允许单个项目有与其他项目不一样的对齐方式

### 7.垂直居中的方法

1. margin:auto
2. 定位 + transform
3. flex

### 8.JS动画与CSS动画的区别

- 渲染线程分为main thread和compositor thread，如果css动画只改变transform和opacity，这时整个CSS动画得以在compositor trhead 完成（而 JS 动画则会在 main thread 执行，然后触发compositor thread 进行下一步操作），特别注意的是如果改变transform和opacity是不会layout或者paint的
- 功能涵盖面上，JS比CSS大
- 实现/重构难度不一，CSS比JS更加简单，性能调优方向固定
- 对帧速表现不好的低版本浏览器，css3可以做到自然降级
- css动画有天然事件支持
- css3有兼容性问题   

### 9.块元素和行元素

- 块元素：独占一行，并且有自动填满父元素，可以设置margin和pading以及高度和宽度
- 行元素：不会独占一行，width和height会失效，并且在垂直方向的padding和margin会失效

### 10.css文字超出显示省略号

单行
```css
white-space:nowrap;
overflow:hidden;
text-overflow:ellipsis;
```

多行
```css
word-break: break-all;
text-overflow: ellipsis;
overflow: hidden;
display: -webkit-box;
-webkit-line-clamp: 2;
-webkit-box-orient: vertical;
```

### 11.visibility=hidden, opacity=0，display:none的区别

- opacity=0，该元素隐藏起来了，但不会改变页面布局，并且，如果该元素已经绑定一些事件，如 click 事件，那么点击该区域，也能触发点击事件的
- visibility=hidden，该元素隐藏起来了，但不会改变页面布局，但是不会触发该元素已经绑定的事件
- display=none， 把元素隐藏起来，并且会改变页面布局，可以理解成在页面中把该元素删除掉一样

### 12.清除浮动
- 方法一：使用带clear属性的空元素在浮动元素后使用一个空元素如<div class="clear"></div>，并在CSS中赋予：clear { clear:both;} 属性即可清理浮动
- 方法二：使用CSS的overflow属性给浮动元素的容器添加overflow:hidden
- 方法三：使用邻接元素处理什么都不做，给浮动元素后面的元素添加clear属性
- 方法四：使用CSS的:after伪元素

### 13.实现自适应正方形

- vw单位：相对于视窗的百分比
- 设置垂直方向的padding撑开容器![image](https://user-images.githubusercontent.com/53267289/153527516-ed619fb1-22a4-4d0c-9037-c86984b8d9d5.png)；margin, padding 的百分比数值是相对 父元素宽度 的宽度计算的。由此可以发现只需将元素垂直方向的一个 padding 值设定为与 width 相同的百分比就可以制作出自适应正方形
- 利用伪元素的 margin(padding)-top 撑开容器



