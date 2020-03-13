const BundleAnalyzerPlugin = require('webpack-bundle-analyzer')
    .BundleAnalyzerPlugin
const path = require('path')
const webpack = require('webpack')
const AddAssetHtmlPlugin = require('add-asset-html-webpack-plugin')
// 导入compression-webpack-plugin
const CompressionWebpackPlugin = require('compression-webpack-plugin')

const productionGzipExtensions = ['js', 'css']

function resolve(dir) {
    return path.join(__dirname, dir)
}
const proxyTargetMap = {
    prod: 'https://xxx.xxx.com/',
    randy: 'http://127.0.0.1�?092',
    peter: 'http://192.168.11.178:3001'
}
let proxyTarget = proxyTargetMap[process.env.API_TYPE] || proxyTargetMap.prod
let publicPath = process.env.NODE_ENV === 'production' ? '/' : '/'
let dllPublishPath = '/vendor'	
module.exports = {
    publicPath: publicPath,
    outputDir: 'dist',

    // 放置静态资源的地方 (js/css/img/font/...)
    // assetsDir: '',

    // 是否在保存的时候使�?`eslint-loader` 进行检查�?    // 有效的值：`ture` | `false` | `"error"`
    // 当设置为 `"error"` 时，检查出的错误会触发编译失败�?    lintOnSave: true,

    // 使用带有浏览器内编译器的完整构建版本
    // 查阅 https://cn.vuejs.org/v2/guide/installation.html#运行�?编译�?vs-只包含运行时
    // compiler: false,

    // babel-loader 默认会跳�?node_modules 依赖�?    // 通过这个选项可以显式转译一个依赖�?    transpileDependencies: [
        /* string or regex */
    ],

    // 是否为生产环境构建生�?source map�?    productionSourceMap: false,

    // 调整内部�?webpack 配置�?    // 查阅 https://github.com/vuejs/vue-docs-zh-cn/blob/master/vue-cli/webpack.md
    chainWebpack: config => {
        // 移除 prefetch 插件,解决组件懒加载失效的问题
        config.plugins.delete('prefetch')
        // 添加新的svg-sprite-loader处理svgIcon
        config.module
            .rule('svgIcon')
            .test(/\.svg$/)
            .include.add(resolve('src/icons'))
            .end()
            .use('svg-sprite-loader')
            .loader('svg-sprite-loader')
            .tap(options => {
                options = {
                    symbolId: 'icon-[name]'
                }
                return options
            })

        // 原有的svg图像处理loader添加exclude
        config.module
            .rule('svg')
            .exclude.add(resolve('src/icons'))
            .end()
    },
    // CSS 相关选项
    css: {
        // 将组件内�?CSS 提取到一个单独的 CSS 文件 (只用在生产环境中)
        // 也可以是一个传递给 `extract-text-webpack-plugin` 的选项对象
        extract: true,

        // 是否开�?CSS source map�?        sourceMap: true,

        // 为预处理器的 loader 传递自定义选项。比如传递给
        // sass-loader 时，使用 `{ sass: { ... } }`�?        loaderOptions: {},

        // 为所有的 CSS 及其预处理文件开�?CSS Modules�?        // 这个选项不会影响 `*.vue` 文件�?        modules: false
    },

    // 在生产环境下�?Babel �?TypeScript 使用 `thread-loader`
    // 在多核机器下会默认开启�?    parallel: require('os').cpus().length > 1,

    // PWA 插件的选项�?    // 查阅 https://github.com/vuejs/vue-docs-zh-cn/blob/master/vue-cli-plugin-pwa/README.md
    pwa: {},

    // 配置 webpack-dev-server 行为�?    devServer: {
        disableHostCheck: true,
        open: process.platform === 'darwin',
        host: 'localhost',
        port: 8080,
        https: false,
        hotOnly: false,
        // eslint-disable-next-line no-dupe-keys
        open: true,
        // 查阅 https://github.com/vuejs/vue-docs-zh-cn/blob/master/vue-cli/cli-service.md#配置代理
        proxy: {
            '/api': {
                target: proxyTarget,
                changeOrigin: true,
                pathRewrite: {
                    '^/api': ''
                }
            },
            '/messages': {
		target: 'http://127.0.0.1:8092',
				changeOrigin: true,
/*                pathRewrite: {
                    '^/messages': ''
            }*/
},
            '/storage': {
		target: 'http://127.0.0.1:8092',
				changeOrigin: true,
/*                pathRewrite: {
                    '^/messages': ''
            }*/
},
            '/assetsInfoAndTagInfo': {
		target: 'http://127.0.0.1:8092',
				changeOrigin: true,
/*                pathRewrite: {
                    '^/messages': ''
            }*/
},
            '/storeDelete': {
		target: 'http://127.0.0.1:8092',
				changeOrigin: true,
/*                pathRewrite: {
                    '^/messages': ''
            }*/
},
            '/photo': {
		target: 'http://127.0.0.1:8092',
				changeOrigin: true,
/*                pathRewrite: {
                    '^/messages': ''
            }*/
},
            '/photos': {
		target: 'http://127.0.0.1:8092',
				changeOrigin: true,
/*                pathRewrite: {
                    '^/messages': ''
            }*/
},
            '/opreateRecord': {
		target: 'http://127.0.0.1:8092',
				changeOrigin: true,
/*                pathRewrite: {
                    '^/messages': ''
            }*/
}
        },
        before: app => {}
    },
    // eslint-disable-next-line no-dupe-keys
    configureWebpack: config => {
        if (process.env.NODE_ENV === 'production') {
            // 为生产环境修改配�?..
            config.plugins.push(
                new webpack.DllReferencePlugin({
                    context: process.cwd(),
                    manifest: require('./public/vendor/vendor-manifest.json')
                }),
                // �?dll 注入�?生成�?html 模板�?                new AddAssetHtmlPlugin({
                    // dll文件位置
                    filepath: path.resolve(__dirname, './public/vendor/*.js'),
                    // dll 引用路径
                    publicPath: dllPublishPath,
                    // dll最终输出的目录
                    outputPath: './vendor'
                }),
                // 开启压�?                new CompressionWebpackPlugin({
                    filename: '[path].gz[query]',
                    algorithm: 'gzip',
                    test: new RegExp(
                        '\\.(' + productionGzipExtensions.join('|') + ')$'
                    ),
                    threshold: 10240,
                    minRatio: 0.8
                })
            )
            if (process.env.npm_lifecycle_event === 'analyze') {
                config.plugins.push(new BundleAnalyzerPlugin())
            }
        } else {
            // 为开发环境修改配�?..
        }
    },

    // 第三方插件的选项
    pluginOptions: {}
}
