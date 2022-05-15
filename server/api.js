

//api路由
//userApi.js —— 测试用 API 示例

var models = require('./db');
var express = require('express');
var router = express.Router();
var fs = require('fs')
var path = require('path')
var multer = require('multer');//安装上传图片模块
var mysql = require('mysql');
// 连接数据库
var conn = mysql.createConnection(models.mysql);
conn.connect();

router.post('/login', (req, res) => {
    var params = req.body;
    conn.query('select * from users where loginid=?', [params.username], function (err, result) {
        if (err) {
            console.log(err);
        }
        let data = JSON.stringify(result)
        res.end(data)
    })
});
router.post('/changpass', (req, res) => {
    var params = req.body;
    conn.query('update users set password=? where loginid=?', [params.password,params.loginid], function (err, result) {
        if (err) {
            console.log(err);
        }
        let data = JSON.stringify(result)
        res.end(data)
    })
});
router.post('/recharge', (req, res) => {
    var params = req.body;
    conn.query('update dorinfo set electricity=? where dor=?', [params.electricity,params.dor], function (err, result) {
        if (err) {
            console.log(err);
        }
        let data = JSON.stringify(result)
        res.end(data)
    })
});
router.post('/health', (req, res) => {
    var params = req.body;
    console.log(req.body)
    console.log(req.files) //上传的路径../public/images/fiximg/
    var des_file = path.join(__dirname, "../src/assets/images/health/" + req.files[0].originalname);
    console.log(des_file);
    fs.readFile(req.files[0].path, function (err, data) {
      fs.writeFile(des_file, data, function (err) {
        if (err) {
          console.log(err);
        } else {
    conn.query('update health set QRcode=?,health=?,location=?,control=?,date=?,pic=? where sid=?', [params.QRcode,params.health,
        params.location,params.control,params.date,req.files[0].originalname,params.sid], function (err, result) {
        if (err) {
            console.log(err);
        }
        let data = JSON.stringify(result)
        res.end(data)
    })
}
});
    })
});
router.post('/publish', (req, res) => {
    var params = req.body;
    conn.query('insert into public(title,publisher,info,pdate,content) values(?,?,?,?,?)', [params.form.title,params.form.publisher,
        params.form.info,params.form.date,params.form.show], function (err, result) {
        if (err) {
            console.log(err);
        }
        let data = JSON.stringify(result)
        res.end(data)
    })
});

