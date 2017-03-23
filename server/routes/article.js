/**
 * Created by tz on 2017/3/10.
 * status
 * 0 返回成功
 * 1 未查询到数据
 * 5 参数错误
 * 6 查询错误
 */
var express = require('express');
var db = require('../mysqlDB');
var Article = require('../model/Article');
var Comment = require('../model/Comment');
var router = express.Router();
/**
 * 获取文章列表——GET
 * @param start 起始索引 默认0
 * @param len 返回列表数据长度 默认返回全部
 */
router.get('/getList', function(req, res) {
    var start = parseInt(req.query.start) || 0,
        len = parseInt(req.query.len) + 1,
        sql;
    if(isNaN(start) || isNaN(len)){
        res.send({status: 5,msg: '参数错误'});
        return;
    }
    sql = 'select article.id,article.`desc`,article.title,article.date,article.author,group_concat(tag.id,":",tag.name) as tags ' +
        'from article_to_tag att left join tag on att.t_id = tag.id left join article on article.id = att.a_id group by article.id order by article.date DESC ' +
        'limit ' + start + ',' + len;
    db.query(sql,function (err, row) {
        if (err) {
            res.send({status: 6,msg: '查询错误'});
            return;
        }
        var isHasData = true;
        if (row.length == len) {
            row.pop();
        } else {
            isHasData = false;
        }
        row.map(function (item) {
            item.tags = item.tags.split(',').map(function (item) {
                var arr = item.split(':');
                if (arr.length != 2) return null;
                return {id: arr[0],name: arr[1]};
            });
            return item;
        });
        res.send({
            status: 0,
            data: {list: row,isHasData: isHasData}
        });
    });
});
/**
 * 获取文章列表——GET
 * @param id 文章id
 */
router.get('/detail', function(req, res) {
    var id = req.query.id,
        sql;
    if(!id){
        res.send({status: 5,msg: '参数错误'});
        return;
    }
    sql = 'SELECT * FROM article WHERE article.id = ' + db.pool.escape(id);
    db.query(sql,function (err, row) {
        if (err) {
            res.send({status: 6,msg: '查询错误'});
            return;
        }
        if (row[0]) {
            res.send({
                status: 0,
                data: {detail: row[0]}
            });
        } else {
            res.send({
                status: 1,
                msg: '未找到文章'
            });
        }
    });
});
/**
 * 获取文章评论——GET articleId or refId
 * @param id 文章id or 子评论id
 * @param type 1，获取文章评论 2，获取子评论
 */
router.get('/comment', function (req, res) {
    var id = req.query.id,
        type = req.query.type,
        sql;
    if(!id || !type){
        res.send({status: 5,msg: '参数错误'});
        return;
    }
    sql = 'SELECT * FROM comment WHERE ' + (type == 1 ? 'article_id' : 'ref_id') + ' = ' + db.pool.escape(id) + ' order by date DESC';
    db.query(sql,function (err, row) {
        if (err) {
            res.send({status: 6,msg: '查询错误'});
            return;
        }
        res.send({
            status: 0,
            data: {list: row}
        });
    });
});
/**
 * 提交文章评论——post
 * @param text:'',author:'',email:'',refId:'',articleId:''
 */
router.post('/submitComment', function (req, res) {
    var comment = new Comment(req.body),
        sql = 'INSERT INTO comment (text, date, author, email, ref_id, article_id) VALUES (' +
            db.pool.escape(comment.text) + ',' + db.pool.escape(comment.date) + ',' + db.pool.escape(comment.author) +
            ',' + db.pool.escape(comment.email) + ',' + db.pool.escape(comment.refId) + ',' + db.pool.escape(comment.articleId) + ')';
    db.query(sql,function (err, row) {
        if (err) {
            res.send({status: 6,msg: '查询错误'});
            return;
        }
        res.send({
            status: 0,
            data: {id: row.insertId}
        });
    });
});

router.get('/tags', function (req, res) {
    var sql = 'SELECT * FROM tag';
    db.query(sql,function (err, row) {
        if (err) {
            res.send({status: 6,msg: '查询错误'});
            return;
        }
        res.send({
            status: 0,
            data: {list: row}
        });
    });
});
module.exports = router;
