#小肥牛 xfn
SET NAMES UTF8;
DROP DATABASE IF EXISTS xfn;
CREATE DATABASE xfn CHARSET=UTF8;
USE xfn;

#管理员信息表：xfn_admin
CREATE TABLE xfn_admin(
  aid INT PRIMARY KEY AUTO_INCREMENT, #管理员编号
  aname VARCHAR(32) UNIQUE,           #管理员编号
  apwd  VARCHAR(64)                   #管理员密码
);
INSERT INTO xfn_admin VALUES
(NULL,'admin',PASSWORD('123456')),
(NULL,'boss',PASSWORD('666666'));


#项目全局设置：xfn_settings
CREATE TABLE xfn_settings(
  sid INT PRIMARY KEY AUTO_INCREMENT,
  appname VARCHAR(32),    #应用/店家名称
  apiURL  VARCHAR(64),    #数据api子系统地址
  adminUrl VARCHAR(64),   #管理后台子系统地址
  appUrl   VARCHAR(64),   #顾客app子系统地址
  icp   VARCHAR(64),      #系统备案号
  copyright VARCHAR(128)  #系统版权声明
);
INSERT INTO xfn_settings VALUES
(NULL,'小肥牛','http://127.0.0.1:8090','http://127.0.0.1:8091','http://127.0.0.1:8092','京ICP备12003709-3','Copyright © 2002-2019 北京达内金桥科技有限公司版权所有');

#桌台信息表：xfn_table
CREATE TABLE xfn_table(
  tid INT PRIMARY KEY AUTO_INCREMENT,           #桌台编号
	tname VARCHAR(64), #桌台昵称
	type VARCHAR(64)  #桌台类型 如3-4人桌
	#status INT         #当前状态
);
INSERT INTO xfn_table VALUES
(NULL,'福满堂','6-8人桌'),
(NULL,'金镶玉','4人桌'),
(NULL,'寿启天','10人桌'),
(NULL,'全家福','2人桌');

#桌台预订信息表：xfn_reservation
CREATE TABLE xfn_reservation(
   rid INT PRIMARY KEY AUTO_INCREMENT,
   contactName VARCHAR(64), #联系人姓名
   phone  VARCHAR(16),      #联系电话
   contactTime BIGINT,      #联系时间
   dinnerTime BIGINT        #预约的用餐时间
);
INSERT INTO xfn_reservation VALUES
(NULL,'丁丁','13200000000',1548404830420,1548410400000),
(NULL,'豆豆','13200000000',1548404830420,1548410400000),
(NULL,'当当','13200000000',1548404830420,1548410400000),

#菜品分类表：xfn_category
CREATE TABLE xfn_category(
 cid INT PRIMARY KEY AUTO_INCREMENT,
 cname VARCHAR(32)
);
INSERT INTO xfn_category VALUES(NULL,'菌菇类'),
INSERT INTO xfn_category VALUES(NULL,'丸滑类'),
INSERT INTO xfn_category VALUES(NULL,'肉类'),
INSERT INTO xfn_category VALUES(NULL,'河鲜类'),
INSERT INTO xfn_category VALUES(NULL,'蔬菜类'),

#菜品信息表：xfn_dish
CREATE TABLE xfn_dish(
  did INT PRIMARY KEY AUTO_INCREMENT,
  dname VARCHAR(32),
  imgUrl VARCHAR(128),
  price DECIMAL(6,2),
  details VARCHAR(128),
  categoryId INT,
   FOREIGN KEY (categoryId) REFERENCES xfn_category(cid)
);
INSERT INTO xfn_dish VALUES
(1000,'招牌虾滑','CF7I9470.jpg','12','精选湛江、北海区域出产的南美品种白虾虾仁，配以盐和淀粉等调料制作而成。虾肉含量越高，虾滑口感越纯正。相比纯虾肉，虾滑食用方便、入口爽滑鲜甜Q弹，海底捞独有的定制生产工艺，含肉量虾肉含量93%，出品装盘前手工摔打10次，是火锅中的经典食材。','3'),
(NULL,'草鱼','CF7I9471.jpg','10','经过挑选、清洗、装盘而成。锅开后再煮2分钟左右即可食用','4');
(NULL,'香菇','CE7I9428.jpg','10','选鲜活草鱼，切出鱼片冷鲜保存。锅开后再煮1分钟左右即可食用','1');
(NULL,'包菜','CF7I9430.jpg','10','经过挑选、清洗、装盘而成。口感清香，锅开后再煮1分钟左右即可食用','5');
(NULL,'墨鱼丸','1-CE7I8920.jpg','10','墨鱼经破碎、搅拌等工艺，再配以秘制调料混合而成。锅开后再浮起来再煮3分钟即可食用。配上丸滑蘸碟，风味更突出。','2');


#订单表：xfn_order
CREATE TABLE xfn_order(
  oid INT PRIMARY KEY AUTO_INCREMENT,
  startTime  BIGINT,
  endTime BIGINT,
  customerCount INT,
  tableId INT,
  FOREIGN KEY(tableId) REFERENCES xfn_table(tid)
);
INSERT INTO xfn_order VALUES
(NULL,'1548404830420','1548410400000',3,1);

#订单表  xfn_order_detail
CREATE TABLE xfn_order_detail(
  did INT PRIMARY KEY AUTO_INCREMENT,
  dishId INT,
  dishCount INT,            #菜品数量
  customerName VARCHAR(64), #点餐用户称呼
  orderId  INT,  #订单编号，指明所属订单
  FOREIGN KEY(dishId) REFERENCES xfn_dish(did),
  FOREIGN KEY(orderId) REFERENCES xfn_order(oid)
);
INSERT INTO xfn_order_detail VALUES
(null,2,1,'丁丁',1);