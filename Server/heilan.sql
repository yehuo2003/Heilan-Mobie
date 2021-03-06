#网站右边导航表
CREATE TABLE heilan_rightList(
	id INT PRIMARY KEY AUTO_INCREMENT,	#编号
	title VARCHAR(32)										#标题
);
#插入网站基本信息表数据
INSERT INTO heilan_rightList VALUES
(null,'我的海澜之家 |'),
(null,'在线客服 |'),
(null,'我的购物袋有0件商品 |'),
(null,'帮助');


#导航表-所有商品
CREATE TABLE heilan_liastnav(
	lid INT PRIMARY KEY AUTO_INCREMENT,	#商品列表编号
	title VARCHAR(16),									#导航名
	cid INT															#关联导航条目表id
);
#插入导航表-所有商品数据
INSERT INTO heilan_liastnav VALUES
(null,'人气排序',1),
(null,'销量排序',1),
(null,'价格排序',1),

(null,"人气排序",2),
(null,"羽绒服",2),
(null,"大衣",2),
(null,"衬衫",2),
(null,"夹克",2),

(null,"卫衣",3),
(null,"长袖衬衫",3),
(null,"长袖t恤",3),
(null,"夹克",3),
(null,"大衣",3),
(null,"针织衫",3),
(null,"休闲裤",3),
(null,"牛仔裤",3),
(null,"西服",3),

(null,"卫衣",4),
(null,"长袖衬衫",4),
(null,"长袖t恤",4),
(null,"夹克",4),
(null,"大衣",4),
(null,"针织衫",4),

(null,"卫衣",5),
(null,"衬衫",5),
(null,"针织衫",5);

#导航列表二级条目-从第二条开始关联
CREATE TABLE heilan_navtwo(
	tid INT PRIMARY KEY AUTO_INCREMENT,	#商品列表编号
	title VARCHAR(16),									#标题名
	cid INT															#关联导航条目表id
);
#插入导航表数据
INSERT INTO heilan_navtwo VALUES
(null,"人气排序",2),
(null,"羽绒服",2),
(null,"大衣",2),
(null,"衬衫",2),
(null,"夹克",2),

(null,'卫衣',3),
(null,'长袖衬衫',3),
(null,'长袖t恤',3),
(null,'夹克',3),
(null,'大衣',3),
(null,'针织衫',3),
(null,'休闲裤',3),
(null,'牛仔裤',3),
(null,'西服',3),

(null,'时尚易搭',4),
(null,'加绒卫衣',4),

ull,'长袖T恤',5),
(null,'羊毛/羊绒衫',5),
(null,'免烫衬衫',5),

(null,'保暖长款',6),
(null,'时尚款',6),
(null,'户外款',6),
(null,'连帽款',6),
(null,'大衣',6),
(null,'针织衫',6),

(null,'双面穿夹克',7),
(null,'摇粒绒夹克',7),
(null,'牛仔夹克',7),
(null,'皮夹克',7),
(null,'夹克',7),

(null,'休闲衬衫',8),
(null,'正装衬衫',8),
(null,'针织衬衫',8),
(null,'免烫衬衫',8),
(null,'保暖衬衫',8),

(null,'基础实穿',9),
(null,'温暖磨毛',9),
(null,'灯芯绒',9),

(null,'基础牛仔',10),
(null,'温暖加绒',10),

(null,'休闲西服',11),
(null,'套装西服',11),

(null,'西服',12),
(null,'休闲上衣',12),
(null,'风衣',12),
(null,'大衣',12),
(null,'针织衫',12),
(null,'夹克',12),

(null,'针织衫',13),
(null,'休闲裤',13),
(null,'牛仔裤',13),
(null,'西服',13),

(null,'基础款',14),
(null,'羊绒款',14),
(null,'加长款',14),
(null,'时尚假两件',14),
(null,'夹克',14);

#网页尾部
#尾部基本信息
CREATE TABLE heilan_rules(
	id INT PRIMARY KEY AUTO_INCREMENT,	#编号
	title VARCHAR(32),									#名称
	content VARCHAR(64),								#内容
	img VARCHAR(128)										#图片地址
);

#插入尾部基本信息条目
INSERT INTO heilan_rules VALUES
(null,'7天','无条件退货','footerimg1.jpg'),
(null,'全场68包邮','送货上门','footerimg2.jpg'),
(null,'全国所有城市','快递上门服务','footerimg3.jpg');

#购物指南
CREATE TABLE heilan_after(
	aid INT PRIMARY KEY AUTO_INCREMENT,	#编号
	title VARCHAR(32)										#名称
);

#导航一级条目表条目
INSERT INTO heilan_after VALUES
(null,"购物指南"),
(null,"配送方式"),
(null,"支付方式"),
(null,"售后服务"),
(null,"新手指南");

#购物指南二级列表
CREATE TABLE heilan_afterlist(
	id INT PRIMARY KEY AUTO_INCREMENT,	#编号
	title VARCHAR(32),									#名称
	cid INT 														#关联一级ID
);

#插入购物指南二级表条目
INSERT INTO heilan_afterlist VALUES
(null,"购物流程",1),
(null,"订单查询",1),
(null,"隐私声明",1),

(null,"商品验货",2),
(null,"商品签收",2),
(null,"配送城市与费用",2),

(null,"中国银联",3),
(null,"支付宝",3),
(null,"发票制度",3),

(null,"退换货政策",4),
(null,"退换货流程",4),
(null,"退款方式",4),

(null,"用户注册",5),
(null,"找回密码",5),
(null,"服务条款",5);

#工商标识表
CREATE TABLE heilan_icbcimg(
	id INT PRIMARY KEY AUTO_INCREMENT,	#商品编号
	img VARCHAR(128),					#图片地址
	cls VARCHAR(32)						#class名称
);

#插入工商标识条目
INSERT INTO heilan_icbcimg VALUES
(null,"footerimg4.jpg","p-1"),
(null,"footerimg5.jpg","p-1"),
(null,"footerimg6.jpg","p-1"),
(null,"ebsIcon.png","p-1 foot_gs");

#工商备案号
CREATE TABLE heilan_icbctitle(
	id INT PRIMARY KEY AUTO_INCREMENT,	#商品编号
	cls VARCHAR(32)						#class名称
);

#插入工商备案号条目
INSERT INTO heilan_icbctitle VALUES
(null,"工信部备案·深ICP备666131号"),
(null,"增值电信业务经营许可证·深B1-666666"),
(null,"©2014-2018 深圳电子商务有限公司 版权所有 HLA Inc. All Rights Reserved.");

#导航一级条目表
CREATE TABLE heilan_onenav(
	cid INT PRIMARY KEY AUTO_INCREMENT,	#商品编号
	img VARCHAR(128),					#图片地址
	title VARCHAR(32)					#商品名称
);

#导航一级条目表条目
INSERT INTO heilan_onenav VALUES
(null,null,'所有商品'),
(null,'O1CN011D59Pn863bQh4Z3_%21%21693060164.jpg','火热新品'),
(null,'O1CN011D59PjoweXjLv1s_%21%21693060164.jpg','秋季热卖'),
(null,'O1CN011D59PmAEdu9I4uM_%21%21693060164.jpg','卫衣'),
(null,'O1CN011D59PmAEdu9I4uM_%21%21693060164.jpg','针织衫/毛衫'),
(null,'O1CN011D59Pn88CfxHdJB_%21%21693060164.jpg','大衣'),
(null,'O1CN011D59Plw73L9uYre_%21%21693060164.jpg','夹克'),
(null,'O1CN011D59Plw73L9uYre_%21%21693060164.jpg','衬衫'),
(null,'O1CN011D59PlXU5xavvvY_%21%21693060164.jpg','休闲裤'),
(null,'O1CN011D59PkailUz4h1r_%21%21693060164.jpg','牛仔裤'),
(null,'O1CN011D59PlLUe32GFCW_%21%21693060164.jpg','西服'),
(null,'O1CN011D59Plo6DlqyBSW_%21%21693060164.jpg','林更新同款'),
(null,'O1CN011D59PlLUZtAs8oJ_%21%21693060164.jpg','潮男时尚'),
(null,'O1CN011D59PleXgJP4tRk_%21%21693060164.jpg','明星同款');

#主页图片和部分内容
CREATE TABLE heilan_pcimg(
	id INT PRIMARY KEY AUTO_INCREMENT,	#商品编号
	img VARCHAR(128)					#图片地址
);

#插入主页图片
INSERT INTO heilan_pcimg VALUES
#imglist
(null,"carousel_01.jpg"),
(null,"carousel_02.jpg"),
(null,"carousel_03.jpg"),
(null,"carousel_04.jpg"),
#bglist
(null,"O1CN011D59PK3Zpdrr6sF_!!693060164.jpg"),
(null,"O1CN011D59PLVIXVRESYE_!!693060164.jpg"),
(null,"O1CN011D59PN9WzyNll7K_!!693060164.jpg"),
(null,"O1CN011D59PKojwclNe6O_!!693060164.jpg"),
(null,"O1CN011D59PMn2LCBDKxF_!!693060164.jpg"),
(null,"O1CN011D59PMn18Pkg1Yb_!!693060164.jpg"),
(null,"O1CN011D59PMFRgkoxzm3_!!693060164.jpg"),
#carousel
(null,"O1CN011D59QIFprNXRHjE_!!693060164.jpg"),
(null,"O1CN011D59QJtu9jCRRep_!!693060164.jpg"),
(null,"5bea2a3bNd48cc0f7.jpg"),
(null,"O1CN011D59PMMJeUg9JFx_!!693060164.jpg"),
#Sixth
(null,"O1CN011D59PMpfaAdLxTQ_!!693060164.jpg"),
(null,"O1CN011D59PNeNMfq3do5_!!693060164.jpg"),
(null,"O1CN011D59POLeXgzRo7I_!!693060164.jpg"),
(null,"O1CN011D59POUzmfWaxRU_!!693060164.jpg"),
(null,"O1CN011D59PLipMYZuv3E_!!693060164.jpg"),
(null,"O1CN011D59PNQtaRqZGGm_!!693060164.jpg"),
#heilist
(null,"7.1为你的商务减负"),
(null,"7.15猜不透的混搭智慧"),
(null,"8.6玩转秋季就要层次感"),
(null,"8.2音乐节的穿搭指南"),
(null,"9.30时尚先生的换季法则"),
(null,"9.20唤醒生活的律动感");

#主页商品列表
CREATE TABLE heilan_goryList(
	lid INT PRIMARY KEY AUTO_INCREMENT,	#商品编号
	title VARCHAR(128),				#标题
	cid INT 									#一级标题	
);

#插入主页商品列表信息
INSERT INTO heilan_goryList VALUES
(null,"STIRT",1),
(null,"T-STIRT",1),
(null,"HOODIE",1),

(null,"衬衫",2),
(null,"T-恤",2),
(null,"卫衣",2),

(null,"JACKET",3),
(null,"CASUAL PANTS",3),
(null,"JEANS",3),

(null,"夹克",4),
(null,"休闲裤",4),
(null,"牛仔裤",4);

#主页浮动框
CREATE TABLE heilan_mentoring(
	id TINYINT PRIMARY KEY AUTO_INCREMENT,	#商品编号
	img VARCHAR(128),				#图片地址
	togo VARCHAR(128)				  #商品链接	
);

