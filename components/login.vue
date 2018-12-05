<template>
  <div class="app_cart">
    <div class="mui-card">
      <div class="mui-card-header">
          <router-link to="/home">
          <img src="../../img/left.png" alt="">
        </router-link>
        <span>登录</span>
      </div>

    <div class="mui-card-content">
      <div class="mui-card-content-inner">
        <form class="mui-input-group">
        <div class="mui-input-row mui-password">
          <input type="text" class="mui-input" placeholder="请输入Email/手机号登录">
        </div>
        <div class="mui-input-row mui-password">
          <input type="password" class="mui-input-password" placeholder="请输入密码">
        </div>					
          <br>
          <mt-button type="danger" size=large>登录</mt-button><br>
          <mt-button type="danger" size=large>注册</mt-button>    
      </form>
    </div> 
  </div>     
      <div class="mui-card-footer">
         <ul>
           <li>
             <a href="javascript:;">
               <img src="../../img/weibuoimg.jpg" alt="">
               <p>新浪微博</p>
             </a>
           </li>
           <li>
             <a href="javascript:;">
               <img src="../../img/QQimg.jpg" alt="">
               <p>QQ账号</p>
             </a>
           </li>
           <li>
             <a href="javascript:;">
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
export default {
  data () {
    return {}
  },
  methods:{    
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

