<template>
  <div class="app_faq">
    <header class="mui-bar mui-bar-nav" @click="next">
      <span class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></span>
      <h1 class="mui-title">关于产品</h1>
    </header>
    <div class="mui-content">
      <div class="mui-content-padded">
        <p>本产品为海澜之家——男人衣柜，镜像网页，为本人个人作品，仅供学习参考，未经许可，禁止进行任何商业行为</p>
        <p>如需商业合作，请与本人联系</p>
        <p>联系方式</p>
        <p>个人微信：yehuo2003</p>
        <img src="http://127.0.0.1:3000/img/home/wx.jpg" alt>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  data() {
    return {};
  },
  methods: {
    next() {
      this.$router.go(-1);
    }
  }
};
</script>
<style>
.mui-card-header span {
  margin: 0 auto;
}
.app_faq img {
  width: 100%;
}
</style>




