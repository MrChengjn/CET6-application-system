(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["chunk-004e3179"],{"0fe2":function(e,t,n){"use strict";n.r(t);var a=function(){var e=this,t=e.$createElement,n=e._self._c||t;return n("div",[e.breakShow?n("div",{staticStyle:{cursor:"pointer",padding:"20px 20px 0px 20px"},on:{click:e.toExam}},[n("el-alert",{attrs:{closable:!1,title:"您有正在进行的考试，离线太久考试将被作废哦，点击此处可继续考试！",type:"error"}})],1):e._e(),n("data-table",{ref:"pagingTable",attrs:{options:e.options,"list-query":e.listQuery},scopedSlots:e._u([{key:"filter-content",fn:function(){return[n("el-select",{staticClass:"filter-item",attrs:{placeholder:"开放类型",clearable:""},model:{value:e.listQuery.params.openType,callback:function(t){e.$set(e.listQuery.params,"openType",t)},expression:"listQuery.params.openType"}},e._l(e.openTypes,(function(e){return n("el-option",{key:e.value,attrs:{label:e.label,value:e.value}})})),1),n("el-input",{staticClass:"filter-item",staticStyle:{width:"200px"},attrs:{placeholder:"搜索考试名称"},model:{value:e.listQuery.params.title,callback:function(t){e.$set(e.listQuery.params,"title",t)},expression:"listQuery.params.title"}})]},proxy:!0},{key:"data-columns",fn:function(){return[n("el-table-column",{attrs:{label:"考试名称",prop:"title","show-overflow-tooltip":""}}),n("el-table-column",{attrs:{label:"考试类型",align:"center"},scopedSlots:e._u([{key:"default",fn:function(t){return[e._v(" "+e._s(e._f("examOpenType")(t.row.openType))+" ")]}}])}),n("el-table-column",{attrs:{label:"考试时间",width:"220px",align:"center"},scopedSlots:e._u([{key:"default",fn:function(t){return[t.row.timeLimit?n("span",[e._v(" "+e._s(t.row.startTime)+" ~ "+e._s(t.row.endTime)+" ")]):n("span",[e._v("不限时")])]}}])}),n("el-table-column",{attrs:{label:"考试时长",align:"center"},scopedSlots:e._u([{key:"default",fn:function(t){return[e._v(" "+e._s(t.row.totalTime)+"分钟 ")]}}])}),n("el-table-column",{attrs:{label:"考试总分",prop:"totalScore",align:"center"}}),n("el-table-column",{attrs:{label:"及格线",prop:"qualifyScore",align:"center"}}),n("el-table-column",{attrs:{label:"操作",align:"center"},scopedSlots:e._u([{key:"default",fn:function(t){return[0===t.row.state?n("el-button",{attrs:{icon:"el-icon-caret-right",type:"primary",size:"mini"},on:{click:function(n){return e.handlePre(t.row.id)}}},[e._v("去考试")]):e._e(),1===t.row.state?n("el-button",{attrs:{icon:"el-icon-s-release",size:"mini",disabled:""}},[e._v("已禁用")]):e._e(),2===t.row.state?n("el-button",{attrs:{icon:"el-icon-s-fold",size:"mini",disabled:""}},[e._v("待开始")]):e._e(),3===t.row.state?n("el-button",{attrs:{icon:"el-icon-s-unfold",size:"mini",disabled:""}},[e._v("已结束")]):e._e()]}}])})]},proxy:!0}])})],1)},i=[],o=n("7845"),l=n("3200"),r={components:{DataTable:o["a"]},data:function(){return{breakShow:!1,breakId:"",openTypes:[{value:1,label:"完全开放"},{value:2,label:"定向考试"}],listQuery:{current:1,size:10,params:{}},options:{multi:!1,listUrl:"/exam/api/exam/exam/online-paging"}}},created:function(){this.check()},methods:{handlePre:function(e){this.$router.push({name:"PreExam",params:{examId:e}})},toExam:function(){this.$router.push({name:"StartExam",params:{id:this.breakId}})},check:function(){var e=this;Object(l["a"])().then((function(t){t.data&&t.data.id&&(e.breakShow=!0,e.breakId=t.data.id)}))}}},s=r,u=n("2877"),c=Object(u["a"])(s,a,i,!1,null,null,null);t["default"]=c.exports},3200:function(e,t,n){"use strict";n.d(t,"b",(function(){return i})),n.d(t,"e",(function(){return o})),n.d(t,"g",(function(){return l})),n.d(t,"c",(function(){return r})),n.d(t,"d",(function(){return s})),n.d(t,"f",(function(){return u})),n.d(t,"a",(function(){return c}));var a=n("b775");function i(e){return Object(a["b"])("/exam/api/paper/paper/create-paper",e)}function o(e){return Object(a["b"])("/exam/api/paper/paper/paper-detail",e)}function l(e){return Object(a["b"])("/exam/api/paper/paper/qu-detail",e)}function r(e){return Object(a["b"])("/exam/api/paper/paper/fill-answer",e)}function s(e){return Object(a["b"])("/exam/api/paper/paper/hand-exam",e)}function u(e){return Object(a["b"])("/exam/api/paper/paper/paper-result",e)}function c(){return Object(a["b"])("/exam/api/paper/paper/check-process",{})}},"333d":function(e,t,n){"use strict";var a=function(){var e=this,t=e.$createElement,n=e._self._c||t;return n("div",{staticClass:"pagination-container",class:{hidden:e.hidden}},[n("el-pagination",e._b({attrs:{background:e.background,"current-page":e.currentPage,"page-size":e.pageSize,layout:e.layout,"page-sizes":e.pageSizes,total:e.total},on:{"update:currentPage":function(t){e.currentPage=t},"update:current-page":function(t){e.currentPage=t},"update:pageSize":function(t){e.pageSize=t},"update:page-size":function(t){e.pageSize=t},"size-change":e.handleSizeChange,"current-change":e.handleCurrentChange}},"el-pagination",e.$attrs,!1))],1)},i=[];n("c5f6");Math.easeInOutQuad=function(e,t,n,a){return e/=a/2,e<1?n/2*e*e+t:(e--,-n/2*(e*(e-2)-1)+t)};var o=function(){return window.requestAnimationFrame||window.webkitRequestAnimationFrame||window.mozRequestAnimationFrame||function(e){window.setTimeout(e,1e3/60)}}();function l(e){document.documentElement.scrollTop=e,document.body.parentNode.scrollTop=e,document.body.scrollTop=e}function r(){return document.documentElement.scrollTop||document.body.parentNode.scrollTop||document.body.scrollTop}function s(e,t,n){var a=r(),i=e-a,s=20,u=0;t="undefined"===typeof t?500:t;var c=function e(){u+=s;var r=Math.easeInOutQuad(u,a,i,t);l(r),u<t?o(e):n&&"function"===typeof n&&n()};c()}var u={name:"Pagination",props:{total:{required:!0,type:Number},page:{type:Number,default:1},limit:{type:Number,default:20},pageSizes:{type:Array,default:function(){return[10,20,30,50]}},layout:{type:String,default:"total, sizes, prev, pager, next, jumper"},background:{type:Boolean,default:!0},autoScroll:{type:Boolean,default:!0},hidden:{type:Boolean,default:!1}},computed:{currentPage:{get:function(){return this.page},set:function(e){this.$emit("update:page",e)}},pageSize:{get:function(){return this.limit},set:function(e){this.$emit("update:limit",e)}}},methods:{handleSizeChange:function(e){this.$emit("pagination",{page:this.currentPage,limit:e}),this.autoScroll&&s(0,800)},handleCurrentChange:function(e){this.$emit("pagination",{page:e,limit:this.pageSize}),this.autoScroll&&s(0,800)}}},c=u,p=(n("5660"),n("2877")),d=Object(p["a"])(c,a,i,!1,null,"6af373ef",null);t["a"]=d.exports},"51c1":function(e,t,n){},5660:function(e,t,n){"use strict";n("7a30")},"5fee":function(e,t,n){"use strict";n("51c1")},7845:function(e,t,n){"use strict";var a=function(){var e=this,t=e.$createElement,n=e._self._c||t;return n("div",{staticClass:"app-container"},[n("div",{staticClass:"filter-container"},[e._t("filter-content"),n("el-row",[n("el-col",[e.options.addRoute?n("el-button",{attrs:{type:"primary",icon:"el-icon-plus"},on:{click:e.handleAdd}},[e._v("添加")]):e._e()],1)],1)],2),n("div",{directives:[{name:"show",rawName:"v-show",value:e.multiShow&&e.options.multiActions,expression:"multiShow && options.multiActions"}],staticClass:"filter-container"},[n("el-select",{staticClass:"filter-item",staticStyle:{width:"130px"},attrs:{placeholder:e.selectedLabel},on:{change:e.handleOption},model:{value:e.multiNow,callback:function(t){e.multiNow=t},expression:"multiNow"}},e._l(e.options.multiActions,(function(e){return n("el-option",{key:e.value,attrs:{label:e.label,value:e.value}})})),1)],1),n("el-table",{directives:[{name:"loading",rawName:"v-loading",value:e.listLoading,expression:"listLoading"}],attrs:{data:e.dataList.records,"header-cell-style":{background:"#f2f3f4",color:"#555","font-weight":"bold","line-height":"32px"},border:"",fit:"","highlight-current-row":""},on:{"selection-change":e.handleSelection}},[e.options.multi?n("el-table-column",{attrs:{align:"center",type:"selection",width:"55"}}):e._e(),e._t("data-columns")],2),n("pagination",{directives:[{name:"show",rawName:"v-show",value:e.dataList.total>0,expression:"dataList.total>0"}],attrs:{total:e.dataList.total,page:e.listQuery.current,limit:e.listQuery.size},on:{"update:page":function(t){return e.$set(e.listQuery,"current",t)},"update:limit":function(t){return e.$set(e.listQuery,"size",t)},pagination:e.getList}})],1)},i=[],o=(n("ac6a"),n("b775"));function l(e,t){return Object(o["b"])(e,t)}function r(e,t){return Object(o["b"])(e,{ids:t})}function s(e,t,n){return Object(o["b"])(e,{ids:t,state:n})}var u=n("333d"),c={name:"PagingTable",components:{Pagination:u["a"]},props:{options:{type:Object,default:function(){return{multiActions:[],listUrl:"/exam/api",deleteUrl:"",stateUrl:"",multi:!1}}},listQuery:{type:Object,default:function(){return{current:1,size:10,params:{},t:0}}}},data:function(){return{dataList:{total:0},listLoading:!0,selectedIds:[],selectedObjs:[],selectedLabel:"",multiShow:!1,multiNow:""}},watch:{listQuery:{handler:function(){this.getList()},deep:!0}},created:function(){this.getList()},methods:{handleAdd:function(){this.options.addRoute?this.$router.push({name:this.options.addRoute,params:{}}):console.log("未设置添加数据跳转路由！")},getList:function(){var e=this;this.listLoading=!0,this.listQuery.t=(new Date).getTime(),l(this.options.listUrl,this.listQuery).then((function(t){e.dataList=t.data,e.listLoading=!1}))},handleFilter:function(){this.getList()},handleOption:function(e){this.multiNow="","delete"!==e?"enable"!==e?"disable"!==e?this.$emit("multi-actions",{opt:e,ids:this.selectedIds}):this.handleState(1):this.handleState(0):this.handleDelete()},handleState:function(e){var t=this;s(this.options.stateUrl,this.selectedIds,e).then((function(e){0===e.code&&(t.$message({type:"success",message:"状态修改成功!"}),t.getList())}))},handleDelete:function(){var e=this;0!==this.selectedIds.length?this.$confirm("确实要删除吗?","提示",{confirmButtonText:"确定",cancelButtonText:"取消",type:"warning"}).then((function(){r(e.options.deleteUrl,e.selectedIds).then((function(){e.$message({type:"success",message:"删除成功!"}),e.getList()}))})):this.$message({message:"请至少选择一条数据！",type:"warning"})},handleSelection:function(e){var t=[];e.forEach((function(e){t.push(e.id)})),this.selectedObjs=e,this.selectedIds=t,this.multiShow=t.length>0,this.selectedLabel="已选"+t.length+"项",this.$emit("select-changed",{ids:this.selectedIds,objs:this.selectedObjs})}}},p=c,d=(n("5fee"),n("2877")),f=Object(d["a"])(p,a,i,!1,null,null,null);t["a"]=f.exports},"7a30":function(e,t,n){}}]);