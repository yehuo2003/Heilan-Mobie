#设置客户端的编码为utf8
SET NAMES UTF8;
#如果存在，删除数据库heilan
DROP DATABASE IF EXISTS heilan;

#创建数据库heilan，指定编码类型为utf8
CREATE DATABASE heilan CHARSET=UTF8;

#进入刚创建的数据库heilan
USE heilan;

#网站基本信息表
CREATE TABLE heilan_site_info(
		site_name VARCHAR(16),#主页名
    logo VARCHAR(64),			#logo图片
    admin_email VARCHAR(64),#
    icp VARCHAR(32),			#许可证
    copyright VARCHAR(64)
);
#插入网站基本信息表数据
INSERT INTO heilan_site_info VALUES
('海澜之家','img/logo.png','admin@heilan.com','粤ICP证09504058412','版权所有@2016-2026 男人衣柜');


#导航表
CREATE TABLE heilan_navbar_item(
	nid TINYINT,									#商品列表编号
	nav_name VARCHAR(16),					#导航名
	url VARCHAR(128),							#导航地址
	parent BOOL										#是否二级菜单
);
#插入导航表数据
INSERT INTO heilan_navbar_item VALUES
(NULL,'首页','index.html',FALSE),
(NULL,'所有商品','cate.html',TRUE),
(NULL,'火热新品','cate.html',TRUE),
(NULL,'秋季热卖','cate.html',TRUE),
(10,'卫衣','cate.html',TRUE),
(10,'大衣','cate.html',TRUE),
(10,'夹克','cate.html',TRUE),
(10,'针织衫/毛衫','cate.html',TRUE),
(10,'衬衫','cate.html',TRUE),
(20,'休闲裤','cate.html',TRUE),
(20,'牛仔裤','cate.html',TRUE),
(10,'西服','cate.html',TRUE),
(NULL,'林更新同款','cate.html',TRUE),
(NULL,'潮男时尚','cate.html',TRUE);

#轮播广告条目表
CREATE TABLE heilan_carousel_item(
	cid TINYINT PRIMARY KEY,	#商品编号
	pic VARCHAR(128),					#图片地址
	url VARCHAR(128),					#商品链接
	title VARCHAR(32),					#商品名称
	nid TINYINT								#商品列表编号
);
#插入轮播条目
INSERT INTO heilan_carousel_item VALUES
(1,'img/index/carousel_01.jpg','goods.html','长款大衣',10),
(2,'img/index/carousel_02.jpg','goods.html','西装',10),
(3,'img/index/carousel_03.jpg','goods.html','羽绒服',10),
(4,'img/index/carousel_04.jpg','goods.html','针织衫',10),
(5,'img/index/5bea2a3bNd48cc0f7.jpg','goods.html','羊皮夹克',10),
(6,'img/index/O1CN011D59QJtu9jCRRep_!!693060164.jpg','goods.html','运动羽绒服',10),
(7,'img/index/O1CN011D59QIFprNXRHjE_!!693060164.jpg','goods.html','风衣',10),
(8,'img/index/O1CN011D59PMMJeUg9JFx_!!693060164.jpg','goods.html','格子西装',10);

#主页商品图片
CREATE TABLE heilan_index_img(
	cid TINYINT PRIMARY KEY,	#商品编号
	pic VARCHAR(128),					#图片地址
	url VARCHAR(128)				  #商品链接	
);

#插入主页商品图片
INSERT INTO heilan_index_img VALUES
(1,"img/index/O1CN011D59Q2lYLCvCGpI_!!693060164.jpg","cate.html"),
(2,"img/index/O1CN011D59PK2iSNq2xBj_!!693060164.jpg","cate.html"),
(3,"img/index/5b7fb2cdNd346b688.jpg","cate.html"),
(4,"img/index/O1CN011D59PK3Zpdrr6sF_!!693060164.jpg","goods.html"),
(5,"img/index/O1CN011D59PLVIXVRESYE_!!693060164.jpg","goods.html"),
(6,"img/index/O1CN011D59PN9WzyNll7K_!!693060164.jpg","goods.html"),
(7,"img/index/O1CN011D59PKojwclNe6O_!!693060164.jpg","goods.html");

#主页变色图片
CREATE TABLE heilan_index_mic(
	cid TINYINT PRIMARY KEY,	#商品编号
	pic VARCHAR(128),					#图片地址
	url VARCHAR(128)				  #商品链接	
);

#插入主页变色图片
INSERT INTO heilan_index_mic VALUES
(1,"img/index/O1CN011D59PMpfaAdLxTQ_!!693060164.jpg","goods.html"),
(2,"img/index/O1CN011D59PMZOgMbe73P_!!693060164.jpg","goods.html"),
(3,"img/index/O1CN011D59PNeNMfq3do5_!!693060164.jpg","goods.html"),
(4,"img/index/O1CN011D59PMZNoNKcRDa_!!693060164.jpg","goods.html"),
(5,"img/index/O1CN011D59POLeXgzRo7I_!!693060164.jpg","goods.html"),
(6,"img/index/O1CN011D59PLOFTJKB96h_!!693060164.jpg","goods.html"),
(7,"img/index/O1CN011D59POUzmfWaxRU_!!693060164.jpg","goods.html"),
(8,"img/index/O1CN011D59PNaD27wFUVP_!!693060164.jpg","goods.html"),
(9,"img/index/O1CN011D59PLipMYZuv3E_!!693060164.jpg","goods.html"),
(10,"img/index/O1CN011D59PNaBlDUb2NG_!!693060164.jpg","goods.html"),
(11,"img/index/O1CN011D59PNQtaRqZGGm_!!693060164.jpg","goods.html"),
(12,"img/index/O1CN011D59PMZNwgj22HB_!!693060164.jpg","goods.html");

