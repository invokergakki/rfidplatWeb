<template>
    <transition name="dialog-frame" :css="response.isUseTransition">
        <div class="model-dialog" :style="setFullScreenStyle" v-if="response.isShowDialog">
            <iframe scroll="none" src="about:blank" class="model-dialog-iframe" ></iframe>
            <div class="dialog-main">
                <p class="dialog-title-box"><span class="dialog-title">{{response.title}}</span>
                    <a href="javascript:void(0)" class="fr icon-dialog-close" @click="closeDialog"></a>
                </p>
                <div style="position:absolute;left:0;right:0; top: 30px; bottom:0; overflow-y: auto; overflow-x: hidden;" class="model-dialog-content">
                    <slot name="libBox">
                    </slot>
                </div>
            </div>
        </div>
    </transition>
</template>
<script>
	export default {
		name: "newDialog",
		props: ["response", "closeFn", "isFullScreen"],
		data: function() {
			return {
				modelBg: false
			}
		},
		computed: {
			setFullScreenStyle: function() {
				if(this.isFullScreen) {
					return {'top': '0'};
				} else {
					return {'top': '50px'};
				}
			}
        },
        watch:{
            response:function(data){
                console.log("transition",data.isUseTransition)
            }
        },
		methods: {
			/**
			 * 关闭弹层
			 * @return {[type]} [description]
			 */
			closeDialog: function() {
                //console.log("closeDialog11");
                $('#frequentViolationsId').css('overflow','');
                var self = this;
                //console.log(self.response);
                // if(self.response.streamPicture){
                //     self.response.streamPicture.getTracks()[0].stop();//如果是活体检测界面 关闭摄像机
                // }
                self.$emit('closeDialog');
				if(self.closeFn) self.closeFn();
				setTimeout(function() { //添加延迟 先让ocx先消失
					self.response.isShowDialog = false;
				}, 90);
			}
		}
	}
</script>
<style>
  
</style>

