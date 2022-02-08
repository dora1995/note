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


### 二、实现原理

1. 通过import-local优先调用本地lerna命令
2. 通过Yargs生成脚手架，先注册全局属性，再注册命令，最后通过parse方法解析参数
3. lerna命令注册时需要传入builder和handler两个方法，builder方法用于注册命令专属的options，handler用来处理命令的业务逻辑
4. lerna通过配置npm本地依赖的方式进行本地开发，具体写法是在package.json的依赖中写入，lerna在publish时会自动将该路径替换
