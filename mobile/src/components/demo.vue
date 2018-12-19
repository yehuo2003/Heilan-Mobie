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
            <h3>546454</h3>
          </div> 
        </div>

      
      <div class="mui-card-footer">
         <h3>脚</h3>
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
    isLogin(){
      var uid = sessionStorage["uid"];
      if(uid == undefined){
        this.$router.push("/login")
      }
    },    
  },
  created(){
    this.isLogin()
  }  

}
</script>
<style>
  .mui-card-header span{
    margin: 0 auto;
  }
</style>




