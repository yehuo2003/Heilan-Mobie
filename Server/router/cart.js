//购物车
//1:引入模块 pool express
const pool = require("../pool");
const express = require("express");
//2:创建路由对象
var router = express.Router();
router.get("/list",(req,res)=>{
    var obj = {code:1,msg:[
        {id:1,name:"海澜之家2018折扣清仓男潮流特卖加绒衬衫",price:168.00,count:3},
        {id:2,name:"海澜之家2018折扣清仓男潮流特卖长款大衣",price:758.00,count:5},
        {id:3,name:"海澜之家2018折扣清仓男潮流特卖牛仔裤",price:218.00,count:2}
    ]};
    res.send(obj);
});  
//4:导出当前路由模块
module.exports = router;