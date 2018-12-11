<template>
  <div class="app_search">
    <!-- 商品的输入框 -->
    <ul>
      <li>
        <img src="http://127.0.0.1:3000/img/home/logo.png" alt="">
      </li>
      <li>
        <input type="search" placeholder="搜索商品" v-model="val">
      </li>
      <li>
        <a href="#" @click.prevent="search">
          <img src="http://127.0.0.1:3000/img/home/search.png" alt="">
        </a>
      </li>
    </ul>
  </div> 
</template>
<script>
import {Toast} from 'mint-ui'
export default {
  data () {
    return {
       val:"",
       pageIndex:0,
       sort:4 
    }
  }, 
  methods:{
   search(sort){
     console.log(this.sort);
     sessionStorage["sorts"]=this.sort;
     this.list=[];     
     var val = this.val;
     val = val.replace(/\s+/g,"")      
      this.pageIndex=1;
      var url = "search/list?pno="+this.pageIndex+"&sort="+this.sort+"&val="+val;
      this.$http.get(url).then(result=>{         
      // this.$emit.list = result.body.msg.data; 
      console.log(result.body.msg)
      this.$router.push("/home/cate")
      if(result.body.msg.data.length == 1){
       Toast("没有更多商品了")
      }else{
        this.$emit('getlists',result.body.msg.data)
      }  
    })
   }
  },
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
