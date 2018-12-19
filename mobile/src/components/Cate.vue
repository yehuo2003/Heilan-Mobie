<template> 
  <div class="app_catelist">
    <search-box @getlists="searchGetdata"></search-box>
    <!-- 选择标签 -->
    <ul>
      <li><a href="#" @click="getList(5)">综合</a></li>
      <li><a href="#" @click="getList(3)">销量</a></li>
      <li><a href="#" @click="getList(2)">上新</a></li>
      <li><a href="#" @click="getList(1)">价格</a></li>
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
  <mt-button type="primary" size=large @click="getMore()">加载更多...</mt-button>
  </div>
</template>
<script>
     var that={};
  //引入头部搜索框
import Search from './Search' 
import {Toast} from 'mint-ui'
  export default {
    data () {
      return {
        list:[],
        pageIndex:0,   //页码
        id:0
      }
    },
    methods: {
      getMore(sort){  
        sort=sessionStorage["sort"];
          this.pageIndex++; //页码 加1
          var url = "catelist/list?pno="+this.pageIndex+"&sort="+sort;
          this.$http.get(url).then(result=>{                
          if(result.body.msg.data.length<=1){
            Toast("没有更多商品了")
          }else{
            this.list = this.list.concat(result.body.msg.data);
          }
        })
      },
      getList(sort){
        sessionStorage["sort"]=sort;
        this.list=[];
        this.pageIndex=1;
          var url = "catelist/list?pno="+this.pageIndex+"&sort="+sort;
          this.$http.get(url).then(result=>{     
          this.list = (result.body.msg.data);    
        })
      },
      search(sort){
        sessionStorage["sort"]=this.sort;
        this.list=[];
        var val = sessionStorage["val"]  
        this.pageIndex=1;
      var url = "search/list?pno="+this.pageIndex+"&sort=4"+"&val="+val;
      this.$http.get(url).then(result=>{         
        if(result.body.msg.data.length === []){
          Toast("没有更多商品了")
        }else{
          this.list = (result.body.msg.data);  
        }
          sessionStorage.removeItem('val') 
          return this.list;
        })
      },
      searchGetdata (d) {
        this.list = d;
      }
    },
    created() {
      this.$bus.$on("senddata",function(data){
        that.list=data;
      })
      this.list=that.list;
      var sort = parseInt(sessionStorage.sort);    
      if(sort==4&&this.list!==undefined){
        this.search(4);
      }else{
        this.getList(5);
      }
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