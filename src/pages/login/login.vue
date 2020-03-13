<template>
    <div class="login-container">
        <el-form class="login-form" autoComplete="on" label-position="left">
            <h3 class="title">后台管理系统</h3>
    <div class="camera_outer">
      <div>
      <video id="videoCamera" :width="videoWidth" :height="videoHeight" autoplay></video>
      <canvas style="display:none;" id="canvasCamera" :width="videoWidth" :height="videoHeight" ></canvas>

      <div v-if="imgSrc" class="img_bg_camera">
        <img :src="imgSrc" alt="" class="tx_img">
      </div>
      </div>
	  <template>
  <el-button type="text" @click="open" style="display:none;">点击打开 Message Box</el-button>
</template>
    </div>
                <el-form-item>
                <el-button  type="primary" style="width:100%;" :loading="loading" @click.native.prevent="setImage()">
                Sign in
                </el-button>
            </el-form-item>
            <!--<div class="tips">用户为admin的时候，能够看到所有的权限列表，其余账号只能看到部分</div>-->
        </el-form>
    </div>
</template>

<script>
import { login } from '@/api/permission'
  import {faceSearch}	 from '@/api/assetsTag'
  import {test} from '@/api/assetsTag'
  import qs from 'qs'
	export default {
    data() {
        return {
        loading: false,
        pwdType: 'password',
        videoWidth: 450,
       	videoHeight: 300,
        imgSrc: '',	
        thisCancas: null,
        thisContext: null,
        thisVideo: null,
        flag:null,
        name:''
        }
    },
	mounted(){
		this.getCompetence();
	},
    methods: {
      getCompetence() {
        var _this = this
        this.thisCancas = document.getElementById('canvasCamera')
        this.thisContext = this.thisCancas.getContext('2d')
        this.thisVideo = document.getElementById('videoCamera')
        // 
        if (navigator.mediaDevices === undefined) {
          navigator.mediaDevices = {}
        }

        if (navigator.mediaDevices.getUserMedia === undefined) {
          navigator.mediaDevices.getUserMedia = function (constraints) {
            var getUserMedia = navigator.webkitGetUserMedia || navigator.mozGetUserMedia || navigator.getUserMedia
            // 保持接口一致
            if (!getUserMedia) {
              return Promise.reject(new Error('getUserMedia is not implemented in this browser'))
            }
            return new Promise(function (resolve, reject) {
              getUserMedia.call(navigator, constraints, resolve, reject)
            })
          }
        }
        
        var constraints = { audio: false, video: { width: this.videoWidth, height: this.videoHeight, transform: 'scaleX(-1)' } }
        navigator.mediaDevices.getUserMedia(constraints).then(function (stream) {
          // 旧  的浏览器可能没有srcObject
          if ('srcObject' in _this.thisVideo) {
            _this.thisVideo.srcObject = stream
          } else {
            // 避免在新的浏览器中使用它，因为它正在被弃用。
            _this.thisVideo.src = window.URL.createObjectURL(stream)
          }
          _this.thisVideo.onloadedmetadata = function (e) {
            _this.thisVideo.play()
          }
        }).catch(err => {
          console.log(err)
        })
      },
//  绘制图片（拍照功能）
      setImage () {
        var _this = this
        // 点击，canvas画图
        _this.thisContext.drawImage(_this.thisVideo, 0, 0, _this.videoWidth, _this.videoHeight)
        // 获取图片base64链接
        var image = this.thisCancas.toDataURL('image/png')
        _this.imgSrc = image
        this.faceSpot(image)
        //this.dataURLtoFile(image,'1.png');
        this.$emit('refreshDataList', this.imgSrc)
      },
// 关闭摄像头
      stopNavigator () {
        this.thisVideo.srcObject.getTracks()[0].stop()
      },
//请求人脸识别
      faceSpot (base64) {
       var self = this;
       
       test({base64}).then(res=>{
    		if(res){
    			self.flag = res.data.flag;
    			self.name = res.data.name;
    			if(res.data.flag==1){
    				self.open();
    			}else{
    				self.openelse();
    			}
    			console.log(self.name);
    		}
    	}).catch(err => {});
      },
      open() {
        this.$alert('验证成功', '验证结果', {
          confirmButtonText: '确定',
          callback: action => {
          	this.$router.push({path:'/home'})
          	this.stopNavigator();
/*            this.$message({
              //type: 'info',
              //message: `action: ${ action }`
            });*/
          }
        });
        this.login();
      },
      openelse() {
        this.$alert('验证失败', '验证结果', {
          confirmButtonText: '确定',
          callback: action => {
          	this.$router.go(0)
          	
/*            this.$message({
              //type: 'info',
              //message: `action: ${ action }`
            });*/
          }
        });
        
      },
        async login() {
            try {
                //let data = await login(this.loginForm)
                let token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFkbWluIiwiaWF0IjoxNTYzNzY0MDAxLCJleHAiOjE1NjM4NTA0MDF9.14dEfjBNN4L1QiPIsArkhv4kzwYXseWzLPNBVbQSx-k'
                this.$store.commit('LOGIN_IN', token)
                this.$router.replace('/')
            } catch (e) {
                console.log(e)
            }
        }
    },
    created(){
		console.log('i');
		this.getCompetence();
		console.log('ocon');
	},
}	
</script>

<style rel="stylesheet/scss" lang="scss">
$bg: #2d3a4b;
$light_gray: #eee;

/* reset element-ui css */
.login-container {
    .el-input {
        display: inline-block;
        height: 47px;
        width: 90%;
        input {
            background: transparent;
            border: 0px;
            -webkit-appearance: none;
            border-radius: 0px;
            padding: 12px 5px 12px 15px;
            color: $light_gray;
            height: 47px;
            &:-webkit-autofill {
                -webkit-box-shadow: 0 0 0px 1000px $bg inset !important;
                -webkit-text-fill-color: #fff !important;
            }
        }
    }
    .el-form-item {
        border: 1px solid rgba(255, 255, 255, 0.1);
        background: rgba(0, 0, 0, 0.1);
        border-radius: 5px;
        color: #454545;
    }
}
</style>

<style rel="stylesheet/scss" lang="scss" scoped>
$bg: #2d3a4b;
$dark_gray: #889aa4;
$light_gray: #eee;
.login-container {
    position: fixed;
    height: 100%;
    width: 100%;
    background-color: $bg;
    .login-form {
        position: absolute;
        left: 0;
        right: 0;
        width: 520px;
        padding: 35px 35px 15px 35px;
        margin: 120px auto;
    }
    .tips {
        font-size: 14px;
        color: #fff;
        margin-bottom: 10px;
        span {
            &:first-of-type {
                margin-right: 16px;
            }
        }
    }
    .svg-container {
        padding: 6px 5px 6px 15px;
        color: $dark_gray;
        vertical-align: middle;
        width: 30px;
        display: inline-block;
        &_login {
            font-size: 20px;
        }
    }
    .title {
        font-size: 26px;
        font-weight: 400;
        color: $light_gray;
        margin: 0px auto 40px auto;
        text-align: center;
        font-weight: bold;
    }
    .show-pwd {
        position: absolute;
        right: 10px;
        top: 7px;
        font-size: 16px;
        color: $dark_gray;
        cursor: pointer;
        user-select: none;
    }
    .fontcontainer{
        color:#889aa4;
        padding-left:10px;
    }
}
</style>
