<template>
 <div class="app_user">
  <div class="mui-content">
		<div class="mui-card-header">
      <router-link to="/home">
        <img src="http://127.0.0.1:3000/img/home/left.png" alt="">
      </router-link>
      <span>个人中心</span>
    </div>
    <div class="mui-card-content">
        <div class="mui-card-content-inner">
          <h3>欢迎回来 {{uname}}</h3>
          <img src="http://127.0.0.1:3000/img/home/face.jpg" alt="">
        </div>
    </div>
			<ul class="mui-table-view">
				<li class="mui-table-view-cell">
					<a class="mui-navigate-right" @click="inform">
						新消息通知
					</a>
				</li>
				<li class="mui-table-view-cell">
					<a class="mui-navigate-right" @click="infaq">
						隐私
					</a>
				</li>
				<li class="mui-table-view-cell">
					<a class="mui-navigate-right" @click="infaq">
						通用
					</a>
				</li>
			</ul>
			<ul class="mui-table-view" style="margin-top: 25px;">
				<li class="mui-table-view-cell">
					<a id="about" class="mui-navigate-right" @click="infaq">
						关于我们
					</a>
				</li>
			</ul>
			<ul class="mui-table-view" style="margin-top: 25px;">
				<li class="mui-table-view-cell">
					<a style="text-align: center;color: #FF3B30;" @click="inOff">
						退出登录
					</a>
				</li>
			</ul>
		</div>
  </div>
</template>
<script>
import {Toast} from 'mint-ui'
 window.history.forward(1);
export default {
  data () {
    return {
      uname:sessionStorage["uname"]
    }
  },
  methods:{
    inOff(){
      //注销用户
      sessionStorage.clear();     
      //注销成功提示
      Toast("注销成功")
      this.$router.push("/login")
      this.$parent.getCartCount()
    },
    infaq(){
      this.$router.push("/faq")
    },
    inform(){
      Toast("没有任何消息")
    },
    isLogin(){
      var uid = sessionStorage["uid"];
      if(uid == undefined){
        Toast("登录后可查看个人中心")
        this.$router.push("/login")
      }
    },    
  },
  created(){
    this.isLogin()
  }  
}
</script>
<style scoped>
  .mui-card-header span{
    margin: 0 auto;
  }
  .app_user .mui-card-content .mui-card-content-inner img{
    width: 50px;
    height: 50px;
    border-radius: 50%;
  }
  .app_user .mui-card-content .mui-card-content-inner{
    background-image: url("http://127.0.0.1:3000/img/home/pg1.jpg");
    position: relative;
    display: flex;
    justify-content: space-evenly
  }
  .app_user .mui-card-content .mui-card-content-inner h3{
    line-height: 37px;
  }
</style>




