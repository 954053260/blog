/**
 * Created by hyt on 2017/2/10.
 */
var DB = require('./db');
var mongodb = DB.mongodb;
function Message (message) {
    this.id = message.id;
    this.type = message.type;
    this.author = message.author;
    this.portrait = message.portrait || 'img/default-portrait.png';
    this.title = message.title;
    this.des = message.des;
    this.unread = message.unread || 0;
    this.date = message.date || new Date().getTime();
}

Message.findOne = function (id, callback) {
    mongodb.open(function (err, db) {
        if (err) {
            return callback(err);
        }
        db.collection('messages', function (err, collection) {
            if (err) {
                mongodb.close();
                return callback(err);
            }
            collection.findOne({
                id: id
            }, function (err, message) {
                mongodb.close();
                if (err) {
                    return callback(err);
                }
                callback(null, message);
            });
        });
    });
};

Message.find = function (option,callback) {
    mongodb.open(function (err, db) {
        if (err) {
            return callback(err);
        }
        db.collection('messages', function (err, collection) {
            if (err) {
                mongodb.close();
                return callback(err);
            }
            collection.find().sort({'date': -1}).skip(option.start).limit(option.len).toArray(
                function (err, messages) {
                    mongodb.close();
                    if (err) {
                        return callback(err);
                    }
                    callback(null, messages);
                });
        });
    });
};

Message.prototype.save = function (callback) {
    var self = this;
    Message.findOne(this.id,function (err,data) {
        if (err) {
            return callback(err);
        }
        if (data) {
            return callback('此文章已存在');
        } else {
            mongodb.open(function (err, db) {
                if (err) {
                    return callback(err);
                }
                db.collection('messages', function (err, collection) {
                    if (err) {
                        mongodb.close();
                        return callback(err);
                    }
                    collection.insert(self, {
                        safe: true
                    }, function (err, message) {
                        mongodb.close();
                        if (err) {
                            return callback(err);
                        }
                        callback(null, message.ops[0]);
                    });
                });
            });
        }
    });
};

Message.prototype.update = function (callback) {
    var self = this;
    mongodb.open(function (err, db) {
        if (err) {
            return callback(err);
        }
        db.collection('messages', function (err, collection) {
            if (err) {
                mongodb.close();
                return callback(err);
            }
            collection.update({id: self.id},{$set: DB.copyObject(self)}, {
                safe: true
            }, function (err, message) {
                mongodb.close();
                if (err) {
                    return callback(err);
                }
                callback(null, message);
            });
        });
    });
};

module.exports = Message;

