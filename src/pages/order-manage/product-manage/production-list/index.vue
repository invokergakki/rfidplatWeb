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
    </el-table>
    <div>
    	<el-pagination v-if="paginationShow" @current-change = "current_change" :page-size="pageSize" layout="total,prev,pager,next,jumper" :total="assetsInfoNumber"></el-pagination>
    </div>
  </div>
</template>

<script>
import {queryAssetsInfoList}	 from '@/api/assetsTag'

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
    			"indexCount":5,
    			"department":'一部'
    		};
    		queryAssetsInfoList({params}).then(res=>{
    			self.paginationShow = true;
    			if(res){
    				self.assetsInfoAndTagInfoVoList = res.data.assetsInfoAndTagInfoVoList;
    				self.assetsInfoNumber = res.data.assetsInfoNumber;
    			}
    		}).catch(err => {});
    	},
    	 getAssetsInfoListByPageIndex(){
    		var self = this;
    		let params={
    			"indexFrom":self.currentPage,
    			"indexCount":5,
    			"department":'一部'
    		};
    		queryAssetsInfoList({params}).then(res=>{
    			if(res){
    				self.assetsInfoAndTagInfoVoList = res.data.assetsInfoAndTagInfoVoList;
    				self.assetsInfoNumber = res.data.assetsInfoNumber;
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
