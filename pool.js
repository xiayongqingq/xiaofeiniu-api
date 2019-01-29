/**
 * MYSQL数据库连接池
 */
const mysql =require('mysql');
var pool=mysql.createPool({
    host            : '127.0.0.1',//数据库端口
    port            : 3306,
    user            : 'root',
    password        : '',
    database        : 'xfn', //连接池中连接数量
    connectionLimit : 10        
});
module.exports=pool;