#插入主页浮动框数据
INSERT INTO heilan_mentoring VALUES
(null,"faq1.png","/cate"),
(null,"faq2.png","/cate"),
(null,"faq3.png","/faq"),
(null,"faq4.png","/cart");


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
(null,'https://yehuo.applinzi.com/img/home/carousel_01.jpg','图片1'),
(null,'https://yehuo.applinzi.com/img/home/carousel_02.jpg','图片2'),
(null,'https://yehuo.applinzi.com/img/home/carousel_03.jpg','图片3'),
(null,'https://yehuo.applinzi.com/img/home/carousel_04.jpg','图片4');

#主页图片 heilan_homelist
CREATE TABLE heilan_homelist(
  id      INT PRIMARY KEY AUTO_INCREMENT,
  img_url VARCHAR(255),
  title   VARCHAR(50)
);
INSERT INTO heilan_homelist VALUES
(null,'https://yehuo.applinzi.com/img/home/menu1.jpg','home_img1'),
(null,'https://yehuo.applinzi.com/img/home/menu2.jpg','home_img2'),
(null,'https://yehuo.applinzi.com/img/home/menu3.jpg','home_img3'),
(null,'https://yehuo.applinzi.com/img/home/menu4.jpg','home_img4'),
(null,'https://yehuo.applinzi.com/img/home/menu5.jpg','home_img5'),
(null,'https://yehuo.applinzi.com/img/home/menu6.jpg','home_img6'),
(null,'https://yehuo.applinzi.com/img/home/menu7.jpg','home_img7'),
(null,'https://yehuo.applinzi.com/img/home/menu8.jpg','home_img8'),
(null,'https://yehuo.applinzi.com/img/home/menu9.jpg','home_img9'),
(null,'https://yehuo.applinzi.com/img/home/menu10.jpg','home_img10');

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
	'<img src="https://yehuo.applinzi.com/img/cate/chenshan1.jpg">  
	<img src="https://yehuo.applinzi.com/img/cate/chenshan2.png">
	<img src="https://yehuo.applinzi.com/img/cate/chenshan3.png">
	<img src="https://yehuo.applinzi.com/img/cate/chenshan4.jpg">
	<img src="https://yehuo.applinzi.com/img/cate/chenshan5.jpg">
	<img src="https://yehuo.applinzi.com/img/cate/chenshan6.jpg">
	<img src="https://yehuo.applinzi.com/img/cate/chenshan7.jpg">
	<img src="https://yehuo.applinzi.com/img/cate/chenshan8.jpg">
	<img src="https://yehuo.applinzi.com/img/cate/chenshan9.jpg">
	<img src="https://yehuo.applinzi.com/img/cate/chenshan10.jpg">',685,137,'https://yehuo.applinzi.com/img/cate/cate1.jpg',398.00,now()),