#创建商品详情表
CREATE TABLE heilan_goods(
	goods_cid TINYINT PRIMARY KEY AUTO_INCREMENT,	#商品编号
	title VARCHAR(32),											#商品名称
	price DECIMAL(6,2),											#商品价格
	stockCount SMALLINT,										#库存量
	mini_img VARCHAR(128),									#略缩图
	small_img VARCHAR(128),									#小图
	middle_img VARCHAR(128),								#中图
	big_img VARCHAR(128),									  #大图
	pic_details VARCHAR(128),								#商品详情图片
	nid TINYINT															#商品列表编号
);
#插入商品列表数据
INSERT INTO heilan_goods VALUES
(NULL,'时尚休闲卫衣',98.00,48,'img/goods/img1/HNZWJ3E081A_21331_1--w_34_h_34.jpg','img/goods/img1/HNZWJ3E081A_21331_1--w_74_h_74.jpg','img/goods/img1/HNZWJ3E081A_21331_1--w_460_h_460.jpg','img/goods/img1/HNZWJ3E081A_21331_1.jpg',NULL,10);

#创建商品内容图片
CREATE TABLE heilan_goods_content(
	cid TINYINT PRIMARY KEY AUTO_INCREMENT,	#商品编号
	pic VARCHAR(128)												#图片地址
);

#插入商品内容数据
INSERT INTO heilan_goods_content VALUES
(NULL,'img/goods/img1/O1CN011D59QBOjThD682y_!!693060164.jpg'),
(NULL,'img/goods/img1/O1CN011D59Q95VygDsE99_!!693060164.jpg'),
(NULL,'img/goods/img1/5b534bacN4c758fc5.jpg'),
(NULL,'img/goods/img1/5b534badN1109998f.jpg'),
(NULL,'img/goods/img1/5b534baeN1d53b948.jpg'),
(NULL,'img/goods/img1/5b534bafNe83c35f3.png'),
(NULL,'img/goods/img1/5b534bb0N239f3c77.png'),
(NULL,'img/goods/img1/big1.jpg'),
(NULL,'img/goods/img1/big2.jpg'),
(NULL,'img/goods/img1/big3.jpg'),
(NULL,'img/goods/img1/big4.jpg'),
(NULL,'img/goods/img1/big5.jpg'),
(NULL,'img/goods/img1/big6.jpg'),
(NULL,'img/goods/img1/big7.jpg'),
(NULL,'img/goods/img1/big8.jpg'),
(NULL,'img/goods/img1/big9.jpg'),
(NULL,'img/goods/img1/big10.jpg'),
(NULL,'img/goods/img1/big11.jpg'),
(NULL,'img/goods/img1/big12.jpg'),
(NULL,'img/goods/img1/big13.jpg'),
(NULL,'img/goods/img1/big14.jpg'),
(NULL,'img/goods/img1/big15.jpg'),
(NULL,'img/goods/img1/big16.jpg');




#设置手机端
#用户列表
CREATE TABLE heilan_user(
	uid TINYINT PRIMARY KEY AUTO_INCREMENT,	#用户编号
	uname VARCHAR(16) NOT NULL DEFAULT '',	#用户姓名
	upwd  VARCHAR(32) NOT NULL DEFAULT '',	#用户密码
	phone CHAR(11),													#联系电话
	gender VARCHAR(3),											#用户性别
	email VARCHAR(32),											#用户邮箱
	recipients VARCHAR(32),								  #收件人姓名	
	user_add VARCHAR(128),									#收件地址
	isdel BOOL															#是否删除 0正常 1已被删除
);
INSERT INTO heilan_user VALUES
(NULL,'Lin',md5('123456'),13666990716,1,'9208608@qq.com',NULL,'广东省深圳市龙华区汇海广场',0),
(NULL,'dingding',md5('123456'),18750390716,0,'dingding@qq.com',NULL,'北京市朝阳区人民广场',0),
(NULL,'tom',md5('123456'),13753290836,1,'tom@sina.com',NULL,'上海市闵行区浦东路',0),
(NULL,'jerry',md5('123456'),15765392018,0,'jerry@163.com',NULL,'福建省福州市闽侯县',0);

#功能一:登录(对数据库查询操作)
#建议:
#SELECT count(uid) as c FROM xz_user
#WHERE  uname = 'tom' AND upwd = md5('123456');

#图片轮播表 heilan_imagelist
CREATE TABLE heilan_imagelist(
  id      INT PRIMARY KEY AUTO_INCREMENT,
  img_url VARCHAR(255),
  title   VARCHAR(50)
);
INSERT INTO heilan_imagelist VALUES
(null,'http://127.0.0.1:3000/img/home/carousel_01.jpg','图片1'),
(null,'http://127.0.0.1:3000/img/home/carousel_02.jpg','图片2'),
(null,'http://127.0.0.1:3000/img/home/carousel_03.jpg','图片3'),
(null,'http://127.0.0.1:3000/img/home/carousel_04.jpg','图片4');

#主页图片 heilan_homelist
CREATE TABLE heilan_homelist(
  id      INT PRIMARY KEY AUTO_INCREMENT,
  img_url VARCHAR(255),
  title   VARCHAR(50)
);
INSERT INTO heilan_homelist VALUES
(null,'http://127.0.0.1:3000/img/home/menu1.jpg','home_img1'),
(null,'http://127.0.0.1:3000/img/home/menu2.jpg','home_img2'),
(null,'http://127.0.0.1:3000/img/home/menu3.jpg','home_img3'),
(null,'http://127.0.0.1:3000/img/home/menu4.jpg','home_img4'),
(null,'http://127.0.0.1:3000/img/home/menu5.jpg','home_img5'),
(null,'http://127.0.0.1:3000/img/home/menu6.jpg','home_img6'),
(null,'http://127.0.0.1:3000/img/home/menu7.jpg','home_img7'),
(null,'http://127.0.0.1:3000/img/home/menu8.jpg','home_img8'),
(null,'http://127.0.0.1:3000/img/home/menu9.jpg','home_img9');

