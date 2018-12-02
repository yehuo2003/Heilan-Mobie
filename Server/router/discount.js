//1:引入模块 pool express
const pool = require("../pool");
const express = require("express");
//2:创建路由对象
var router = express.Router();
//一、折扣商品列表模块
var router = express.Router();
router.get("/list",(req,res)=>{
  var obj = [
    {id:1,img_url:"http://127.0.0.1:3000/img/cate/cate1.jpg",title:"海澜之家2018折扣清仓男牛津纺水洗休闲衬衫",p_old:"368.00",p_now:"168.00",sell:1},
    {id:2,img_url:"http://127.0.0.1:3000/img/cate/cate2.jpg",title:"海澜之家2018折扣清仓男潮流特卖长袖衬衫",p_old:"798.00",p_now:"596.00",sell:3},
    {id:3,img_url:"http://127.0.0.1:3000/img/cate/cate3.jpg",title:"海澜之家2018折扣清仓男休闲潮流卫衣",p_old:"368.00",p_now:"168.00",sell:2},
    {id:4,img_url:"http://127.0.0.1:3000/img/cate/cate4.jpg",title:"海澜之家2018折扣清仓男潮流特卖加绒衬衫",p_old:"179.00",p_now:"388.00",sell:5}
  ];
  res.send({code:1,msg:obj});
});

router.get("/find",(req,res)=>{
  var obj = {id:"9",title:"海澜之家2018折扣清仓男潮流特卖加绒衬衫",p_old:"179.00",p_now:"388.00",p_sn:"219954563",p_type:"衬衫"}
  res.send(obj);
})
//4:导出当前路由模块
module.exports = router;