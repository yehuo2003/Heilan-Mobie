//1:引入模块 pool express
const pool = require("../pool");
const express = require("express");
//2:创建路由对象
var router = express.Router();
//一、折扣商品列表模块
var router = express.Router();
router.get("/list",(req,res)=>{
  var sql = "SELECT id,title,stock,img_url,price FROM heilan_cate ORDER BY stock LIMIT 5";
  pool.query(sql,(err,result)=>{
    if(err) throw err;
    res.send({code:1,msg:result});
  })
});

router.get("/find",(req,res)=>{
  var obj = {id:"9",title:"海澜之家2018折扣清仓男潮流特卖加绒衬衫",p_old:"179.00",p_now:"388.00",p_sn:"219954563",p_type:"衬衫"}
  res.send(obj);
})
//4:导出当前路由模块
module.exports = router;