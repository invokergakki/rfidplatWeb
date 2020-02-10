import vueHttp from '@/config/vue-http'


export const queryAssetsTagInfoList=(params)=>{
    return vueHttp.fetchGet('/messages',params);
}

export const storageCheckTag=(params)=>{
    return vueHttp.fetchPost('/storage',params);
}

export const queryAssetsInfoList=(params)=>{
    return vueHttp.fetchGet('/assetsInfoAndTagInfo',params);
}

export const queryOpreateRecprd=(params)=>{
    return vueHttp.fetchGet('/opreateRecord',params);
}

export const faceSearch=(data)=>{
    return vueHttp.fetchGet('/photo',data);
}

export const test=(params)=>{
    return vueHttp.fetchPost('/photo',params);
}
