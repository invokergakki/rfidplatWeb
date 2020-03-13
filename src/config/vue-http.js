import config from './http.default.config'
import axios from 'axios'
/**
 * Install plugin
 * @param Vue
 * @param axios
 */

var vueHttp = {};
var storeInstance = null;

    vueHttp.install = function(Vue, store) {
		storeInstance = store
		vueHttp._settings(axios, config)
	},
	vueHttp.fetchGet = function(url, params) {
		return new Promise((resolve, reject) => {
			axios.get(url, params).then(res => {
				resolve(res)
			}).catch(error => {
				reject(error)
			})
		})
	},
	vueHttp.fetchPost = function(url, params, config) {
		return new Promise((resolve, reject) => {
			if(config) {
				axios.post(url, params,config).then(res => {
					resolve(res)
				}).catch(error => {
					reject(error)
				})
			} else {
				axios.post(url, params).then(res => {
					resolve(res)
				}).catch(error => {
					reject(error)
				})
			}
		})
	},
	vueHttp.fetchDelete = function(url, params) {
		return new Promise((resolve, reject) => {
			axios.delete(url).then(res => {
				resolve(res)
			}).catch(error => {
				reject(error)
			})
		})
	},
	vueHttp.fetchPut = function(url, params, config) {
		return new Promise((resolve, reject) => {
			if(config) {
				axios.put(url, params,config).then(res => {
					resolve(res)
				}).catch(error => {
					reject(error)
				})
			} else {
				axios.put(url, params).then(res => {
					resolve(res)
				}).catch(error => {
					reject(error)
				})
			}
		})
	},
	/**
	 * vue http设置 - 可以根据config设置指定的axios实例
	 * @author pangjian
	 * @param  {Object} axios      axios实例
	 * @param  {Object} httpConfig 配置信息
	 * @return {Object} 返回一个Promise
	 */
	vueHttp._settings = function(axios, httpConfig) {
		if(httpConfig.timeout) {
			axios.defaults.timeout = httpConfig.timeout
		}
		if(httpConfig.contentType) {
			axios.defaults.headers.post['Content-Type'] = httpConfig.contentType;
			axios.defaults.headers.put['Content-Type'] = 'application/json';
			axios.defaults.headers.get['Content-Type'] = 'application/octet-stream';
			axios.defaults.headers.get['Content-Disposition'] = 'attachment'
		}
		if(httpConfig.acceptLanguage) {
			//axios.defaults.headers.post['Accept-Language'] = storeInstance.state.locale
		}
		// 请求发送拦截器
		axios.interceptors.request.use(httpConfig.reqInterceptors, (error) => {
			return Promise.reject(error)
		});
		// 请求返回拦截器
		axios.interceptors.response.use(httpConfig.resInterceptors, (error) => {
			var errorMsg = {
				errorCode: error.response.status,
				errorText: error.response.statusText,
			};
			storeInstance.dispatch('setErrorMsg', errorMsg);
			return Promise.reject(error)
		});

	}

export default vueHttp