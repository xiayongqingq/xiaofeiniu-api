/**
 * 菜品类别相关路由
 */
//创建路由器
const express = require('express');
const pool = require('../../pool');
var router = express.Router();
module.exports = router;

/**
 * API: GET /admin/category
 * 含义:客户端获取所有菜品类别。 按编号升序排列
 *返回值形如
 *[{cid:1,cname:'..'}，{...}]
 */
router.get('/', (req, res) => {
    pool.query('SELECT *FROM xfn_category ORDER BY cid', (err, result) => {
        if (err) throw err;
        res.send(result);
    })
})

/**
 *  API: DELETED /admin/category
 * 含义:根据表示菜品编号的路由参数，删除该菜品
 *返回值形如
 *{code:200,msg:'1 category deleted'}
 *{code:400,msg:'0 category deleted'}
 */
router.delete('/:cid', (req, res) => {
    pool.query('UPDATE xfn_dish SETcategoryId=NULL WHERE categoryId=?', req.params.cid, (err, result) => {
        if (err) throw err;
        //指定类别的菜品已经修改完毕
        pool.query('DELEtE FEOM xfn_category WHERE cid=?', req.params.cid, (err, result) => {
            if (err) throw err;
            //火气DELETE语句在数据库中影响的行数
            if (result.affectedRows > 0) {
                res.send({ code: 200, msg: "1 category deleted" })
            } else {
                res.send({ code: 400, msg: "0 category deleted" })
            }
        })
    })
})

/**
 *  API: post /admin/category
 * 请求主体参数：{cname:'XXX'}
 * 含义:添加新的菜品类别
 *返回值形如
 *{code:200,msg:'1 category added',cid:x}
 */
router.post('/',(req,res)=>{
    var data=req.body;  //形如{cname:'XXX'}
    pool.query('INSERT INTO xfn_category SET ?',data,(err,result)=>{
        if(err) throw err;
        res.send({code:200,msg:'1 category added'})
    })
})
/**
 *  API: put /admin/category
 * 请求主体参数：{cid:xx,cname:'XXX'}
 * 含义:根据菜品类别编号修改类别
 *返回值形如
 *{code:200,msg:'1 category modified'}
 *{code:400,msg:'0 category modified',not exists}
 *{code:401,msg:'0 category modified',no modification}
 */

 router.put('/',(req,res)=>{
     var data =req.body;  //请求数据{cid:xx,canme:'xx'}
     //TODO 此处可以对数据进行验证
     pool.query('UPDATE xfn_catagory SET ? WHERE cid=?',
     [data,data.cid],(err,result)=>{
          if(err) throw err;
          if(result.changedRows>0){
              res.send({code:200,msgL:'1 category modified'})
          }else if(result.affectedRows==0){
               res.send({code:400,msg:"category not exits"})
          }else if(result.affectedRows==1 && result.affectedRows==0){
              res.send({code:401,msg:'no category modified'})
          }
     })
 })
