/**
 * 小肥牛扫码点餐API子系统
 */
 const PORT=8090;
 const express=require('express');

 /**
  * 启动子服务器
  */
 var app=express();
 app.listen(PORT, ()=>{
     console.log('server Listening'+PORT+'......');
 })