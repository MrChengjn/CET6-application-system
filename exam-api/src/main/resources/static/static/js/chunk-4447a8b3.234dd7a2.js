(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["chunk-4447a8b3"],{"333d":function(t,e,n){"use strict";var i=function(){var t=this,e=t.$createElement,n=t._self._c||e;return n("div",{staticClass:"pagination-container",class:{hidden:t.hidden}},[n("el-pagination",t._b({attrs:{background:t.background,"current-page":t.currentPage,"page-size":t.pageSize,layout:t.layout,"page-sizes":t.pageSizes,total:t.total},on:{"update:currentPage":function(e){t.currentPage=e},"update:current-page":function(e){t.currentPage=e},"update:pageSize":function(e){t.pageSize=e},"update:page-size":function(e){t.pageSize=e},"size-change":t.handleSizeChange,"current-change":t.handleCurrentChange}},"el-pagination",t.$attrs,!1))],1)},a=[];n("c5f6");Math.easeInOutQuad=function(t,e,n,i){return t/=i/2,t<1?n/2*t*t+e:(t--,-n/2*(t*(t-2)-1)+e)};var s=function(){return window.requestAnimationFrame||window.webkitRequestAnimationFrame||window.mozRequestAnimationFrame||function(t){window.setTimeout(t,1e3/60)}}();function o(t){document.documentElement.scrollTop=t,document.body.parentNode.scrollTop=t,document.body.scrollTop=t}function l(){return document.documentElement.scrollTop||document.body.parentNode.scrollTop||document.body.scrollTop}function r(t,e,n){var i=l(),a=t-i,r=20,u=0;e="undefined"===typeof e?500:e;var c=function t(){u+=r;var l=Math.easeInOutQuad(u,i,a,e);o(l),u<e?s(t):n&&"function"===typeof n&&n()};c()}var u={name:"Pagination",props:{total:{required:!0,type:Number},page:{type:Number,default:1},limit:{type:Number,default:20},pageSizes:{type:Array,default:function(){return[10,20,30,50]}},layout:{type:String,default:"total, sizes, prev, pager, next, jumper"},background:{type:Boolean,default:!0},autoScroll:{type:Boolean,default:!0},hidden:{type:Boolean,default:!1}},computed:{currentPage:{get:function(){return this.page},set:function(t){this.$emit("update:page",t)}},pageSize:{get:function(){return this.limit},set:function(t){this.$emit("update:limit",t)}}},methods:{handleSizeChange:function(t){this.$emit("pagination",{page:this.currentPage,limit:t}),this.autoScroll&&r(0,800)},handleCurrentChange:function(t){this.$emit("pagination",{page:t,limit:this.pageSize}),this.autoScroll&&r(0,800)}}},c=u,d=(n("5660"),n("2877")),p=Object(d["a"])(c,i,a,!1,null,"6af373ef",null);e["a"]=p.exports},"3fc5":function(t,e,n){"use strict";n.r(e);var i=function(){var t=this,e=t.$createElement,n=t._self._c||e;return n("data-table",{ref:"pagingTable",attrs:{options:t.options,"list-query":t.listQuery},scopedSlots:t._u([{key:"filter-content",fn:function(){return[n("el-input",{staticClass:"filter-item",staticStyle:{width:"200px"},attrs:{placeholder:"搜索题目内容"},model:{value:t.listQuery.params.title,callback:function(e){t.$set(t.listQuery.params,"title",e)},expression:"listQuery.params.title"}}),n("el-button",{staticClass:"filter-item",staticStyle:{float:"right"},attrs:{type:"primary",icon:"el-icon-magic-stick"},on:{click:t.startTrain}},[t._v(" 错题训练 ")])]},proxy:!0},{key:"data-columns",fn:function(){return[n("el-table-column",{attrs:{label:"题目内容","show-overflow-tooltip":""},scopedSlots:t._u([{key:"default",fn:function(e){return[n("router-link",{attrs:{to:{name:"ViewQu",params:{id:e.row.quId}}}},[t._v(" "+t._s(e.row.title)+" ")])]}}])}),n("el-table-column",{attrs:{label:"错误次数",prop:"wrongCount",align:"center",width:"100px"}}),n("el-table-column",{attrs:{label:"更新时间",align:"center",prop:"updateTime",width:"180px"}})]},proxy:!0}])})},a=[],s=n("7845"),o={name:"QuList",components:{DataTable:s["a"]},data:function(){return{listQuery:{current:1,size:10,params:{title:"",examId:""}},options:{multi:!0,multiActions:[{value:"delete",label:"删除"}],listUrl:"/exam/api/user/wrong-book/paging",deleteUrl:"/exam/api/user/wrong-book/delete"}}},created:function(){var t=this.$route.params.examId;"undefined"!==typeof t&&(this.listQuery.params.examId=t,this.fetchData(t))},methods:{startTrain:function(){this.$router.push({name:"BookTraining",params:{examId:this.listQuery.params.examId}})}}},l=o,r=n("2877"),u=Object(r["a"])(l,i,a,!1,null,null,null);e["default"]=u.exports},"51c1":function(t,e,n){},5660:function(t,e,n){"use strict";n("7a30")},"5fee":function(t,e,n){"use strict";n("51c1")},7845:function(t,e,n){"use strict";var i=function(){var t=this,e=t.$createElement,n=t._self._c||e;return n("div",{staticClass:"app-container"},[n("div",{staticClass:"filter-container"},[t._t("filter-content"),n("el-row",[n("el-col",[t.options.addRoute?n("el-button",{attrs:{type:"primary",icon:"el-icon-plus"},on:{click:t.handleAdd}},[t._v("添加")]):t._e()],1)],1)],2),n("div",{directives:[{name:"show",rawName:"v-show",value:t.multiShow&&t.options.multiActions,expression:"multiShow && options.multiActions"}],staticClass:"filter-container"},[n("el-select",{staticClass:"filter-item",staticStyle:{width:"130px"},attrs:{placeholder:t.selectedLabel},on:{change:t.handleOption},model:{value:t.multiNow,callback:function(e){t.multiNow=e},expression:"multiNow"}},t._l(t.options.multiActions,(function(t){return n("el-option",{key:t.value,attrs:{label:t.label,value:t.value}})})),1)],1),n("el-table",{directives:[{name:"loading",rawName:"v-loading",value:t.listLoading,expression:"listLoading"}],attrs:{data:t.dataList.records,"header-cell-style":{background:"#f2f3f4",color:"#555","font-weight":"bold","line-height":"32px"},border:"",fit:"","highlight-current-row":""},on:{"selection-change":t.handleSelection}},[t.options.multi?n("el-table-column",{attrs:{align:"center",type:"selection",width:"55"}}):t._e(),t._t("data-columns")],2),n("pagination",{directives:[{name:"show",rawName:"v-show",value:t.dataList.total>0,expression:"dataList.total>0"}],attrs:{total:t.dataList.total,page:t.listQuery.current,limit:t.listQuery.size},on:{"update:page":function(e){return t.$set(t.listQuery,"current",e)},"update:limit":function(e){return t.$set(t.listQuery,"size",e)},pagination:t.getList}})],1)},a=[],s=(n("ac6a"),n("b775"));function o(t,e){return Object(s["b"])(t,e)}function l(t,e){return Object(s["b"])(t,{ids:e})}function r(t,e,n){return Object(s["b"])(t,{ids:e,state:n})}var u=n("333d"),c={name:"PagingTable",components:{Pagination:u["a"]},props:{options:{type:Object,default:function(){return{multiActions:[],listUrl:"/exam/api",deleteUrl:"",stateUrl:"",multi:!1}}},listQuery:{type:Object,default:function(){return{current:1,size:10,params:{},t:0}}}},data:function(){return{dataList:{total:0},listLoading:!0,selectedIds:[],selectedObjs:[],selectedLabel:"",multiShow:!1,multiNow:""}},watch:{listQuery:{handler:function(){this.getList()},deep:!0}},created:function(){this.getList()},methods:{handleAdd:function(){this.options.addRoute?this.$router.push({name:this.options.addRoute,params:{}}):console.log("未设置添加数据跳转路由！")},getList:function(){var t=this;this.listLoading=!0,this.listQuery.t=(new Date).getTime(),o(this.options.listUrl,this.listQuery).then((function(e){t.dataList=e.data,t.listLoading=!1}))},handleFilter:function(){this.getList()},handleOption:function(t){this.multiNow="","delete"!==t?"enable"!==t?"disable"!==t?this.$emit("multi-actions",{opt:t,ids:this.selectedIds}):this.handleState(1):this.handleState(0):this.handleDelete()},handleState:function(t){var e=this;r(this.options.stateUrl,this.selectedIds,t).then((function(t){0===t.code&&(e.$message({type:"success",message:"状态修改成功!"}),e.getList())}))},handleDelete:function(){var t=this;0!==this.selectedIds.length?this.$confirm("确实要删除吗?","提示",{confirmButtonText:"确定",cancelButtonText:"取消",type:"warning"}).then((function(){l(t.options.deleteUrl,t.selectedIds).then((function(){t.$message({type:"success",message:"删除成功!"}),t.getList()}))})):this.$message({message:"请至少选择一条数据！",type:"warning"})},handleSelection:function(t){var e=[];t.forEach((function(t){e.push(t.id)})),this.selectedObjs=t,this.selectedIds=e,this.multiShow=e.length>0,this.selectedLabel="已选"+e.length+"项",this.$emit("select-changed",{ids:this.selectedIds,objs:this.selectedObjs})}}},d=c,p=(n("5fee"),n("2877")),h=Object(p["a"])(d,i,a,!1,null,null,null);e["a"]=h.exports},"7a30":function(t,e,n){}}]);