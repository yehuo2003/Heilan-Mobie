//购物车
//1:引入模块 pool express
const pool = require("../pool");
const express = require("express");
//2:创建路由对象
var router = express.Router();

//查询当前用户购物车商品数量
router.get("/select", (req, res) => {
  var user_id = req.query.uid;
  var sql = "SELECT SUM(count) AS c FROM heilan_cart WHERE user_id = ?"
  pool.query(sql, user_id, (err, result) => {
    if (err) throw err;
    res.send({ code: 1, msg: result })
  })
})

//添加购物车
router.get("/add", (req, res) => {
  //1:获取3个参数
  //需要第三方模块支持 bodyParser
  var user_id = req.query.user_id;
  var cate_id = req.query.cate_id;
  var count = req.query.count;
  //先查询，判断购物车是否有该用户购买记录
  var sql = "SELECT id,user_id,cate_id FROM heilan_cart WHERE user_id = ? AND cate_id =? "
  pool.query(sql, [user_id, cate_id], (err, result) => {
    if (err) {
      throw err
      //如果查询到购物车有购买记录
    } else if (result.length > 0) {
      //在原有购买记录上，购物车商品数量+1
      var sql = "UPDATE heilan_cart SET count=count+? WHERE user_id=? AND cate_id=?";
      pool.query(sql, [count, user_id, cate_id], (err, result) => {
        if (err) throw err
        res.send({ code: 1, msg: "购物车添加成功" });
      })
    } else {
      //如果购物车没有记录，那就添加进购物车
      var sql = " INSERT INTO heilan_cart VALUES (null,?,?,?,0)"
      pool.query(sql, [user_id, cate_id, count], (err, result) => {
        if (err) throw err;
        res.send({ code: 1, msg: "购物车添加成功" });
      });
    }
  })
})


//查询购物详细信息
router.get("/list", (req, res) => {
  var uid = req.query.uid;
  var sql = " SELECT cart.id,cart.user_id,cart.cate_id,img_url,cart.count,cate.price,cate.title,cate.stock,cate.sales FROM heilan_cate cate, heilan_cart cart WHERE cate.id = cart.cate_id AND cart.user_id = ?";
  uid = parseInt(uid);
  pool.query(sql, [uid], (err, result) => {
    if (err) throw err;
    res.send({ code: 1, msg: result });
  });
})

router.get("/update", (req, res) => {
  //1.参数  user_id cate_id count
  var user_id = req.query.uid;
  var cate_id = req.query.cate_id;
  var count = req.query.count;
  //2.sql
  var sql = "UPDATE heilan_cart SET count = ? WHERE user_id=? AND cate_id=?";
  user_id = parseInt(user_id);
  cate_id = parseInt(cate_id);
  count = parseInt(count);
  //3.json
  pool.query(sql, [count, user_id, cate_id], (err, result) => {
    if (err) throw err
    if (result.affectedRows > 0) {
      res.send({ code: 1, msg: "数量修改成功" })
    }
    else {
      res.send({ code: -1, msg: "修改失败" })
    }
  })
})

//删除购物车商品
router.get("/delete", (req, res) => {
  //获取需要的参数
  var user_id = req.query.uid;
  var cate_id = req.query.cate_id;
  var count = req.query.count;
  var sql = "DELETE FROM heilan_cart WHERE user_id=? AND cate_id =? AND count=?"
  pool.query(sql, [user_id, cate_id, count], (err, result) => {
    if (err) throw err;
    res.send({ code: 1, msg: "删除成功" })
  })
})

//4:导出当前路由模块
module.exports = router;