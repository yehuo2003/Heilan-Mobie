<template>
  <div class="app">
    <!-- 主页组件Home -->
     <search-box @getlists="rcvMsg"></search-box>
    <!-- 1.轮播图 -->
    <mt-swipe :auto="3000">
      <mt-swipe-item v-for="item of list" :key="item.id">
        <img :src="item.img_url" @click="getRouter(1)">
      </mt-swipe-item>
    </mt-swipe>
    <!-- 2.主页内容图片 -->
    <div class="menu">
      <p v-for="item of centent" :key="item.id" @click="getRouter(item.id)">
        <img :src="item.img_url" />     
      </p>      
    </div>
  </div>
</template>
<script>
  //加载当前组件需要的模块
import {Toast} from "mint-ui";
  //引入头部搜索框
import SearchVue from './Search.vue';  
import Search from '../components/Search'

  export default {
    data () {
      return {
        list:[],
        centent:[]
      }
    },
    methods: {
      getRouter(id){
        if(id===10){
          window.scrollTo(0,0);
        }else{
          this.$router.push("/home/cate")       
        }
      },
      rcvMsg(data){
        this.list=data;
        this.$bus.$emit("senddata",this.list);
      },
      getCentent(){
        //获取主页图片内容
        var url = "imagelist/centent";
        this.$http.get(url).then(result=>{
          if(result.body.code == 1){
            this.centent = result.body.msg;
          }else{
            Toast("加载内容失败...")
          }
        })
      },
      getImageList(){
        //获取图片轮播的数据
        var url = "imagelist/list";
        this.$http.get(url).then(result=>{
          if(result.body.code == 1){
            this.list = result.body.msg;
          }else{
            Toast("加载轮播图片失败...");
          }
        })
      }
    },
    created() {
      this.getImageList();
      this.getCentent();
    },
    components:{
      "search-box":Search
    }
  }
</script>
<style>
  /* 设置图片高度 */
  .app .mint-swipe{
    height:141px;
  }
  .app .mint-swipe img,.app .menu img{
    width: 100%;
  }
</style>