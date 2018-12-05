//1.加载模块express
const express = require("express");
//1.1加载路由
const ImageList = require("./router/imagelist")
const cateList = require("./router/catelist")
const comment = require("./router/comment")
const discount = require("./router/discount")
const cart = require("./router/cart")
const user = require("./router/user")
//1.2加载body-parser
const bodyParse = require("body-parser")

//加载第三方模块express-session
const session = require("express-session")

//2 创建express
var app = express();
//2.0配置模块
app.use(bodyParse.urlencoded({
	extended:false
}));
//2.1 加载跨域处理请求
const cors = require("cors");
//2.2 允许哪个地址跨域访问
app.use(cors({
	origin:["http://localhost:8080","http://127.0.0.1:8080"],
	credentials:true
}))
//3.绑定端口 3000
app.listen(3000,()=>{
  console.log("启动海澜之家服务器，端口号3000，id：http://176.137.6.75")
})
//对跨域模块进行配置
app.use(session({
  secret:"128位随机字符",    //安全字符串
  resave:false,             //请求保存
  saveUninitialized:true,   //初始化保存
  cookie:{
    maxAge:1000 * 60 * 60 
  }
}));

//4.指定静态目录 public
app.use(express.static(__dirname+"/public"))
//5.将图片轮播模块加载当前应用中指定访问路径
app.use("/imagelist",ImageList);
app.use("/catelist",cateList);
app.use("/comment",comment);
app.use("/discount",discount);
app.use("/cart",cart);
app.use("/user",user);