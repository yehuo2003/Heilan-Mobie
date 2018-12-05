//用户模块
//1:引入模块 pool express
const pool = require("../pool");
const express = require("express");
var router = express.Router();


//2:创建路由对象
router.get("/login",(req,res)=>{
    //1.获取参数 uname,upwd
    var uname = req.query.uname;
    var upwd = req.query.upwd;
    //2.创建正则表达式
    //3.创建sql
    var sql = " SELECT count(uid) as c FROM heilan_user WHERE uname = ? AND upwd = md5(?)"
    pool.query(sql,[uname,upwd],(err,result)=>{
      if(err) throw err;
      var obj = result[0].c;
      if(obj == 1){
        //4.将用户名保存到session对象中
        req.session.uname = uname;
        res.send({code:1,msg:"登录成功"})
      }else{
        res.send({code:-1,msg:"用户名或密码错误"})
      }
    })
  })
//4:导出当前路由模块
module.exports = router;