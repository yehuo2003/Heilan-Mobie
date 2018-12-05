//一、商品列表模块
const express = require("express");
const pool = require("../pool");
const router = express.Router();
//按页码查询商品
router.get("/list",(req,res)=>{
  var pno = req.query.pno;  //当前页码
  var pageSize = req.query.pageSize;//页大小
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
  var sql = " SELECT id,title,price,sales,img_url FROM heilan_cate ORDER BY RAND() LIMIT ?,?";
  var offset = parseInt((pno-1)*pageSize);
  pageSize = parseInt(pageSize);
  pool.query(sql,[offset,pageSize],(err,result)=>{
    if(err)throw err;
    //console.log(result)
    obj.data = result;     //保存当前页内容
    progress += 50;     //进度加50
    if(progress == 100){//如果二条sql语句全部完成
      res.send({code:1,msg:obj})//发送
    }
  })
  //6.将数据json发送
})

//二、依据id查询商品详细信息
router.get("/find",(req,res)=>{
  //1.参数 id
  var id = req.query.id;
  var sql = " SELECT id,title,content,sales,stock,img_url,price,ctime FROM heilan_cate WHERE id = ? ";
  pool.query(sql,[id],(err,result)=>{
    if(err) throw err;
    res.send({code:1,msg:result})
  })    
});

module.exports = router;