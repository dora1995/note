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




