参考文档：
- umi+dva的使用 https://umijs.org/plugins/plugin-dva
- Dva官网 https://dvajs.com/guide/#%E7%89%B9%E6%80%A7
- Dva本身是基于redux封装的方案 https://redux.js.org/introduction/getting-started


依照惯例，在使用一个不熟悉的工具前，先仔细看一遍官方文档，尽可能地过一遍，尽可能做到了解：现有什么问题，解决了什么问题，怎么做+使用，是怎么实现的（思路，最后一步）；在项目预研阶段也是如此

### 1.介绍

React问题：
> React本身只是一个DOM的抽象层，使用组件构建虚拟DOM。
> 如果开发大应用还需要解决一个问题：
> 组件之间如何通信？
> 数据如何和视图串联起来？路由和数据如何绑定？如何编写异步逻辑？

即对于数据流方面，其实React并没有做过多的处理和支持，React只提供了传参一种方式，只能在父子级之间来回，对于兄弟或无关系组件中，数据的传递就变得很困难

具体可看：https://dvajs.com/guide/introduce-class.html#%E6%95%B0%E6%8D%AE%E6%B5%81%E9%97%AE%E9%A2%98

Dva解决的问题：
> dva 首先是一个基于redux和redux-saga的数据流方案，然后为了简化开发体验，dva 还额外内置了react-router和fetch，所以也可以理解为一个轻量级的应用框架

不过在umi中，使用到的大部分是redux相关的；所以在umi中用来作为一个状态管理工具

Dva图解：https://dvajs.com/guide/fig-show.html

### 2.Dva的使用总结

关于model文件的写法这里就不说了，参考官网的即可

state 对模块下所有状态的保存
effects 副作用，在这里可以进行对接口的请求，复杂判断操作等；即可以是异步
reducers 放置更改状态的函数，要求是纯函数，且返回新对象；必须为同步操作
subscriptions 订阅，放置该model生效后的回调函数，可在里面做一些副作用之类的

不要被官网的subscriptions的key=setup产生误解，**目前在subscriptions定义的所有回调，在model初始化后都会被执行**，key值只是作者预留的数据结构以便后续的取消操作

详见：https://github.com/dvajs/dva/issues/174#issuecomment-469959264


代码参考：
```javascript
import { Reducer, Subscription, request, Effect } from 'umi';
import { GetGlobalConfig } from '@/services/auth';

export interface GlobalConfigState {
    loadGlobal: boolean;
    wsUrl: string;
}

export interface GlobalConfigModelType {
    namespace: 'globalConfig';
    state: GlobalConfigState;
    reducers: {
        change: Reducer<GlobalConfigState>;
    };
    effects: {
        query: Effect;
    };
    subscriptions: { setup: Subscription };
}

const globalConfigModel: GlobalConfigModelType = {
    namespace: 'globalConfig',
    state: {
        loadGlobal: false,
        wsUrl: '',
    },
    reducers: {
        change(state, action) {
            return {
                ...state,
                ...action.payload,
            };
        },
    },
    effects: {
        *query(action, { call, put, select }) {
            const { loadGlobal } = yield select((_: any) => _.globalConfig);
            if (!loadGlobal) {
                const res = yield call(GetGlobalConfig);
                const { wsUrl } = res.result;
                yield put({
                    type: 'change',
                    payload: {
                        loadGlobal: true,
                        wsUrl,
                    },
                });
            }
        },
    },
    subscriptions: {
        setup({ dispatch, history }, done) {
            // 在登录后请求接口获取全局配置
            history.listen(({ pathname }) => {
                if (!pathname.includes('/login')) {
                    dispatch({
                        type: 'query',
                    });
                }
            });
        },
    },
};

export default globalConfigModel;
```
