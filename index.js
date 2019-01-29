/**
 * 小肥牛扫码点餐API子系统
 */
 console.log(new Date().toLocaleString());
 const PORT=8090;
 const express=require('express');
 const cors=require('cors');
 const categoryRouter=require('./routes/admin/category');
 const adminRouter=require('./routes/admin/admin')
 const bodyParser=require('body-parser');
 /**
  * 启动子服务器
  */
 var app=express();
 app.listen(PORT, ()=>{
     console.log('server Listening : '+PORT+'......');
 })


 //使用中间件
 app.use(cors());
 app.use(bodyParser.json())//把json格式的请求主体数据解析出来反骨req.body属性


//挂载路由器
app.use('/admin/category',categoryRouter);
app.use('/admin',adminRouter);
// 