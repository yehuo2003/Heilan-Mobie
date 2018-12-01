<template>
  <div class="app_subcomment">
    <h1>评论子组件</h1>
  </div>
</template>
<script>
  export default {
    data () {
      return{}
    },
    methods:{},
    created() {
      console.log(this.id)
    },
    props:["id"]  //接收父组件传递参数
  }
</script>
<style>
  
</style>