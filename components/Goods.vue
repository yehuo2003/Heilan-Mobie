<template>
  <div class="app_goods">
 <!-- 第一部分：商品的轮播区域 -->
    <div class="mui-card">
				<div class="mui-card-content">
					<div class="mui-card-content-inner">
					<swipe-box :list="imagelist"></swipe-box>	
					</div>
    </div>
  </div>
 <!-- 第二部分：商品的购买区域 -->
 <div class="mui-card">
				<div class="mui-card-header">{{info.title}}</div>
				<div class="mui-card-content">
					<div class="mui-card-content-inner">
						<p class="price">
              市场价：<del>￥{{info.p_old}}</del>
              销售价：<span class="now_price">
                ￥{{info.p_now}}
              </span>
            </p>
            <p>
              购买数量：            
              <div class="mui-numbox">
                <button class="mui-btn mui-btn-numbox-minus" type="button" @click="goSub">-</button>
                <input class="mui-input-numbox" type="number" value="1" v-model="num"/>
                <button class="mui-btn mui-btn-numbox-plus" type="button" @click="goAdd">+</button>
              </div> 
                </p>     
					</div>
				</div>
    <div class="mui-card-footer">
      <p>
        <mt-button type="primary" size="small">立即购买</mt-button>
        <mt-button type="danger" size="small">加入购物车</mt-button>
      </p>
    </div>
  </div>
 <!-- 第三部分：商品的参数区域 -->
  <div class="mui-card">  
				<div class="mui-card-header">商品参数</div>
				<div class="mui-card-content">
					<div class="mui-card-content-inner">
						<p>商品货号：{{info.p_sn}}</p>
						<p>商品类型：{{info.p_type}}</p>
						<p>商品类型：{{info.p_type}}</p>
					</div>
      </div>
  <div class="mui-card-footer">
      按钮 图文介绍 商品评论
    </div>
  </div>
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

  <comment-box :id="this.id"></comment-box>
  </div>  
</template>  
<script> 
//导入评论子组件
 import comment from '../components/comment'
//导入轮播子组件
 import swiper from "../components/swiper"
//引入mui js组件完成数字切换
//由于mui.js与脚手架严格模式有冲突，放弃
//import mui from "../lib/mui/js/mui.js"
export default {
  data () {
    return {
      id:this.$route.params.id,
      imagelist:[],
      goodinfo:{},
      info:{}, //保存商品详细信息
      num:1
    }
  },
  methods:{
    goSub(){
      if(this.num<=1){return this.num=0}
      this.num = parseInt(this.num) -1
    },
    goAdd(){
      if(this.num>=99){return this.num=99}
      this.num = parseInt(this.num) +1
    },
    //获取当前商品的数据
    findDetail(){
      //发送请求获取数据
      this.$http.get("discount/find").then(result=>{
        //保存info对象中
        this.info = result.body;
        console.log(this.info)
      })    
    },
    getImgList(){
      this.$http.get("imagelist/list").then(result=>{
        if(result.body.code == 1){
          this.imagelist = result.body.msg;
        }
      })
    },
    getgoods(){
      //获取商品详情内容
      var url = "catelist/find?id="+this.id;
      this.$http.get(url).then(result=>{
        this.goodinfo = result.body.msg[0];
      })
    }
  },
  created() {
    this.getgoods();
    this.getImgList();
    this.findDetail();
  },
  components:{
    "comment-box":comment,
    "swipe-box":swiper
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

