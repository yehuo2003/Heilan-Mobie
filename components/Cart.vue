<template>
  <div class="app_cart">
    <div class="mui-card">
      <div class="mui-card-header">
          <router-link to="/home">
          <img src="http://127.0.0.1:3000/img/home/left.png" alt="">
        </router-link>
        <span>购物车</span>
      </div>
      <div class="cart-container" v-for="item of list" :key="item.id">
        <div>
          <img :src="item.img_url" alt="">
        </div>
        <div class="cart-centent">
          <h6>
            {{item.title}}
          </h6>
          <div class="mui-numbox">
            <button class="mui-btn mui-btn-numbox-minus" type="button" @click="setSub(item.id)">-</button>
            <input class="mui-input-numbox" type="number" :value="item.count"/>
            <button class="mui-btn mui-btn-numbox-plus" type="button" @click="setAdd(item.id)">+</button>
          </div>
          <h6>编号：HLA54H4R{{item.price}}KBY{{item.id}}</h6>         
        </div>
        <div class="cart-right">
          <p>￥ {{(item.price).toFixed(2)}}</p>
          <mt-button type="danger" size="small" @click="del($event)" :count="item.count" :cate_id="item.cate_id">删除</mt-button>
        </div>
      </div>
      <div class="mui-card-footer">
          <span>合计(不含运费)：<b>￥ {{(getSubtotal).toFixed(2)}}</b></span>
          <mt-button type="danger">结算</mt-button>
      </div>
    </div>
  </div>
</template>
<script>
import {Toast} from 'mint-ui'
export default {
  data () {
    return {
      list:[]
    }
  },
  methods:{
    setSub(id){
      for(var item of this.list){
        if(item.id == id){
          if(item.count<=1)break;
          item.count--;
          this.updateCart(item.cate_id,item.count)
        }
      } 
    },
    setAdd(id){
      //依据id将对应count自增操作
      for(var item of this.list){
        if(item.id == id){          
          item.count ++;
          this.updateCart(item.cate_id,item.count)          
          if(item.count > item.stock){
            Toast("超过最大库存量")
            return (item.count = item.stock)           
          }                   
        }
      }      
    },
    updateCart(cate_id,count){
      var uid = sessionStorage["uid"];
      var url = "cart/update?uid="+uid+"&cate_id="+cate_id+"&count="+count;
          this.$http.get(url).then(result=>{
          })
    },
    del(e){
      //获取需要的参数
      var uid = sessionStorage["uid"];
      var cate_id = e.target.getAttribute("cate_id")
      var count = e.target.getAttribute("count")      
      var url = "cart/delete?uid="+uid+"&cate_id="+cate_id+"&count="+count;
      this.$http.get(url).then(result=>{
        var res = result.body
        if(res.code == 1){
          Toast(res.msg)
          this.getCartList()
        }else{
          Toast("删除失败，请重新登录")
        }
      })
    },
    getCartList(){
      var uid = sessionStorage["uid"];
      if(uid==undefined){
        Toast("您还没有登录呢")
        this.$router.push("/user")
      }else{
        var url = "cart/list?uid="+uid;
        this.$http.get(url).then(result=>{
          this.list = result.body.msg;
        })
      }
    }
  },
  created() {
    this.getCartList();   
  },
  computed:{
    //计算属性 计算多个数据变化
    getSubtotal:function(){
      var sum = 0;
      for (var item of this.list){
        sum += item.price * item.count;
      }
      return sum;
    }
  }
}
</script>
<style>
  *{margin: 0;padding: 0;}
  .mui-card-header span{
    margin: 0 auto;    
  }
  .app_cart .mui-card .mui-card-header{
    background: #EFEFF4;
  }
  .app_cart .mui-card{
    margin:0;
  }
  .cart-container{
    display: flex;
    height: 120px;
    padding: 5px;
  }
  .cart-container .cart-centent{
    width: 319px;
    padding-left:5px;
    padding-right: 3px;
  }
  .cart-container .cart-centent h6{
    color: #333;
  }
  .cart-container img{
    width: 100px;
  }
  .mui-numbox{
    height: 32px;  
  }
  .cart-container .cart-right{
    width: 35%;
    padding-top: 5px;
  }
  .cart-right{
    text-align: center;
  }
  .cart-right>button{
    margin: 0 auto;
  }
  .cart-right>p{
    text-align: center;
    white-space:nowrap;
    color: red;
  }
  .mui-card-footer{
    padding: 5px 10px;   
  }
  .mui-card-footer b{
    color: red;
    font-size: 16px;
  }
</style>

