### 一、使用vite构建项目

构建：`yarn create vite my-vue-app --template react-ts`

启动：`yarn dev`

打包：`yarn build`

### 二、安装Antd/Less

`yarn add antd`

`yarn add -D less`，安装完后就可以在vite中使用了，默认支持；修改CSS文件名为CSSModule格式即可如index.module.less

同时在vite.config.js文件中配置：
```
export default defineConfig({
	...
  css: {
    preprocessorOptions: {
      less: {
        // 支持内联 JavaScript
        javascriptEnabled: true
      },
    }
  }
})

```

### 三、路径别名

```
import path from "path"
// vite.config.ts
export default defineConfig({
	...
  resolve: {
    alias: {
      "@": path.resolve(__dirname, 'src')
    }
  },
})
```

### 四、Antd样式按需加载

在未按需加载样式时，打包出来的css文件由500+kb，本身项目也还没写什么东西，感觉应该是antd样式导致

安装插件：`yarn add vite-plugin-imp -D`

```
import { defineConfig } from 'vite'
import vitePluginImp from 'vite-plugin-imp'

export default defineConfig({
  plugins: [
    vitePluginImp({
      libList:[
        {
          libName:'antd',
          style: name=>`antd/lib/${name}/style/index.less`,
        }
      ]
    })
  ],
  ...
})

```

### 五、问题
是否可以将`vite-plugin-react`换成`@vitejs/plugin-react-refresh`

### 六、自定义antd主题色

修改vite.config.js文件：

```
import lessToJs from 'less-vars-to-js';
import fs from 'fs';
const variablesConfig = lessToJs(fs.readFileSync(path.resolve(__dirname, './config/variables.less'), 'utf8'))

export default defineConfig({
  ...
  css:{
    preprocessorOptions:{
      less:{
        // 支持内联js
        javascriptEnabled:true,
        // 重写less变量，定制样式 
        modifyVars:variablesConfig
      }
    }
  }
})
```

### 七、安装React-Router
`yarn add react-router-dom@6`

`yarn add react-router-config`：https://www.npmjs.com/package/react-router-config / https://www.jianshu.com/p/f1a3184ac81c

关于react-router-config，因为router的升级而不适用，所以暂时不用了，后面看看有没有升级

参考react-router文档使用即可，6版改动挺多的




