<template>
  <div class="mui-card-footer">
    <ul>
      <li v-for="(item,index) of thirdparty" :key="index">
        <a href="javascript:;" @click="isNo">
          <img :src="item.url">
          <p>{{item.title}}</p>
        </a>
      </li>
    </ul>
  </div>
</template>
<script>
import { Toast } from "mint-ui";
export default {
  data() {
    return {
      thirdparty: [
        {
          title: "新浪微博",
          url: "http://127.0.0.1:3000/img/home/weibuoimg.jpg"
        },
        { title: "QQ账号", url: "http://127.0.0.1:3000/img/home/QQimg.jpg" },
        {
          title: "支付宝账号",
          url: "http://127.0.0.1:3000/img/home/zhihubaologo.jpg"
        }
      ]
    };
  },
  methods: {
    //第三方登录
    isNo() {
      Toast("合作功能暂未开放");
    }
  }
};
</script>
<style>
.mui-card-footer {
  border-top: 1px dashed #aaa;
}
.mui-card-footer ul {
  padding-left: 5px;
  display: flex;
}
.mui-card-footer ul li {
  padding-left: 19px;
  margin: auto;
  width: 107px;
  list-style: none;
  border-right: 1px solid #aaa;
}
.mui-card-footer ul li:nth-child(1) {
  padding-left: 20px;
}
.mui-card-footer ul li:nth-child(3) {
  border-right: 0;
}
.mui-card-footer ul li:nth-child(1) img {
  width: 50px;
}
.mui-card-footer ul li:nth-child(2) {
  padding-left: 30px;
}
.mui-card-footer ul li:nth-child(2) img {
  margin-left: 10px;
  width: 30px;
}
.mui-card-footer ul li:nth-child(3) img {
  margin-left: 20px;
  width: 28px;
}
</style>