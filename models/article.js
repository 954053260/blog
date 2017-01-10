var DB = require('./db');
var mongodb = DB.mongodb;
function Article (article) {
  this.id = article.id;
  this.title = article.title;
  this.des = article.des;
  this.author = article.author;
  this.readNum = article.readNum;
  this.commentNum = article.commentNum;
  this.date = article.date;
}

//find one
Article.findOne = function (id, callback) {
  mongodb.open(function (err, db) {
    if (err) {
      return callback(err);
    }
    db.collection('articles', function (err, collection) {
      if (err) {
        mongodb.close();
        return callback(err);
      }
      collection.findOne({
        id: id
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

//find more
Article.find = function (option,callback) {
  mongodb.open(function (err, db) {
    if (err) {
      return callback(err);
    }
    db.collection('articles', function (err, collection) {
      if (err) {
        mongodb.close();
        return callback(err);
      }
      collection.find().sort({'date':-1}).skip(option.start).limit(option.len).toArray(
          function(err,articles){
            mongodb.close();
            if (err) {
              return callback(err);
            }
            callback(null, articles);
          });
    });
  });
};

//save info
Article.prototype.save = function (callback) {
  var self = this;
  Article.findOne(this.id,function (err,data) {
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
        db.collection('articles', function (err, collection) {
          if (err) {
            mongodb.close();
            return callback(err);
          }
          collection.insert(self, {
            safe: true
          }, function (err, articles) {
            mongodb.close();
            if (err) {
              return callback(err);
            }
            callback(null, articles.ops[0]);
          });
        });
      });
    }
  });
};

//update info
Article.prototype.update = function (callback) {
  var self = this;
  mongodb.open(function (err, db) {
    if (err) {
      return callback(err);
    }
    db.collection('articles', function (err, collection) {
      if (err) {
        mongodb.close();
        return callback(err);
      }
      collection.update({id: self.name},{$set: DB.copyObject(self)}, {
        safe: true
      }, function (err, article) {
        mongodb.close();
        if (err) {
          return callback(err);
        }
        callback(null, article);
      });
    });
  });
};

module.exports = Article;