#商品列表 
CREATE TABLE heilan_cate(
  id INT PRIMARY KEY AUTO_INCREMENT,	#商品列表id
  title   VARCHAR(255),								#标题
  content VARCHAR(2000),							#内容
  sales   INT,												#销量
	stock   INT,												#库存
  img_url VARCHAR(255),								#图片路径
  price   DECIMAL(10,2),							#价格
  ctime   DATETIME										#时间
);
INSERT INTO heilan_cate VALUES
(null,'HLA海澜之家微弹羊毛混纺正装衬衫2018舒适长袖薄款春秋衬衫',
	'<img src="http://127.0.0.1:3000/img/cate/chenshan1.jpg">  
	<img src="http://127.0.0.1:3000/img/cate/chenshan2.png">
	<img src="http://127.0.0.1:3000/img/cate/chenshan3.png">
	<img src="http://127.0.0.1:3000/img/cate/chenshan4.jpg">
	<img src="http://127.0.0.1:3000/img/cate/chenshan5.jpg">
	<img src="http://127.0.0.1:3000/img/cate/chenshan6.jpg">
	<img src="http://127.0.0.1:3000/img/cate/chenshan7.jpg">
	<img src="http://127.0.0.1:3000/img/cate/chenshan8.jpg">
	<img src="http://127.0.0.1:3000/img/cate/chenshan9.jpg">
	<img src="http://127.0.0.1:3000/img/cate/chenshan10.jpg">',685,37,'http://127.0.0.1:3000/img/cate/cate1.jpg',398.00,now()),
(null,'HLA海澜之家色织花纹正装衬衫2018秋季新品服帖免烫长袖衬衫',
	'<img src="http://127.0.0.1:3000/img/cate/chenshan1.jpg">  
	<img src="http://127.0.0.1:3000/img/cate/chenshan2.png">
	<img src="http://127.0.0.1:3000/img/cate/chenshan3.png">
	<img src="http://127.0.0.1:3000/img/cate/chenshan4.jpg">
	<img src="http://127.0.0.1:3000/img/cate/chenshan5.jpg">
	<img src="http://127.0.0.1:3000/img/cate/chenshan6.jpg">
	<img src="http://127.0.0.1:3000/img/cate/chenshan7.jpg">
	<img src="http://127.0.0.1:3000/img/cate/chenshan8.jpg">
	<img src="http://127.0.0.1:3000/img/cate/chenshan9.jpg">
	<img src="http://127.0.0.1:3000/img/cate/chenshan10.jpg">',685,28,'http://127.0.0.1:3000/img/cate/cate2.jpg',268.00,now()),
(null,'海澜之家2018火热新品男潮流特卖时尚牛津纺水洗休闲衬衫','<img src="http://127.0.0.1:3000/img/cate/chenshan1.jpg">  
<img src="http://127.0.0.1:3000/img/cate/chenshan2.png">
<img src="http://127.0.0.1:3000/img/cate/chenshan3.png">
<img src="http://127.0.0.1:3000/img/cate/chenshan4.jpg">
<img src="http://127.0.0.1:3000/img/cate/chenshan5.jpg">
<img src="http://127.0.0.1:3000/img/cate/chenshan6.jpg">
<img src="http://127.0.0.1:3000/img/cate/chenshan7.jpg">
<img src="http://127.0.0.1:3000/img/cate/chenshan8.jpg">
<img src="http://127.0.0.1:3000/img/cate/chenshan9.jpg">
<img src="http://127.0.0.1:3000/img/cate/chenshan10.jpg">',685,53,'http://127.0.0.1:3000/img/cate/cate3.jpg',98.00,now()),
(null,'海澜之家撞色混纺双领针织衫2018舒适时尚假两件春装卫衣','<img src="http://127.0.0.1:3000/img/cate/chenshan1.jpg">  
<img src="http://127.0.0.1:3000/img/cate/chenshan2.png">
<img src="http://127.0.0.1:3000/img/cate/chenshan3.png">
<img src="http://127.0.0.1:3000/img/cate/chenshan4.jpg">
<img src="http://127.0.0.1:3000/img/cate/chenshan5.jpg">
<img src="http://127.0.0.1:3000/img/cate/chenshan6.jpg">
<img src="http://127.0.0.1:3000/img/cate/chenshan7.jpg">
<img src="http://127.0.0.1:3000/img/cate/chenshan8.jpg">
<img src="http://127.0.0.1:3000/img/cate/chenshan9.jpg">
<img src="http://127.0.0.1:3000/img/cate/chenshan10.jpg">',155,63,'http://127.0.0.1:3000/img/cate/cate4.jpg',168.00,now()),
(null,'海澜之家2018火热新品男潮流特卖时尚长袖衬衫','<img src="http://127.0.0.1:3000/img/cate/chenshan1.jpg">  
<img src="http://127.0.0.1:3000/img/cate/chenshan2.png">
<img src="http://127.0.0.1:3000/img/cate/chenshan3.png">
<img src="http://127.0.0.1:3000/img/cate/chenshan4.jpg">
<img src="http://127.0.0.1:3000/img/cate/chenshan5.jpg">
<img src="http://127.0.0.1:3000/img/cate/chenshan6.jpg">
<img src="http://127.0.0.1:3000/img/cate/chenshan7.jpg">
<img src="http://127.0.0.1:3000/img/cate/chenshan8.jpg">
<img src="http://127.0.0.1:3000/img/cate/chenshan9.jpg">
<img src="http://127.0.0.1:3000/img/cate/chenshan10.jpg">',542,168,'http://127.0.0.1:3000/img/cate/cate5.jpg',298.00,now()),
(null,'海澜之家2018火热新品男潮流特卖时尚条纹衬衫','<img src="http://127.0.0.1:3000/img/cate/chenshan1.jpg">  
<img src="http://127.0.0.1:3000/img/cate/chenshan2.png">
<img src="http://127.0.0.1:3000/img/cate/chenshan3.png">
<img src="http://127.0.0.1:3000/img/cate/chenshan4.jpg">
<img src="http://127.0.0.1:3000/img/cate/chenshan5.jpg">
<img src="http://127.0.0.1:3000/img/cate/chenshan6.jpg">
<img src="http://127.0.0.1:3000/img/cate/chenshan7.jpg">
<img src="http://127.0.0.1:3000/img/cate/chenshan8.jpg">
<img src="http://127.0.0.1:3000/img/cate/chenshan9.jpg">
<img src="http://127.0.0.1:3000/img/cate/chenshan10.jpg">',786,253,'http://127.0.0.1:3000/img/cate/cate6.jpg',298.00,now()),
(null,'海澜之家2018火热新品男潮流特卖时尚提花秋装长袖','<img src="http://127.0.0.1:3000/img/cate/chenshan1.jpg">  
<img src="http://127.0.0.1:3000/img/cate/chenshan2.png">
<img src="http://127.0.0.1:3000/img/cate/chenshan3.png">
<img src="http://127.0.0.1:3000/img/cate/chenshan4.jpg">
<img src="http://127.0.0.1:3000/img/cate/chenshan5.jpg">
<img src="http://127.0.0.1:3000/img/cate/chenshan6.jpg">
<img src="http://127.0.0.1:3000/img/cate/chenshan7.jpg">
<img src="http://127.0.0.1:3000/img/cate/chenshan8.jpg">
<img src="http://127.0.0.1:3000/img/cate/chenshan9.jpg">
<img src="http://127.0.0.1:3000/img/cate/chenshan10.jpg">',254,512,'http://127.0.0.1:3000/img/cate/cate7.jpg',328.00,now()),
(null,'海澜之家撞色混纺双领针织衫2018冬季新品舒适时尚春装卫衣','<img src="http://127.0.0.1:3000/img/cate/chenshan1.jpg">  
<img src="http://127.0.0.1:3000/img/cate/chenshan2.png">
<img src="http://127.0.0.1:3000/img/cate/chenshan3.png">
<img src="http://127.0.0.1:3000/img/cate/chenshan4.jpg">
<img src="http://127.0.0.1:3000/img/cate/chenshan5.jpg">
<img src="http://127.0.0.1:3000/img/cate/chenshan6.jpg">
<img src="http://127.0.0.1:3000/img/cate/chenshan7.jpg">
<img src="http://127.0.0.1:3000/img/cate/chenshan8.jpg">
<img src="http://127.0.0.1:3000/img/cate/chenshan9.jpg">
<img src="http://127.0.0.1:3000/img/cate/chenshan10.jpg">',138,421,'http://127.0.0.1:3000/img/cate/cate8.jpg',98.00,now()),
(null,'海澜之家2018火热新品男潮流特卖时尚冬季衬衫','<img src="http://127.0.0.1:3000/img/cate/chenshan1.jpg">  
<img src="http://127.0.0.1:3000/img/cate/chenshan2.png">
<img src="http://127.0.0.1:3000/img/cate/chenshan3.png">
<img src="http://127.0.0.1:3000/img/cate/chenshan4.jpg">
<img src="http://127.0.0.1:3000/img/cate/chenshan5.jpg">
<img src="http://127.0.0.1:3000/img/cate/chenshan6.jpg">
<img src="http://127.0.0.1:3000/img/cate/chenshan7.jpg">
<img src="http://127.0.0.1:3000/img/cate/chenshan8.jpg">
<img src="http://127.0.0.1:3000/img/cate/chenshan9.jpg">
<img src="http://127.0.0.1:3000/img/cate/chenshan10.jpg">',854,123,'http://127.0.0.1:3000/img/cate/cate9.jpg',328.00,now()),
(null,'海澜之家2018火热新品男潮流特卖几何纹冬季长袖','<img src="http://127.0.0.1:3000/img/cate/chenshan1.jpg">  
<img src="http://127.0.0.1:3000/img/cate/chenshan2.png">
<img src="http://127.0.0.1:3000/img/cate/chenshan3.png">
<img src="http://127.0.0.1:3000/img/cate/chenshan4.jpg">
<img src="http://127.0.0.1:3000/img/cate/chenshan5.jpg">
<img src="http://127.0.0.1:3000/img/cate/chenshan6.jpg">
<img src="http://127.0.0.1:3000/img/cate/chenshan7.jpg">
<img src="http://127.0.0.1:3000/img/cate/chenshan8.jpg">
<img src="http://127.0.0.1:3000/img/cate/chenshan9.jpg">
<img src="http://127.0.0.1:3000/img/cate/chenshan10.jpg">',268,642,'http://127.0.0.1:3000/img/cate/cate10.jpg',98.00,now()),
(null,'海澜之家2018火热新品男潮流特卖时尚牛津纺水洗休闲衬衫','<img src="http://127.0.0.1:3000/img/cate/chenshan1.jpg">  
<img src="http://127.0.0.1:3000/img/cate/chenshan2.png">
<img src="http://127.0.0.1:3000/img/cate/chenshan3.png">
<img src="http://127.0.0.1:3000/img/cate/chenshan4.jpg">
<img src="http://127.0.0.1:3000/img/cate/chenshan5.jpg">
<img src="http://127.0.0.1:3000/img/cate/chenshan6.jpg">
<img src="http://127.0.0.1:3000/img/cate/chenshan7.jpg">
<img src="http://127.0.0.1:3000/img/cate/chenshan8.jpg">
<img src="http://127.0.0.1:3000/img/cate/chenshan9.jpg">
<img src="http://127.0.0.1:3000/img/cate/chenshan10.jpg">',333,551,'http://127.0.0.1:3000/img/cate/cate11.jpg',98.00,now()),
(null,'海澜之家时尚连帽卫衣2019春季新品个性绣标舒适秋季卫衣','<img src="http://127.0.0.1:3000/img/cate/chenshan1.jpg">  
<img src="http://127.0.0.1:3000/img/cate/chenshan2.png">
<img src="http://127.0.0.1:3000/img/cate/chenshan3.png">
<img src="http://127.0.0.1:3000/img/cate/chenshan4.jpg">
<img src="http://127.0.0.1:3000/img/cate/chenshan5.jpg">
<img src="http://127.0.0.1:3000/img/cate/chenshan6.jpg">
<img src="http://127.0.0.1:3000/img/cate/chenshan7.jpg">
<img src="http://127.0.0.1:3000/img/cate/chenshan8.jpg">
<img src="http://127.0.0.1:3000/img/cate/chenshan9.jpg">
<img src="http://127.0.0.1:3000/img/cate/chenshan10.jpg">',486,339,'http://127.0.0.1:3000/img/cate/cate12.jpg',328.00,now()),
(null,'海澜之家撞色混纺双领针织衫2018冬季新品舒适时尚冬季西装','<img src="http://127.0.0.1:3000/img/cate/dayi1.jpg">  
<img src="http://127.0.0.1:3000/img/cate/dayi2.jpg">
<img src="http://127.0.0.1:3000/img/cate/dayi3.png">
<img src="http://127.0.0.1:3000/img/cate/dayi4.png">
<img src="http://127.0.0.1:3000/img/cate/dayi5.jpg">
<img src="http://127.0.0.1:3000/img/cate/dayi6.jpg">
<img src="http://127.0.0.1:3000/img/cate/dayi7.jpg">
<img src="http://127.0.0.1:3000/img/cate/dayi8.jpg">
<img src="http://127.0.0.1:3000/img/cate/dayi9.jpg">
<img src="http://127.0.0.1:3000/img/cate/dayi10.jpg">
<img src="http://127.0.0.1:3000/img/cate/dayi11.png">',847,472,'http://127.0.0.1:3000/img/cate/cate13.jpg',298.00,now()),
(null,'海澜之家2018火热新品男潮流特卖时尚条纹衬衫','<img src="http://127.0.0.1:3000/img/cate/dayi1.jpg">  
<img src="http://127.0.0.1:3000/img/cate/dayi2.jpg">
<img src="http://127.0.0.1:3000/img/cate/dayi3.png">
<img src="http://127.0.0.1:3000/img/cate/dayi4.png">
<img src="http://127.0.0.1:3000/img/cate/dayi5.jpg">
<img src="http://127.0.0.1:3000/img/cate/dayi6.jpg">
<img src="http://127.0.0.1:3000/img/cate/dayi7.jpg">
<img src="http://127.0.0.1:3000/img/cate/dayi8.jpg">
<img src="http://127.0.0.1:3000/img/cate/dayi9.jpg">
<img src="http://127.0.0.1:3000/img/cate/dayi10.jpg">
<img src="http://127.0.0.1:3000/img/cate/dayi11.png">',568,520,'http://127.0.0.1:3000/img/cate/cate14.jpg',298.00,now()),
(null,'海澜之家时尚连帽卫衣2019春季新品个性绣标舒适春秋羽绒','<img src="http://127.0.0.1:3000/img/cate/dayi1.jpg">  
<img src="http://127.0.0.1:3000/img/cate/dayi2.jpg">
<img src="http://127.0.0.1:3000/img/cate/dayi3.png">
<img src="http://127.0.0.1:3000/img/cate/dayi4.png">
<img src="http://127.0.0.1:3000/img/cate/dayi5.jpg">
<img src="http://127.0.0.1:3000/img/cate/dayi6.jpg">
<img src="http://127.0.0.1:3000/img/cate/dayi7.jpg">
<img src="http://127.0.0.1:3000/img/cate/dayi8.jpg">
<img src="http://127.0.0.1:3000/img/cate/dayi9.jpg">
<img src="http://127.0.0.1:3000/img/cate/dayi10.jpg">
<img src="http://127.0.0.1:3000/img/cate/dayi11.png">',516,920,'http://127.0.0.1:3000/img/cate/cate15.jpg',328.00,now()),
(null,'海澜之家2018火热新品男潮流特卖时尚清新休闲衬衫','<img src="http://127.0.0.1:3000/img/cate/dayi1.jpg">  
<img src="http://127.0.0.1:3000/img/cate/dayi2.jpg">
<img src="http://127.0.0.1:3000/img/cate/dayi3.png">
<img src="http://127.0.0.1:3000/img/cate/dayi4.png">
<img src="http://127.0.0.1:3000/img/cate/dayi5.jpg">
<img src="http://127.0.0.1:3000/img/cate/dayi6.jpg">
<img src="http://127.0.0.1:3000/img/cate/dayi7.jpg">
<img src="http://127.0.0.1:3000/img/cate/dayi8.jpg">
<img src="http://127.0.0.1:3000/img/cate/dayi9.jpg">
<img src="http://127.0.0.1:3000/img/cate/dayi10.jpg">
<img src="http://127.0.0.1:3000/img/cate/dayi11.png">',85,864,'http://127.0.0.1:3000/img/cate/cate16.jpg',98.00,now()),
(null,'海澜之家时尚连帽卫衣2019春季新品个性绣标舒适秋装卫衣','<img src="http://127.0.0.1:3000/img/cate/dayi1.jpg">  
<img src="http://127.0.0.1:3000/img/cate/dayi2.jpg">
<img src="http://127.0.0.1:3000/img/cate/dayi3.png">
<img src="http://127.0.0.1:3000/img/cate/dayi4.png">
<img src="http://127.0.0.1:3000/img/cate/dayi5.jpg">
<img src="http://127.0.0.1:3000/img/cate/dayi6.jpg">
<img src="http://127.0.0.1:3000/img/cate/dayi7.jpg">
<img src="http://127.0.0.1:3000/img/cate/dayi8.jpg">
<img src="http://127.0.0.1:3000/img/cate/dayi9.jpg">
<img src="http://127.0.0.1:3000/img/cate/dayi10.jpg">
<img src="http://127.0.0.1:3000/img/cate/dayi11.png">',169,334,'http://127.0.0.1:3000/img/cate/cate17.jpg',328.00,now()),
(null,'海澜之家2018火热新品男特卖时尚几何纹潮流长袖','<img src="http://127.0.0.1:3000/img/cate/dayi1.jpg">  
<img src="http://127.0.0.1:3000/img/cate/dayi2.jpg">
<img src="http://127.0.0.1:3000/img/cate/dayi3.png">
<img src="http://127.0.0.1:3000/img/cate/dayi4.png">
<img src="http://127.0.0.1:3000/img/cate/dayi5.jpg">
<img src="http://127.0.0.1:3000/img/cate/dayi6.jpg">
<img src="http://127.0.0.1:3000/img/cate/dayi7.jpg">
<img src="http://127.0.0.1:3000/img/cate/dayi8.jpg">
<img src="http://127.0.0.1:3000/img/cate/dayi9.jpg">
<img src="http://127.0.0.1:3000/img/cate/dayi10.jpg">
<img src="http://127.0.0.1:3000/img/cate/dayi11.png">',563,58,'http://127.0.0.1:3000/img/cate/cate18.jpg',98.00,now()),
(null,'HLA海澜之家舒适宽松牛仔裤2018秋季新品微弹简约有型男裤','<img src="http://127.0.0.1:3000/img/cate/kuzi1.jpg">
	<img src="http://127.0.0.1:3000/img/cate/kuzi2.jpg">
	<img src="http://127.0.0.1:3000/img/cate/kuzi3.jpg">
	<img src="http://127.0.0.1:3000/img/cate/kuzi4.jpg">
	<img src="http://127.0.0.1:3000/img/cate/kuzi5.jpg">
	<img src="http://127.0.0.1:3000/img/cate/kuzi6.jpg">
	<img src="http://127.0.0.1:3000/img/cate/kuzi7.jpg">
	<img src="http://127.0.0.1:3000/img/cate/kuzi8.png">
	<img src="http://127.0.0.1:3000/img/cate/kuzi9.jpg">
	<img src="http://127.0.0.1:3000/img/cate/kuzi10.jpg">
	<img src="http://127.0.0.1:3000/img/cate/kuzi11.jpg">
	<img src="http://127.0.0.1:3000/img/cate/kuzi12.jpg"> ',378,67,'http://127.0.0.1:3000/img/cate/cate19.jpg',168.00,now()),
(null,'HLA海澜之家五袋款牛仔裤2018秋季新品修身磨破时尚长裤','<img src="http://127.0.0.1:3000/img/cate/kuzi1.jpg">
<img src="http://127.0.0.1:3000/img/cate/kuzi2.jpg">
<img src="http://127.0.0.1:3000/img/cate/kuzi3.jpg">
<img src="http://127.0.0.1:3000/img/cate/kuzi4.jpg">
<img src="http://127.0.0.1:3000/img/cate/kuzi5.jpg">
<img src="http://127.0.0.1:3000/img/cate/kuzi6.jpg">
<img src="http://127.0.0.1:3000/img/cate/kuzi7.jpg">
<img src="http://127.0.0.1:3000/img/cate/kuzi8.png">
<img src="http://127.0.0.1:3000/img/cate/kuzi9.jpg">
<img src="http://127.0.0.1:3000/img/cate/kuzi10.jpg">
<img src="http://127.0.0.1:3000/img/cate/kuzi11.jpg">
<img src="http://127.0.0.1:3000/img/cate/kuzi12.jpg">',865,74,'http://127.0.0.1:3000/img/cate/cate20.jpg',298.00,now()),
(null,'HLA海澜之家时尚商务款牛仔裤2018秋季新品直筒款牛仔长裤','<img src="http://127.0.0.1:3000/img/cate/kuzi1.jpg">
<img src="http://127.0.0.1:3000/img/cate/kuzi2.jpg">
<img src="http://127.0.0.1:3000/img/cate/kuzi3.jpg">
<img src="http://127.0.0.1:3000/img/cate/kuzi4.jpg">
<img src="http://127.0.0.1:3000/img/cate/kuzi5.jpg">
<img src="http://127.0.0.1:3000/img/cate/kuzi6.jpg">
<img src="http://127.0.0.1:3000/img/cate/kuzi7.jpg">
<img src="http://127.0.0.1:3000/img/cate/kuzi8.png">
<img src="http://127.0.0.1:3000/img/cate/kuzi9.jpg">
<img src="http://127.0.0.1:3000/img/cate/kuzi10.jpg">
<img src="http://127.0.0.1:3000/img/cate/kuzi11.jpg">
<img src="http://127.0.0.1:3000/img/cate/kuzi12.jpg">',865,85,'http://127.0.0.1:3000/img/cate/cate21.jpg',298.00,now()),
(null,'HLA海澜之家时尚猫须款牛仔裤2018秋季新品直筒款牛仔长裤','<img src="http://127.0.0.1:3000/img/cate/kuzi1.jpg">
<img src="http://127.0.0.1:3000/img/cate/kuzi2.jpg">
<img src="http://127.0.0.1:3000/img/cate/kuzi3.jpg">
<img src="http://127.0.0.1:3000/img/cate/kuzi4.jpg">
<img src="http://127.0.0.1:3000/img/cate/kuzi5.jpg">
<img src="http://127.0.0.1:3000/img/cate/kuzi6.jpg">
<img src="http://127.0.0.1:3000/img/cate/kuzi7.jpg">
<img src="http://127.0.0.1:3000/img/cate/kuzi8.png">
<img src="http://127.0.0.1:3000/img/cate/kuzi9.jpg">
<img src="http://127.0.0.1:3000/img/cate/kuzi10.jpg">
<img src="http://127.0.0.1:3000/img/cate/kuzi11.jpg">
<img src="http://127.0.0.1:3000/img/cate/kuzi12.jpg">',269,468,'http://127.0.0.1:3000/img/cate/cate22.jpg',298.00,now()),
(null,'HLA海澜之家五袋款牛仔裤2018秋季新品修身时尚磨破长裤','<img src="http://127.0.0.1:3000/img/cate/kuzi1.jpg">
<img src="http://127.0.0.1:3000/img/cate/kuzi2.jpg">
<img src="http://127.0.0.1:3000/img/cate/kuzi3.jpg">
<img src="http://127.0.0.1:3000/img/cate/kuzi4.jpg">
<img src="http://127.0.0.1:3000/img/cate/kuzi5.jpg">
<img src="http://127.0.0.1:3000/img/cate/kuzi6.jpg">
<img src="http://127.0.0.1:3000/img/cate/kuzi7.jpg">
<img src="http://127.0.0.1:3000/img/cate/kuzi8.png">
<img src="http://127.0.0.1:3000/img/cate/kuzi9.jpg">
<img src="http://127.0.0.1:3000/img/cate/kuzi10.jpg">
<img src="http://127.0.0.1:3000/img/cate/kuzi11.jpg">
<img src="http://127.0.0.1:3000/img/cate/kuzi12.jpg">',475,6,'http://127.0.0.1:3000/img/cate/cate23.jpg',328.00,now()),
(null,'HLA海澜之家时尚牛仔裤2018冬季新品长款牛仔裤','<img src="http://127.0.0.1:3000/img/cate/kuzi1.jpg">
<img src="http://127.0.0.1:3000/img/cate/kuzi2.jpg">
<img src="http://127.0.0.1:3000/img/cate/kuzi3.jpg">
<img src="http://127.0.0.1:3000/img/cate/kuzi4.jpg">
<img src="http://127.0.0.1:3000/img/cate/kuzi5.jpg">
<img src="http://127.0.0.1:3000/img/cate/kuzi6.jpg">
<img src="http://127.0.0.1:3000/img/cate/kuzi7.jpg">
<img src="http://127.0.0.1:3000/img/cate/kuzi8.png">
<img src="http://127.0.0.1:3000/img/cate/kuzi9.jpg">
<img src="http://127.0.0.1:3000/img/cate/kuzi10.jpg">
<img src="http://127.0.0.1:3000/img/cate/kuzi11.jpg">
<img src="http://127.0.0.1:3000/img/cate/kuzi12.jpg">',567,256,'http://127.0.0.1:3000/img/cate/cate24.jpg',298.00,now()),
(null,'HLA海澜之家轻户外纯色羽绒服2018冬季新品可脱卸帽羽绒外套','<img src="http://127.0.0.1:3000/img/cate/dayi1.jpg">
<img src="http://127.0.0.1:3000/img/cate/dayi2.jpg">
<img src="http://127.0.0.1:3000/img/cate/dayi3.png">
<img src="http://127.0.0.1:3000/img/cate/dayi4.png">
<img src="http://127.0.0.1:3000/img/cate/dayi5.jpg">
<img src="http://127.0.0.1:3000/img/cate/dayi6.jpg">
<img src="http://127.0.0.1:3000/img/cate/dayi7.jpg">
<img src="http://127.0.0.1:3000/img/cate/dayi8.jpg">
<img src="http://127.0.0.1:3000/img/cate/dayi9.jpg">
<img src="http://127.0.0.1:3000/img/cate/dayi10.jpg">
<img src="http://127.0.0.1:3000/img/cate/dayi11.png">',567,136,'http://127.0.0.1:3000/img/cate/cate25.jpg',698.00,now()),
(null,'HLA海澜之家翻领PU皮夹克2018冬季新品加绒皮毛一体保暖外套','<img src="http://127.0.0.1:3000/img/cate/dayi1.jpg">
<img src="http://127.0.0.1:3000/img/cate/dayi2.jpg">
<img src="http://127.0.0.1:3000/img/cate/dayi3.png">
<img src="http://127.0.0.1:3000/img/cate/dayi4.png">
<img src="http://127.0.0.1:3000/img/cate/dayi5.jpg">
<img src="http://127.0.0.1:3000/img/cate/dayi6.jpg">
<img src="http://127.0.0.1:3000/img/cate/dayi7.jpg">
<img src="http://127.0.0.1:3000/img/cate/dayi8.jpg">
<img src="http://127.0.0.1:3000/img/cate/dayi9.jpg">
<img src="http://127.0.0.1:3000/img/cate/dayi10.jpg">
<img src="http://127.0.0.1:3000/img/cate/dayi11.png">',567,56,'http://127.0.0.1:3000/img/cate/cate26.jpg',598.00,now()),
(null,'HLA海澜之家连帽简约款休闲上衣秋季新品舒适套头衫轻薄卫衣','<img src="http://127.0.0.1:3000/img/cate/dayi1.jpg">
<img src="http://127.0.0.1:3000/img/cate/dayi2.jpg">
<img src="http://127.0.0.1:3000/img/cate/dayi3.png">
<img src="http://127.0.0.1:3000/img/cate/dayi4.png">
<img src="http://127.0.0.1:3000/img/cate/dayi5.jpg">
<img src="http://127.0.0.1:3000/img/cate/dayi6.jpg">
<img src="http://127.0.0.1:3000/img/cate/dayi7.jpg">
<img src="http://127.0.0.1:3000/img/cate/dayi8.jpg">
<img src="http://127.0.0.1:3000/img/cate/dayi9.jpg">
<img src="http://127.0.0.1:3000/img/cate/dayi10.jpg">
<img src="http://127.0.0.1:3000/img/cate/dayi11.png">',567,78,'http://127.0.0.1:3000/img/cate/cate27.jpg',258.00,now()),
(null,'HLA海澜之家单排扣长款针织大衣2018冬季新品西装领大衣外套','<img src="http://127.0.0.1:3000/img/cate/dayi1.jpg">
<img src="http://127.0.0.1:3000/img/cate/dayi2.jpg">
<img src="http://127.0.0.1:3000/img/cate/dayi3.png">
<img src="http://127.0.0.1:3000/img/cate/dayi4.png">
<img src="http://127.0.0.1:3000/img/cate/dayi5.jpg">
<img src="http://127.0.0.1:3000/img/cate/dayi6.jpg">
<img src="http://127.0.0.1:3000/img/cate/dayi7.jpg">
<img src="http://127.0.0.1:3000/img/cate/dayi8.jpg">
<img src="http://127.0.0.1:3000/img/cate/dayi9.jpg">
<img src="http://127.0.0.1:3000/img/cate/dayi10.jpg">
<img src="http://127.0.0.1:3000/img/cate/dayi11.png">',567,3,'http://127.0.0.1:3000/img/cate/cate28.jpg',898.00,now()),
(null,'HLA海澜之家经典立领款羽绒服2018冬季新品简约保暖羽绒外套','<img src="http://127.0.0.1:3000/img/cate/dayi1.jpg">
<img src="http://127.0.0.1:3000/img/cate/dayi2.jpg">
<img src="http://127.0.0.1:3000/img/cate/dayi3.png">
<img src="http://127.0.0.1:3000/img/cate/dayi4.png">
<img src="http://127.0.0.1:3000/img/cate/dayi5.jpg">
<img src="http://127.0.0.1:3000/img/cate/dayi6.jpg">
<img src="http://127.0.0.1:3000/img/cate/dayi7.jpg">
<img src="http://127.0.0.1:3000/img/cate/dayi8.jpg">
<img src="http://127.0.0.1:3000/img/cate/dayi9.jpg">
<img src="http://127.0.0.1:3000/img/cate/dayi10.jpg">
<img src="http://127.0.0.1:3000/img/cate/dayi11.png">',367,74,'http://127.0.0.1:3000/img/cate/cate29.jpg',898.00,now()),
(null,'HLA海澜之家撞色混纺双领针织衫2018冬季新品时尚假两件舒适西装','<img src="http://127.0.0.1:3000/img/cate/dayi1.jpg">
<img src="http://127.0.0.1:3000/img/cate/dayi2.jpg">
<img src="http://127.0.0.1:3000/img/cate/dayi3.png">
<img src="http://127.0.0.1:3000/img/cate/dayi4.png">
<img src="http://127.0.0.1:3000/img/cate/dayi5.jpg">
<img src="http://127.0.0.1:3000/img/cate/dayi6.jpg">
<img src="http://127.0.0.1:3000/img/cate/dayi7.jpg">
<img src="http://127.0.0.1:3000/img/cate/dayi8.jpg">
<img src="http://127.0.0.1:3000/img/cate/dayi9.jpg">
<img src="http://127.0.0.1:3000/img/cate/dayi10.jpg">
<img src="http://127.0.0.1:3000/img/cate/dayi11.png">',485,268,'http://127.0.0.1:3000/img/cate/cate30.jpg',328.00,now());

#创建评论信息表
CREATE TABLE heilan_comment(
  id INT PRIMARY KEY AUTO_INCREMENT,
	nid INT,	#评论楼层
	ctime DATETIME,	#时间
	content VARCHAR(50),	#评论内容
	username VARCHAR(25),	#用户名
	isdel	INT	
);
#插入数据
INSERT INTO heilan_comment VALUES
(null,1,now(),'11121','tom',0),
(null,1,now(),'11212','tom',0),
(null,1,now(),'11113','tom',0),
(null,1,now(),'11114','tom',0),
(null,1,now(),'11115','tom',0),
(null,1,now(),'11116','tom',0),
(null,1,now(),'11117','tom',0),
(null,1,now(),'11118','tom',0),
(null,1,now(),'11119','tom',0),
(null,1,now(),'11110','tom',0),

(null,2,now(),'111219','tom',0),
(null,2,now(),'112128','tom',0),
(null,2,now(),'111137','tom',0),
(null,2,now(),'111146','tom',0),
(null,2,now(),'11115','tom',0),
(null,2,now(),'111164','tom',0),
(null,2,now(),'111173','tom',0),
(null,2,now(),'111185','tom',0),
(null,2,now(),'111192','tom',0),
(null,2,now(),'111101','tom',0),

(null,3,now(),'1112191','tom',0),
(null,3,now(),'1121282','tom',0),
(null,3,now(),'1111373','tom',0),
(null,3,now(),'1111464','tom',0),
(null,3,now(),'1111555','tom',0),
(null,3,now(),'1111646','tom',0),
(null,3,now(),'1111737','tom',0),
(null,3,now(),'1111858','tom',0),
(null,3,now(),'1111929','tom',0),
(null,3,now(),'1111010','tom',0);