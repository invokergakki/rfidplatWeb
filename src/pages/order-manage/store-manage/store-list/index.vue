<template>
  <div class="demo-image__lazy">
    <el-table :data="assetsInfoAndTagInfoVoList" style = "width: 100%">
    	<el-table-column prop="assetsId" label="固定资产编码"></el-table-column>
    	<el-table-column prop="assetsName" label="资产名称"></el-table-column>
    	<el-table-column prop="assetsType" label="资产类型"></el-table-column>
    	<el-table-column prop="assetsUse" label="资产用途"></el-table-column>
    	<el-table-column prop="department" label="所在部门"></el-table-column>
    	<el-table-column prop="userName" label="使用人"></el-table-column>
    	<el-table-column prop="epcId" label="电子编码"></el-table-column>
    	<el-table-column prop="scanPlace" label="扫描区域"></el-table-column>
    	<el-table-column prop="scanDate" label="扫描日期"></el-table-column>
    	    	<el-table-column prop="" label="是否出库">
    			<template slot-scope="scope">
  					<el-checkbox 	@change="editCheckBox(scope.$index,scope.row)"  v-model="scope.row.checked" label="是否出库"></el-checkbox>
					</template>    		
    	</el-table-column>
    </el-table>
        <div>
    	<el-button @click="checkedAdd()" type="primary" size="medium" plain>出库</el-button>
    </div>
    <div>
    	<el-pagination v-if="paginationShow" @current-change = "current_change" :page-size="pageSize" layout="total,prev,pager,next,jumper" :total="assetsInfoNumber"></el-pagination>
    </div>
  </div>
</template>

<script>
import {queryAssetsInfoList}	 from '@/api/assetsTag'
import {test}	 from '@/api/assetsTag'
import {storeDelete}	 from '@/api/assetsTag'
export default {
    data() {
        return {
            assetsInfoAndTagInfoVoList:[],
            assetsInfoNumber:0,
            currentPage:1,
            paginationShow:true,
            pageSize:5,
            checked:false,
        }
    },
    created(){
    	var self = this;
    	this.getAssetsInfoListByNoFactor();
    },
    methods:{
    	getAssetsInfoListByNoFactor(){
    		var self = this;
    		self.paginationShow=false;
    		let params={
    			"indexFrom":1,
    			"indexCount":5
    		};

    		queryAssetsInfoList({params}).then(res=>{
    			self.paginationShow = true;
    			if(res){
    				self.assetsInfoAndTagInfoVoList = res.data.assetsInfoAndTagInfoVoList;
    				self.assetsInfoNumber = res.data.assetsInfoNumber;
    			}
    		}).catch(err => {});
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
        let params={
    			"assetsId":1
    		};
    		  var self=this;
    		  var checkList=self.checkList;
    		  storageCheckTag({checkList}).then(res=>{
    		 } 
    		 ).catch(err => {});
    		 setTimeout(function(){
    		  self.storeDelete();	
    		 },500)

    },
    	 getAssetsInfoListByPageIndex(){
    		var self = this;
    		let params={
    			"indexFrom":self.currentPage,
    			"indexCount":5
    		};
    		    		let param={
    			"base64":"base64"
    		};
    		queryAssetsInfoList({params}).then(res=>{
    			if(res){
    				self.assetsInfoAndTagInfoVoList = res.data.assetsInfoAndTagInfoVoList;
    				self.assetsInfoNumber = res.data.assetsInfoNumber;
    			}
    		}).catch(err => {});
    		test({param}).then(res=>{
    			if(res){
    				console.log("12321");
    			}
    		}).catch(err => {});
    	},
    	current_change:function(currentPage){
    		this.currentPage = currentPage;
    		this.getAssetsInfoListByPageIndex();
    	}
    }
} 

</script>
