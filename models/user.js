/**
 * Created by hyt on 2016/12/30.
 */
var DB = require('./db');
var mongodb = DB.mongodb;
function User(user) {
    this.name = user.name;
    this.password = user.password;
    this.email = user.email;
}

//find user info
User.find = function (name, callback) {
    mongodb.open(function (err, db) {
        if (err) {
            return callback(err);
        }
        db.collection('users', function (err, collection) {
            if (err) {
                mongodb.close();
                return callback(err);
            }
            collection.findOne({
                name: name
            }, function (err, user) {
                mongodb.close();
                if (err) {
                    return callback(err);
                }
                callback(null, user);
            });
        });
    });
};

//save user info
User.prototype.save = function (callback) {
    var self = this;
    User.find(this.name,function (err,data) {
        if (err) {
            return callback(err);
        }
        if (data) {
            return callback('用户已存在');
        } else {
            mongodb.open(function (err, db) {
                if (err) {
                    return callback(err);
                }
                db.collection('users', function (err, collection) {
                    if (err) {
                        mongodb.close();
                        return callback(err);
                    }
                    collection.insert(self, {
                        safe: true
                    }, function (err, user) {
                        mongodb.close();
                        if (err) {
                            return callback(err);
                        }
                        callback(null, user.ops[0]);
                    });
                });
            });
        }
    });
};

//update user info
User.prototype.update = function (callback) {
    var self = this;
    mongodb.open(function (err, db) {
        if (err) {
            return callback(err);
        }
        db.collection('users', function (err, collection) {
            if (err) {
                mongodb.close();
                return callback(err);
            }
            collection.update({name: self.name},{$set: DB.copyObject(self)}, {
                safe: true
            }, function (err, user) {
                mongodb.close();
                if (err) {
                    return callback(err);
                }
                callback(null, user);
            });
        });
    });
};
module.exports = User;
