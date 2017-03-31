//import 'iview/dist/styles/iview.css'
import './css/ionicons.min.css'
import './css/style.css'
import './css/github-markdown.css'
import './common/components'
import Vue from 'vue'
import router from './router.js'
import store from './store'
import filter from './filter.js'
import app from './view/app.vue'
import ajax from './ajax.js'
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
    //var barrage = ['66666666','文章写的很赞','弹幕压制','弹幕弹幕弹幕弹幕弹幕','弹弹弹弹','幕幕幕幕','11111111','22222222','333333333','233333','============']
    //setInterval(function () {
    //  Vue.barrage.info({info: barrage[parseInt(Math.random()*10)]});
    //},100);
  },
  mounted: function () {

  }
});
