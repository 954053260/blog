var express = require('express');
var User = require('../models/user');
var router = express.Router();

router.post('/user/login', function(req, res, next) {
  res.send('respond with a resource');
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
