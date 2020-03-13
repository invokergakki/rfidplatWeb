import Vue from 'vue'
import Router from 'vue-router'

import Login from '@/pages/login/login'
import NotFound from '@/pages/errorPage/404'
import Forbidden from '@/pages/errorPage/403'
import Layout from '@/pages/layout/index'
import Home from '@/pages/home/index'
import Store from '@/pages/store-manage/store'
Vue.use(Router)
/* 初始路由 */
export default new Router({
    routes: [
        {
            path: '/login',
            component: Login
        }
    ]
})

/*{
                path: 'alllist',
                name: 'order-list',
                component: OrderList,
                meta: {
                    name: '待入库资产列表',
                    icon: 'table'
                }
            }*/
/* 准备动态添加的路由 */
export const DynamicRoutes = [
    {
        path: '',
        component: Layout,
        name: 'container',
        redirect: 'home',
        meta: {
            requiresAuth: true,
            name: '主页'
        },
        children: [
            {
                id: 1,
                path: 'home',
                component: Home,
                name: 'home',
                meta: {
                    name: '待入库资产列表',
                    icon: 'tree'
                }
            },
            {
                id: 2,
                path: 'store',
                component: Store,
                name: 'store',
                meta: {
                    name: '仓库资产列表',
                    icon: 'tree'
                }
            }
        ]
    },
    {
        path: '/403',
        component: Forbidden
    },
    {
        path: '*',
        component: NotFound
    }
]
