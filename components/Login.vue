<template>
  <!-- 引入头部文件 -->
  <div class="app_login">
    <div class="mui-card">
      <div class="mui-card-header">
        <router-link to="/home">
          <img src="http://127.0.0.1:3000/img/home/left.png">
        </router-link>
        <span>登录</span>
      </div>
      <!-- 表单内容 -->
      <div class="mui-card-content">
        <div class="mui-card-content-inner">
          <form class="mui-input-group">
            <div class="mui-input-row mui-password">
              <input
                type="text"
                class="mui-input"
                placeholder="请输入Email / 手机号 / 用户名登录"
                v-model="val"
                @mouseout="yanzhen"
              >
            </div>
            <div class="mui-input-row mui-password">
              <input type="password" class="mui-input-password" placeholder="请输入密码" v-model="upwd">
            </div>
            <!-- 引入组件：四位数随机验证码 -->
            <reg-row ref="getReg"></reg-row>
            <br>
            <mt-button type="danger" size="large" @click.prevent="login">{{isLogin}}</mt-button>
            <br>
            <mt-button type="danger" size="large" @click.prevent="reg">注册</mt-button>
          </form>
        </div>
      </div>
      <!-- footer第三方登录 -->
      <third-party></third-party>
    </div>
  </div>
</template>
<script>
import { Toast } from "mint-ui";
import RandomRegVue from "./RandomReg.vue";
import ThirdParty from "./ThirdParty.vue";
import qs from "qs";

export default {
  data() {
    return {
      isLogin: "登录",
      val: "",
      upwd: ""
    };
  },
  mounted() {
    this.$refs.getReg.isCode();
  },
  methods: {
    reg() {
      this.$router.push("/reg");
    },
    yanzhen() {
      var ePattern = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
      var mPattern = /^1[34578]\d{9}$/;
      var uPattern = /^[a-zA-Z0-9_-]{3,10}$/;
      if (ePattern.test(this.val)) {
        var email = this.val;
      } else if (mPattern.test(this.val)) {
        var phone = this.val;
      } else if (uPattern.test(this.val)) {
        var uname = this.val;
      } else {
        Toast("请输入合法登录名");
      }
      var arr = { email, uname, phone };
      return arr;
    },
    login() {
      this.isLogin = "登录中...";
      var sum = this.$refs.getReg.sum.toUpperCase();
      var reg = this.$refs.getReg.isReg.toUpperCase();
      // 先判断验证码是否通过
      if (sum != reg) {
        Toast("验证码有误");
        this.isLogin = "登录";
        this.$refs.getReg.isCode();
      } else {
        if (this.val.length == 0) {
          Toast("登录名不能为空");
          this.isLogin = "登录";
          this.$refs.getReg.isCode();
        } else if (this.upwd.length == 0) {
          Toast("密码不能为空");
          this.isLogin = "登录";
          this.$refs.getReg.isCode();
        } else {
          var obj = this.yanzhen();
          obj.upwd = this.upwd;
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
              this.isLogin = "登录";
              this.$refs.getReg.isCode();
            }
          });
        }
      }
    }
  },
  components: {
    "reg-row": RandomRegVue,
    "third-party": ThirdParty
  }
};
</script>
<style>
.app_login .mui-card-header span {
  margin: 0 auto;
}
</style>

