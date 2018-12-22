<template>
  <div class="app_disc">
    <!-- 顶部返回 -->
    <div class="mui-card-header">
      <router-link to="/home">
        <img src="http://127.0.0.1:3000/img/home/left.png" alt>
      </router-link>
      <span>清仓秒杀</span>
    </div>
    <div class="app_discount">
      <!-- 秒杀列表 -->
      <div
        class="app_discount-item"
        v-for="item of list"
        :key="item.id"
        @click="getDetail(item.id)"
      >
        <img :src="item.img_url">
        <h1 class="title">{{item.title}}</h1>
        <div class="info">
          <p class="price">
            <span class="old">￥{{(item.price*1.5).toFixed(2)}}</span>
            <span class="now">￥{{(item.price).toFixed(2)}}</span>
          </p>
          <p class="sell">
            <span>热卖中</span>
            <span>还剩{{item.stock}}件</span>
          </p>
        </div>
      </div>
      <!--已售出 -->
      <div class="app_discount-item out">
        <div class="yishou">
          <img src="http://127.0.0.1:3000/img/cate/cate.jpg">
          <img src="http://127.0.0.1:3000/img/cate/yishou.png">
        </div>
        <h1 class="title">HLA海澜之家免烫时尚秋季长袖清仓促销衬衫</h1>
        <div class="info">
          <p class="price">
            <span class="old">￥468.00</span>
            <span class="now">￥316.00</span>
          </p>
          <p class="sell">
            <span>已售空</span>
            <span>还剩 0 件</span>
          </p>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  data() {
    return {
      list: []
    };
  },
  methods: {
    getList() {
      this.$http.get("catelist/disc").then(result => {
        this.list = result.body.msg;
      });
    },
    getDetail(id) {
      this.$router.push({ path: "/goods/" + id });
    }
  },
  created() {
    this.getList();
  }
};
//点击当前商品跳转，商品详细信息组件
</script>
<style>
.mui-card-header span {
  margin: 0 auto;
}
.app_discount {
  display: flex;
  flex-wrap: wrap;
  padding: 7px;
  justify-content: space-between;
}
.app_discount .app_discount-item {
  width: 49%;
  background: #ccc;
  border: 1px solid #ccc;
  box-shadow: 0 0 8px #ccc;
  margin: 4px 0;
  padding: 2px;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  min-height: 293px;
}
.app_discount .app_discount-item img {
  width: 100%;
}
.app_discount .app_discount-item .title {
  font-size: 14px;
}
.app_discount .app_discount-item .info {
  background: #eee;
}
.app_discount .app_discount-item .info p {
  margin: 0;
  padding: 5px;
}
.app_discount .app_discount-item .info .price .old {
  text-decoration: line-through;
  font-size: 12px;
}
.app_discount .app_discount-item .info .price .now {
  color: #f00009;
  font-weight: bold;
  font-size: 16px;
}
.app_discount .app_discount-item .info .sell {
  display: flex;
  font-size: 12px;
  justify-content: space-between;
}
.app_disc .out {
  opacity: 0.5;
}
.app_disc .out .yishou {
  position: relative;
  z-index: 0;
  height: 170;
}
.app_disc .out img {
  position: absolute;
}
.app_disc .out .title {
  margin-top: 165px;
}
.app_disc .out .price .now {
  color: #666 !important;
}
</style>