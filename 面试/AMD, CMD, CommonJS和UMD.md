参考文章：
- https://github.com/mqyqingfeng/Blog/issues/108
- https://juejin.cn/post/7031188691733348365
- https://juejin.cn/post/6844903520865386510

### 一、Javascript模块化

模块化是指在解决某一个复杂问题或者一系列的杂糅问题时，依照一种**分类的思维把问题进行系统性的分解以之处理**。模块化是一种处理复杂系统分解为代码结构更合理，可维护性更高的可管理的模块的方式。可以想象一个巨大的系统代码，被整合优化分割成逻辑性很强的模块时，对于软件是一种何等意义的存在。对于软件行业来说：解耦软件系统的复杂性，使得不管多么大的系统，也可以将管理，开发，维护变得“有理可循”。

还有一些对于模块化一些专业的定义为：模块化是软件系统的属性，这个系统被分解为一组高内聚，低耦合的模块。那么在理想状态下我们只需要完成自己部分的核心业务逻辑代码，其他方面的依赖可以通过直接加载被人已经写好模块进行使用即可。

首先，既然是模块化设计，那么作为一个模块化系统所必须的能力：
- 定义封装的模块。
- 定义新模块对其他模块的依赖。
- 可对其他模块的引入支持。


好了，思想有了，那么总要有点什么来建立一个模块化的规范制度吧，不然各式各样的模块加载方式只会将局搅得更为混乱。那么在JavaScript中出现了一些非传统模块开发方式的规范 CommonJS的模块规范，AMD（Asynchronous Module Definition），CMD（Common Module Definition）等。

### 二、CommonJS
CommonJS是服务器端模块的规范，Node.js采用了这个规范。

根据CommonJS规范，一个单独的文件就是一个模块。加载模块使用require方法，该方法读取一个文件并执行，最后返回文件内部的exports对象。

**CommonJS加载模块是同步的**，所以只有加载完成才能执行后面的操作。像Node.js主要用于服务器的编程，加载的模块文件一般都已经存在本地硬盘，所以加载起来比较快，不用考虑异步加载的方式，所以CommonJS规范比较适用。但如果是浏览器环境，要从服务器加载模块，这是就必须采用异步模式。所以就有了 AMD CMD 解决方案

### 三、AMD
AMD是"Asynchronous Module Definition"的缩写，意思就是"异步模块定义"；代表RequireJS

AMD设计出一个简洁的写模块API：
define(id?, dependencies?, factory);
第一个参数 id 为字符串类型，表示了模块标识，为可选参数。若不存在则模块标识应该默认定义为在加载器中被请求脚本的标识。如果存在，那么模块标识必须为顶层的或者一个绝对的标识。
第二个参数，dependencies ，是一个当前模块依赖的，已被模块定义的模块标识的数组字面量。
第三个参数，factory，是一个需要进行实例化的函数或者一个对象。

通过参数的排列组合，这个简单的API可以从容应对各种各样的应用场景，如下所述。

定义无依赖的模块
```
define( {
    add : function( x, y ){
        return x + y ;
    }
});
```

定义有依赖的模块
```
define(["alpha"], function( alpha ){
    return {
        verb : function(){
            return alpha.verb() + 1 ;
        }
    }
});
```

定义数据对象模块
```
define({
    users: [],
    members: []
});
```

具名模块
```
define("alpha", [ "require", "exports", "beta" ], function( require, exports, beta ){
    export.verb = function(){
        return beta.verb();
        // or:
        return require("beta").verb();
    }
});
```

包装模块
```
define(function(require, exports, module) {
    var a = require('a'),
          b = require('b');

    exports.action = function() {};
});
```

模块加载

require([module], callback)

AMD模块化规范中使用全局或局部的require函数实现加载一个或多个模块，所有模块加载完成之后的回调函数。

其中：

[module]：是一个数组，里面的成员就是要加载的模块；
callback：是模块加载完成之后的回调函数。

例如：加载一个math模块，然后调用方法 math.add(2, 3);
```
require(['math'], function(math) {
　math.add(2, 3);
});
```

### 四、UMD
UMD是AMD和CommonJS的糅合

AMD模块以浏览器第一的原则发展，异步加载模块。
CommonJS模块以服务器第一原则发展，选择同步加载，它的模块无需包装(unwrapped modules)。
这迫使人们又想出另一个更通用的模式UMD （Universal Module Definition）。希望解决跨平台的解决方案。

UMD先判断是否支持Node.js的模块（exports）是否存在，存在则使用Node.js模块模式。
在判断是否支持AMD（define是否存在），存在则使用AMD方式加载模块。

```
(function (window, factory) {
    if (typeof exports === 'object') {
     
        module.exports = factory();
    } else if (typeof define === 'function' && define.amd) {
     
        define(factory);
    } else {
     
        window.eventUtil = factory();
    }
})(this, function () {
    // module ...
});
```

### 五、ES6
// todo


https://juejin.cn/post/6844903961128861704

https://fki4c3ici6.feishu.cn/docs/doccn6t4RrQJeRpX1QXIq0Xkijc




