<template>
  <div class="app_swiper">
    <mt-swipe :auto="4000">
      <mt-swipe-item v-for="item of list" :key="item.id">
        <img :src="item.img_url">
      </mt-swipe-item>
    </mt-swipe>
  </div>
</template>
<script>
export default {
  data() {
    return {};
  },
  methods: {},
  props: ["list"] //父元素传递数据
};
</script>
<style>
.app_swiper .mint-swipe {
  height: 125px;
}
.app_swiper .mint-swipe .mint-swipe-item {
  text-align: center;
}
.app_swiper .mint-swipe img {
  width: 100%;
}
</style>