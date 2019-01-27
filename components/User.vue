<template>
  <div class="app_user">
    <div class="mui-content">
      <div class="mui-card-header">
        <router-link to="/home">
          <img src="http://127.0.0.1:3000/img/home/left.png">
        </router-link>
        <span>个人中心</span>
      </div>
      <div class="mui-card-content">
        <div class="mui-card-content-inner">
          <h2>欢迎回来 {{uname}}</h2>
          <img src="http://127.0.0.1:3000/img/home/face.jpg">
        </div>
      </div>
      <ul class="mui-table-view">
        <li class="mui-table-view-cell" v-for="item of isfaq" :key="item.id">
          <a class="mui-navigate-right" @click="infaq(item.id)">{{item.title}}</a>
        </li>
      </ul>
      <ul class="mui-table-view" style="margin-top: 25px;">
        <li class="mui-table-view-cell">
          <a class="mui-navigate-right" @click="infaq">关于我们</a>
        </li>
      </ul>
      <ul class="mui-table-view" style="margin-top: 25px;">
        <li class="mui-table-view-cell">
          <a style="text-align: center;color: #FF3B30;" @click="inOff">退出登录</a>
        </li>
      </ul>
    </div>
  </div>
</template>
<script>
import { Toast } from "mint-ui";
window.history.forward(1);
export default {
  data() {
    return {
      isfaq: [
        { id: 1, title: "新消息通知" },
        { id: 2, title: "隐私" },
        { id: 3, title: "通用" }
      ],
      uname: sessionStorage["uname"]
    };
  },
  methods: {
    inOff() {
      //注销用户
      sessionStorage.clear();
      if (sessionStorage.length === 0) {
        //注销成功提示
        Toast("注销成功");
        this.$router.push("/login");
        this.$parent.getCartCount();
      } else {
        Toast("系统繁忙，请稍后再试");
      }
    },
    infaq(id) {
      if (id == 1) {
        Toast("没有任何消息");
      } else {
        this.$router.push("/faq");
      }
    },
    isLogin() {
      var uid = sessionStorage["uid"];
      if (uid == undefined) {
        Toast("登录后可查看个人中心");
        this.$router.push("/login");
      }
    }
  },
  created() {
    this.isLogin();
  }
};
</script>
<style scoped>
.mui-card-header span {
  margin: 0 auto;
}
.app_user .mui-card-content .mui-card-content-inner img {
  width: 50px;
  height: 50px;
  border-radius: 50%;
}
.app_user .mui-card-content .mui-card-content-inner {
  background-image: url("http://127.0.0.1:3000/img/home/pg1.jpg");
  position: relative;
  display: flex;
  justify-content: space-evenly;
}
.app_user .mui-card-content .mui-card-content-inner h2 {
  line-height: 37px;
  font-weight: 500;
  color: gainsboro;
  font-family: -webkit-body;
}
</style>




