<template>
  <div class="app_cart">
    <div class="mui-card">
      <div class="mui-card-header">
          <router-link to="/home">
          <img src="http://127.0.0.1:3000/img/home/left.png" alt="">
        </router-link>
        <span>登录</span>
    </div>

    <div class="mui-card-content">
      <div class="mui-card-content-inner">
        <form class="mui-input-group">
        <div class="mui-input-row mui-password">
          <input type="text" class="mui-input" placeholder="请输入Email/手机号登录" v-model="uname">
        </div>
        <div class="mui-input-row mui-password">
          <input type="password" class="mui-input-password" placeholder="请输入密码" v-model="upwd">
        </div>					
          <br>
          <mt-button type="danger" size=large @click="login">登录</mt-button><br>
          <mt-button type="danger" size=large @click="reg">注册</mt-button>    
        </form>
    </div> 
  </div>     
      <div class="mui-card-footer">
         <ul>
           <li>
             <a href="javascript:;">
               <img src="" alt="">
               <p>新浪微博</p>
             </a>
           </li>
           <li>
             <a href="javascript:;">
               <img src="" alt="">
               <p>QQ账号</p>
             </a>
           </li>
           <li>
             <a href="javascript:;">
               <img src="" alt="">
               <p>支付宝账号</p>
             </a>
           </li>
         </ul>
      </div>
		</div>
  </div>
</template>
<script>
import {Toast} from "mint-ui"
import qs from 'qs'

export default {
  data () {
    return {
      uname:"",
      upwd:""
    }
  },
  methods:{
    reg(){
      this.$router.push("/reg")
    },
    login(){
      //1.获取参数
      var u = this.uname;
      var p = this.upwd;

      let obj = {
        uname: u,
        upwd: p
      }
      //2.正则表达式验证
      //3.发送请求
      // var url = "user/login?uname="+u+"&upwd="+p;
      // this.$http.get(url).then(result=>{
      //   var obj = result.body
      //   if(obj.code == -1){
      //     Toast(obj.msg)  //登录失败提示
      //   }else{
      //     //登录成功跳转Home
      //     this.$router.push("/Home");
      //   }
      // })
      var url = "http://127.0.0.1:3000/user/login";
      this.axios.post(url,qs.stringify(obj)).then(result=>{
        if(result.data.code == 1){
           sessionStorage["uid"]=result.data.uid;
           sessionStorage["uname"]=result.data.uname;
           this.$router.push("/Home")
        }else{
          Toast("用户名或密码有误")
        }
      })
    }    
  },
  created(){
 
  }
}
</script>
<style>
  .mui-card-header span{
    margin: 0 auto;
  }
  .mui-card-footer{
    border-top:1px dashed #aaa;
  }
  .mui-card-footer ul{
    padding-left: 0px;
    display: flex;
  }
  .mui-card-footer ul li{
    padding-left:15px ;
    margin: auto;
    width: 117px;
    list-style: none;
    border-right: 1px solid #aaa;
  }
  .mui-card-footer ul li:nth-child(1){
    padding-left: 20px;
  }
  .mui-card-footer ul li:nth-child(1) img{
    width: 50px;
  }
  .mui-card-footer ul li:nth-child(2){
    padding-left: 30px;
  }
  .mui-card-footer ul li:nth-child(2) img{
    margin-left: 10px;
    width: 30px;
  }
  .mui-card-footer ul li:nth-child(3) img{
    margin-left: 20px;
    width: 28px;
  }
</style>

