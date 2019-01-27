<template>
  <div class="app-container">
    <!-- App.vue 根组件 -->
    <!-- 1.顶部加固定导航栏 -->
    <!-- 2.显示子组件 -->
    <router-view></router-view>
    <!-- 3.tabbar -->
    <nav class="mui-bar mui-bar-tab">
      <router-link class="mui-tab-item" v-for="(item,index) of Tab" :key="index" :to="item.url">
        <span class="mui-icon" :class="item.cls">
          <span class="mui-badge" v-show="count>0 && item.title=='购物车'">{{count}}</span>
        </span>
        <span class="mui-tab-label">{{item.title}}</span>
      </router-link>
    </nav>
  </div>
</template>
<script>
export default {
  data() {
    return {
      Tab: [
        { title: "首页", cls: "mui-icon-home", url: "/home" },
        {
          title: "秒杀",
          cls: "mui-icon-extra mui-icon-extra-outline",
          url: "/discount"
        },
        {
          title: "列表",
          cls: "mui-icon-extra mui-icon-extra-class",
          url: "/cate"
        },
        {
          title: "购物车",
          cls: "mui-icon-extra mui-icon-extra-cart",
          url: "/cart"
        },
        { title: "我的", cls: "mui-icon-contact", url: "/user" }
      ],
      count: 0
    };
  },
  methods: {
    getCartCount() {
      var uid = sessionStorage["uid"];
      if (uid === undefined) {
        this.count = 0;
      } else {
        var url = "cart/select?uid=" + uid;
        this.$http.get(url).then(result => {
          this.count = result.body.msg[0].c;
          sessionStorage["count"] = this.count;
          if (this.count == null) {
            sessionStorage.removeItem("cate_id");
          }
          this.$store.commit("increment", this.count);
        });
      }
    }
  },
  created() {
    this.getCartCount();
  }
};
</script>
<style>
.app-container {
  padding-bottom: 50px;
  overflow-x: hidden;
}
.mui-bar-tab {
  background: #041764;
}
</style>
