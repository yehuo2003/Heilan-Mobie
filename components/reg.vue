<template>
  <div class="app_cart">
    <div class="mui-card">
      <div class="mui-card-header">
          <router-link to="/home">
          <img src="../../img/left.png" alt="">
        </router-link>
        <span>注册</span>
      </div>

    <div class="mui-card-content">
      <div class="mui-card-content-inner">
   <form class="mui-input-group">
          <div class="mui-input-row">
						<label>用户名称</label>
						<input type="text" placeholder="4~16位字母、数字" v-model="uname" @mouseout="yzuname">
					</div>
          <div class="mui-input-row">
						<label>电子邮箱</label>
						<input type="email" placeholder="请输入有效邮箱" v-model="email" @mouseout="yzemail">
					</div>
					<div class="mui-input-row">
						<label>手机号码</label>
						<input type="text" placeholder="请输入11位数手机号码" v-model="phone" @mouseout="yzphone">
					</div>
					<div class="mui-input-row">
						<label>设定密码</label>
						<input type="password" class="mui-input-clear" placeholder="8~16位数字+大小写字母" v-model="upwd" @mouseout="yzupwd">
					</div>
					<div class="mui-input-row">
						<label>确认密码</label>
						<input type="password" class="mui-input-clear" placeholder="请确保两次密码一致" v-model="cpwd" @mouseout="yzcpwd">
					</div>		
					<div class="mui-button-row">            
						<button type="button" class="mui-btn mui-btn-primary" @click="reg">注册</button>&nbsp;&nbsp;
						<button type="button" class="mui-btn mui-btn-danger" @click="refresh">返回</button>
					</div>
				</form>        
    </div> 
  </div>     
      <div class="mui-card-footer">
         <ul>
           <li>
             <a href="javascript:;" @click="isNo">
               <img src="../../img/weibuoimg.jpg" alt="">
               <p>新浪微博</p>
             </a>
           </li>
           <li>
             <a href="javascript:;" @click="isNo">
               <img src="../../img/QQimg.jpg" alt="">
               <p>QQ账号</p>
             </a>
           </li>
           <li>
             <a href="javascript:;" @click="isNo">
               <img src="../../img/zhihubaologo.jpg" alt="">
               <p>支付宝账号</p>
             </a>
           </li>
         </ul>
      </div>
		</div>
  </div>
</template>
<script>
import {Toast} from 'mint-ui'
export default {
  data () {
    return {
      uname:"",
      upwd:"",
      cpwd:"",
      email:"",
      phone:"",
    }
  },
  methods:{
    //重置
    refresh(){
      this.$router.push("/login")
    },
    //第三方登录
    isNo(){
      Toast("合作功能暂未开放")
    },
    //验证用户名
    yzuname(){
      var uPattern = /^[a-zA-Z0-9_-]{4,16}$/;
      if(uPattern.test(this.uname)==false){
        Toast("用户名格式不正确")
      }
    },
    //验证email
    yzemail(){
      var ePattern = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
      if(ePattern.test(this.email)==false){
        Toast("邮箱格式不正确")
      }
    },
    //验证手机号
    yzphone(){
    var mPattern = /^1[34578]\d{9}$/;
      if(mPattern.test(this.phone)==false){
        Toast("手机格式不正确")
      }
    },
    //验证重复密码
    yzcpwd(){
      if(this.cpwd!=this.upwd){
        Toast("两次密码不一致！")
      }
    },
    //验证密码
    yzupwd(){
    var pPattern = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])[a-zA-Z\d]{8,16}$/;
      if(pPattern.test(this.upwd)==false){
        Toast("密码格式不正确")
      }
    },
    reg(){
      var uname = this.uname;
      var upwd = this.upwd;
      var email = this.email;
      var phone = this.phone;
      var cpwd = this.cpwd;
      //用户名正则
      var uPattern = /^[a-zA-Z0-9_-]{4,16}$/;
      //Email正则
      var ePattern = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
      //手机号正则
      var mPattern = /^1[34578]\d{9}$/; 
      //密码强度正则，密码由大写字母+小写字母+数字，8-16位组成！
      var pPattern = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])[a-zA-Z\d]{8,16}$/;
      //用正则表达式验证表单信息是否符合
      if(
        uPattern.test(uname) == true &&
        ePattern.test(email) == true &&
        mPattern.test(phone) == true &&
        pPattern.test(upwd) == true &&
        cpwd == upwd
      ){
        //前端验证通过，发送ajax进行后台注册
      var url = "user/reg"
      var obj = {uname:uname,upwd:upwd,email:email,phone:phone};
      this.$http.post(url,obj).then(result=>{
        if(result.body.code == 1){
          //注册成功提示信息
          Toast(result.body.msg)
          //返回登录界面
          this.$router.push("/login")
        }else{
          //如果失败
          Toast(result.body.msg)
        }
      })
      }else{
        //正则验证不通过，请用户检查注册信息
        Toast("请检查注册信息")
      }
    }    
  }
}
</script>
<style>
  .mui-card-header span{
    margin: 0 auto;
    background: #fff;	
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

