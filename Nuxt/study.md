对文档的学习，有需要注意的点就记录下来

### 目录结构

- assets 资源，会进行编译
- components 组件，这里的组件不会被nuxt拓展，即不会有asyncData那样的方法
- layouts 布局组件
- middleware 中间件
- pages 页面目录，nuxt会自动根据文件名生成路由
- plugins 插件，需要在根应用实例化之前运行的js插件
- static 静态文件，不会被构建编译，映射到根路径/下
- store vuex状态
- nuxt.config.js 配置文件
- app.html 定制化html模版，一般用默认的就可以了，参考：https://www.nuxtjs.cn/guide/views

在文件代码中可以使用 `~`或者`@`表示目录（srcDir）

#### 布局
可通过添加 layouts/default.vue 文件来扩展应用的默认布局，别忘了在布局文件中添加 <nuxt/> 组件用于显示页面的主体内容

也可以自定义布局，在layouts中创建完后，在页面代码中使用：`layout: 'myLayout'`

#### 插件

**在任何 Vue 组件的生命周期内， 只有 beforeCreate 和 created 这两个方法会在 客户端和服务端被调用。其他生命周期函数仅在客户端被调用**

在 plugins 中创建执行文件，然后在 nuxt.config.js中的plugins 引入，代码可以是命令式，也可以是一个函数

**可以通过检测process.server这个变量来控制插件中的某些脚本库只在服务端使用。当值为 true 表示是当前执行环境为服务器中**

https://www.nuxtjs.cn/guide/plugins

### 路由
项目中的路由都是nuxt自动根据page目录生成的，有较多规则，需要看看，特别是动态路由

#### 中间件
中间件允许您定义一个自定义函数运行在一个页面或一组页面渲染之前运行；可以异步执行,只需要返回一个 Promise

一个中间件是接收context作为第一个参数的函数

中间件执行流程顺序：
- nuxt.config.js
- 匹配布局
- 匹配页面

```
nuxt.config.js
// stats 中间件将在每个路由改变时被调用
module.exports = {
  router: {
    middleware: 'stats'
  }
}

// 也可以将 middleware 添加到指定的布局或者页面
export default {
  middleware: 'stats'
}

```

### 视图
todo：需要创建 layouts/error.vue 作为错误页面，不然nuxt提供的页面会将错误报出来，全都是代码
```
<template>
  <div class="container">
    <h1 v-if="error.statusCode === 404">页面不存在</h1>
    <h1 v-else>应用发生错误异常</h1>
    <nuxt-link to="/">首 页</nuxt-link>
  </div>
</template>

<script>
  export default {
    props: ['error'],
    layout: 'blog' // 你可以为错误页面指定自定义的布局
  }
</script>
```

### 插件
https://www.nuxtjs.cn/guide/plugins

