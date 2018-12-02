<template>
  <div class="app_cart">
    <div class="mui-card">
      <div class="mui-card-header">购物车</div>
      <div class="mui-card-content">

        <div class="mui-card-content-inner" v-for="item of list" :key="item.id">
          {{item.name}} {{item.price}}
          <!-- 按钮组件 -->
          <div class="mui-numbox">
            <button class="mui-btn mui-btn-numbox-minus" type="button" @click="setSub(item.id)">-</button>
            <input class="mui-input-numbox" type="number" :value="item.count"/>
            <button class="mui-btn mui-btn-numbox-plus" type="button" @click="setAdd(item.id)">+</button>
          </div> 
        </div>

      </div>
      <div class="mui-card-footer">
        小计：<span>￥ {{getSubtotal}}</span>
      </div>
			</div>
  </div>
</template>

<script>
export default {
  data () {
    return {
      list:[]
    }
  },
  methods:{
    setSub(id){
      for(var item of this.list){
        if(item.id == id){
          if(item.count<=1)break;
          item.count--;
        }
      }
    },
    setAdd(id){
      //依据id将对应count自增操作
      for(var item of this.list){
        if(item.id == id){
          item.count ++;
        }
      }
    },
    getCartList(){
      this.$http.get("cart/list").then(result=>{
        this.list = result.body.msg;
      })
    }
  },
  created() {
    this.getCartList();
  },
  computed:{
    //计算属性 计算多个数据变化
    getSubtotal:function(){
      var sum = 0;
      for (var item of this.list){
        sum += item.price * item.count;
      }
      return sum;
    }
  }
}
</script>
<style>

</style>

