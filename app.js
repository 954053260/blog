var express = require('express');
var path = require('path');
var favicon = require('serve-favicon');
var logger = require('morgan');
var cookieParser = require('cookie-parser');
var bodyParser = require('body-parser');
var session = require('express-session');
var MongoStore = require('connect-mongo')(session);
var flash = require('connect-flash');
var config = require('./config.js');
var index = require('./routes/index');
var userRouter = require('./routes/userRouter');
var articleRouter = require('./routes/articleRouter');
var messageRouter = require('./routes/messageRouter');
var app = express();
app.use(favicon(path.join(__dirname, 'public', 'favicon.ico')));
//设置视图目录
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');
// flash 中间键，用来显示通知
app.use(flash());
app.use(session({
  secret: config.mongodb.cookieSecret,
  key: config.mongodb.db,//cookie name
  cookie: {maxAge: 1000 * 60 * 60 * 24 * 30},//30 days
  store: new MongoStore({
    //db: config.mongodb.db,
    //host: config.mongodb.host,
    //port: config.mongodb.port,
    url: 'mongodb://localhost/blog'
  })
}));
//设置头部
app.use(function(req, res, next) {
  res.header('Access-Control-Allow-Origin', '*');
  res.header('Access-Control-Allow-Methods', 'GET,PUT,POST,DELETE');
  res.header('Access-Control-Allow-Headers', 'Content-Type');
  res.header('Access-Control-Allow-Credentials','true');
  next();
});
app.use(logger('dev'));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));
app.use('/', index);
app.use('/', userRouter);
app.use('/', articleRouter);
app.use('/', messageRouter);
// catch 404 and forward to error handler
app.use(function(req, res, next) {
  var err = new Error('Not Found');
  err.status = 404;
  next(err);
});

// error handler
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};
  // render the error page
  res.status(err.status || 500);
  res.render('error');
});

app.listen(8888,function(){
  console.log("Server Start!");
});

