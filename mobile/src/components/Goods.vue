<template>
  <!-- 头部导航条 -->
  <div class="app_goods">
    <div class="mui-card-header">
      <a href="javascript:;" @click="next">
        <img src="http://127.0.0.1:3000/img/home/left.png" alt="">
      </a>
      <span @click="isShow(1)">商品</span>
      <span @click="isShow(2)">详情</span>
      <span @click="isShow(3)">评论</span>
    </div> 
  <!-- 商品内容区域 -->
   <div id="teLIst">
      <!--第一部分：商品  -->
      <div class="product" v-show="flag==1"> 
       <!-- 商品区域 -->
        <div class="mui-card">
          <div class="mui-card-content">
            <div class="mui-card-content-inner">
              <!-- <swipe-box :list="imagelist"></swipe-box>	 -->
              <img :src="goodinfo.img_url" alt="">
            </div>
          </div>
        </div>
       <!-- 商品的购买区域 按钮组件 -->
        <div class="mui-card">
          <div class="mui-card-header">
            {{goodinfo.title}}
          </div>
          <div class="mui-card-content">
            <div class="mui-card-content-inner">
              <p class="subtitle">
                <span>时间：{{goodinfo.ctime | dateFormat}}</span>
                <span>月销量：{{goodinfo.sales}} 件</span>
              </p>
              <div class="price">
                市场价：<del>￥{{(goodinfo.price*1.1).toFixed(2)}}</del>
                <p class="now_price">销售价：￥{{goodinfo.price}}.00</p>
              </div>
              <p>
                购买数量：
              </p> 
                <!-- 按钮组件 -->
              <div class="mui-numbox">
                <button class="mui-btn mui-btn-numbox-minus" type="button" @click="goSub">-</button>
                  <input class="mui-input-numbox" type="number" value="1" v-model="num"/>
                <button class="mui-btn mui-btn-numbox-plus" type="button" @click="goAdd">+</button>
              </div>                      
            </div>
          </div> 
          <div class="mybutton">
            <mt-button type="primary" @click="faq">
              立即购买
            </mt-button>
            <mt-button type="danger" @click="addCart">
              加入购物车
            </mt-button>
          </div>
        </div>
      </div>  
    <!-- 第二部分：商品的详情区域 -->
      <div class="mui-card" v-show="flag==2">  
      <div class="mui-card-header">
        商品参数
      </div>
      <div class="mui-card-content">
        <div class="mui-card-content-inner">
          <p>商品货号：HLA54H4R{{goodinfo.price}}KBY{{goodinfo.id}}</p>
          <p>商品类型：{{goodinfo.title.slice(-2)}}</p>
          <p>商品材质：{{goodinfo.title.slice(-4,-2)}}</p>
        </div>
      </div>
      <!-- 商品展示 -->
      <div class="container" v-html="goodinfo.content"></div>  
      </div>
      <!-- 评论区域 -->
      <comment-box :id="this.id" v-show="flag==3"></comment-box>
  </div>    
 </div>
</template>  
<script> 
import {Toast} from 'mint-ui'
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
      flag:1,
      id:this.$route.params.id,
      imagelist:[],
      goodinfo:{title:''},
      info:{}, //保存商品详细信息
      num:1
    }
  },
  methods:{
    isShow(t){     
      this.flag = t;
    },
    next() {
     this.$router.go(-1);
    },
    addCart(){
      //1.获取参数 user_id cate_id count
      var user_id = sessionStorage["uid"];
      var cate_id = this.id;
      var count = this.num;
      sessionStorage["cate_id"]= this.id;    
      //2.判断用户是否登录，如果没登录无法添加到购物车
      if(user_id == undefined){
          Toast("请先登录后再添加购物车")
          return; 
      }
      //2.有登录，就发送请求        
      var url = "http://127.0.0.1:3000/cart/add?user_id="+user_id+"&cate_id="+cate_id+"&count="+count;       
      this.axios.get(url).then(result=>{                                
        if(result.data.code == 1){          
          //修改全局共享数据
          //3.如果成功提示
          this.$store.commit("increment",count);                
          Toast("购物车添加成功")
          this.$parent.getCartCount()
        }else{
          Toast("购物车添加失败，请检查网络")
        }        
      })
    },
    faq(){
      var user_id = sessionStorage["uid"];
      if(user_id == undefined){
          Toast("请先登录后再购买商品")
          return; 
      }
      this.$router.push("/faq")
    },
    goSub(){
      if(this.num<=1){
        return this.num=0
      }else{
      this.num = parseInt(this.num) -1
      }
    },
    goAdd(){
      if(this.num>=this.goodinfo.stock){
        Toast("超过最大库存量")
        return this.num=this.goodinfo.stock
      }else{
        this.num = parseInt(this.num) +1
      }
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
  },
  components:{
    "comment-box":comment,
    "swipe-box":swiper
  }
}
</script>
<style>
  .app_goods .mui-card-header span{
      margin: 0 auto;
  }
  .app_goods ul>li{
    list-style: none;    
  }
  .app_goods .mui-card img{
    width: 100%;
  }
  #teLIst .mui-card{
    margin:0;
  }
  .app_goods .product .mui-card .mybutton{
    display: flex;
    justify-content: space-around;
    border:0;
    padding: 0;
  }
  .app_goods .product .mui-card .mybutton button{
    width: 50%;
    border-radius: 0;
  }
  .app_goods ul>li>a{
    color: #aaa;
    height: 40px;
    font-size: 16px;
    line-height: 35px;
  }
  .app_goods ul>li>a:link{
    color: orangered;
  }
  .app_goods ul{
    background: #fff;
    margin: 2px 0;
    padding: 0 30px;
    display: flex;
    justify-content: space-between;
  }
  .app_goods .container img{
    width: 100%;
  }
</style>

