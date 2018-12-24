import Vue from 'vue'
import Router from 'vue-router'
import Home from "@/components/Home"
import Cate from "@/components/Cate"
import User from "@/components/User"
import Reg from "@/components/Reg"
import Cart from "@/components/Cart"
import Login from "@/components/Login"
import Search from "@/components/Search"
import Goods from "@/components/Goods"
import Faq from "@/components/Faq"
import Discount from "@/components/Discount"

Vue.use(Router)

export default new Router({
  routes: [
    { path: '/', redirect: "/home" },
    { path: '/home', component: Home },
    { path: '/discount', component: Discount },
    { path: '/cate', component: Cate },
    { path: '/goods/:id', component: Goods, name: "goodsinfo" },
    { path: '/user', component: User },
    { path: '/login', component: Login },
    { path: '/reg', component: Reg },
    { path: '/cart', component: Cart },
    { path: '/faq', component: Faq },
    { path: '/search', component: Search }
  ], linkActiveClass: "mui-active"
})
