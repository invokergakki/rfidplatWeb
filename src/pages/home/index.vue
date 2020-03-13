<template>
  <div class="demo-image__lazy">
    <el-table :data="assetsTagInfoList" style = "width: 100%">
    	<el-table-column prop="assetsId" label="固定资产编码"></el-table-column>
    	<el-table-column prop="epcId" label="电子编码"></el-table-column>
    	<el-table-column prop="scanPlace" label="扫描区域"></el-table-column>
    	<el-table-column prop="devName" label="扫描设备"></el-table-column>
    	<el-table-column prop="scanDate" label="扫描日期"></el-table-column>
    	<el-table-column prop="" label="是否入库">
    			<template slot-scope="scope">
  					<el-checkbox 	@change="editCheckBox(scope.$index,scope.row)"  v-model="scope.row.checked" label="是否入库"></el-checkbox>
					</template>    		
    	</el-table-column>

    </el-table>
    <div>
    	<el-button @click="checkedAdd()" type="primary" size="medium" plain>入库</el-button>
    	<el-button @click="checkedAddAll()" type="primary" size="medium" plain>全部入库</el-button>
    </div>
  </div>
</template>

<script>
import {queryAssetsTagInfoList}	 from '@/api/assetsTag'
import {storageCheckTag}	 from '@/api/assetsTag'
import {queryOpreateRecprd}	 from '@/api/assetsTag'
export default {
    data() {
        return {
            assetsTagInfoList:[],
            assetsTagInfoNumber:0,
            checked:false,
            checkList:[]
        }
    },
    created(){
    	var self = this;
    	this.getAssetsTagInfoListByNoFactor();
    	self.getAssetsTagInfoListByNoFactorTime();
    },
    methods:{
    	getAssetsTagInfoListByNoFactor(){
    		var self = this;
    		let params={
    			"indexFrom":1,
    			"indexCount":20
    		};
    		queryAssetsTagInfoList({params}).then(res=>{
    			if(res){
    				self.assetsTagInfoList = res.data.assetsTagInfoList;
    				console.log(res.data.assetsTagInfoList);
    				self.assetsTagInfoNumber = res.data.assetsTagInfoCountNumber;
    			}
    		}).catch(err => {});
    	},
    	current_change:function(currentPage){
    		this.currentPage = currentPage;
    		this.getAssetsTagInfoListByPageIndex();
    	},
    	editCheckBox(index,row){
    		var self = this;
    		let rowObj=Object.assign({},row);

    		if(rowObj.checked==true){
    			self.checkList.push(rowObj.assetsId);
    		}
    		if(rowObj.checked==false){
    			var i = self.checkList.length;
    			while(i--){
    				if(self.checkList[i]==rowObj.assetsId){
    					self.checkList.splice(i,1);
    				}
    			}
    		}
    	},
    	checkedAdd(){
    		  var self=this;

    		  var checkList=self.checkList;
    		  storageCheckTag({checkList}).then(res=>{

    		 } 
    		 ).catch(err => {});
    		 setTimeout(function(){
    		  self.getOpreateRecord();	
    		 },500)
    		  setTimeout(function(){
    		  self.getAssetsTagInfoListByNoFactor();
    		 },1000)
    },
      checkedAddAll(){
      		var self=this;
    		  var checkList=[];
    		  self.assetsTagInfoList.forEach(item=>{
    		  	checkList.push(item.assetsId);
    		  })
    		 storageCheckTag({checkList}).then(res=>{
    		 }  		 	
    		 ).catch(err => {});
    		 setTimeout(function(){
    		  self.getOpreateRecord();	
    		 },500)
    		 setTimeout(function(){
    		  self.getAssetsTagInfoListByNoFactor();
    		 },1000)
    		 
    },
    	getOpreateRecord(){
    		var self = this;
    		queryOpreateRecprd({}).then(res=>{
    			alert('入库成功！本次入库共新增'+res.data.addedNumber+'件资产信息，共更新'+res.data.updatedNumber+'件资产信息');
    		})
    	},
    	getAssetsTagInfoListByNoFactorTime(){
    		var self = this;
    		window.setInterval(function(){
    			if(self.assetsTagInfoList.length==0){
    			   self.getAssetsTagInfoListByNoFactor();
    		}
    		},3000);
    	},
    }
} 

</script>
