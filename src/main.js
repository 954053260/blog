//import 'iview/dist/styles/iview.css'
import './assets/clock.gif'
import './css/ionicons.min.css'
import './css/style.css'
import './css/github-markdown.css'
import './directive.js'
import './common/components'
import Vue from 'vue'
import checkbox from './common/checkbox.vue'
import router from './router.js'
import store from './store'
import filter from './filter.js'
import app from './view/app.vue'
import ajax from './ajax.js'
import socket from './socket.js'
Vue.component('checkbox', checkbox);
Vue.use(socket);
//import iView from 'iview';
//Vue.use(iView);
Vue.use(ajax, {
  root: 'http://localhost:3000/',
  timeout: 30000
});
new Vue({
  el: '#main',
  router,
  store,
  created: function () {
    this.$socket.on('chat', (data) => {
      this.$barrage.info({info: data.text});
    });
    //setTimeout(function () {
    //  Vue.dialog.confirm({
    //    content: '弹出一个对话框！',
    //    onOk: function () {
    //      alert('ok');
    //    }
    //  });
    //},2000);
    //var barrage = ['66666666','文章写的很赞','弹幕压制','弹幕弹幕弹幕弹幕弹幕','弹弹弹弹','幕幕幕幕','11111111','22222222','333333333','233333','============']
    //setInterval(function () {
    //  Vue.barrage.info({info: barrage[parseInt(Math.random()*10)]});
    //},100);
  },
  mounted: function () {

  }
});
