/**
 * Created by hyt on 2017/1/10.
 */
var express = require('express');
var Article = require('../models/article');
var router = express.Router();

router.get('/article/list', function(req, res, next) {
    var param = {start: parseInt(req.query.start), len: parseInt(req.query.len)};
    Article.find(param,
        function (err,data) {
            if (err) {
                res.send({
                    status: 1,
                    msg: err
                });
                return console.error('/article/list', err);
            }
            if(!(data instanceof Array)){
                data = [data];
            }
            res.send({
                status: 0,
                data: {list:data}
            });
        }
    )
});

module.exports = router;