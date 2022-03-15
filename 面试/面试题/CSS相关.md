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

### 6. 为什么要初始化CSS样式

- 因为浏览器的兼容问题，不同浏览器对有些标签的默认值是不同的，如果没对CSS初始化往往会出现浏览器之间的页面显示差异。
- 当然，初始化样式会对SEO有一定的影响，但鱼和熊掌不可兼得，但力求影响最小的情况下初始化

### 7. css3有哪些新特性
- **新增选择器** p:nth-child(n){color: rgba(255, 0, 0, 0.75)}
- **弹性盒模型** display: flex;
- 多列布局 column-count: 5;
- **媒体查询** @media (max-width: 480px) {.box: {column-count: 1;}}
- 个性化字体 @font-face{font-family: BorderWeb; src:url(BORDERW0.eot);}
- **颜色透明度** color: rgba(255, 0, 0, 0.75);
- **圆角** border-radius: 5px;
- **渐变** background:linear-gradient(red, green, blue);
- 阴影 box-shadow:3px 3px 3px rgba(0, 64, 128, 0.3);
- 倒影 box-reflect: below 2px;
- 文字装饰 text-stroke-color: red;
- **文字溢出** text-overflow:ellipsis;
- 背景效果 background-size: 100px 100px;
- 边框效果 border-image:url(bt_blue.png) 0 10;
- 转换
- **旋转** transform: rotate(20deg);
- 倾斜 transform: skew(150deg, -10deg);
- 位移 transform: translate(20px, 20px);
- 缩放 transform: scale(.5);
- **平滑过渡** transition: all .3s ease-in .1s;
- 动画 @keyframes anim-1 {50% {border-radius: 50%;}} animation: anim-1 1s;


### 8. 介绍一下标准的CSS的盒子模型？低版本IE的盒子模型有什么不同的？

- 有两种， IE盒子模型、W3C盒子模型；
- 盒子模型构成：内容(content)、内填充(padding)、 边框(border)、外边距(margin)
- IE8及其以下版本浏览器，未声明 DOCTYPE，内容宽高会包含内填充和边框，称为怪异盒模型(IE盒模型)
- 标准(W3C)盒模型：元素宽度 = width + padding + border + margin；即width为content的宽度
- 怪异(IE)盒模型：元素宽度 = width + margin；即width为content+padding+border的宽度
- 标准浏览器通过设置 css3 的 box-sizing: border-box 属性，触发“怪异模式”解析计算宽高

### 9. CSS优先级算法如何计算？
- 优先级就近原则，同权重情况下样式定义最近者为准
- 载入样式以最后载入的定位为准
- 优先级为: !important > id > class > tag; !important比内联优先级高

### 10. position的值，relative和absolute定位原点是
- absolute：生成绝对定位的元素，相对于static定位以外的第一个父元素进行定位
- fixed：生成绝对定位的元素，相对于浏览器窗口进行定位
- relative：生成相对定位的元素，相对于其正常位置进行定位
- static 默认值。没有定位，元素出现在正常的流中
- inherit 规定从父元素继承 position 属性的值

### 11. display:inline-block 什么时候不会显示间隙？
- 移除空格
- 使用margin负值
- 使用font-size:0
- letter-spacing
- word-spacing

### 12. 如果需要手动写动画，你认为最小时间间隔是多久，为什么
多数显示器默认频率是60Hz，即1秒刷新60次，所以理论上最小间隔为`1/60*1000ms ＝ 16.7ms`

### 13. CSS不同选择器的权重
-!important规则最重要，大于其它规则
- 行内样式规则，加1000
- 对于选择器中给定的各个ID属性值，加100
- 对于选择器中给定的各个类属性、属性选择器或者伪类选择器，加10
- 对于选择其中给定的各个元素标签选择器，加1
- 如果权值一样，则按照样式规则的先后顺序来应用，顺序靠后的覆盖靠前的规则

### 14. 列出你所知道可以改变页面布局的属性
position、display、float、width、height、margin、padding、top、left、right

### 15. base64的原理及优缺点
- 优点可以加密，减少了HTTTP请求
- 缺点是需要消耗CPU进行编解码

