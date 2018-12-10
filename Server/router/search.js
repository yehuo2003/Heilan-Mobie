//商品搜素模块
//1:引入模块 pool express
const pool = require("../pool");
const express = require("express");
//2:创建路由对象
var router = express.Router();
router.get("/list",(req,res)=>{
  var pno = req.query.pno;  //当前页码
  var pageSize = req.query.pageSize;//页大小
  var sort = req.query.sort;
  var val = req.query.val;
  //2.设置参数默认值
  if(!pno){
    pno = 1;
  }
  if(!pageSize){
    pageSize = 10;
  }
  //3.验证用户输入
  var reg = /^[0-9]{1,}$/;
  if(!reg.test(pno)){
    res.send({code:-1,msg:"页码格式不正确"});
    return;
  }
  if(!reg.test(pageSize)){
    res.send({code:-2,msg:"页大小格式不正确"});
    return;
  }
  //设置跨域
  var progress = 0;
  var obj = {code:1};
  obj.uname = req.session.uname;

  //4.创建两条sql发送 总记录数
  //4.1创建空对象保存返回数据
  var obj = {pno:pno,pageSize:pageSize};
  //4.2创建变量保存(sql语句完成)进度
  var progress = 0;
  var sql = " SELECT count(id) AS c FROM heilan_cate";
  pool.query(sql,(err,result)=>{
    if(err)throw err;
    //console.log(result[0].c)
    var pageCount = Math.ceil(result[0].c/pageSize);
    obj.pageCount = pageCount;//保存总页数
    progress += 50;           //保存当前进度
    if(progress == 100){      //二条sql完成
      res.send({code:1,msg:obj})//发送结果
    }
  })
  //5.创建第二条sql语句 当前页内容
  if(sort == 1){
    //如果sort等于1，执行价格排序
    var sql = " SELECT id,title,price,sales,img_url FROM heilan_cate ORDER BY price LIMIT ?,?";
  }else if(sort == 2){
    //如果sort等于2，按时间排序
    var sql = " SELECT id,title,price,sales,img_url FROM heilan_cate ORDER BY ctime LIMIT ?,?";
  }else if(sort == 3){
    //如果sort等于3，按销量排序
    var sql = " SELECT id,title,price,sales,img_url FROM heilan_cate ORDER BY sales LIMIT ?,?";
  }else if(sort == 4){
    //如果sort等于4，模糊查找
    var sql = " SELECT id,title,price,sales,img_url FROM heilan_cate WHERE title LIKE ? ORDER BY price LIMIT ?,?";
  }else{
    var sql = " SELECT id,title,price,sales,img_url FROM heilan_cate ORDER BY RAND() LIMIT ?,?";
  }
  var offset = parseInt((pno-1)*pageSize);
  pageSize = parseInt(pageSize);
  pool.query(sql,[`%${val}%`,offset,pageSize],(err,result)=>{
    if(err)throw err;
    console.log(result)
    obj.data = result;     //保存当前页内容
    progress += 50;     //进度加50
    if(progress == 100){//如果二条sql语句全部完成
      res.send({code:1,msg:obj})//发送
    }
  })
  //6.将数据json发送
})
//4:导出当前路由模块
module.exports = router;