(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["chunk-4175a80a"],{3200:function(t,e,a){"use strict";a.d(e,"b",(function(){return r})),a.d(e,"e",(function(){return i})),a.d(e,"g",(function(){return o})),a.d(e,"c",(function(){return c})),a.d(e,"d",(function(){return u})),a.d(e,"f",(function(){return s})),a.d(e,"a",(function(){return p}));var n=a("b775");function r(t){return Object(n["b"])("/exam/api/paper/paper/create-paper",t)}function i(t){return Object(n["b"])("/exam/api/paper/paper/paper-detail",t)}function o(t){return Object(n["b"])("/exam/api/paper/paper/qu-detail",t)}function c(t){return Object(n["b"])("/exam/api/paper/paper/fill-answer",t)}function u(t){return Object(n["b"])("/exam/api/paper/paper/hand-exam",t)}function s(t){return Object(n["b"])("/exam/api/paper/paper/paper-result",t)}function p(){return Object(n["b"])("/exam/api/paper/paper/check-process",{})}},"3fd1":function(t,e,a){"use strict";a("eb90")},"6e21":function(t,e,a){"use strict";a.r(e);var n=function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("div",{staticClass:"app-container"},[a("el-row",{attrs:{gutter:24}},[a("el-col",{staticStyle:{"margin-bottom":"20px"},attrs:{span:24}},[a("el-alert",{staticStyle:{"margin-bottom":"10px"},attrs:{title:"点击`开始考试`后将自动进入考试，请诚信考试！",type:"error"}}),a("el-card",{staticClass:"pre-exam"},[a("div",[a("strong",[t._v("考试名称：")]),t._v(t._s(t.detailData.title))]),a("div",[a("strong",[t._v("考试时长：")]),t._v(t._s(t.detailData.totalTime)+"分钟")]),a("div",[a("strong",[t._v("试卷总分：")]),t._v(t._s(t.detailData.totalScore)+"分")]),a("div",[a("strong",[t._v("及格分数：")]),t._v(t._s(t.detailData.qualifyScore)+"分")]),a("div",[a("strong",[t._v("考试描述：")]),t._v(t._s(t.detailData.content))]),a("div",[a("strong",[t._v("开放类型：")]),t._v(" "+t._s(t._f("examOpenType")(t.detailData.openType)))])])],1),a("el-col",{attrs:{span:24}},[a("el-button",{attrs:{loading:t.loading,type:"primary",icon:"el-icon-caret-right"},on:{click:t.handleCreate}},[t._v(" 开始考试 ")]),a("el-button",{on:{click:t.handleBack}},[t._v(" 返回 ")])],1)],1)],1)},r=[],i=a("955d"),o=a("3200"),c={data:function(){return{detailData:{},postForm:{examId:"",password:""},rules:{password:[{required:!0,message:"考试密码不能为空！"}]},loading:!1}},created:function(){this.postForm.examId=this.$route.params.examId,this.fetchData()},methods:{fetchData:function(){var t=this;Object(i["a"])(this.postForm.examId).then((function(e){t.detailData=e.data}))},handleCreate:function(){var t=this,e=this;this.loading=!0,Object(o["b"])(this.postForm).then((function(t){console.log(t),0===t.code&&setTimeout((function(){this.loading=!1,e.dialogVisible=!1,e.$router.push({name:"StartExam",params:{id:t.data.id}})}),1e3)})).catch((function(){t.loading=!1}))},handleBack:function(){this.$router.push({name:"ExamOnline"})}}},u=c,s=(a("3fd1"),a("2877")),p=Object(s["a"])(u,n,r,!1,null,"6a786fd5",null);e["default"]=p.exports},"955d":function(t,e,a){"use strict";a.d(e,"a",(function(){return r})),a.d(e,"c",(function(){return i})),a.d(e,"b",(function(){return o}));var n=a("b775");function r(t){return Object(n["b"])("/exam/api/exam/exam/detail",{id:t})}function i(t){return Object(n["b"])("/exam/api/exam/exam/save",t)}function o(){return Object(n["b"])("/exam/api/exam/exam/paging",{current:1,size:100})}},eb90:function(t,e,a){}}]);