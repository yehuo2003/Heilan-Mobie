//购物车
//1:引入模块 pool express
const pool = require("../pool");
const express = require("express");
//2:创建路由对象
var router = express.Router();
// app.get("/add",(req,res)=>{
//     //1:获取3个参数
//     //需要第三方模块支持 bodyParser
//     // var uid = req.query.uid;
//     // var pid = req.query.pid;
//     // var c = req.query.count;
//     // //2:创建sql语句
//     // var sql  =" INSERT INTO `xz_shoppingcart_item`(`iid`, `user_id`, `product_id`, `count`, `is_checked`) VALUES (null,?,?,?,0)"
  
//     // pool.query(sql,[uid,pid,c],(err,result)=>{
//     //      if(err)throw err;
//     //      res.send({code:1,msg:"购物车添加成功"});
//     });
//     //3:返回添加结果
//   }) 
//4:导出当前路由模块
module.exports = router;