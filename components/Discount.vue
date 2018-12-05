<template>
 <div>
   <!-- 顶部返回 -->
    <div class="mui-card-header">
      <router-link to="/home">
        <img src="../../img/left.png" alt="">
      </router-link>
      <span>秒杀</span>
    </div>
  <div class="app_discount">    
    <!-- 秒杀列表 -->
    <div class="app_discount-item" v-for="item of list" :key="item.id" @click="getDetail(item.id)">
      <img :src="item.img_url" />
      <h1 class="title">{{item.title}}</h1>
      <div class="info">
        <p class="price">
          <span class="old">￥{{(item.price*1.5).toFixed(2)}}</span>
          <span class="now">￥{{item.price}}</span>          
        </p>
        <p class="sell">
          <span>热卖中</span>
          <span>还剩{{item.stock}}件</span>
        </p>
      </div>
    </div>

    <!-- 按钮 -->
    <mt-button type="primary" size="large">加载更多</mt-button>
  </div>
 </div>
</template>
<script>
  export default {
    data () {
      return{
        list:[]
      }
    },
    methods:{
      getList(){
        this.$http.get("discount/list").then(result=>{
          this.list = result.body.msg;
        })
      },
      getDetail(id){
        this.$router.push({path:"/goods/"+id})
      }
    },
    created(){
      this.getList();
    }
  }
  //点击当前商品跳转，商品详细信息组件
</script>
<style>
  .mui-card-header span{
    margin:0 auto;
    background: #eee;;
  }
  .app_discount{
    display: flex;
    flex-wrap: wrap;
    padding: 7px;
    justify-content: space-between;
  }
  .app_discount .app_discount-item{
    width: 49%;
    background: #ccc;
    border:1px solid #ccc;
    box-shadow: 0 0 8px #ccc;
    margin: 4px 0;
    padding: 2px;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    min-height:293px;
  }
  .app_discount .app_discount-item img{
    width: 100%;
  }
  .app_discount .app_discount-item .title{
    font-size: 14px;
  }
  .app_discount .app_discount-item .info{
    background: #eee;
  }
  .app_discount .app_discount-item .info p{
    margin: 0;
    padding: 5px;
  }
  .app_discount .app_discount-item .info .price .old{
    text-decoration:line-through; 
    font-size: 12px;
  }
  .app_discount .app_discount-item .info .price .now{
    color:#F00009;
    font-weight: bold;
    font-size: 16px;
  }
  .app_discount .app_discount-item .info .sell{
    display: flex;
    font-size: 12px;
    justify-content: space-between;
  }
</style>