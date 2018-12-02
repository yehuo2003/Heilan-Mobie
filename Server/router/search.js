//商品搜素模块
//1:引入模块 pool express
const pool = require("../pool");
const express = require("express");
//2:创建路由对象
var router = express.Router();
router.get("/list",(req,res)=>{

});  
//4:导出当前路由模块
module.exports = router;