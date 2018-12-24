//用户模块
//1:引入模块 pool express
const pool = require("../pool");
const express = require("express");
var router = express.Router();

//2:创建路由对象
router.post("/login", (req, res) => {
  //1.获取参数 uname,upwd
  var obj = req.body;
  var uname = obj.uname;
  var upwd = obj.upwd;
  //2.创建正则表达式
  //3.创建sql
  var sql = " SELECT count(uid) as c,uid,uname FROM heilan_user WHERE uname = ? AND upwd = md5(?)"
  pool.query(sql, [uname, upwd], (err, result) => {
    if (err) throw err;
    var obj = result[0].c;
    if (obj == 1) {
      //4.将用户名保存到session对象中
      req.session.uname = uname;
      res.send({ code: 1, msg: "登录成功", uid: result[0].uid, uname: result[0].uname })
    } else {
      res.send({ code: -1, msg: "用户名或密码错误" })
    }
  })
})

//用户注册
router.post("/reg", (req, res) => {
  var obj = req.body;
  var uname = obj.uname;
  var upwd = obj.upwd;
  var phone = obj.phone;
  var email = obj.email;
  var sql = "INSERT INTO heilan_user VALUES(NULL,?,md5(?),?,NULL,?,NULL,NULL,0)";
  pool.query(sql, [uname, upwd, email, phone], (err, result) => {
    if (err) throw err;
    if (result.affectedRows > 0) {
      res.send({ code: 1, msg: "注册成功" })
    } else {
      res.send({ code: -1, msg: "注册失败" })
    }
  })
})
//4:导出当前路由模块
module.exports = router;