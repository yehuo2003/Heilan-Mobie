<template> 
  <div class="app_catelist">
    <search-box @getlist="searchGetdata"></search-box>
    <!-- 选择标签 -->
    <ul>
      <li><a href="#" @click="getMore">综合</a></li>
      <li><a href="#" @click="getSales">销量</a></li>
      <li><a href="#" @click="getCtime">上新</a></li>
      <li><a href="#" @click="getPrice">价格</a></li>
    </ul>
    <!-- 商品列表 -->
    <div class="cateList">
      <div class="cateItem" v-for="(item,index) of list" :key="index">
        <router-link :to="'/goods/'+item.id">
          <img :src="item.img_url">
          <p>
            {{item.title}}
          </p>
          <span>￥ {{item.price}}</span>
          <b>销量 {{item.sales}}</b>
        </router-link>
      </div>     
    </div>
     <!--  加载更多 -->
  <mt-button type="primary" size=large @click="getMore">加载更多...</mt-button>
  </div>
</template>
<script>
  //引入头部搜索框
import Search from '../components/Search' 
  export default {
    data () {
      return {
        list:[],
        pageIndex:0   //页码
      }
    },
    methods: {
      getSales(){//销量排序
       this.getMore(3);
      },
      getCtime(){//时间排序
       this.getMore(2);
      },
      getPrice(){//价格排序
       this.getMore(1);
      },
      getMore(sort){    
          this.pageIndex++; //页码 加1
          var url = "catelist/list?pno="+this.pageIndex+"&sort="+sort;
          this.$http.get(url).then(result=>{         
          this.list = this.list.concat(result.body.msg.data);
        })
      },
      searchGetdata (d) {
        this.list = d
      }
    },
    created() {
      this.getMore(1);
    },
    components:{
      "search-box":Search
    }
  }
</script>
<style>
  .app_catelist .mui-card-header span{
      margin: 0 auto;
  }
  .app_catelist>ul>li{
    list-style: none;    
  }
  .app_catelist>ul>li>a{
    color: #aaa;
    height: 40px;
    font-size: 16px;
    line-height: 35px;
  }
  .app_catelist>ul>li>a:link{
    color: orangered;
  }
  .app_catelist>ul{
    background: #fff;
    margin: 2px 0;
    padding: 0 30px;
    display: flex;
    justify-content: space-between;
  }
  .cateList{
    background: #eee;
    display: flex;
    flex-wrap:wrap;
  }
  .cateItem{
    background: #fff;
    padding: 5px;
    width: 50%;
  }
  .cateItem img{
    width: 100%;
  }
  .cateItem p{
    color: #555;
    font-size: 12px;
  }
  .cateItem span{
    color: #dc2829;
  }
  .cateItem b{
    float: right;
    margin-right:5px;
    color: #999;
    font-size: 12px;
  }
</style>