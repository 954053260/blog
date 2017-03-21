import './css/style.css'
import './css/ionicons.min.css'
import './css/github-markdown.css'
import Vue from 'vue'
import router from './router.js'
import filter from './filter.js'
import app from './view/app.vue'
import ajax from './ajax.js'
import toast from './common/toast'
Vue.use(toast, {
  root: 'http://localhost:3000/',
  timeout: 30000
});
Vue.use(ajax, {
  root: 'http://localhost:3000/',
  timeout: 30000
});
new Vue({
  el: '#main',
  router,
  created: function () {

  },
  mounted: function () {

  },
  render: h=>h(app)
});
