//1.加载模块express
const express = require("express");
//2.创建express
var app = express();
//3.绑定端口 3000
app.listen(3000,()=>{
  console.log("启动海澜之家服务器，端口号3000，id：176.137.6.75")
})
app.use(express.static(__dirname+"/public"))