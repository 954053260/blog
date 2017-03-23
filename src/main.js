import 'iview/dist/styles/iview.css'
import './css/ionicons.min.css'
import './css/style.css'
import './css/github-markdown.css'
import Vue from 'vue'
import router from './router.js'
import store from './store'
import filter from './filter.js'
import app from './view/app.vue'
import ajax from './ajax.js'
import iView from 'iview';
Vue.use(iView);
Vue.use(ajax, {
  root: 'http://localhost:3000/',
  timeout: 30000
});
new Vue({
  el: '#main',
  router,
  store,
  created: function () {

  },
  mounted: function () {

  },
  render: h=>h(app)
});
