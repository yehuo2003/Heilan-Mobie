<template>
  <div class="app-container">
    <!-- App.vue 根组件 -->
    <!-- 1.顶部加固定导航栏 -->
    <!-- 2.显示子组件 -->
    <router-view></router-view>
    <!-- 3.tabbar -->
    <nav class="mui-bar mui-bar-tab">
      <router-link class="mui-tab-item" to="/home">
        <span class="mui-icon mui-icon-home"></span>
        <span class="mui-tab-label">首页</span>
      </router-link>
      <router-link class="mui-tab-item" to="/discount">
        <span class="mui-icon mui-icon-extra mui-icon-extra-outline"></span>
        <span class="mui-tab-label">秒杀</span>
      </router-link>
      <router-link class="mui-tab-item" to="/cate">
        <span class="mui-icon mui-icon-extra mui-icon-extra-class"></span>
        <span class="mui-tab-label">列表</span>
      </router-link>
      <router-link class="mui-tab-item" to="/cart">
        <span class="mui-icon mui-icon-extra mui-icon-extra-cart">
          <!-- <span class="mui-badge" v-show="$store.getters.optCartCount>0">{{$store.getters.optCartCount}}</span> -->
          <span class="mui-badge" v-show="count>0">{{count}}</span>
        </span>
        <span class="mui-tab-label">购物车</span>
      </router-link>
      <router-link class="mui-tab-item" to="/user">
        <span class="mui-icon mui-icon-contact"></span>
        <span class="mui-tab-label">我的</span>
      </router-link>
    </nav>
  </div>
</template>
<script>
export default {
  data() {
    return {
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
