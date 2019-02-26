//1:引入模块 pool express
const pool = require("../pool");
const express = require("express");
//2:创建路由对象
var router = express.Router();

//头部
// 右边导航表
router.get("/rightList", (req, res) => {
  var sql = "SELECT id,title FROM heilan_rightList";
  pool.query(sql, (err, result) => {
    //如果执行操作出错误，抛出错误对象
    if (err) throw err;
    res.send(result);
  });
});

// 查询一级条目下所有商品的条目
router.get("/liastnav", (req, res) => {
  var sql = "SELECT cid,title FROM heilan_onenav LIMIT 5";
  pool.query(sql, (err, result) => {
    //如果执行操作出错误，抛出错误对象
    if (err) throw err;
    var navBarList = result; //导航条目列表
    var count = 0;
    for (let c of navBarList) {
      // 循环查询二级条目
      pool.query(
        "SELECT * FROM heilan_liastnav WHERE cid=?",
        c.cid,
        (err, result) => {
          if (err) throw err;
          c.list = result;
          count++;
          // 必须保证所有类别下的菜品都查询完成才能发送——这些查询都是异步执行的
          if (count == navBarList.length) {
            res.send(navBarList);
          }
        }
      );
    }
  });
});
// 导航条目
router.get("/navBarList", (req, res) => {
  var sql = "SELECT * FROM heilan_onenav";
  pool.query(sql, (err, result) => {
    if (err) throw err;
    var navBarList = result; //导航条目列表
    var count = 0;
    for (let c of navBarList) {
      // 循环查询二级条目
      pool.query(
        "SELECT * FROM heilan_navtwo WHERE cid=?",
        c.cid,
        (err, result) => {
          if (err) throw err;
          c.list = result;
          count++;
          // 必须保证所有类别下的菜品都查询完成才能发送——这些查询都是异步执行的
          if (count == navBarList.length) {
            res.send(navBarList);
          }
        }
      );
    }
  });
});

// 查询尾部信息
// 查询尾部购物指南一二级列表
router.get("/after", (req, res) => {
  var sql = "SELECT * FROM heilan_after";
  pool.query(sql, (err, result) => {
    //如果执行操作出错误，抛出错误对象
    if (err) throw err;
    var List = result; //导航条目列表
    var count = 0;
    for (let c of List) {
      // 循环查询二级条目
      pool.query(
        "SELECT * FROM heilan_afterlist WHERE cid=?",
        c.aid,
        (err, result) => {
          if (err) throw err;
          c.list = result;
          count++;
          if (count == List.length) {
            res.send(List);
          }
        }
      );
    }
  });
});

// 尾部基本信息
router.get("/rules", (req, res) => {
  var sql = "SELECT * FROM heilan_rules";
  pool.query(sql, (err, result) => {
    //如果执行操作出错误，抛出错误对象
    if (err) throw err;
    res.send(result);
  });
});

// 工商标识
router.get("/icbcimg", (req, res) => {
  var sql = "SELECT * FROM heilan_icbcimg";
  pool.query(sql, (err, result) => {
    //如果执行操作出错误，抛出错误对象
    if (err) throw err;
    res.send(result);
  });
});

// 工商备案
router.get("/icbctitle", (req, res) => {
  var sql = "SELECT * FROM heilan_icbctitle";
  pool.query(sql, (err, result) => {
    //如果执行操作出错误，抛出错误对象
    if (err) throw err;
    res.send(result);
  });
});

// 插入主页信息
// 插入主页图片列表
router.get("/pcimg", (req, res) => {
  var sql = "SELECT * FROM heilan_pcimg";
  pool.query(sql, (err, result) => {
    //如果执行操作出错误，抛出错误对象
    if (err) throw err;
    res.send(result);
  });
});

// 插入列表信息
router.get("/goryList", (req, res) => {
  // 模拟空数据
  var List = [
    { cid: 1, list: [] },
    { cid: 2, list: [] },
    { cid: 3, list: [] },
    { cid: 4, list: [] }
  ];
  var count = 0;
  for (let c of List) {
    // 循环查询二级条目
    pool.query(
      "SELECT * FROM heilan_goryList WHERE cid=?",
      c.aid,
      (err, result) => {
        if (err) throw err;
        c.list = result;
        count++;
        if (count == List.length) {
          res.send(List);
        }
      }
    );
  }
});

// 浮动框
router.get("/Mentoring", (req, res) => {
  var sql = "SELECT * FROM heilan_mentoring";
  pool.query(sql, (err, result) => {
    //如果执行操作出错误，抛出错误对象
    if (err) throw err;
    res.send(result);
  });
});

//4:导出当前路由模块
module.exports = router;
