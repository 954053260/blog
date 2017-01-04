/**
 * Created by hyt on 2016/12/30.
 */
var config = require('../config.js');
var Db = require('mongodb').Db;
//var Connection = require('mongodb').Connection;
var Server = require('mongodb').Server;
module.exports = new Db(
    config.mongodb.db,
    new Server(config.mongodb.host, config.mongodb.port),
    {safe: true}
);