router.post('/dfixinfo', (req, res) => {
    var params = req.body;
    console.log(params);
    conn.query('select * from fixinfo where dor=?',[params.dor], function (err, result) {
        if (err) {
            console.log(err);
        }
        let data = JSON.stringify(result)
        res.end(data)
    })
});
router.post('/fixinfo',(req,res)=>{
    conn.query('select * from fixinfo ORDER BY dor ASC',function(err,row){
        if(err){
             console.log(err)            
        }
        console.log(typeof row)
        let data = JSON.stringify(row)
        res.end(data)
    })
});
router.post('/updatefix',(req,res)=>{
    var params = req.body;
    conn.query('update fixinfo set fix=? where dor=?',[params.fix,params.dor],function(err,row){
        if(err){
             console.log(err)            
        }
        console.log(typeof row)
        let data = JSON.stringify(row)
        res.end(data)
    })
});
router.post('/searchfix', (req, res) => {
    var params = req.body;
    console.log(params);
    conn.query('select * from fixinfo where dor like "%'+params.dor+'%"', function (err, result) {
        if (err) {
            console.log(err);
        }
        let data = JSON.stringify(result)
        res.end(data)
    })
});
router.post('/dorinfo', (req, res) => {
    var params = req.body;
    console.log(params);
    conn.query('select * from dorinfo where dor=?',[params.dor], function (err, result) {
        if (err) {
            console.log(err);
        }
        let data = JSON.stringify(result)
        res.end(data)
    })
});
router.post('/searchdor', (req, res) => {
    var params = req.body;
    console.log(params);
    conn.query('select * from dorinfo where dor like "%'+params.dor+'%"', function (err, result) {
        if (err) {
            console.log(err);
        }
        let data = JSON.stringify(result)
        res.end(data)
    })
});
router.post('/adorinfo', (req, res) => {
    conn.query('select * from dorinfo ORDER BY dor ASC', function (err, result) {
        if (err) {
            console.log(err);
        }
        let data = JSON.stringify(result)
        res.end(data)
    })
});
router.post('/insertdor', (req, res) => {
    var params = req.body;
    conn.query('insert into dorinfo(dor,num,quarantine,electricity,gender,admin1,admin2) values(?,?,?,?,?,?,?)',[params.form.dor,params.form.num,
        params.form.quarantine,params.form.electricity,params.form.gender,params.form.admin1,params.form.admin2], function (err, result) {
        if (err) {
            console.log(err);
        }
        let data = JSON.stringify(result)
        res.end(data)
    })
});
router.post('/deldor', (req, res) => {
    var params = req.body;
    conn.query('delete from dorinfo where dor=?',[params.dor], function (err, result) {
        if (err) {
            console.log(err);
        }
        let data = JSON.stringify(result)
        res.end(data)
    })
});
router.post('/upstudor', (req, res) => {
    var params = req.body;
    conn.query('update student set dor=? where sid=?',[params.dor,params.sid], function (err, result) {
        if (err) {
            console.log(err);
        }
        let data = JSON.stringify(result)
        res.end(data)
    })
});
router.post('/updor', (req, res) => {
    var params = req.body;
    conn.query('update dorinfo set gender=?,num=?,score=? where dor=?',[params.row.gender,params.row.num,params.row.score,
        params.row.dor], function (err, result) {
        if (err) {
            console.log(err);
        }
        let data = JSON.stringify(result)
        res.end(data)
    })
});
router.post('/public', (req, res) => {
    conn.query('select * from public', function (err, result) {
        if (err) {
            console.log(err);
        }
        let data = JSON.stringify(result)
        res.end(data)
    })
});
router.post('/stuinfo', (req, res) => {
    var params = req.body;
    console.log(params);
    conn.query('select * from student where sid=?',[params.sid], function (err, result) {
        if (err) {
            console.log(err);
        }
        let data = JSON.stringify(result)
        res.end(data)
    })
});
router.post('/sinfo', (req, res) => {
    var params = req.body;
    console.log(params);
    conn.query('select * from student where dor=?',[params.dor], function (err, result) {
        if (err) {
            console.log(err);
        }
        let data = JSON.stringify(result)
        res.end(data)
    })
});
router.post('/admininfo', (req, res) => {
    var params = req.body;
    console.log(params);
    conn.query('select * from admin where aid=?',[params.aid], function (err, result) {
        if (err) {
            console.log(err);
        }
        let data = JSON.stringify(result)
        res.end(data)
    })
});
router.post('/admin1', (req, res) => {
    var params = req.body;
    console.log(params);
    conn.query('select * from admin where `name` in(SELECT admin1 from dorinfo where dor=?)',[params.dor], function (err, result) {
        if (err) {
            console.log(err);
        }
        let data = JSON.stringify(result)
        res.end(data)
    })
});
router.post('/admin2', (req, res) => {
    var params = req.body;
    console.log(params);
    conn.query('select * from admin where `name` in(SELECT admin2 from dorinfo where dor=?)',[params.dor], function (err, result) {
        if (err) {
            console.log(err);
        }
        let data = JSON.stringify(result)
        res.end(data)
    })
});
router.post('/searchadsc', (req, res) => {
    var params = req.body;
    console.log(params);
    conn.query('select * from admin where name like "%'+params.name+'%"', function (err, result) {
        if (err) {
            console.log(err);
        }
        let data = JSON.stringify(result)
        res.end(data)
    })
});
router.post('/phone', (req, res) => {
    var params = req.body;
    console.log(params);
    conn.query('update '+params.table+' set phone=? where name=?',[params.phone,params.name], function (err, result) {
        if (err) {
            console.log(err);
        }
        let data = JSON.stringify(result)
        res.end(data)
    })
});
//头像上传
router.post('/avatar_upload',(req, res)=> {
    var params = req.body;
    console.log(req.body)
    console.log(req.files) //上传的路径../public/images/avatar/
    var des_file = path.join(__dirname, "../src/assets/images/avatar/" + req.files[0].originalname);
    console.log(des_file);
    fs.readFile(req.files[0].path, function (err, data) {
      fs.writeFile(des_file, data, function (err) {
        if (err) {
          console.log(err);
        } else {
            conn.query('update '+params.table+' set img="' + req.files[0].originalname +'" , phone=? where name=?',[params.phone,
                params.name], function (err, result) {
                if (err) {
                    console.log(err);
                }
                let data = JSON.stringify(result)
                res.end(data)
            })
        }
      });
    });
  });
  //报修上传
router.post('/insert_fixinfo',(req, res)=> {
    var params = req.body;
    console.log(req.body)
    console.log(req.files) //上传的路径../public/images/fiximg/
    var des_file = path.join(__dirname, "../src/assets/images/fiximg/" + req.files[0].originalname);
    console.log(des_file);
    fs.readFile(req.files[0].path, function (err, data) {
      fs.writeFile(des_file, data, function (err) {
        if (err) {
          console.log(err);
        } else {
            conn.query('insert into fixinfo(fdate,dor,stuff,state,pic,marks,fix) values(?,?,?,?,?,?,"0")',[params.fdate,params.dor,
                params.stuff,params.state,req.files[0].originalname,params.marks], function (err, result) {
                if (err) {
                    console.log(err);
                }
                let data = JSON.stringify(result)
                res.end(data)
            })
        }
      });
    });
  });
module.exports = router;

