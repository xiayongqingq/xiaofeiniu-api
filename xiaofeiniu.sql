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
)

#桌台信息表：xfn_table
CREATE TABLE xfn_table(
  tid INT,           #桌台编号
	tname VARCHAR(64), #桌台昵称
	type VARCHAR(64),  #桌台类型 如3-4人桌
	status INT         #当前状态
)

#桌台预订信息表：xfn_reservation
CREATE TABLE xfn_reservation{
   rid INT PRIMARY KEY AUTO_INCREMENT,
   contactName VARCHAR(64), #联系人姓名
   phone  VARCHAR(16),      #联系电话
   contactTime BIGINT,      #联系时间
   dinnerTime BIGINT        #预约的用餐时间
}

#菜品分类表：xfn_category
CREATE TABLE xfn_category{
 cid INT PRIMARY KEY AUTO_INCREMENT,
 cname VARCHAR(32)
}

#菜品信息表：xfn_dish
CREATE TABLE xfn_dish{
  did INT PRIMARY KEY AUTO_INCREMENT,
  dname VACHAR(32),
  imgUrl VARCHAR(128),
  price DECIMAL(6,2),
  details VARCHAR(128),
  categoryId INT FOREIGN KRY
}

#订单表：xfn_order
CREATE TABLE xfn_order{
  oid INT PRIMARY KEY AUTO_INCREMENT,
  startTime  BIGINT,
  endTime BIGINT,
  customerCount INT,
  tableId INT FOREIGN KRY
}

#订单表  xfn_order_detail
CREATE TABLE xfn_order_detail{
  did INT PRIMARY KEY AUTO_INCREMENT,
  dishId INT FOREIGN KRY,
  dishCount INT,
  customerName VARCHAR(64),
  orderId  INT FOREIGN KRY
}