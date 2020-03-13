
const httpConfig = {
  timeout: 10000,
  contentType: 'application/json;charset=UTF-8',
  acceptLanguage: 'en-US',
  baseUrl: '',

/*  reqInterceptors: (config) => {
  // POST传参序列化
    if (config.method === 'post' || config.method === 'put') {
      config.data = JSON.stringify(config.data)
    }
    return config
  },
*/
  resInterceptors: (res) => {
    var isSuccess = res.status === 200? true: false;
    if(isSuccess) {
      return res.data
    } else {
      return {
        code: res.status,
        message: res.statusText
      }
    }
  }
}

export default httpConfig
