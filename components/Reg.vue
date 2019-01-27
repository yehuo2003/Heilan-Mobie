<template>
  <!-- 引入头部 -->
  <div class="app_reg">
    <div class="mui-card">
      <div class="mui-card-header">
        <router-link to="/home">
          <img src="http://127.0.0.1:3000/img/home/left.png">
        </router-link>
        <span>注册</span>
      </div>
      <!-- 登录表单 -->
      <div class="mui-card-content">
        <div class="mui-card-content-inner">
          <form class="mui-input-group">
            <div class="mui-input-row">
              <label>用户名称</label>
              <input type="text" placeholder="3~10位字母、数字" v-model="uname" @mouseout="yzuname">
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
              <input
                type="password"
                class="mui-input-clear"
                placeholder="8~16位数字+大小写字母"
                v-model="upwd"
                @mouseout="yzupwd"
              >
            </div>
            <div class="mui-input-row">
              <label>确认密码</label>
              <input
                type="password"
                class="mui-input-clear"
                placeholder="请确保两次密码一致"
                v-model="cpwd"
                @mouseout="yzcpwd"
              >
            </div>
            <!-- 引入组件：四位数随机验证码 -->
            <reg-row ref="getReg"></reg-row>
            <div class="mui-button-row">
              <button type="button" class="mui-btn mui-btn-primary" @click="reg">注册</button>&nbsp;&nbsp;
              <button type="button" class="mui-btn mui-btn-danger" @click="refresh">返回</button>
            </div>
          </form>
        </div>
      </div>
      <!-- 引入组件：第三方合作 -->
      <third-party></third-party>
    </div>
  </div>
</template>
<script>
import { Toast } from "mint-ui";
import RandomRegVue from "./RandomReg.vue";
import ThirdParty from "./ThirdParty.vue";
export default {
  data() {
    return {
      uname: "",
      upwd: "",
      cpwd: "",
      email: "",
      phone: "",
      uPattern: /^[a-zA-Z0-9_-]{3,10}$/, //用户名正则
      ePattern: /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/, //邮箱正则
      mPattern: /^1[34578]\d{9}$/, //手机号正则
      pPattern: /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])[a-zA-Z\d]{8,16}$/ //密码正则
    };
  },
  mounted() {
    this.$refs.getReg.isCode();
  },
  methods: {
    //重置
    refresh() {
      this.$router.push("/login");
    },
    //第三方登录
    isNo() {
      Toast("合作功能暂未开放");
    },
    // 正则验证
    vali({ reg, name, text, url }) {
      if (reg.test(name) == false) {
        Toast(text);
      } else {
        this.$http.get(url).then(result => {
          if (result.body.code === 1) {
            Toast(result.body.msg);
          } else {
            Toast(result.body.msg);
          }
        });
      }
    },
    //验证用户名
    yzuname() {
      this.vali({
        reg: this.uPattern,
        name: this.uname,
        text: "用户名格式不正确",
        url: "user/isUname?uname=" + this.uname
      });
    },
    //验证email
    yzemail() {
      this.vali({
        reg: this.ePattern,
        name: this.email,
        text: "邮箱格式不正确",
        url: "user/isEmail?email=" + this.email
      });
    },
    //验证手机号
    yzphone() {
      this.vali({
        reg: this.mPattern,
        name: this.phone,
        text: "手机格式不正确",
        url: "user/isPhone?phone=" + this.phone
      });
    },
    //验证重复密码
    yzcpwd() {
      if (this.cpwd != this.upwd) {
        Toast("两次密码不一致！");
      }
    },
    //验证密码
    yzupwd() {
      if (this.pPattern.test(this.upwd) == false) {
        Toast("密码强度不够");
      }
    },
    reg() {
      let uname = this.uname;
      let upwd = this.upwd;
      let email = this.email;
      let phone = this.phone;
      let cpwd = this.cpwd;
      let sum = this.$refs.getReg.sum.toUpperCase();
      let reg = this.$refs.getReg.isReg.toUpperCase();
      // 先判断验证码是否通过
      if (sum != reg) {
        Toast("验证码有误");
        this.$refs.getReg.isCode();
      } else {
        // 用正则表达式验证表单信息是否符合
        if (
          this.uPattern.test(uname) &&
          this.ePattern.test(email) &&
          this.mPattern.test(phone) &&
          this.pPattern.test(upwd) &&
          cpwd == upwd
        ) {
          //前端验证通过，发送ajax进行后台注册
          let url = "user/reg";
          let obj = { uname, upwd, email, phone };
          this.$http.post(url, obj).then(result => {
            if (result.body.code == 1) {
              //注册成功提示信息
              Toast(result.body.msg);
              //返回登录界面
              this.$router.push("/login");
            } else {
              //如果失败
              Toast(result.body.msg);
              this.$refs.getReg.isCode();
            }
          });
        } else {
          //正则验证不通过，请用户检查注册信息
          Toast("请检查注册信息");
          this.$refs.getReg.isCode();
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
.app_reg .mui-card-content label {
  font-size: 16px;
  color: #444;
}
.app_reg .mui-card-header span {
  margin: 0 auto;
}
</style>

