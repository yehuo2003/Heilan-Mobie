<template>
  <div class="app_subcomment">
    <h4>发表评论</h4>
    <hr />
    <textarea placeholder="请输入评论的内容" maxlength="120" v-model="msg"></textarea>
    <mt-button type="primary" size="large" @click="postComment">发表评论</mt-button>
    <div class="cmt-list">
      <div class="cmt-list-item" v-for="(item,i) of list" :key="item.id">
        <div class="cmt-title">
          第{{i+1}}楼 &nbsp;&nbsp; 用户：{{item.username}} 发表时间：{{item.ctime | dateFormat}}
        </div>
        <div class="cmt-body">
          {{item.content}}
        </div>
      </div>
    </div>
    <mt-button type="danger" size="large" @click="getCommentList">加载更多</mt-button>
  </div>
</template>
<script>
 import {Toast} from "mint-ui";
 export default {
  data () {
    return{
      list:[],
      msg:"",     //双向绑定留言
      pageIndex:0 //当前显示页码
    }
  },
  methods:{
    postComment(){
      //发表评论
      var username = "匿名用户"; //用户名
      var nid = this.id;        //新闻编号
      var content = this.msg;   //双向绑定留言内容

      var url = "comment/save";
      var obj = {nid:nid,content:content,username:username};     
      this.$http.post(url,obj).then(result=>{
        if(result.body.code == 1){
          //1.添加完成清空原有内容
          this.msg = "";
          //2.提示
          Toast(result.body.msg);
          this.pageIndex = 0;    //将当前页码清零
          this.list = [];        //数据值清空
          this.getCommentList(); //加载第一页
        }else{
          //出错返回
          Toast(result.body.msg);
        }
      })
    },
    //分页
    //1.对象创建成功后加载第一页
    //2.点击加载更多按钮加载下一页
    //3.添加新评论，看第一条内容   
    getCommentList(){
      this.pageIndex++;
      var url = "comment/list?nid="+this.id;
          url += "&pno="+this.pageIndex;
      this.$http.get(url).then(result=>{
        //console.log(result.body.data)
        this.list = this.list.concat(result.body.data);
      })
    }
  },
  created() {
    this.getCommentList();
    //console.log(this.id);//在程序直接使用this.id
  },
  props:["id"]  //接收父组件传递参数
 }
</script>
<style>
 .app_subcomment textarea{
   font-size: 14px;
   height: 85px;
   margin:0;
 }
 .app_subcomment .cmt-list{
   margin: 5px 0;
 }
 .app_subcomment .cmt-list .cmt-list-item{
   font-size: 13px;
 }
 .app_subcomment .cmt-list .cmt-list-item .cmt-title{
   line-height: 30px;
   background: #ccc;
 }
 .app_subcomment .cmt-list .cmt-list-item .cmt-body{
   line-height: 30px;
   text-indent:2rem;
 }
</style>