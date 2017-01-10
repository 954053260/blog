/**
 * Created by hyt on 2016/12/30.
 */
var config = require('../config.js');
var mongodb = require('mongodb').Db;
//var Connection = require('mongodb').Connection;
var Server = require('mongodb').Server;
module.exports = {
    mongodb: new mongodb(
        config.mongodb.db,
        new Server(config.mongodb.host, config.mongodb.port),
        {safe: true}),
    copyObject: function (obj) {
        var object = {};
        for(var key in obj){
            if(obj.hasOwnProperty(key) && obj[key] !== undefined){
                object[key] = obj[key];
            }
        }
        return object;
    }
};