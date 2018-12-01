<template>
  <div class="app_catelist">
    <!-- 选择标签 -->
    <ul>
      <li><a href="#">综合</a></li>
      <li><a href="#">销量</a></li>
      <li><a href="#">上新</a></li>
      <li><a href="#">价格</a></li>
    </ul>
    <!-- 商品列表 -->
    <div class="cateList">
      <div class="cateItem" v-for="item of list" :key="item.id">
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
  export default {
    data () {
      return {
        list:[],
        pageIndex:0   //页码
      }
    },
    methods: {
      getMore(){
        this.pageIndex++; //页码 加1
        var url = "catelist/list?pno="+this.pageIndex;
        this.$http.get(url).then(result=>{
          this.list = this.list.concat(result.body.msg.data);
        })
      },
      getCateList(){
        // //分页获取商品列表
        // var url = "catelist/list";
        // this.$http.get(url).then(result=>{
        //   if(result.body.code == 1){
        //     this.list = result.body.msg.data;
        //   }
        // })
      }
    },
    created() {
      this.getMore();
    }
  }
</script>
<style>
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