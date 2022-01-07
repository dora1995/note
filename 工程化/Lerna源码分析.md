### 一、源码阅读前的准备
- 下载源码：https://github.com/lerna/lerna
- 安装依赖
- 找到入口文件
- 能够本地调试

#### 入口
可以从package.json（版本3.22）下的bin：lerna指向core/lerna/cli.js，在这里只是做一个指示作用

在版本4.0的时候上面那个bin就被去掉了，其实也可以，毕竟只是最外层的一个结构，实际上入口仍是上面那个

**所以入口文件是 core/lerna/cli.js**

#### 调试
- 在webStorm中的代码加上红点
- 使用webStorm的调试模式：待学习，用vscode代替
