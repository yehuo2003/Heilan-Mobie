<template>
  <div class="app_search">
    <!-- 商品的输入框 -->
    <ul>
      <li>
        <img src="http://127.0.0.1:3000/img/home/logo.png">
      </li>
      <li>
        <input type="search" placeholder="搜索商品" v-model="val">
      </li>
      <li>
        <a href="#" @click.prevent="search">
          <img src="http://127.0.0.1:3000/img/home/search.png">
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
      val: "",
      sort: 4
    };
  },
  methods: {
    search(sort) {
      sessionStorage["sort"] = this.sort;
      let val = this.val;
      val = val.replace(/\s+/g, "");
      var yzVal = /^[\s\S]*.*[^\s][\s\S]*$/;
      if (yzVal.test(val) === false) {
        Toast("搜索内容不能为空");
      } else {
        var url = "search/list?sort=" + this.sort + "&val=" + val;
        this.$http.get(url).then(result => {
          this.$router.push("/cate");
          if (result === []) {
            Toast("没有更多商品了");
          } else {
            sessionStorage["val"] = val;
            var lt = result.body.msg.length;
            Toast(`搜索到${lt}件商品`);
            this.$emit("getlists", result.body.msg);
          }
        });
      }
    }
  }
};
</script>
<style>
* {
  margin: 0;
  padding: 0;
}
.app_search {
  height: 50px;
  background: #041764;
}
.app_search ul {
  display: fixed;
  list-style-type: none;
  display: flex;
  justify-content: space-around;
  padding-top: 2%;
}
.app_search ul li input {
  width: 135%;
  height: 33px;
  background: #fff;
  font-size: 14px;
  border-radius: 0%;
  padding-left: 5px;
  margin-left: -30px;
}
.app_search ul li input:focus {
  border-style: solid;
  border-color: #03a9f4;
  box-shadow: 0 0 5px #03a9f4;
}
.app_search ul > li:nth-child(1) img {
  width: 40px;
}
.app_search ul > li:nth-child(3) {
  width: 50px;
  height: 33px;
  border: 2px solid #fff;
  position: relative;
  right: 16px;
}
.app_search ul > li:nth-child(3) img {
  width: 30px;
  margin-left: 5px;
}
</style>
