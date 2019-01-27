//商品搜素模块
//1:引入模块 pool express
const pool = require("../pool");
const express = require("express");
//2:创建路由对象
var router = express.Router();
router.get("/list", (req, res) => {
  var val = req.query.val
  var sql = " SELECT id,title,price,sales,img_url FROM heilan_cate WHERE title LIKE ? ORDER BY price";
  pool.query(sql, `%${val}%`, (err, result) => {
    if (err) throw err;
    res.send({ code: 1, msg: result })//发送
  })
})
//4:导出当前路由模块
module.exports = router;