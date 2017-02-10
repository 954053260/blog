/**
 * Created by hyt on 2017/2/10.
 */
var express = require('express');
var Message = require('../models/message');
var router = express.Router();
router.get('/message/list', function (req, res) {
    var param = {start: parseInt(req.query.start), len: parseInt(req.query.len)};
    Message.find(param,
        function (err, data) {
            if (err) {
                res.send({
                    status: 1,
                    msg: err
                });
                return console.error('/message/list', err);
            }
            if (!(data instanceof Array)) {
                data = [data];
            }
            res.send({
                status: 0,
                data: {list: data}
            });
        }
    )
});

router.post('/message/submit', function (req, res) {
    var message = new Message(JSON.parse(req.body.data));
    message.date = new Date().getTime();

    Message.findOne(message.id, function (err, data) {
        if (err) {
            return error(err);
        }
        if (data) {
            message.unread = parseInt(data.unread) + 1;
            message.update(callback);
        } else {
            message.unread = 1;
            message.save(callback);
        }

        function callback(err, data) {
            if (err) {
                return error(err);
            }
            res.send({
                status: 0,
                msg: '添加成功',
                data: data
            });
        }

        function error(err) {
            res.send({
                status: 1,
                msg: err
            });
            return console.error('/message/submit', err);
        }
    });
});
module.exports = router;