(null,'HLA海澜之家色织花纹正装衬衫2018秋季新品服帖免烫长袖衬衫',
	'<img src="https://yehuo.applinzi.com/img/cate/chenshan1.jpg">  
	<img src="https://yehuo.applinzi.com/img/cate/chenshan2.png">
	<img src="https://yehuo.applinzi.com/img/cate/chenshan3.png">
	<img src="https://yehuo.applinzi.com/img/cate/chenshan4.jpg">
	<img src="https://yehuo.applinzi.com/img/cate/chenshan5.jpg">
	<img src="https://yehuo.applinzi.com/img/cate/chenshan6.jpg">
	<img src="https://yehuo.applinzi.com/img/cate/chenshan7.jpg">
	<img src="https://yehuo.applinzi.com/img/cate/chenshan8.jpg">
	<img src="https://yehuo.applinzi.com/img/cate/chenshan9.jpg">
	<img src="https://yehuo.applinzi.com/img/cate/chenshan10.jpg">',595,28,'https://yehuo.applinzi.com/img/cate/cate2.jpg',268.00,now()),
(null,'海澜之家2018火热新品男潮流特卖时尚牛津纺水洗休闲衬衫',
'<img src="https://yehuo.applinzi.com/img/cate/chenshan1.jpg">  
<img src="https://yehuo.applinzi.com/img/cate/chenshan2.png">
<img src="https://yehuo.applinzi.com/img/cate/chenshan3.png">
<img src="https://yehuo.applinzi.com/img/cate/chenshan4.jpg">
<img src="https://yehuo.applinzi.com/img/cate/chenshan5.jpg">
<img src="https://yehuo.applinzi.com/img/cate/chenshan6.jpg">
<img src="https://yehuo.applinzi.com/img/cate/chenshan7.jpg">
<img src="https://yehuo.applinzi.com/img/cate/chenshan8.jpg">
<img src="https://yehuo.applinzi.com/img/cate/chenshan9.jpg">
<img src="https://yehuo.applinzi.com/img/cate/chenshan10.jpg">',615,53,'https://yehuo.applinzi.com/img/cate/cate3.jpg',98.00,now()),
(null,'海澜之家几何花格混纺针织衬衫2018舒适时尚春装衬衫男',
'<img src="https://yehuo.applinzi.com/img/cate/chenshan1.jpg">  
<img src="https://yehuo.applinzi.com/img/cate/chenshan2.png">
<img src="https://yehuo.applinzi.com/img/cate/chenshan3.png">
<img src="https://yehuo.applinzi.com/img/cate/chenshan4.jpg">
<img src="https://yehuo.applinzi.com/img/cate/chenshan5.jpg">
<img src="https://yehuo.applinzi.com/img/cate/chenshan6.jpg">
<img src="https://yehuo.applinzi.com/img/cate/chenshan7.jpg">
<img src="https://yehuo.applinzi.com/img/cate/chenshan8.jpg">
<img src="https://yehuo.applinzi.com/img/cate/chenshan9.jpg">
<img src="https://yehuo.applinzi.com/img/cate/chenshan10.jpg">',655,63,'https://yehuo.applinzi.com/img/cate/cate4.jpg',168.00,now()),
(null,'海澜之家2018火热新品男潮流特卖时尚长袖衬衫',
'<img src="https://yehuo.applinzi.com/img/cate/chenshan1.jpg">  
<img src="https://yehuo.applinzi.com/img/cate/chenshan2.png">
<img src="https://yehuo.applinzi.com/img/cate/chenshan3.png">
<img src="https://yehuo.applinzi.com/img/cate/chenshan4.jpg">
<img src="https://yehuo.applinzi.com/img/cate/chenshan5.jpg">
<img src="https://yehuo.applinzi.com/img/cate/chenshan6.jpg">
<img src="https://yehuo.applinzi.com/img/cate/chenshan7.jpg">
<img src="https://yehuo.applinzi.com/img/cate/chenshan8.jpg">
<img src="https://yehuo.applinzi.com/img/cate/chenshan9.jpg">
<img src="https://yehuo.applinzi.com/img/cate/chenshan10.jpg">',542,168,'https://yehuo.applinzi.com/img/cate/cate5.jpg',298.00,now()),
(null,'海澜之家2018火热新品男潮流特卖时尚条纹衬衫',
'<img src="https://yehuo.applinzi.com/img/cate/chenshan1.jpg">  
<img src="https://yehuo.applinzi.com/img/cate/chenshan2.png">
<img src="https://yehuo.applinzi.com/img/cate/chenshan3.png">
<img src="https://yehuo.applinzi.com/img/cate/chenshan4.jpg">
<img src="https://yehuo.applinzi.com/img/cate/chenshan5.jpg">
<img src="https://yehuo.applinzi.com/img/cate/chenshan6.jpg">
<img src="https://yehuo.applinzi.com/img/cate/chenshan7.jpg">
<img src="https://yehuo.applinzi.com/img/cate/chenshan8.jpg">
<img src="https://yehuo.applinzi.com/img/cate/chenshan9.jpg">
<img src="https://yehuo.applinzi.com/img/cate/chenshan10.jpg">',786,253,'https://yehuo.applinzi.com/img/cate/cate6.jpg',298.00,now()),
(null,'海澜之家2018火热新品男潮流特卖时尚提花秋装长袖',
'<img src="https://yehuo.applinzi.com/img/cate/chenshan1.jpg">  
<img src="https://yehuo.applinzi.com/img/cate/chenshan2.png">
<img src="https://yehuo.applinzi.com/img/cate/chenshan3.png">
<img src="https://yehuo.applinzi.com/img/cate/chenshan4.jpg">
<img src="https://yehuo.applinzi.com/img/cate/chenshan5.jpg">
<img src="https://yehuo.applinzi.com/img/cate/chenshan6.jpg">
<img src="https://yehuo.applinzi.com/img/cate/chenshan7.jpg">
<img src="https://yehuo.applinzi.com/img/cate/chenshan8.jpg">
<img src="https://yehuo.applinzi.com/img/cate/chenshan9.jpg">
<img src="https://yehuo.applinzi.com/img/cate/chenshan10.jpg">',1254,512,'https://yehuo.applinzi.com/img/cate/cate7.jpg',328.00,now()),
(null,'海澜之家牛仔混纺潮流衬衫2018冬季新品舒适时尚衬衫男',
'<img src="https://yehuo.applinzi.com/img/cate/waitao1.jpg">
<img src="https://yehuo.applinzi.com/img/cate/waitao2.jpg">
<img src="https://yehuo.applinzi.com/img/cate/waitao3.jpg">
<img src="https://yehuo.applinzi.com/img/cate/dayi3.png">
<img src="https://yehuo.applinzi.com/img/cate/dayi4.png">
<img src="https://yehuo.applinzi.com/img/cate/waitao4.jpg">
<img src="https://yehuo.applinzi.com/img/cate/waitao5.jpg">',438,421,'https://yehuo.applinzi.com/img/cate/cate8.jpg',268.00,now()),
(null,'海澜之家2018火热新品男潮流特卖时尚冬季衬衫',
'<img src="https://yehuo.applinzi.com/img/cate/chenshan1.jpg">  
<img src="https://yehuo.applinzi.com/img/cate/chenshan2.png">
<img src="https://yehuo.applinzi.com/img/cate/chenshan3.png">
<img src="https://yehuo.applinzi.com/img/cate/chenshan4.jpg">
<img src="https://yehuo.applinzi.com/img/cate/chenshan5.jpg">
<img src="https://yehuo.applinzi.com/img/cate/chenshan6.jpg">
<img src="https://yehuo.applinzi.com/img/cate/chenshan7.jpg">
<img src="https://yehuo.applinzi.com/img/cate/chenshan8.jpg">
<img src="https://yehuo.applinzi.com/img/cate/chenshan9.jpg">
<img src="https://yehuo.applinzi.com/img/cate/chenshan10.jpg">',854,123,'https://yehuo.applinzi.com/img/cate/cate9.jpg',198.00,now()),
(null,'海澜之家2018撞色混纺套头针织衫几何纹冬季长袖',
'<img src="https://yehuo.applinzi.com/img/cate/chenshan1.jpg">  
<img src="https://yehuo.applinzi.com/img/cate/chenshan2.png">
<img src="https://yehuo.applinzi.com/img/cate/chenshan3.png">
<img src="https://yehuo.applinzi.com/img/cate/chenshan4.jpg">
<img src="https://yehuo.applinzi.com/img/cate/chenshan5.jpg">
<img src="https://yehuo.applinzi.com/img/cate/chenshan6.jpg">
<img src="https://yehuo.applinzi.com/img/cate/chenshan7.jpg">
<img src="https://yehuo.applinzi.com/img/cate/chenshan8.jpg">
<img src="https://yehuo.applinzi.com/img/cate/chenshan9.jpg">
<img src="https://yehuo.applinzi.com/img/cate/chenshan10.jpg">',268,642,'https://yehuo.applinzi.com/img/cate/cate10.jpg',298.00,now()),
(null,'海澜之家2018火热秋季新品男潮流特卖时尚休闲西装男',
'<img src="https://yehuo.applinzi.com/img/cate/chenshan1.jpg">  
<img src="https://yehuo.applinzi.com/img/cate/chenshan2.png">
<img src="https://yehuo.applinzi.com/img/cate/chenshan3.png">
<img src="https://yehuo.applinzi.com/img/cate/chenshan4.jpg">
<img src="https://yehuo.applinzi.com/img/cate/chenshan5.jpg">
<img src="https://yehuo.applinzi.com/img/cate/chenshan6.jpg">
<img src="https://yehuo.applinzi.com/img/cate/chenshan7.jpg">
<img src="https://yehuo.applinzi.com/img/cate/chenshan8.jpg">
<img src="https://yehuo.applinzi.com/img/cate/chenshan9.jpg">
<img src="https://yehuo.applinzi.com/img/cate/chenshan10.jpg">',333,551,'https://yehuo.applinzi.com/img/cate/cate11.jpg',318.00,now()),
(null,'海澜之家时尚粉色衬衫2019春季新品个性绣标舒适衬衫男',
'<img src="https://yehuo.applinzi.com/img/cate/chenshan1.jpg">  
<img src="https://yehuo.applinzi.com/img/cate/chenshan2.png">
<img src="https://yehuo.applinzi.com/img/cate/chenshan3.png">
<img src="https://yehuo.applinzi.com/img/cate/chenshan4.jpg">
<img src="https://yehuo.applinzi.com/img/cate/chenshan5.jpg">
<img src="https://yehuo.applinzi.com/img/cate/chenshan6.jpg">
<img src="https://yehuo.applinzi.com/img/cate/chenshan7.jpg">
<img src="https://yehuo.applinzi.com/img/cate/chenshan8.jpg">
<img src="https://yehuo.applinzi.com/img/cate/chenshan9.jpg">
<img src="https://yehuo.applinzi.com/img/cate/chenshan10.jpg">',486,339,'https://yehuo.applinzi.com/img/cate/cate12.jpg',228.00,now()),
(null,'海澜之家撞色混纺双领针织衫2018冬季新品舒适时尚冬季长袖',
'<img src="https://yehuo.applinzi.com/img/cate/dayi1.jpg">  
<img src="https://yehuo.applinzi.com/img/cate/dayi2.jpg">
<img src="https://yehuo.applinzi.com/img/cate/dayi3.png">
<img src="https://yehuo.applinzi.com/img/cate/dayi4.png">
<img src="https://yehuo.applinzi.com/img/cate/dayi5.jpg">
<img src="https://yehuo.applinzi.com/img/cate/dayi6.jpg">
<img src="https://yehuo.applinzi.com/img/cate/dayi7.jpg">
<img src="https://yehuo.applinzi.com/img/cate/dayi8.jpg">
<img src="https://yehuo.applinzi.com/img/cate/dayi9.jpg">
<img src="https://yehuo.applinzi.com/img/cate/dayi10.jpg">
<img src="https://yehuo.applinzi.com/img/cate/dayi11.png">',847,472,'https://yehuo.applinzi.com/img/cate/cate13.jpg',298.00,now()),
(null,'海澜之家2018火热新品几何条纹男潮流特卖时尚卫衣男',
'<img src="https://yehuo.applinzi.com/img/cate/dayi1.jpg">  
<img src="https://yehuo.applinzi.com/img/cate/dayi2.jpg">
<img src="https://yehuo.applinzi.com/img/cate/dayi3.png">
<img src="https://yehuo.applinzi.com/img/cate/dayi4.png">
<img src="https://yehuo.applinzi.com/img/cate/dayi5.jpg">
<img src="https://yehuo.applinzi.com/img/cate/dayi6.jpg">
<img src="https://yehuo.applinzi.com/img/cate/dayi7.jpg">
<img src="https://yehuo.applinzi.com/img/cate/dayi8.jpg">
<img src="https://yehuo.applinzi.com/img/cate/dayi9.jpg">
<img src="https://yehuo.applinzi.com/img/cate/dayi10.jpg">
<img src="https://yehuo.applinzi.com/img/cate/dayi11.png">',568,520,'https://yehuo.applinzi.com/img/cate/cate14.jpg',298.00,now()),
(null,'海澜之家时尚卫衣2019春季新品个性套头舒适假两件',
'<img src="https://yehuo.applinzi.com/img/cate/jialj1.jpg">
<img src="https://yehuo.applinzi.com/img/cate/jialj2.jpg">
<img src="https://yehuo.applinzi.com/img/cate/jialj3.jpg">
<img src="https://yehuo.applinzi.com/img/cate/dayi3.png">
<img src="https://yehuo.applinzi.com/img/cate/dayi4.png">
<img src="https://yehuo.applinzi.com/img/cate/dayi6.jpg">
<img src="https://yehuo.applinzi.com/img/cate/dayi7.jpg">
<img src="https://yehuo.applinzi.com/img/cate/dayi8.jpg">
<img src="https://yehuo.applinzi.com/img/cate/dayi9.jpg">
<img src="https://yehuo.applinzi.com/img/cate/jialj4.jpg">
<img src="https://yehuo.applinzi.com/img/cate/dayi11.png">',516,920,'https://yehuo.applinzi.com/img/cate/cate15.jpg',268.00,now()),
(null,'海澜之家2018秋季新品男立领西装大衣时尚清新毛呢男','
<img src="https://yehuo.applinzi.com/img/cate/xifu1.jpg">
<img src="https://yehuo.applinzi.com/img/cate/xifu2.jpg">
<img src="https://yehuo.applinzi.com/img/cate/xifu3.jpg">
<img src="https://yehuo.applinzi.com/img/cate/xifu4.jpg">
<img src="https://yehuo.applinzi.com/img/cate/xifu5.jpg">
<img src="https://yehuo.applinzi.com/img/cate/xifu6.jpg">
<img src="https://yehuo.applinzi.com/img/cate/xifu5.png">
<img src="https://yehuo.applinzi.com/img/cate/xifu6.png">
<img src="https://yehuo.applinzi.com/img/cate/xifu7.jpg">
<img src="https://yehuo.applinzi.com/img/cate/xifu8.jpg">
<img src="https://yehuo.applinzi.com/img/cate/xifu9.jpg">
<img src="https://yehuo.applinzi.com/img/cate/xifu10.jpg">
<img src="https://yehuo.applinzi.com/img/cate/xifu11.jpg">
<img src="https://yehuo.applinzi.com/img/cate/xifu12.png">',385,264,'https://yehuo.applinzi.com/img/cate/cate16.jpg',598.00,now()),
(null,'海澜之家时尚连帽羽绒2019春季新品保暖长款羽绒男','
<img src="https://yehuo.applinzi.com/img/cate/yurong1.jpg">
<img src="https://yehuo.applinzi.com/img/cate/yurong2.jpg">
<img src="https://yehuo.applinzi.com/img/cate/yurong3.jpg">
<img src="https://yehuo.applinzi.com/img/cate/yurong4.jpg">
<img src="https://yehuo.applinzi.com/img/cate/yurong5.jpg">
<img src="https://yehuo.applinzi.com/img/cate/xifu5.png">
<img src="https://yehuo.applinzi.com/img/cate/xifu6.png">
<img src="https://yehuo.applinzi.com/img/cate/yurong6.jpg">',169,334,'https://yehuo.applinzi.com/img/cate/cate17.jpg',328.00,now()),
(null,'海澜之家2018秋季新品男羽绒服时尚潮流外套条纹男',
'<img src="https://yehuo.applinzi.com/img/cate/yurong1.jpg">
<img src="https://yehuo.applinzi.com/img/cate/yurong2.jpg">
<img src="https://yehuo.applinzi.com/img/cate/yurong3.jpg">
<img src="https://yehuo.applinzi.com/img/cate/yurong4.jpg">
<img src="https://yehuo.applinzi.com/img/cate/yurong5.jpg">
<img src="https://yehuo.applinzi.com/img/cate/xifu5.png">
<img src="https://yehuo.applinzi.com/img/cate/xifu6.png">
<img src="https://yehuo.applinzi.com/img/cate/yurong6.jpg">',563,58,'https://yehuo.applinzi.com/img/cate/cate18.jpg',398.00,now()),
(null,'HLA海澜之家舒适宽松牛仔裤2018秋季新品微弹简约有型男裤',
'<img src="https://yehuo.applinzi.com/img/cate/kuzi1.jpg">
	<img src="https://yehuo.applinzi.com/img/cate/kuzi2.jpg">
	<img src="https://yehuo.applinzi.com/img/cate/kuzi3.jpg">
	<img src="https://yehuo.applinzi.com/img/cate/kuzi4.jpg">
	<img src="https://yehuo.applinzi.com/img/cate/kuzi5.jpg">
	<img src="https://yehuo.applinzi.com/img/cate/kuzi6.jpg">
	<img src="https://yehuo.applinzi.com/img/cate/kuzi7.jpg">
	<img src="https://yehuo.applinzi.com/img/cate/kuzi8.png">
	<img src="https://yehuo.applinzi.com/img/cate/kuzi9.jpg">
	<img src="https://yehuo.applinzi.com/img/cate/kuzi10.jpg">
	<img src="https://yehuo.applinzi.com/img/cate/kuzi11.jpg">
	<img src="https://yehuo.applinzi.com/img/cate/kuzi12.jpg"> ',378,67,'https://yehuo.applinzi.com/img/cate/cate19.jpg',168.00,now()),
(null,'HLA海澜之家五袋款牛仔裤2018秋季新品修身磨破时尚长裤',
'<img src="https://yehuo.applinzi.com/img/cate/kuzi1.jpg">
<img src="https://yehuo.applinzi.com/img/cate/kuzi2.jpg">
<img src="https://yehuo.applinzi.com/img/cate/kuzi3.jpg">
<img src="https://yehuo.applinzi.com/img/cate/kuzi4.jpg">
<img src="https://yehuo.applinzi.com/img/cate/kuzi5.jpg">
<img src="https://yehuo.applinzi.com/img/cate/kuzi6.jpg">
<img src="https://yehuo.applinzi.com/img/cate/kuzi7.jpg">
<img src="https://yehuo.applinzi.com/img/cate/kuzi8.png">
<img src="https://yehuo.applinzi.com/img/cate/kuzi9.jpg">
<img src="https://yehuo.applinzi.com/img/cate/kuzi10.jpg">
<img src="https://yehuo.applinzi.com/img/cate/kuzi11.jpg">
<img src="https://yehuo.applinzi.com/img/cate/kuzi12.jpg">',865,74,'https://yehuo.applinzi.com/img/cate/cate20.jpg',298.00,now()),
(null,'HLA海澜之家时尚潮流长裤2018秋季新品牛仔长裤男',
'<img src="https://yehuo.applinzi.com/img/cate/kuzi1.jpg">
<img src="https://yehuo.applinzi.com/img/cate/kuzi2.jpg">
<img src="https://yehuo.applinzi.com/img/cate/kuzi3.jpg">
<img src="https://yehuo.applinzi.com/img/cate/kuzi4.jpg">
<img src="https://yehuo.applinzi.com/img/cate/kuzi5.jpg">
<img src="https://yehuo.applinzi.com/img/cate/kuzi6.jpg">
<img src="https://yehuo.applinzi.com/img/cate/kuzi7.jpg">
<img src="https://yehuo.applinzi.com/img/cate/kuzi8.png">
<img src="https://yehuo.applinzi.com/img/cate/kuzi9.jpg">
<img src="https://yehuo.applinzi.com/img/cate/kuzi10.jpg">
<img src="https://yehuo.applinzi.com/img/cate/kuzi11.jpg">
<img src="https://yehuo.applinzi.com/img/cate/kuzi12.jpg">',65,185,'https://yehuo.applinzi.com/img/cate/cate21.jpg',198.00,now()),
(null,'HLA海澜之家时尚猫须款牛仔裤2018秋季新品直筒款牛仔长裤',
'<img src="https://yehuo.applinzi.com/img/cate/kuzi1.jpg">
<img src="https://yehuo.applinzi.com/img/cate/kuzi2.jpg">
<img src="https://yehuo.applinzi.com/img/cate/kuzi3.jpg">
<img src="https://yehuo.applinzi.com/img/cate/kuzi4.jpg">
<img src="https://yehuo.applinzi.com/img/cate/kuzi5.jpg">
<img src="https://yehuo.applinzi.com/img/cate/kuzi6.jpg">
<img src="https://yehuo.applinzi.com/img/cate/kuzi7.jpg">
<img src="https://yehuo.applinzi.com/img/cate/kuzi8.png">
<img src="https://yehuo.applinzi.com/img/cate/kuzi9.jpg">
<img src="https://yehuo.applinzi.com/img/cate/kuzi10.jpg">
<img src="https://yehuo.applinzi.com/img/cate/kuzi11.jpg">
<img src="https://yehuo.applinzi.com/img/cate/kuzi12.jpg">',269,468,'https://yehuo.applinzi.com/img/cate/cate22.jpg',298.00,now()),
(null,'HLA海澜之家五袋款牛仔裤2018秋季新品修身时尚磨破长裤',
'<img src="https://yehuo.applinzi.com/img/cate/kuzi1.jpg">
<img src="https://yehuo.applinzi.com/img/cate/kuzi2.jpg">
<img src="https://yehuo.applinzi.com/img/cate/kuzi3.jpg">
<img src="https://yehuo.applinzi.com/img/cate/kuzi4.jpg">
<img src="https://yehuo.applinzi.com/img/cate/kuzi5.jpg">
<img src="https://yehuo.applinzi.com/img/cate/kuzi6.jpg">
<img src="https://yehuo.applinzi.com/img/cate/kuzi7.jpg">
<img src="https://yehuo.applinzi.com/img/cate/kuzi8.png">
<img src="https://yehuo.applinzi.com/img/cate/kuzi9.jpg">
<img src="https://yehuo.applinzi.com/img/cate/kuzi10.jpg">
<img src="https://yehuo.applinzi.com/img/cate/kuzi11.jpg">
<img src="https://yehuo.applinzi.com/img/cate/kuzi12.jpg">',475,6,'https://yehuo.applinzi.com/img/cate/cate23.jpg',328.00,now()),
(null,'HLA海澜之家时尚牛仔裤2018冬季新品长款牛仔裤',
'<img src="https://yehuo.applinzi.com/img/cate/kuzi1.jpg">
<img src="https://yehuo.applinzi.com/img/cate/kuzi2.jpg">
<img src="https://yehuo.applinzi.com/img/cate/kuzi3.jpg">
<img src="https://yehuo.applinzi.com/img/cate/kuzi4.jpg">
<img src="https://yehuo.applinzi.com/img/cate/kuzi5.jpg">
<img src="https://yehuo.applinzi.com/img/cate/kuzi6.jpg">
<img src="https://yehuo.applinzi.com/img/cate/kuzi7.jpg">
<img src="https://yehuo.applinzi.com/img/cate/kuzi8.png">
<img src="https://yehuo.applinzi.com/img/cate/kuzi9.jpg">
<img src="https://yehuo.applinzi.com/img/cate/kuzi10.jpg">
<img src="https://yehuo.applinzi.com/img/cate/kuzi11.jpg">
<img src="https://yehuo.applinzi.com/img/cate/kuzi12.jpg">',523,256,'https://yehuo.applinzi.com/img/cate/cate24.jpg',298.00,now()),
(null,'HLA海澜之家轻户外纯色毛呢大衣2018冬季新品毛绒外套',
'<img src="https://yehuo.applinzi.com/img/cate/xizhuang1.jpg">
<img src="https://yehuo.applinzi.com/img/cate/xizhuang2.jpg">
<img src="https://yehuo.applinzi.com/img/cate/xizhuang3.jpg">
<img src="https://yehuo.applinzi.com/img/cate/xizhuang4.jpg">
<img src="https://yehuo.applinzi.com/img/cate/xizhuang5.png">
<img src="https://yehuo.applinzi.com/img/cate/xizhuang6.png">
<img src="https://yehuo.applinzi.com/img/cate/xizhuang7.jpg">
<img src="https://yehuo.applinzi.com/img/cate/xizhuang8.jpg">
<img src="https://yehuo.applinzi.com/img/cate/xizhuang9.jpg">
<img src="https://yehuo.applinzi.com/img/cate/xizhuang10.jpg">
<img src="https://yehuo.applinzi.com/img/cate/xizhuang11.jpg">
<img src="https://yehuo.applinzi.com/img/cate/xizhuang12.jpg">
<img src="https://yehuo.applinzi.com/img/cate/xizhuang13.jpg">
<img src="https://yehuo.applinzi.com/img/cate/xizhuang14.jpg">
<img src="https://yehuo.applinzi.com/img/cate/xizhuang15.jpg">
<img src="https://yehuo.applinzi.com/img/cate/xizhuang16.png">',427,136,'https://yehuo.applinzi.com/img/cate/cate25.jpg',698.00,now()),
(null,'HLA海澜之家毛领真皮潮流秋季新品舒适羊皮保暖外套男',
'<img src="https://yehuo.applinzi.com/img/cate/dayi1.jpg">
<img src="https://yehuo.applinzi.com/img/cate/dayi2.jpg">
<img src="https://yehuo.applinzi.com/img/cate/dayi3.png">
<img src="https://yehuo.applinzi.com/img/cate/dayi4.png">
<img src="https://yehuo.applinzi.com/img/cate/dayi5.jpg">
<img src="https://yehuo.applinzi.com/img/cate/dayi6.jpg">
<img src="https://yehuo.applinzi.com/img/cate/dayi7.jpg">
<img src="https://yehuo.applinzi.com/img/cate/dayi8.jpg">
<img src="https://yehuo.applinzi.com/img/cate/dayi9.jpg">
<img src="https://yehuo.applinzi.com/img/cate/dayi10.jpg">
<img src="https://yehuo.applinzi.com/img/cate/dayi11.png">',267,68,'https://yehuo.applinzi.com/img/cate/cate26.jpg',468.00,now()),
(null,'HLA海澜之家连帽简约款休闲上衣秋季新品舒适套头衫轻薄卫衣',
'<img src="https://yehuo.applinzi.com/img/cate/dayi1.jpg">
<img src="https://yehuo.applinzi.com/img/cate/dayi2.jpg">
<img src="https://yehuo.applinzi.com/img/cate/dayi3.png">
<img src="https://yehuo.applinzi.com/img/cate/dayi4.png">
<img src="https://yehuo.applinzi.com/img/cate/dayi5.jpg">
<img src="https://yehuo.applinzi.com/img/cate/dayi6.jpg">
<img src="https://yehuo.applinzi.com/img/cate/dayi7.jpg">
<img src="https://yehuo.applinzi.com/img/cate/dayi8.jpg">
<img src="https://yehuo.applinzi.com/img/cate/dayi9.jpg">
<img src="https://yehuo.applinzi.com/img/cate/dayi10.jpg">
<img src="https://yehuo.applinzi.com/img/cate/dayi11.png">',567,78,'https://yehuo.applinzi.com/img/cate/cate27.jpg',258.00,now()),
(null,'HLA海澜之家单排扣长款针织大衣2018冬季新品西装领大衣外套',
'<img src="https://yehuo.applinzi.com/img/cate/dayi1.jpg">
<img src="https://yehuo.applinzi.com/img/cate/dayi2.jpg">
<img src="https://yehuo.applinzi.com/img/cate/dayi3.png">
<img src="https://yehuo.applinzi.com/img/cate/dayi4.png">
<img src="https://yehuo.applinzi.com/img/cate/dayi5.jpg">
<img src="https://yehuo.applinzi.com/img/cate/dayi6.jpg">
<img src="https://yehuo.applinzi.com/img/cate/dayi7.jpg">
<img src="https://yehuo.applinzi.com/img/cate/dayi8.jpg">
<img src="https://yehuo.applinzi.com/img/cate/dayi9.jpg">
<img src="https://yehuo.applinzi.com/img/cate/dayi10.jpg">
<img src="https://yehuo.applinzi.com/img/cate/dayi11.png">',337,3,'https://yehuo.applinzi.com/img/cate/cate28.jpg',898.00,now()),
(null,'HLA海澜之家经典立领款羽绒服2018冬季新品简约保暖羽绒外套',
'<img src="https://yehuo.applinzi.com/img/cate/yurong1.jpg">
<img src="https://yehuo.applinzi.com/img/cate/yurong2.jpg">
<img src="https://yehuo.applinzi.com/img/cate/yurong3.jpg">
<img src="https://yehuo.applinzi.com/img/cate/yurong4.jpg">
<img src="https://yehuo.applinzi.com/img/cate/yurong5.jpg">
<img src="https://yehuo.applinzi.com/img/cate/xifu5.png">
<img src="https://yehuo.applinzi.com/img/cate/xifu6.png">
<img src="https://yehuo.applinzi.com/img/cate/yurong6.jpg">',367,39,'https://yehuo.applinzi.com/img/cate/cate29.jpg',898.00,now()),
(null,'HLA海澜之家撞色混纺双领针织衫时尚假两件舒适夹克',
'<img src="https://yehuo.applinzi.com/img/cate/wt1.jpg">
<img src="https://yehuo.applinzi.com/img/cate/wt2.jpg">
<img src="https://yehuo.applinzi.com/img/cate/wt3.jpg">
<img src="https://yehuo.applinzi.com/img/cate/dayi3.png">
<img src="https://yehuo.applinzi.com/img/cate/dayi4.png">
<img src="https://yehuo.applinzi.com/img/cate/dayi6.jpg">
<img src="https://yehuo.applinzi.com/img/cate/dayi7.jpg">
<img src="https://yehuo.applinzi.com/img/cate/dayi8.jpg">
<img src="https://yehuo.applinzi.com/img/cate/dayi9.jpg">
<img src="https://yehuo.applinzi.com/img/cate/jialj4.jpg">
<img src="https://yehuo.applinzi.com/img/cate/dayi11.png">',1925,268,'https://yehuo.applinzi.com/img/cate/cate30.jpg',328.00,now()),
(null,'HLA海澜之家优雅净色大衣2018冬季西装领保暖大衣男','
<img src="https://yehuo.applinzi.com/img/cate/xizhuang1.jpg">
<img src="https://yehuo.applinzi.com/img/cate/xizhuang2.jpg">
<img src="https://yehuo.applinzi.com/img/cate/xizhuang3.jpg">
<img src="https://yehuo.applinzi.com/img/cate/xizhuang4.jpg">
<img src="https://yehuo.applinzi.com/img/cate/xizhuang5.png">
<img src="https://yehuo.applinzi.com/img/cate/xizhuang6.png">
<img src="https://yehuo.applinzi.com/img/cate/xizhuang7.jpg">
<img src="https://yehuo.applinzi.com/img/cate/xizhuang8.jpg">
<img src="https://yehuo.applinzi.com/img/cate/xizhuang9.jpg">
<img src="https://yehuo.applinzi.com/img/cate/xizhuang10.jpg">
<img src="https://yehuo.applinzi.com/img/cate/xizhuang11.jpg">
<img src="https://yehuo.applinzi.com/img/cate/xizhuang12.jpg">
<img src="https://yehuo.applinzi.com/img/cate/xizhuang13.jpg">
<img src="https://yehuo.applinzi.com/img/cate/xizhuang14.jpg">
<img src="https://yehuo.applinzi.com/img/cate/xizhuang15.jpg">
<img src="https://yehuo.applinzi.com/img/cate/xizhuang16.png">',1063,56,'https://yehuo.applinzi.com/img/cate/cate31.jpg',758.00,now()),
(null,'HLA海澜之家花纹西装领2018冬季新品简约保暖大衣外套',
'<img src="https://yehuo.applinzi.com/img/cate/xizhuang1.jpg">
<img src="https://yehuo.applinzi.com/img/cate/xizhuang2.jpg">
<img src="https://yehuo.applinzi.com/img/cate/xizhuang3.jpg">
<img src="https://yehuo.applinzi.com/img/cate/xizhuang4.jpg">
<img src="https://yehuo.applinzi.com/img/cate/xizhuang5.png">
<img src="https://yehuo.applinzi.com/img/cate/xizhuang6.png">
<img src="https://yehuo.applinzi.com/img/cate/xizhuang7.jpg">
<img src="https://yehuo.applinzi.com/img/cate/xizhuang8.jpg">
<img src="https://yehuo.applinzi.com/img/cate/xizhuang9.jpg">
<img src="https://yehuo.applinzi.com/img/cate/xizhuang10.jpg">
<img src="https://yehuo.applinzi.com/img/cate/xizhuang11.jpg">
<img src="https://yehuo.applinzi.com/img/cate/xizhuang12.jpg">
<img src="https://yehuo.applinzi.com/img/cate/xizhuang13.jpg">
<img src="https://yehuo.applinzi.com/img/cate/xizhuang14.jpg">
<img src="https://yehuo.applinzi.com/img/cate/xizhuang15.jpg">
<img src="https://yehuo.applinzi.com/img/cate/xizhuang16.png">',367,74,'https://yehuo.applinzi.com/img/cate/cate32.jpg',898.00,now()),
(null,'海澜之家2018秋季新品男立领西装大衣时尚清新毛呢男','
<img src="https://yehuo.applinzi.com/img/cate/xifu1.jpg">
<img src="https://yehuo.applinzi.com/img/cate/xifu2.jpg">
<img src="https://yehuo.applinzi.com/img/cate/xifu3.jpg">
<img src="https://yehuo.applinzi.com/img/cate/xifu4.jpg">
<img src="https://yehuo.applinzi.com/img/cate/xifu5.jpg">
<img src="https://yehuo.applinzi.com/img/cate/xifu6.jpg">
<img src="https://yehuo.applinzi.com/img/cate/xifu5.png">
<img src="https://yehuo.applinzi.com/img/cate/xifu6.png">
<img src="https://yehuo.applinzi.com/img/cate/xifu7.jpg">
<img src="https://yehuo.applinzi.com/img/cate/xifu8.jpg">
<img src="https://yehuo.applinzi.com/img/cate/xifu9.jpg">
<img src="https://yehuo.applinzi.com/img/cate/xifu10.jpg">
<img src="https://yehuo.applinzi.com/img/cate/xifu11.jpg">
<img src="https://yehuo.applinzi.com/img/cate/xifu12.png">',1375,264,'https://yehuo.applinzi.com/img/cate/cate33.jpg',698.00,now()),
(null,'海澜之家2018冬季新品男针织立领大衣时尚保暖毛呢男','
<img src="https://yehuo.applinzi.com/img/cate/xifu1.jpg">
<img src="https://yehuo.applinzi.com/img/cate/xifu2.jpg">
<img src="https://yehuo.applinzi.com/img/cate/xifu3.jpg">
<img src="https://yehuo.applinzi.com/img/cate/xifu4.jpg">
<img src="https://yehuo.applinzi.com/img/cate/xifu5.jpg">
<img src="https://yehuo.applinzi.com/img/cate/xifu6.jpg">
<img src="https://yehuo.applinzi.com/img/cate/xifu5.png">
<img src="https://yehuo.applinzi.com/img/cate/xifu6.png">
<img src="https://yehuo.applinzi.com/img/cate/xifu7.jpg">
<img src="https://yehuo.applinzi.com/img/cate/xifu8.jpg">
<img src="https://yehuo.applinzi.com/img/cate/xifu9.jpg">
<img src="https://yehuo.applinzi.com/img/cate/xifu10.jpg">
<img src="https://yehuo.applinzi.com/img/cate/xifu11.jpg">
<img src="https://yehuo.applinzi.com/img/cate/xifu12.png">',125,176,'https://yehuo.applinzi.com/img/cate/cate34.jpg',798.00,now()),
(null,'海澜之家2018轻薄中腰休闲裤2019新品微弹舒适大方男','
<img src="https://yehuo.applinzi.com/img/cate/kuzi13.jpg">
<img src="https://yehuo.applinzi.com/img/cate/kuzi14.jpg">
<img src="https://yehuo.applinzi.com/img/cate/kuzi15.jpg">
<img src="https://yehuo.applinzi.com/img/cate/kuzi4.jpg">
<img src="https://yehuo.applinzi.com/img/cate/kuzi5.jpg">
<img src="https://yehuo.applinzi.com/img/cate/kuzi6.jpg">
<img src="https://yehuo.applinzi.com/img/cate/kuzi7.jpg">
<img src="https://yehuo.applinzi.com/img/cate/kuzi8.png">
<img src="https://yehuo.applinzi.com/img/cate/kuzi9.jpg">
<img src="https://yehuo.applinzi.com/img/cate/kuzi10.jpg">
<img src="https://yehuo.applinzi.com/img/cate/kuzi11.jpg">
<img src="https://yehuo.applinzi.com/img/cate/kuzi12.jpg">',975,425,'https://yehuo.applinzi.com/img/cate/cate35.jpg',298.00,now()),
(null,'海澜之家无帽立领皮羽绒2018冬季新品柔软羽绒服男','
<img src="https://yehuo.applinzi.com/img/cate/yurong1.jpg">
<img src="https://yehuo.applinzi.com/img/cate/yurong2.jpg">
<img src="https://yehuo.applinzi.com/img/cate/yurong3.jpg">
<img src="https://yehuo.applinzi.com/img/cate/yurong4.jpg">
<img src="https://yehuo.applinzi.com/img/cate/yurong5.jpg">
<img src="https://yehuo.applinzi.com/img/cate/xifu5.png">
<img src="https://yehuo.applinzi.com/img/cate/xifu6.png">
<img src="https://yehuo.applinzi.com/img/cate/yurong6.jpg">',36,315,'https://yehuo.applinzi.com/img/cate/cate36.jpg',2398.00,now()),
(null,'海澜之家粗针条纹针织衫2019春季新品撞色毛线长袖男',
'<img src="https://yehuo.applinzi.com/img/cate/zhenzhi1.jpg">  
<img src="https://yehuo.applinzi.com/img/cate/zhenzhi2.jpg">
<img src="https://yehuo.applinzi.com/img/cate/zhenzhi3.jpg">
<img src="https://yehuo.applinzi.com/img/cate/xifu5.png">
<img src="https://yehuo.applinzi.com/img/cate/xifu6.png">
<img src="https://yehuo.applinzi.com/img/cate/chenshan7.jpg">
<img src="https://yehuo.applinzi.com/img/cate/chenshan8.jpg">
<img src="https://yehuo.applinzi.com/img/cate/chenshan9.jpg">
<img src="https://yehuo.applinzi.com/img/cate/zhenzhi4.jpg">',684,274,'https://yehuo.applinzi.com/img/cate/cate37.jpg',218.00,now()),
(null,'HLA海澜之家套头提花双领针织衫2018冬季新品背心假两件男',
'<img src="https://yehuo.applinzi.com/img/cate/jialj1.jpg">
<img src="https://yehuo.applinzi.com/img/cate/jialj2.jpg">
<img src="https://yehuo.applinzi.com/img/cate/jialj3.jpg">
<img src="https://yehuo.applinzi.com/img/cate/dayi3.png">
<img src="https://yehuo.applinzi.com/img/cate/dayi4.png">
<img src="https://yehuo.applinzi.com/img/cate/dayi6.jpg">
<img src="https://yehuo.applinzi.com/img/cate/dayi7.jpg">
<img src="https://yehuo.applinzi.com/img/cate/dayi8.jpg">
<img src="https://yehuo.applinzi.com/img/cate/dayi9.jpg">
<img src="https://yehuo.applinzi.com/img/cate/jialj4.jpg">
<img src="https://yehuo.applinzi.com/img/cate/dayi11.png">',345,316,'https://yehuo.applinzi.com/img/cate/cate38.jpg',288.00,now()),
(null,'HLA海澜之家羊羔毛领牛仔外套2018冬季新品牛仔外套男',
'<img src="https://yehuo.applinzi.com/img/cate/waitao1.jpg">
<img src="https://yehuo.applinzi.com/img/cate/waitao2.jpg">
<img src="https://yehuo.applinzi.com/img/cate/waitao3.jpg">
<img src="https://yehuo.applinzi.com/img/cate/dayi3.png">
<img src="https://yehuo.applinzi.com/img/cate/dayi4.png">
<img src="https://yehuo.applinzi.com/img/cate/waitao4.jpg">
<img src="https://yehuo.applinzi.com/img/cate/waitao5.jpg">',1345,423,'https://yehuo.applinzi.com/img/cate/cate39.jpg',458.00,now()),
(null,'HLA海澜之家长款连帽夹克时尚舒适休闲迷彩帽里外套男',
'<img src="https://yehuo.applinzi.com/img/cate/wt1.jpg">
<img src="https://yehuo.applinzi.com/img/cate/wt2.jpg">
<img src="https://yehuo.applinzi.com/img/cate/wt3.jpg">
<img src="https://yehuo.applinzi.com/img/cate/dayi3.png">
<img src="https://yehuo.applinzi.com/img/cate/dayi4.png">
<img src="https://yehuo.applinzi.com/img/cate/waitao4.jpg">
<img src="https://yehuo.applinzi.com/img/cate/waitao5.jpg">',1345,273,'https://yehuo.applinzi.com/img/cate/cate40.jpg',458.00,now()),
(null,'HLA海澜之家棒球领夹克2018秋季羊毛混纺针织夹克外套男',
'<img src="https://yehuo.applinzi.com/img/cate/waitao1.jpg">
<img src="https://yehuo.applinzi.com/img/cate/waitao2.jpg">
<img src="https://yehuo.applinzi.com/img/cate/waitao3.jpg">
<img src="https://yehuo.applinzi.com/img/cate/dayi3.png">
<img src="https://yehuo.applinzi.com/img/cate/dayi4.png">
<img src="https://yehuo.applinzi.com/img/cate/waitao4.jpg">
<img src="https://yehuo.applinzi.com/img/cate/waitao5.jpg">',678,371,'https://yehuo.applinzi.com/img/cate/cate41.jpg',598.00,now()),
(null,'HLA海澜之家经典平滑扣皮带2019春季新品商务款皮带男',
'<img src="https://yehuo.applinzi.com/img/cate/pidai1.jpg">
<img src="https://yehuo.applinzi.com/img/cate/pidai2.jpg">
<img src="https://yehuo.applinzi.com/img/cate/pidai3.jpg">
<img src="https://yehuo.applinzi.com/img/cate/pidai4.jpg">
<img src="https://yehuo.applinzi.com/img/cate/pidai5.jpg">
<img src="https://yehuo.applinzi.com/img/cate/pidai6.jpg">
<img src="https://yehuo.applinzi.com/img/cate/pidai7.jpg">',624,635,'https://yehuo.applinzi.com/img/cate/cate42.jpg',128.00,now()),
(null,'HLA海澜之家细腻皮质平滑扣皮带2019春季新品舒适腰带男',
'<img src="https://yehuo.applinzi.com/img/cate/pidai1.jpg">
<img src="https://yehuo.applinzi.com/img/cate/pidai2.jpg">
<img src="https://yehuo.applinzi.com/img/cate/pidai3.jpg">
<img src="https://yehuo.applinzi.com/img/cate/pidai4.jpg">
<img src="https://yehuo.applinzi.com/img/cate/pidai5.jpg">
<img src="https://yehuo.applinzi.com/img/cate/pidai6.jpg">
<img src="https://yehuo.applinzi.com/img/cate/pidai7.jpg">',463,335,'https://yehuo.applinzi.com/img/cate/cate43.jpg',168.00,now()),
(null,'HLA海澜之家时尚大气花纹皮带新品简约扣头男士腰带',
'<img src="https://yehuo.applinzi.com/img/cate/pidai1.jpg">
<img src="https://yehuo.applinzi.com/img/cate/pidai2.jpg">
<img src="https://yehuo.applinzi.com/img/cate/pidai3.jpg">
<img src="https://yehuo.applinzi.com/img/cate/pidai4.jpg">
<img src="https://yehuo.applinzi.com/img/cate/pidai5.jpg">
<img src="https://yehuo.applinzi.com/img/cate/pidai6.jpg">
<img src="https://yehuo.applinzi.com/img/cate/pidai7.jpg">',213,89,'https://yehuo.applinzi.com/img/cate/cate44.jpg',168.00,now()),
(null,'HLA海澜之家光面针扣皮带舒适商务复古男士腰带',
'<img src="https://yehuo.applinzi.com/img/cate/pidai1.jpg">
<img src="https://yehuo.applinzi.com/img/cate/pidai2.jpg">
<img src="https://yehuo.applinzi.com/img/cate/pidai3.jpg">
<img src="https://yehuo.applinzi.com/img/cate/pidai4.jpg">
<img src="https://yehuo.applinzi.com/img/cate/pidai5.jpg">
<img src="https://yehuo.applinzi.com/img/cate/pidai6.jpg">
<img src="https://yehuo.applinzi.com/img/cate/pidai7.jpg">',438,289,'https://yehuo.applinzi.com/img/cate/cate45.jpg',128.00,now()),
(null,'HLA海澜之家条纹保暖围巾2018冬季新品经典绅士围脖男',
'<img src="https://yehuo.applinzi.com/img/cate/weijin1.jpg">
<img src="https://yehuo.applinzi.com/img/cate/weijin2.jpg">
<img src="https://yehuo.applinzi.com/img/cate/weijin3.jpg">
<img src="https://yehuo.applinzi.com/img/cate/weijin4.jpg">
<img src="https://yehuo.applinzi.com/img/cate/weijin5.jpg">
<img src="https://yehuo.applinzi.com/img/cate/weijin6.jpg">
<img src="https://yehuo.applinzi.com/img/cate/weijin7.png">',512,410,'https://yehuo.applinzi.com/img/cate/cate46.jpg',218.00,now()),
(null,'HLA海澜之家撞色保暖围巾2018冬季新品经典绅士围脖男',
'<img src="https://yehuo.applinzi.com/img/cate/weijin1.jpg">
<img src="https://yehuo.applinzi.com/img/cate/weijin2.jpg">
<img src="https://yehuo.applinzi.com/img/cate/weijin3.jpg">
<img src="https://yehuo.applinzi.com/img/cate/weijin4.jpg">
<img src="https://yehuo.applinzi.com/img/cate/weijin5.jpg">
<img src="https://yehuo.applinzi.com/img/cate/weijin6.jpg">
<img src="https://yehuo.applinzi.com/img/cate/weijin7.png">',214,635,'https://yehuo.applinzi.com/img/cate/cate47.jpg',198.00,now()),
(null,'HLA海澜之家撞色保暖围巾2018冬季新品经典绅士围脖男',
'<img src="https://yehuo.applinzi.com/img/cate/weijin1.jpg">
<img src="https://yehuo.applinzi.com/img/cate/weijin2.jpg">
<img src="https://yehuo.applinzi.com/img/cate/weijin3.jpg">
<img src="https://yehuo.applinzi.com/img/cate/weijin4.jpg">
<img src="https://yehuo.applinzi.com/img/cate/weijin5.jpg">
<img src="https://yehuo.applinzi.com/img/cate/weijin6.jpg">
<img src="https://yehuo.applinzi.com/img/cate/weijin7.png">',685,217,'https://yehuo.applinzi.com/img/cate/cate48.jpg',135.00,now()),
(null,'HLA海澜之家三双装中筒袜2018秋季新品柔软舒适袜子男',
'<img src="https://yehuo.applinzi.com/img/cate/wazi1.jpg">
<img src="https://yehuo.applinzi.com/img/cate/wazi2.jpg">
<img src="https://yehuo.applinzi.com/img/cate/wazi3.jpg">
<img src="https://yehuo.applinzi.com/img/cate/wazi4.jpg">
<img src="https://yehuo.applinzi.com/img/cate/wazi5.jpg">
<img src="https://yehuo.applinzi.com/img/cate/wazi6.jpg">
<img src="https://yehuo.applinzi.com/img/cate/wazi7.jpg">',596,521,'https://yehuo.applinzi.com/img/cate/cate49.jpg',35.00,now()),
(null,'HLA海澜之家三双装柔软2018秋季舒适透气休闲男袜',
'<img src="https://yehuo.applinzi.com/img/cate/wazi1.jpg">
<img src="https://yehuo.applinzi.com/img/cate/wazi2.jpg">
<img src="https://yehuo.applinzi.com/img/cate/wazi3.jpg">
<img src="https://yehuo.applinzi.com/img/cate/wazi4.jpg">
<img src="https://yehuo.applinzi.com/img/cate/wazi5.jpg">
<img src="https://yehuo.applinzi.com/img/cate/wazi6.jpg">
<img src="https://yehuo.applinzi.com/img/cate/wazi7.jpg">',685,347,'https://yehuo.applinzi.com/img/cate/cate50.jpg',35.00,now()),
(null,'HLA海澜之家三双装柔软2018秋季舒适透气休闲男袜',
'<img src="https://yehuo.applinzi.com/img/cate/wazi1.jpg">
<img src="https://yehuo.applinzi.com/img/cate/wazi2.jpg">
<img src="https://yehuo.applinzi.com/img/cate/wazi3.jpg">
<img src="https://yehuo.applinzi.com/img/cate/wazi4.jpg">
<img src="https://yehuo.applinzi.com/img/cate/wazi5.jpg">
<img src="https://yehuo.applinzi.com/img/cate/wazi6.jpg">
<img src="https://yehuo.applinzi.com/img/cate/wazi7.jpg">',520,296,'https://yehuo.applinzi.com/img/cate/cate51.jpg',35.00,now()),
(null,'HLA海澜之家三双装柔软2018秋季舒适透气休闲男袜',
'<img src="https://yehuo.applinzi.com/img/cate/wazi1.jpg">
<img src="https://yehuo.applinzi.com/img/cate/wazi2.jpg">
<img src="https://yehuo.applinzi.com/img/cate/wazi3.jpg">
<img src="https://yehuo.applinzi.com/img/cate/wazi4.jpg">
<img src="https://yehuo.applinzi.com/img/cate/wazi5.jpg">
<img src="https://yehuo.applinzi.com/img/cate/wazi6.jpg">
<img src="https://yehuo.applinzi.com/img/cate/wazi7.jpg">',432,461,'https://yehuo.applinzi.com/img/cate/cate52.jpg',35.00,now()),
(null,'海澜之家花纹棒球领夹克春季新品简约大方夹克外套男',
'<img src="https://yehuo.applinzi.com/img/cate/jiake1.jpg">
<img src="https://yehuo.applinzi.com/img/cate/jiake2.jpg">
<img src="https://yehuo.applinzi.com/img/cate/jiake3.jpg">
<img src="https://yehuo.applinzi.com/img/cate/dayi3.png">
<img src="https://yehuo.applinzi.com/img/cate/dayi4.png">
<img src="https://yehuo.applinzi.com/img/cate/jiake4.jpg">
<img src="https://yehuo.applinzi.com/img/cate/jiake5.jpg">
<img src="https://yehuo.applinzi.com/img/cate/jiake6.jpg">
<img src="https://yehuo.applinzi.com/img/cate/jiake7.jpg">
<img src="https://yehuo.applinzi.com/img/cate/jiake8.jpg">
<img src="https://yehuo.applinzi.com/img/cate/jiake9.jpg">
<img src="https://yehuo.applinzi.com/img/cate/jiake10.jpg">',920,370,'https://yehuo.applinzi.com/img/cate/cate53.jpg',398.00,now()),
(null,'海澜之家时尚连帽款夹克2019春季新品净色透气夹克外套男',
'<img src="https://yehuo.applinzi.com/img/cate/jiake1.jpg">
<img src="https://yehuo.applinzi.com/img/cate/jiake2.jpg">
<img src="https://yehuo.applinzi.com/img/cate/jiake3.jpg">
<img src="https://yehuo.applinzi.com/img/cate/dayi3.png">
<img src="https://yehuo.applinzi.com/img/cate/dayi4.png">
<img src="https://yehuo.applinzi.com/img/cate/jiake4.jpg">
<img src="https://yehuo.applinzi.com/img/cate/jiake5.jpg">
<img src="https://yehuo.applinzi.com/img/cate/jiake6.jpg">
<img src="https://yehuo.applinzi.com/img/cate/jiake7.jpg">
<img src="https://yehuo.applinzi.com/img/cate/jiake8.jpg">
<img src="https://yehuo.applinzi.com/img/cate/jiake9.jpg">
<img src="https://yehuo.applinzi.com/img/cate/jiake10.jpg">',666,349,'https://yehuo.applinzi.com/img/cate/cate54.jpg',458.00,now()),
(null,'海澜之家连帽款双面穿夹克春季新品时尚条纹夹克外套男',
'<img src="https://yehuo.applinzi.com/img/cate/jiake1.jpg">
<img src="https://yehuo.applinzi.com/img/cate/jiake2.jpg">
<img src="https://yehuo.applinzi.com/img/cate/jiake3.jpg">
<img src="https://yehuo.applinzi.com/img/cate/dayi3.png">
<img src="https://yehuo.applinzi.com/img/cate/dayi4.png">
<img src="https://yehuo.applinzi.com/img/cate/jiake4.jpg">
<img src="https://yehuo.applinzi.com/img/cate/jiake5.jpg">
<img src="https://yehuo.applinzi.com/img/cate/jiake6.jpg">
<img src="https://yehuo.applinzi.com/img/cate/jiake7.jpg">
<img src="https://yehuo.applinzi.com/img/cate/jiake8.jpg">
<img src="https://yehuo.applinzi.com/img/cate/jiake9.jpg">
<img src="https://yehuo.applinzi.com/img/cate/jiake10.jpg">',241,259,'https://yehuo.applinzi.com/img/cate/cate55.jpg',458.00,now()),
(null,'海澜之家时尚印花棒球领夹克2019春季新品经典夹克外套男',
'<img src="https://yehuo.applinzi.com/img/cate/jiake1.jpg">
<img src="https://yehuo.applinzi.com/img/cate/jiake2.jpg">
<img src="https://yehuo.applinzi.com/img/cate/jiake3.jpg">
<img src="https://yehuo.applinzi.com/img/cate/dayi3.png">
<img src="https://yehuo.applinzi.com/img/cate/dayi4.png">
<img src="https://yehuo.applinzi.com/img/cate/jiake4.jpg">
<img src="https://yehuo.applinzi.com/img/cate/jiake5.jpg">
<img src="https://yehuo.applinzi.com/img/cate/jiake6.jpg">
<img src="https://yehuo.applinzi.com/img/cate/jiake7.jpg">
<img src="https://yehuo.applinzi.com/img/cate/jiake8.jpg">
<img src="https://yehuo.applinzi.com/img/cate/jiake9.jpg">
<img src="https://yehuo.applinzi.com/img/cate/jiake10.jpg">',521,259,'https://yehuo.applinzi.com/img/cate/cate56.jpg',398.00,now()),
(null,'海澜之家翻领夹棉保暖夹克2018冬季新品舒适时尚外套男',
'<img src="https://yehuo.applinzi.com/img/cate/jiake1.jpg">
<img src="https://yehuo.applinzi.com/img/cate/jiake2.jpg">
<img src="https://yehuo.applinzi.com/img/cate/jiake3.jpg">
<img src="https://yehuo.applinzi.com/img/cate/dayi3.png">
<img src="https://yehuo.applinzi.com/img/cate/dayi4.png">
<img src="https://yehuo.applinzi.com/img/cate/jiake4.jpg">
<img src="https://yehuo.applinzi.com/img/cate/jiake5.jpg">
<img src="https://yehuo.applinzi.com/img/cate/jiake6.jpg">
<img src="https://yehuo.applinzi.com/img/cate/jiake7.jpg">
<img src="https://yehuo.applinzi.com/img/cate/jiake8.jpg">
<img src="https://yehuo.applinzi.com/img/cate/jiake9.jpg">
<img src="https://yehuo.applinzi.com/img/cate/jiake10.jpg">',361,89,'https://yehuo.applinzi.com/img/cate/cate57.jpg',658.00,now()),
(null,'海澜之家翻领长款风衣2018秋季新品休闲舒适外套男士',
'<img src="https://yehuo.applinzi.com/img/cate/dayi1.jpg">  
<img src="https://yehuo.applinzi.com/img/cate/dayi2.jpg">
<img src="https://yehuo.applinzi.com/img/cate/dayi3.png">
<img src="https://yehuo.applinzi.com/img/cate/dayi4.png">
<img src="https://yehuo.applinzi.com/img/cate/dayi5.jpg">
<img src="https://yehuo.applinzi.com/img/cate/dayi6.jpg">
<img src="https://yehuo.applinzi.com/img/cate/dayi7.jpg">
<img src="https://yehuo.applinzi.com/img/cate/dayi8.jpg">
<img src="https://yehuo.applinzi.com/img/cate/dayi9.jpg">
<img src="https://yehuo.applinzi.com/img/cate/dayi10.jpg">
<img src="https://yehuo.applinzi.com/img/cate/dayi11.png">',297,132,'https://yehuo.applinzi.com/img/cate/cate58.jpg',598.00,now()),
(null,'HLA海澜之家低调时尚免烫衬衫2018秋季新品舒适正装衬衫男',
'<img src="https://yehuo.applinzi.com/img/cate/chenshan1.jpg">  
<img src="https://yehuo.applinzi.com/img/cate/chenshan2.png">
<img src="https://yehuo.applinzi.com/img/cate/chenshan3.png">
<img src="https://yehuo.applinzi.com/img/cate/chenshan4.jpg">
<img src="https://yehuo.applinzi.com/img/cate/chenshan5.jpg">
<img src="https://yehuo.applinzi.com/img/cate/chenshan6.jpg">
<img src="https://yehuo.applinzi.com/img/cate/chenshan7.jpg">
<img src="https://yehuo.applinzi.com/img/cate/chenshan8.jpg">
<img src="https://yehuo.applinzi.com/img/cate/chenshan9.jpg">
<img src="https://yehuo.applinzi.com/img/cate/chenshan10.jpg">',175,187,'https://yehuo.applinzi.com/img/cate/cate59.jpg',268.00,now());

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
(null,2,now(),'这个羽绒服和老公在店里试的 很喜欢 薄厚长短正好 老公明年本命年 就想给他买一个红色外套 主要这个红不浮夸 很稳重 这个年龄穿又不会显老 挺挂架 刻意等到活动来拍的 物流用顺丰超级快 两天就收到','dingding',0),
(null,4,now(),'产品质量觉得很好，穿着也很暖和、舒适 。就是号码有点小 ，建议买大一点的，我是退换了的 。还会继续选择hlzj 总之很满意！','jerry',0),
(null,3,now(),'上身效果很好，跟实体店一样，给满分！','tom',0),
(null,1,now(),'面料很柔软，上身效果很好，跟实体店一样！下次还会光顾','lin',0),
(null,1,now(),'挺好 挺好 挺好，无漏毛现象 挺好，无起球现象 挺好，很舒服。 衣服不错，活动也很给力，只是尺码偏小，买小了一号，穿着有点瘦，其他都还好，准备拿去专柜换一件呢，不知道给不给换啊。衣服不错，活动也很给力，只是尺码偏小，买小了一号，穿着有点瘦，其他都还好，准备拿去专柜','tom',0),
(null,1,now(),'给家人买的，说是还不错，自己本身也是经常买海澜之家的','lin',0),
(null,1,now(),'海澜之家老用户了，服务很好，满意','tom',0),

(null,2,now(),'比实体店便宜一百多，大小合适，质量很好，尤其是快递，顺丰的超快！下单后第二天就到了唉！','tom',0),
(null,7,now(),'大牌同款很时尚很休闲，也宽松，好评','jerry',0),
(null,8,now(),'衣衣很是不错，老公很喜欢。上身效果好的很。','marry',0),
(null,9,now(),'不错，满意的一次购物,无起球现象 挺好，很舒服。 衣服不错，活动也很给力','lin',0),
(null,10,now(),'衣服质量挺好的，很厚实，可以温暖的度过严冬了，非常好。 服务态度很端正，也很热情的回答各种问题。','jerry',0),
(null,12,now(),'海澜之家依旧不错，穿着舒适暖和，服务态度也还可以，最主要价格方面很实在，以后又需要就会购买，好评。','dingding',0),
(null,13,now(),'为啥买海澜之家，因为他质量好呗。淘宝上买东西还是要买品牌货。后面的好评不用看了复制的。 一如既往的好，多次购买了，贝到货了，货已经收到，满满的爱，宝贝很满意！','jerry',0),
(null,14,now(),'一直穿海澜之家的，还会在买!用着不错对产品相当满意挺好的很不错，是正品。','tom',0),
(null,15,now(),'一如既往的好，多次购买了，这次送了好多实用的小礼物，用完会再来的，祝店家生意兴隆。','tom',0),
(null,16,now(),'包装非常仔细、严实，物流公司服务态度很好，运送速度很快，很满意的一次购物。	','lin',0),

(null,17,now(),'为啥买海澜之家，因为他质量好呗。淘宝上买东西还是要买品牌货。后面的好评不用看了复制的。 ','dingding',0),
(null,18,now(),'果然没有林更新长得帅，穿着没他好看','lin',0),
(null,19,now(),'很惊喜呢，质量不错，以后就在海澜之家网店买了，以前都在实体店买。
','tom',0),
(null,20,now(),'挺厚保暖，就面料有点吸毛。准备抢手机的，可惜付款时被电脑卡了下，晚了一秒，看来没机会了。衣服不错，推荐。 发货特快','tom',0),
(null,21,now(),'衣服很不错，大气，面料也很好 要不是看在衣服还不错的份上，估计就直接给差评了，以后再追评吧','tom',0),
(null,22,now(),'本来准备抢手机来着，估计是没戏了…… 衣服挺好，老公穿起来很帅','dingding',0),
(null,23,now(),'颜色偏暗，衣服一般，还行吧','tom',0),
(null,24,now(),'很不错..质量棒棒的..和实体店的一样..信任海澜之家','dingding',0),
(null,25,now(),'是正品，去试穿过，专卖店原价一分不少，少了100多，比在专卖店买划算多了','tom',0),
(null,15,now(),'衣服不错，挺厚实的，款式好看','tom',0),
(null,1,now(),'最喜欢这件衣服，面料不错，比去年买的同价格的面料厚实一些，码数刚好，一直穿海澜之家的衣服，注意是款式非常符合个人气质','tom',0),
(null,2,now(),'宝贝不错，上身效果不错，显年轻，老公很满意。','hanmeimei',0),
(null,3,now(),'不错，比较单薄，适合广东这边的气温','tom',0),
(null,4,now(),'衣服很好换货也很方便，大小号不合适很容易就换了，客服态度很好，还打了电话咨询确认，很棒！','tom',0),
(null,5,now(),'衣服很好。是春秋季节穿的。','lin',0),
(null,6,now(),'合身，很喜欢，海澜之家男人的衣柜。','lin',0),
(null,7,now(),'帮爸爸买的几件衣服，最后一共减了300，挺实惠的，两条牛仔裤一条厚实一点儿，一条薄款，厚实的会有轻微掉色。薄款针织枣红色那件掉毛，过几次清水一样掉，材质比较容易变形，总的来说，性价比高质量也可以了','lin',0),
(null,8,now(),'海澜衣服价格比较亲民，质量也不错，每年都要买上几套，手机操作，不常写评价，一般都是系统自动好评的，这次看到了就写下','lin',0),
(null,9,now(),'送给老爸的双十一礼物，老爸很喜欢，天天穿这两件，这个天气买来后刚刚好！质量也很棒！相信海澜之家！','tom',0),
(null,10,now(),'第一回收到货背部有跳线跟客服沟通可以换货，第二回收到货了，仔细瞅了瞅没有瑕疵，客服服务态度很好，颜色样式跟图片一样','tom',0),
(null,11,now(),'给叔叔买的，不知道怎么样？说颜色挺深的，反正价格也挺便宜的了，比实体店还要便宜，很划得来','dingding',0),
(null,12,now(),'给老爸买的，很喜欢','dingding',0),
(null,13,now(),'一如既往的好，质量、做工、款式都非常喜欢，发货及时，隔天收货，有需要会再来','dingding',0),
(null,14,now(),'一如既往的好，老公一直都是在海澜之家购买的衣服，样式质量都达到老公的要求，最主要的是价格实惠完全可以接受，希望海澜之家可以越做越好','dingding',0),
(null,15,now(),'不错，不错，一直都是在海澜之家购买的衣服，样式质量都能达到我的要求，最主要的是价格实惠完全可以接受，希望海澜之家可以越做越好。
','tom',0),
(null,16,now(),'弹性效果：衣服质量好，大小刚好，173公分,70公斤。质量非常好，与卖家描述的完全一致，非常满意, 真的很喜欢，完全超出期望值，发货速度非常快，包装非常仔细、严实，物流公司服务态度很好，运送速度很快，很满意的一次购物 。','tom',0),
(null,17,now(),'质量不错，穿起来帅哒哒的。不赖不赖','tom',0),
(null,18,now(),'老公衣服现在基本都是海澜之家，款式新颖，价格实惠，质量又好，真的性价比很高的一家店。','jerry',0),
(null,19,now(),'衣服老公穿刚刚好，一惯来穿海兰之家的衣服。经常光顾实休店，偶尔网上买买。质量是杠杠的，拉链设计的也不错。都用胶带包住的，每个小细节都做的很到位','jerry',0),
(null,20,now(),'料子不错 挺舒服的 老公很喜欢 就是产品价格不优惠 只有店铺优惠券 其他品牌店铺都是买多打折的 海澜之家都没有这样 希望活动多多','jerry',0),
(null,21,now(),'质量很好，穿上很合身，实物和图片色一样，一直穿海澜之家的衣服，质量，物流，服务都非常满意，以后会继续回购支持的！','jerry',0),
(null,22,now(),'收到了很好，大品牌就是不一样，比想像中的还要好，衣服试穿了一下，大小合适，穿着很舒服，一次非常愉快的购物。','tom',0),
(null,23,now(),'一直信赖海澜之家的牌子，质量好价格又实惠，款式也好看，很满意。','tom',0),
(null,24,now(),'质量确实可以，比平时优惠了很多，品牌就是不一样，很满意','tom',0),
(null,25,now(),'造型和质量都可以，就是码数偏大了一点','david',0),
(null,26,now(),'衣服很好看，经济划算，比较百搭！质量很好，做工很ok。我家哥哥一直都穿海澜之家的哈','david',0),
(null,27,now(),'衣服收到，尺码正，面料做工精致，价格比实体店便宜，客服态度很好，值得购买！！！！！！！！！！！！！！！！！！！！！！！！！！！！！','david',0),
(null,28,now(),'全身一套蓝色海澜之家，sao气十足，人帅穿什么都好看。哈哈哈','david',0),
(null,29,now(),'衣服质量看起来不错，手感很好。','tom',0),
(null,30,now(),'衣服不错做工精细性价比很高','tom',0),
(null,31,now(),'172，偏瘦体质，要170的大小正好合身','lilei',0),
(null,32,now(),'没说的，冲着海澜之家的服务，全满分','lilei',0),
(null,33,now(),'不会太厚，挺满意的，福建比较适合穿，但再冷一点就得厚一点了','lilei',0),
(null,34,now(),'海澜之家用了好几年了，真的在里面买啥都没让人失望过！','lilei',0),
(null,35,now(),'一直买他家的东东，一如既住地好，下次还来','tom',0),
(null,36,now(),'质量款式都不错，还有老公可以穿的尺码，满意。','sunlanlan',0),
(null,37,now(),'还可以，老公穿上很帅气','sunlanlan',0),
(null,38,now(),'给爸爸买的，174，165斤，穿着正合适，摸着也还不错，物流我怕来不及，让客服帮我催一催，结果立马就发货了，比心','jock',0),
(null,39,now(),'合身，无色差，质量挺好。','hanmeimei',0),
(null,40,now(),'衣服质量很好！老公很喜欢，衣服都是他家的！','rose',0),
(null,1,now(),'外套很满意，版型很舒服，好评！','tom',0),
(null,2,now(),'质量不错，无色差，手感也还好。','tom',0),
(null,3,now(),'衣服不错，家人穿很合适。客服服务态度好。','tom',0),
(null,4,now(),'还是可以的，这个价格还不错','tom',0),
(null,5,now(),'质量不错，码数也很准','lin',0),
(null,6,now(),'性价比非常高','lin',0),
(null,7,now(),'好看，合身','lin',0),
(null,8,now(),'挺有型的，老少皆宜','lin',0),
(null,9,now(),'不错，很好看，难得爸妈都满意','tom',0),
(null,10,now(),'喜欢这衣服，大气','tom',0),
(null,11,now(),'不错，衣服穿上很舒服','ouchuyu',0),
(null,12,now(),'满意 178高 195重 买的190号的正合适','dingding',0),
(null,13,now(),'衣服质量很好，有一件灰色的买小了，和客服联系很快给了回复，直接退货了，很方便，其他两件大小合适，一分钱一分货，穿上很好看，显年轻。','dingding',0),
(null,14,now(),'虽然没有照片，但是衣服真的非常满意，面料很舒服，老公非常喜欢，我也喜欢，穿上很帅气，性价比很高，超级满意的购物，没有色差，没有缩水，没有掉色','dingding',0),
(null,15,now(),'衣服很不错，上身效果很好，就是压了个印，不过不影响，很好。最想说的是快递，发的顺丰，快递服务绝对的棒，一级棒，六楼给送上来了，真是太好了，一定要表扬下我快递朋友，感谢','tom',0),
(null,16,now(),'质量非常不错，比实体店便宜一点，下次还会再买的','tom',0),
(null,17,now(),'回购的，款式质量都很棒，好评','tom',0),
(null,18,now(),'超级好看，质量好，一直以来钟爱海澜之家','jerry',0),
(null,19,now(),'刚合身，质量不错','jerry',0),
(null,20,now(),'厚度适中，穿着还不错。','jerry',0),
(null,21,now(),'买大了，商家很快就帮我换了，真的很爽快，衣服质量也很好，实体店的一样哟！穿着很舒服！推荐大家购买哟！有需要还会再来的哟！','jerry',0),
(null,22,now(),'穿上这件神衣，感觉自己年轻了10岁，全身散发着耀眼的光芒，路人的眼睛都快被光芒照瞎了。','tom',0),
(null,23,now(),'很好 目前洗了两次还没发现起球 送给爸爸的 他很开心 会回购','ouchuyu',0),
(null,24,now(),'面料舒适度：一如既往。','tom',0),
(null,25,now(),'衣服收到了,挺好看的。料子感觉还行吧,穿一段时间在看。衣服收到了,挺好看的。衣服尺码合身,料子感觉还行吧。','david',0),
(null,26,now(),'很舒服的一件衣服,南方目前的天气正好穿这个。海澜之家,值得信赖。给爸爸买的,质量很好。','david',0),
(null,27,now(),'衣服的实物和照片的色差很小，几乎没有任何色差，质量也非常赞，厚度正好，穿着正合适，我是海澜之家的老客户了，一直相信品质！','david',0),
(null,28,now(),'物流炒鸡快了 质量应该不错吧买它当然是觉得它好看啦(｡･ω･｡)','david',0),
(null,29,now(),'毛衣摸着很舒服，料子也不错，是薄款的','tom',0),
(null,30,now(),'老顾客了，海澜之家的衣服质量都很好，值得信赖！','tom',0),
(null,31,now(),'180/140,大小很合身,现在穿很暖和，非常满意。','lilei',0),
(null,32,now(),'经常买，这件衣服还行！','lilei',0),
(null,33,now(),'衣服面料摸着很舒适，上身效果也很棒，而且海澜之家大牌也是值得购买的，要比平时便宜很多','lilei',0),
(null,34,now(),'海澜之家的老顾客，一如既往的习惯，一如既往地无限次回购，质量没话说，哥哥很喜欢，料子软软的，五分好评，','lilei',0),
(null,35,now(),'质量不错，值得购买！','tom',0),
(null,36,now(),'宝贝收到了，由于忙忘记早点评价了，衣服总体效果不错，老公穿上帅帅的，针织衫毛衣柔软舒适，毛呢外套摸起来手感很柔软','sunlanlan',0),
(null,37,now(),'海澜之家，老公一直穿他家的衣服，质量不错，穿上很帅气。','sunlanlan',0),
(null,38,now(),'衣服穿着挺合身的，款式也不错，布料挺软的，直接贴身也舒服，推荐购买。','tom',0),
(null,39,now(),'衣服收到了，一直没有穿，给老公买的，这两天天气非常非常非常非常非常非常非常的冷，老公里面穿了一件保暖衣，外面穿的这个，挺好看的，唯一的缺点就是有点薄，面料还可以，有点薄有点薄有点薄，重要的事情说三遍','ouchuyu',0),
(null,40,now(),'毛衣是全棉的穿着很舒服，跟买的羽绒服很搭洗完也不会起球，老公的衣服都是海澜之家买的','marry',0),

(null,41,now(),'不错，衣服穿上很舒服','ouchuyu',0),
(null,42,now(),'满意 质量很好的皮带 戴着正合适','dingding',0),
(null,43,now(),'皮带和衣服质量很好，有一件灰色的买小了，和客服联系很快给了回复，直接退货了，很方便，其他两件大小合适，一分钱一分货，穿上很好看，显年轻。','dingding',0),
(null,44,now(),'虽然没有照片，但是皮带真的非常满意，面料很舒服，老公非常喜欢，我也喜欢，戴上很帅气，性价比很高，超级满意的购物，没有色差，没有缩水，没有掉色','dingding',0),
(null,45,now(),'皮带很不错，上身效果很好，就是压了个印，不过不影响，很好。最想说的是快递，发的顺丰，快递服务绝对的棒，一级棒，六楼给送上来了，真是太好了，一定要表扬下我快递朋友，感谢','tom',0),
(null,46,now(),'质量非常不错，比实体店便宜一点，下次还会再买的','tom',0),
(null,47,now(),'回购的，款式质量都很棒，好评','tom',0),
(null,48,now(),'超级好看，质量好，一直以来钟爱海澜之家','jerry',0),
(null,49,now(),'刚合身，质量不错','jerry',0),
(null,50,now(),'厚度适中，穿着还不错。','jerry',0),
(null,51,now(),'买大了，商家很快就帮我换了，真的很爽快，衣服质量也很好，实体店的一样哟！穿着很舒服！推荐大家购买哟！有需要还会再来的哟！','jerry',0),
(null,52,now(),'老公穿上这件神衣，感觉自己年轻了10岁，全身散发着耀眼的光芒，路人的眼睛都快被光芒照瞎了。','chuyu',0),
(null,53,now(),'很好 目前洗了两次还没发现起球 送给爸爸的 他很开心 会回购','ouchuyu',0),
(null,54,now(),'面料舒适度：一如既往。','tom',0),
(null,55,now(),'衣服收到了,挺好看的。料子感觉还行吧,穿一段时间在看。衣服收到了,挺好看的。衣服尺码合身,料子感觉还行吧。','david',0),
(null,56,now(),'很舒服的一件衣服,南方目前的天气正好穿这个。海澜之家,值得信赖。给爸爸买的,质量很好。','david',0),
(null,57,now(),'衣服的实物和照片的色差很小，几乎没有任何色差，质量也非常赞，厚度正好，穿着正合适，我是海澜之家的老客户了，一直相信品质！','david',0),
(null,58,now(),'物流炒鸡快了 质量应该不错吧买它当然是觉得它好看啦(｡･ω･｡)','david',0),
(null,52,now(),'质量不错，无色差，手感也还好。','tom',0),
(null,53,now(),'衣服不错，家人穿很合适。客服服务态度好。','tom',0),
(null,54,now(),'还是可以的，这个价格还不错','tom',0),
(null,55,now(),'质量不错，码数也很准','lin',0),
(null,56,now(),'性价比非常高','lin',0),
(null,57,now(),'好看，合身','lin',0),
(null,58,now(),'挺有型的，老少皆宜','lin',0),
(null,59,now(),'不错，很好看，难得爸妈都满意','tom',0),
(null,10,now(),'喜欢这衣服，大气','tom',0),
(null,11,now(),'不错，衣服穿上很舒服','ouchuyu',0),
(null,59,now(),'毛衣摸着很舒服，料子也不错，是薄款的','tom',0);



#创建购物车表
CREATE TABLE heilan_cart(
  id INT PRIMARY KEY AUTO_INCREMENT,
	user_id INT,	
	cate_id INT,	
	count VARCHAR(50),	
	isdel	INT	
);
#插入数据
INSERT INTO heilan_cart VALUES
(null,3,15,1,0),
(null,1,6,3,0),
(null,2,5,1,0);