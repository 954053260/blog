/**
 * Created by hyt on 2017/1/10.
 */
var express = require('express');
var Article = require('../models/article');
var router = express.Router();

router.get('/article/list', function(req, res) {
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

router.post('/article/submit',function (req, res) {
    var article = new Article(JSON.parse(req.body.data));
    article.date = new Date().getTime();
    article.id = String(article.date);
    article.save(function (err,data) {
        if (err) {
            res.send({
                status: 1,
                msg: err
            });
            return console.error('/article/submit', err);
        }
        res.send({
            status: 0,
            msg: '添加成功',
            data: data
        });
    });
});
module.exports = router;