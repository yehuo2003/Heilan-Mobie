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
  var email = obj.email;
  var phone = obj.phone;
  var upwd = obj.upwd;
  //2.创建正则表达式
  //3.创建sql
  var sql = " SELECT count(uid) as c,uid,uname FROM heilan_user WHERE uname = ? OR email = ? OR phone = ? AND upwd = md5(?)"
  pool.query(sql, [uname, email, phone, upwd], (err, result) => {
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
});
// 验证注册信息
// 验证用户名是否可用
router.get("/isUname", (req, res) => {
  var uname = req.query.uname;
  var sql = "SELECT uname FROM heilan_user WHERE uname = ?";
  pool.query(sql, uname, (err, result) => {
    if (err) throw err;
    if (result.length > 0) {
      res.send({ code: -1, msg: "该用户名已被注册" });
    } else {
      res.send({ code: 1, msg: "该用户名可以使用" });
    }
  })
});

// 验证邮箱是否可用
router.get("/isEmail", (req, res) => {
  var email = req.query.email;
  var sql = "SELECT email FROM heilan_user WHERE email = ?";
  pool.query(sql, email, (err, result) => {
    if (err) throw err;
    if (result.length > 0) {
      res.send({ code: -1, msg: "该邮箱已被注册" });
    } else {
      res.send({ code: 1, msg: "该邮箱可以使用" });
    }
  })
});

// 手机号是否可用
router.get("/isPhone", (req, res) => {
  var phone = req.query.phone;
  var sql = "SELECT phone FROM heilan_user WHERE phone = ?";
  pool.query(sql, phone, (err, result) => {
    if (err) throw err;
    if (result.length > 0) {
      res.send({ code: -1, msg: "该手机号已被注册" });
    } else {
      res.send({ code: 1, msg: "该手机号可以使用" });
    }
  })
});
//用户注册
router.post("/reg", (req, res) => {
  var obj = req.body;
  var uname = obj.uname;
  var upwd = obj.upwd;
  var phone = obj.phone;
  var email = obj.email;
  var sql = " SELECT uname, email, phone FROM heilan_user WHERE uname = ? OR email = ? OR phone = ?"
  pool.query(sql, [uname, email, phone], (err, result) => {
    if (err) throw err;
    if (result.length > 0) {
      res.send({ code: -1, msg: "请检查注册信息" })
    } else {
      var sql = "INSERT INTO heilan_user VALUES(NULL,?,md5(?),?,NULL,?,NULL,NULL,0)";
      pool.query(sql, [uname, upwd, phone, email], (err, result) => {
        if (err) throw err;
        if (result.affectedRows > 0) {
          res.send({ code: 1, msg: "注册成功" })
        } else {
          res.send({ code: -1, msg: "注册失败" })
        }
      })
    }
  })
})
//4:导出当前路由模块
module.exports = router;