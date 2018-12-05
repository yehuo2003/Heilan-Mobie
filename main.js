// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import router from './router'
//引入mint-ui组件并注册
//1.引入Header组件
import { Header,Swipe,SwipeItem,Button} from 'mint-ui';
//引入mint-ui 样式文件
import 'mint-ui/lib/style.css';
//导入 MUI 样式表
//还需要加载字体图标
import './lib/mui/css/mui.css'
import './lib/mui/css/icons-extra.css'
Vue.config.productionTip = false
//2.注册Header组件
Vue.component(Header.name,Header);
Vue.component(Swipe.name,Swipe);
Vue.component(SwipeItem.name,SwipeItem,Button);
Vue.component(Button.name,Button);
//2.1:引入axios组件库(VueResource)
import axios from "axios"
//2.2:跨域保存session值
axios.defaults.withCredentials=true
//2.3:注册组件
Vue.prototype.axios=axios

Vue.config.productionTip = false
//3.导入 vue-resource 引入到项目中
import VueResource from 'vue-resource'
//4.加载VueResource  全部加载
Vue.use(VueResource)
//5.自定义过滤器
//-dateFormat 过滤器名称
//-datestr 用户日期
Vue.filter("dateFormat",function(datestr,pattern="YYYY-MM-DD"){
  return new Date(datestr).toLocaleString();
});
//6.设置全局ajax访问基础路径
Vue.http.options.root = "http://127.0.0.1:3000";
//7.设置全局ajax post 访问格式
Vue.http.options.emulateJSON = true;
//8.跨域访问保存session值选项
Vue.http.options.withCredentials = true;

new Vue({
  el: '#app',
  router,
  components: { App },
  template: '<App/>'
})
