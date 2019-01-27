<template>
  <div class="app_catelist">
    <search-box @getlists="searchGetdata"></search-box>
    <!-- 选择标签 -->
    <ul>
      <li v-for="(item,index) of tab" :key="index">
        <a href="#" @click="getList(item.sort)" :class="{active:flag===item.sort}">{{item.title}}</a>
      </li>
    </ul>
    <!-- 商品列表 -->
    <div class="cateList">
      <div class="cateItem" v-for="(item,index) of list" :key="index">
        <router-link :to="'/goods/'+item.id">
          <img :src="item.img_url">
          <p>{{item.title}}</p>
          <span>￥ {{item.price}}</span>
          <b>销量 {{item.sales}}</b>
        </router-link>
      </div>
    </div>
    <!--  加载更多 -->
    <mt-button type="primary" size="large" :class="{refMore:isMore}" @click="getMore()">加载更多...</mt-button>
  </div>
</template>
<script>
var that = {};
//引入头部搜索框
import Search from "./Search";
import { Toast } from "mint-ui";
export default {
  data() {
    return {
      id: 0,
      flag: 0,
      pageIndex: 0, //页码
      list: [],
      isMore: false,
      tab: [
        { sort: 5, title: "综合" },
        { sort: 3, title: "销量" },
        { sort: 2, title: "上新" },
        { sort: 1, title: "价格" }
      ]
    };
  },
  methods: {
    getMore(sort) {
      this.isMore = false;
      sort = sessionStorage["sort"];
      this.pageIndex++; //页码 加1
      var url = "catelist/list?pno=" + this.pageIndex + "&sort=" + sort;
      this.$http.get(url).then(result => {
        if (result.body.msg.data.length <= 1) {
          Toast("没有更多商品了");
          this.isMore = true;
        } else {
          this.list = this.list.concat(result.body.msg.data);
        }
      });
    },
    getList(sort) {
      this.flag = sort;
      sessionStorage["sort"] = sort;
      this.list = [];
      this.pageIndex = 1;
      var url = "catelist/list?pno=" + this.pageIndex + "&sort=" + sort;
      this.$http.get(url).then(result => {
        this.list = result.body.msg.data;
      });
    },
    search(sort) {
      sessionStorage["sort"] = this.sort;
      this.list = [];
      var val = sessionStorage["val"];
      var url = "search/list?sort=4" + "&val=" + val;
      this.$http.get(url).then(result => {
        if (result.body.msg.length === []) {
          Toast("没有更多商品了");
        } else {
          this.list = result.body.msg;
        }
        sessionStorage.removeItem("val");
        return this.list;
      });
    },
    searchGetdata(d) {
      this.list = d;
    }
  },
  created() {
    var sort = parseInt(sessionStorage.sort);
    if (sort == 4 && this.list !== undefined) {
      this.search(4);
    } else {
      this.getList(5);
    }
  },
  components: {
    "search-box": Search
  }
};
</script>
<style>
.active {
  color: #ff5200 !important;
}
.app_catelist .mui-card-header span {
  margin: 0 auto;
}
.app_catelist > ul > li {
  list-style: none;
}
.app_catelist > ul > li > a {
  color: #aaa;
  height: 40px;
  font-size: 16px;
  line-height: 35px;
}
.app_catelist > ul > li > a:link {
  color: orangered;
}
.app_catelist > ul {
  background: #fff;
  margin: 2px 0;
  padding: 0 30px;
  display: flex;
  justify-content: space-between;
}
.cateList {
  background: #eee;
  display: flex;
  flex-wrap: wrap;
}
.cateItem {
  background: #fff;
  padding: 5px;
  width: 50%;
}
.cateItem img {
  width: 100%;
}
.cateItem p {
  color: #555;
  font-size: 12px;
}
.cateItem span {
  color: #dc2829;
}
.cateItem b {
  float: right;
  margin-right: 5px;
  color: #999;
  font-size: 12px;
}
.refMore {
  display: none;
}
</style>