### 16. 水平居中的方法
- 元素为行内元素，设置父元素text-align:center
- 如果元素宽度固定，可以设置左右margin为auto;
- 绝对定位和移动: absolute + transform
- 使用flex-box布局，指定justify-content属性为center
- display设置为tabel-ceil

### 17. 垂直居中的方法
- 将显示方式设置为表格，display:table-cell,同时设置vertial-align：middle
- 使用flex布局，设置为align-item：center
- 绝对定位中设置bottom:0,top:0,并设置margin:auto
- 绝对定位中固定高度时设置top:50%，margin-top值为高度一半的负值
- 文本垂直居中设置line-height为height值
- 如果是单行文本, line-height 设置成和 height 值

### 18.如何使用CSS实现硬件加速
硬件加速是指通过创建独立的复合图层，让GPU来渲染这个图层，从而提高性能

一般触发硬件加速的CSS属性有transform、opacity、filter，为了避免2D动画在开始和结束的时候的repaint操作，**一般使用tranform:translateZ(0)**

### 19. 重绘和回流（重排）是什么，如何避免？
- 重绘：当渲染树中的元素外观（如：颜色）发生改变，不影响布局时，产生重绘
- 回流：当渲染树中的元素的布局（如：尺寸、位置、隐藏/状态状态）发生改变时，产生重绘回流
- 注意：JS获取Layout属性值（如：offsetLeft、scrollTop、getComputedStyle等）也会引起回流。因为浏览器需要通过回流计算最新值
- 回流必将引起重绘，而重绘不一定会引起回流

如何最小化重绘(repaint)和回流(reflow)
- 需要要对元素进行复杂的操作时，可以先隐藏(display:"none")，操作完成后再显示
- 需要创建多个DOM节点时，使用DocumentFragment创建完后一次性的加入document
- 缓存Layout属性值，如：var left = elem.offsetLeft; 这样，多次使用 left 只产生一次回流
- 尽量避免用table布局（table元素一旦触发回流就会导致table里所有的其它元素回流）
- 避免使用css表达式(expression)，因为每次调用都会重新计算值（包括加载页面）
- 尽量使用 css 属性简写，如：用 border 代替 border-width, border-style, border-color
- 批量修改元素样式：elem.className 和 elem.style.cssText 代替 elem.style.xxx

### 20. 请列举几种隐藏元素的方法

- visibility: hidden; 这个属性只是简单的隐藏某个元素，但是元素占用的空间任然存在
- opacity: 0; CSS3属性，设置0可以使一个元素完全透明
- position: absolute; 设置一个很大的 left 负值定位，使元素定位在可见区域之外
- display: none; 元素会变得不可见，并且不会再占用文档的空间。
- transform: scale(0); 将一个元素设置为缩放无限小，元素将不可见，元素原来所在的位置将被保留
- `<div hidden="hidden">`HTML5属性,效果和display:none;相同，但这个属性用于记录一个元素的状态
- height: 0; 将元素高度设为 0 ，并消除边框
- filter: blur(0); CSS3属性，将一个元素的模糊度设置为0，从而使这个元素“消失”在页面中

### 21. 元素竖向的百分比设定是相对于容器的高度吗
元素竖向的百分比设定是相对于**容器的宽度**，而不是高度

### 22. 什么是响应式设计？响应式设计的基本原理是什么？如何兼容低版本的IE

- 响应式设计就是网站能够兼容多个终端，而不是为每个终端做一个特定的版本
- 基本原理是利用CSS3媒体查询，为不同尺寸的设备适配不同样式
- 对于低版本的IE，可采用JS获取屏幕宽度，然后通过resize方法来实现兼容

### 23. 如何修改Chrome记住密码后自动填充表单的黄色背景
- 产生原因：由于Chrome默认会给自动填充的input表单加上 input:-webkit-autofill 私有属性造成的
- 解决方案1：在form标签上直接关闭了表单的自动填充：autocomplete="off"
- 解决方案2：input:-webkit-autofill { background-color: transparent; }

### 24. 设置元素浮动后，该元素的 display 值会如何变化

设置元素浮动后，该元素的 display 值自动变成 block



