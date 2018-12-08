<template>
  <div class="app_search">
    <!-- 商品的输入框 -->
    <ul>
      <li>
        <img src="../../img/logo.png" alt="">
      </li>
      <li>
        <input type="search" placeholder="搜索商品">
      </li>
      <li>
        <a href="#">
          <img src="../../img/search.png" alt="">
        </a>
      </li>
    </ul>
  </div> 
</template>
<script>
export default {
  data () {
    return {
       
    }
  },
  methods:{},
  created() {
    
  },
}
</script>
<style>
  *{margin: 0;padding: 0;}
  .app_search{
    height:50px;  
    background: #041764; 
  }
  .app_search ul{
        display: fixed;
    list-style-type: none;
    display: flex;
    justify-content: space-around;  
    padding-top:2%;
  }
  .app_search ul li input{
    width: 135%;
    height:33px;
    background: #fff;
    font-size: 14px;
    border-radius: 0%;
    padding-left: 5px; 
    margin-left: -30px;
  }
  .app_search ul>li:nth-child(1) img{
    width: 40px;
  }
  .app_search ul>li:nth-child(3){
    width: 50px;
    height: 33px;
    border: 2px solid #fff;
    position: relative;
    right: 16px;
  }
  .app_search ul>li:nth-child(3) img{
    width: 30px;  
    
  }

</style>
