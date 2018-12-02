<template>
  <div class="app_search">
    <!-- 商品的输入框 -->
    <div class="mui-card-content">
      <div class="mui-card-content-inner">
        <input type="text" value="" placeholder="搜索商品...">
        <mt-button type="danger" size="small">搜索</mt-button>
      </div>
    </div>
    <!-- 商品列表 -->
    <div class="mui-card">
      <div class="mui-card-header">搜索结果</div>
      <div class="mui-card-content">
        <div class="mui-card-content-inner">
          <ul class="mui-table-view">
            <li class="mui-table-view-cell mui-media">
              <a href="javascript:;">
                <img class="mui-media-object mui-pull-left" src="">
                <div class="mui-media-body">
                  海澜之家
                  <p class='mui-ellipsis'>
                    海澜之家——男人衣柜
                  </p>
                </div>
              </a>
				    </li>
          </ul>
        </div>
      </div>
      <div class="mui-card-footer">页脚</div>
    </div>
    

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
  
</style>
