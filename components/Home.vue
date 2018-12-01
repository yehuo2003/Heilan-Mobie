<template>
  <div class="app">
    <!-- 主页组件Home -->
    <!-- 1.轮播图 -->
    <mt-swipe :auto="3000">
      <mt-swipe-item v-for="item of list" :key="item.id">
        <img :src="item.img_url">
      </mt-swipe-item>
    </mt-swipe>
    <!-- 2.主页内容图片 -->
    <div class="menu">
      <p>
        <router-link to="home/cate"><img src="../../img/menu1.jpg" />
        </router-link>
      </p>
      <p>
        <a href=""><img src="../../img/menu2.jpg" />
        </a>
      </p>
      <p>
        <a href=""><img src="../../img/menu3.jpg" />
        </a>
      </p>
      <p>
        <a href=""><img src="../../img/menu4.jpg" />
        </a>
      </p>
      <p>
        <a href=""><img src="../../img/menu5.jpg" />
        </a>
      </p>
      <p>
        <a href=""><img src="../../img/menu6.jpg" />
        </a>
      </p>
      <p>
        <a href=""><img src="../../img/menu7.jpg" />
        </a>
      </p>
      <p>
        <a href=""><img src="../../img/menu8.jpg" />
        </a>
      </p>
      <p>
        <a href=""><img src="../../img/menu9.jpg" />
        </a>
      </p>    
      </div>
  </div>
</template>
<script>
  //加载当前组件需要的模块
  import {Toast} from "mint-ui";
  export default {
    data () {
      return {
        list:[]
      }
    },
    methods: {
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
    },
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