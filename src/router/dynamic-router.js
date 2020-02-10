/* 订单管理 */
const Order = () => import('@/pages/order-manage')
const OrderList = () => import('@/pages/order-manage/order-list')
const ProductManage = () => import('@/pages/order-manage/product-manage')
const AllProductionList = () =>
    import('@/pages/order-manage/product-manage/all-list')
const ProductionList = () =>
    import('@/pages/order-manage/product-manage/production-list')
const ReviewManage = () =>
    import('@/pages/order-manage/product-manage/review-manage')
const ReturnGoods = () => import('@/pages/order-manage/return-goods')

/* 产品管理 */
const Goods = () => import('@/pages/goods-manage')
const GoodsList = () => import('@/pages/goods-manage/goods-list')
const GoodsClassify = () => import('@/pages/goods-manage/goods-classify')

/* 需要权限判断的路由 */
const dynamicRoutes = [
    {
        path: '/order',
        component: Order,
        name: 'order-manage',
        meta: {
            name: '资产管理',
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
