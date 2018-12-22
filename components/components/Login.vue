<template>
  <!-- 引入头部文件 -->
  <div class="app_login">
    <div class="mui-card">
      <div class="mui-card-header">
        <router-link to="/home">
          <img src="http://127.0.0.1:3000/img/home/left.png" alt>
        </router-link>
        <span>登录</span>
      </div>
      <!-- 表单内容 -->
      <div class="mui-card-content">
        <div class="mui-card-content-inner">
          <form class="mui-input-group">
            <div class="mui-input-row mui-password">
              <input type="text" class="mui-input" placeholder="请输入用户名登录" v-model="uname">
            </div>
            <div class="mui-input-row mui-password">
              <input type="password" class="mui-input-password" placeholder="请输入密码" v-model="upwd">
            </div>
            <br>
            <mt-button type="danger" size="large" @click.prevent="login">登录</mt-button>
            <br>
            <mt-button type="danger" size="large" @click.prevent="reg">注册</mt-button>
          </form>
        </div>
        <!-- footer第三方登录 -->
      </div>
      <div class="mui-card-footer">
        <ul>
          <li>
            <a href="javascript:;" @click="isNo">
              <img src="http://127.0.0.1:3000/img/home/weibuoimg.jpg">
              <p>新浪微博</p>
            </a>
          </li>
          <li>
            <a href="javascript:;" @click="isNo">
              <img src="http://127.0.0.1:3000/img/home/QQimg.jpg">
              <p>QQ账号</p>
            </a>
          </li>
          <li>
            <a href="javascript:;" @click="isNo">
              <img src="http://127.0.0.1:3000/img/home/zhihubaologo.jpg">
              <p>支付宝账号</p>
            </a>
          </li>
        </ul>
      </div>
    </div>
  </div>
</template>
<script>
import { Toast } from "mint-ui";
import qs from "qs";

export default {
  data() {
    return {
      uname: "",
      upwd: ""
    };
  },
  methods: {
    reg() {
      this.$router.push("/reg");
    },
    //第三方登录
    isNo() {
      Toast("合作功能暂未开放");
    },
    login() {
      //1.获取参数
      var u = this.uname;
      var p = this.upwd;

      let obj = {
        uname: u,
        upwd: p
      };
      var url = "http://127.0.0.1:3000/user/login";
      this.axios.post(url, qs.stringify(obj)).then(result => {
        if (result.data.code == 1) {
          sessionStorage["uid"] = result.data.uid;
          sessionStorage["uname"] = result.data.uname;
          this.$parent.getCartCount();
          Toast("登录成功");
          this.$router.push("/Home");
        } else {
          Toast("用户名或密码有误");
        }
      });
    }
  }
};
</script>
<style>
.app_login .mui-card-header span {
  margin: 0 auto;
}
.app_login .mui-card-footer {
  border-top: 1px dashed #aaa;
}
.app_login .mui-card-footer ul {
  padding-left: 5px;
  display: flex;
}
.app_login .mui-card-footer ul li {
  padding-left: 19px;
  margin: auto;
  width: 107px;
  list-style: none;
  border-right: 1px solid #aaa;
}
.app_login .mui-card-footer ul li:nth-child(1) {
  padding-left: 20px;
}
.app_login .mui-card-footer ul li:nth-child(3) {
  border-right: 0;
}
.app_login .mui-card-footer ul li:nth-child(1) img {
  width: 50px;
}
.app_login .mui-card-footer ul li:nth-child(2) {
  padding-left: 30px;
}
.app_login .mui-card-footer ul li:nth-child(2) img {
  margin-left: 10px;
  width: 30px;
}
.app_login .mui-card-footer ul li:nth-child(3) img {
  margin-left: 20px;
  width: 28px;
}
</style>

