<template>
  <div class="app_goods">
 <!-- 选择标签 -->
    <ul>
      <li><a href="#"><img src="../../img/left.png"></a></li>
      <li><a href="#">商品</a></li>
      <li><a href="#">详情</a></li>
      <li><a href="#">评价</a></li>
      <li><a href="#"><img src="../../img/cart.png"></a></li>
    </ul>
  <!-- 商品列表 -->

  <!-- 模拟 -->
    <h1 class="title">{{goodinfo.title}}</h1>
    <p class="subtitle">
      <span>时间：{{goodinfo.ctime | dateFormat}}</span>
      <span>点击：{{goodinfo.sales}} 次</span>
    </p>
    <div class="container" v-html="goodinfo.content">
    </div>
  <!-- 评论区域 -->
  <!-- <comment></comment> -->
  <comment-box :id="this.id"></comment-box>
  </div>  
</template>  
<script> 
//导入评论子组件
// import comment from "comment"
 import comment from '../components/comment'
export default {
  data () {
    return {
      id:this.$route.params.id,
      goodinfo:{}
    }
  },
  methods:{
    getgoods(){
      //获取商品详情内容
      var url = "catelist/find?id="+this.id;
      this.$http.get(url).then(result=>{
        this.goodinfo = result.body.msg[0];
        console.log(this.goodinfo);
      })
    }
  },
  created() {
    this.getgoods();
  },
  components:{
    "comment-box":comment
  }
}
//商品id获取成功
//发送ajax请求获取新闻返回结果

</script>
<style>
  .app_goods>ul>li{
    list-style: none;    
  }
  .app_goods>ul>li>a{
    color: #aaa;
    height: 40px;
    font-size: 16px;
    line-height: 35px;
  }
  .app_goods>ul>li>a:link{
    color: orangered;
  }
  .app_goods>ul{
    background: #fff;
    margin: 2px 0;
    padding: 0 30px;
    display: flex;
    justify-content: space-between;
  }
</style>

