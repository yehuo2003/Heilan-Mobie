<template>
  <div class="app-container">
    <!-- App.vue 根组件 -->
    <!-- 1.顶部加固定导航栏 -->
    
    <!-- 2.显示子组件 -->
    <router-view></router-view>
    <!-- 3.tabbar -->
    <nav class="mui-bar mui-bar-tab">
        <router-link class="mui-tab-item mui-active"  to="/home">
      <span class="mui-icon mui-icon-home"></span>
      <span class="mui-tab-label">首页</span>
      </router-link>			
      <router-link class="mui-tab-item" to="/home/discount">
        <span class="mui-icon mui-icon-extra mui-icon-extra-class"></span>
        <span class="mui-tab-label">秒杀</span>
      </router-link>
      <router-link class="mui-tab-item" to="/home/cate">
        <span class="mui-icon mui-icon-extra mui-icon-extra-class"></span>
        <span class="mui-tab-label">列表</span>
      </router-link>
      <router-link class="mui-tab-item" to="/cart">
        <span class="mui-icon mui-icon-extra mui-icon-extra-cart">
          <span class="mui-badge">{{$store.getters.optCartCount}}</span>
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
  data () {
    return {

    }
  }
}
</script>
<style>
  .app-container{
    padding-bottom: 50px;
    overflow-x: hidden;
  }
  .mui-bar-tab{
    background: #041764; 
  }
</style>
