/* 订单管理 */
const Order = () => import('@/pages/order-manage')
const OrderList = () => import('@/pages/order-manage/order-list')
const ProductManage = () => import('@/pages/order-manage/product-manage')
const StoreManage = () => import('@/pages/order-manage/store-manage')
const AllProductionList = () =>
    import('@/pages/order-manage/product-manage/all-list')
const StoreAllProductionList = () =>
    import('@/pages/order-manage/store-manage/store-list')
const ProductionList = () =>
    import('@/pages/order-manage/product-manage/production-list')
const ReviewManage = () =>
    import('@/pages/order-manage/product-manage/review-manage')
const StoreOrder = () => import('@/pages/store-manage')
const StoreOrderList = () => import('@/pages/store-manage/order-list')
const StoreProductManage = () => import('@/pages/store-manage/product-manage')
const StoreProductionList = () =>
    import('@/pages/store-manage/product-manage/production-list')
const StoreReviewManage = () =>
    import('@/pages/store-manage/product-manage/review-manage')    


/* 需要权限判断的路由 */
const dynamicRoutes = [
    {
        path: '/order',
        component: Order,
        name: 'order-manage',
        meta: {
            name: '外部资产管理',
            icon: 'example'
        },
        children: [
/*            {
                path: 'alllist',
                name: 'order-list',
                component: OrderList,
                meta: {
                    name: '待入库资产列表',
                    icon: 'table'
                }
            },*/
            {
                path: 'store',
                name: 'store-manage',
                component: StoreManage,
                meta: {
                    name: '仓库资产管理',
                    icon: 'user'
                },
                children: [
                    {
                        path: 'storealllist',
                        name: 'store-list',
                        component: StoreAllProductionList,
                        meta: {
                            name: '全部',
                            icon: 'table'
                        }
                    }
                ]
            },
            {
                path: 'product',
                name: 'product-manage',
                component: ProductManage,
                meta: {
                    name: '已入库资产列表',
                    icon: 'user'
                },
                children: [
                    {
                        path: 'alllist',
                        name: 'all-list',
                        component: AllProductionList,
                        meta: {
                            name: '全部',
                            icon: 'table'
                        }
                    },
                    {
                        path: 'list',
                        name: 'product-list',
                        component: ProductionList,
                        meta: {
                            name: '一部',
                            icon: 'table'
                        }
                    },
                    {
                        path: 'review',
                        name: 'review-manage',
                        component: ReviewManage,
                        meta: {
                            name: '二部',
                            icon: 'eye'
                        }	
                    }
                ]
            }
        ]
    }
]
export default dynamicRoutes
