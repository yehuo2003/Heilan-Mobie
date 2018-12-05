const express = require("express");
const pool = require("../pool");
const router = express.Router();

//一、分页显示评论列表
router.get("/list",(req,res)=>{
  //1.参数 pno pageSize nid
  var pno = req.query.pno;
  var pageSize = req.query.pageSize;
  var nid = parseInt(req.query.nid);
  if(!pno){pno=1}
  if(!pageSize){pageSize=5}

  //2.sql-总记录数
  var obj = {pno:pno,pageSize:pageSize};
  var progress = 0;
  var sql = " SELECT count(id) AS c FROM heilan_comment WHERE nid = ?";
  pool.query(sql,[nid],(err,result)=>{
    if(err) throw err;
    obj.pageCount = Math.ceil(result[0].c/pageSize);
    progress += 50;
    if(progress == 100)
    res.send(obj);
  })

  // 当前页内容
  var offset = parseInt((pno-1)*pageSize);
  pageSize = parseInt(pageSize);
  var sql = "SELECT id,nid,ctime,content, username,isdel FROM heilan_comment WHERE nid = ? ORDER BY id DESC LIMIT ?,?";
  pool.query(sql,[nid,offset,pageSize],(err,result)=>{
    if(err) throw err;
    obj.data = result;
    progress += 50;
    if(progress == 100)
    res.send(obj);
  })
})

//二、添加一条评论
router.post("/save",(req,res)=>{
  //1.参数 nid username content
  var obj = req.body;
  var nid = parseInt(obj.nid);  //新闻编号
  var uname = req.session.uname;//用户名
  var content = obj.content;    //评论内容
  //内容长度大于2
  if(content.length < 2) {
    res.send({code:-1,msg:"亲，评论内容太少了"})
    return;
  }
  //2.sql  
  var sql = " INSERT INTO heilan_comment VALUES(null,?,now(),?,?,0)"
  pool.query(sql,[nid,content,uname],(err,result)=>{
    if(err) throw err;
    //执行成功条件：影响行数
    if(result.affectedRows == 1){
     res.send({code:1,msg:"评论成功"});
    }else{
     res.send({code:-1,msg:"评论失败"});
    }
  })
})

//导出路由对象
module.exports = router;