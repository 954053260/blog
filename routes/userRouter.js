var express = require('express');
var User = require('../models/user');
var router = express.Router();

router.post('/user/login', function(req, res, next) {
  User.find(req.body.name,function (err,data) {
    if (err) {
      res.send({status: 1,msg: '登录失败'});
      return console.error('/user/login', err);
    }
    if(data){
      if(data.password == req.body.pwd){
        res.send({status: 0,msg: '登录成功',data: data});
      }else{
        res.send({status: 2,msg: '密码错误'});
      }
    }else{
      res.send({status: 3,msg: '用户名不存在'});
    }
  });
});

router.post('/user/reg', function(req, res, next) {
  var user = new User(req.body);
  user.save(function (err,data) {
    if (err) {
      res.send({
        status: 1,
        msg: err
      });
      return console.error('/user/reg', err);
    }
    res.send({
      status: 0,
      msg: '注册成功',
      data: data
    });
  });
});

router.post('/user/resetPwd', function (req, res, next) {
  var user = new User(req.body);
  user.update(function (err,data) {
    if (err) {
      res.send({
        status: 1,
        msg: err
      });
      return console.error('/user/resetPwd', err);
    }
    res.send({
      status: 0,
      msg: '重置密码成功',
      data: data
    });
  });
});

module.exports = router;
