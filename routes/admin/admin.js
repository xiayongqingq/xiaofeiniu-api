/**
 * 管理员相关路由
 */
const express=require("express");
const pool=require("../../pool");
var router=express.Router();


module.exports=router;




/**
 * API:GET/admin/login/:aname/:apwd
 * 请求数据:{aname:'xxx',apwd:'xxx'}
 * 完成用户登录验证(提示：有的项目此处会选择post请求)
 *  返回数据{code:200,msg:'login succ'}
 * {code:400,msg:'aname or apwd err'}
 */
router.get('/login/:aname/:apwd',(req,res)=>{
    var aname=req.params.aname;
    var apwd=req.params.apwd;
    pool.query('SELECT aid from xfn_admin where aname=? and apwd=PASSWORD(?)',[aname,apwd],(err,result)=>{
        if(err)throw err;
        if(result.length>0){//查询到一行数据，登录成功
            res.send({code:200,msg:'login succ'})
        }else{//没有查询到数据
            res.send({code:400,msg:'aname or apwd err'})
        }
    })
})






 /**
 * API:PATCH/admin/login
 * 请求数据:{aname:'xxx'.oldpwd:'xxx',newPwd:'xxx'}
 * 根据管理员名和密码修改管理员密码
 *  返回数据{code:200,msg:'modified succ'}
 * {code:400,msg:'aname or apwd err'}
 * {code:401,msg:'aname or apwd modified'}
 */
router.patch("/",(req,res)=>{
    var data=req.body;
    console.log(data)

})