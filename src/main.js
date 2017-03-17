import './css/style.css'
import './css/ionicons.min.css'
import './css/github-markdown.css'
import Vue from 'vue'
import router from './router.js'
import app from './view/app.vue'
new Vue({
  el: '#main',
  router,
  created: function () {

  },
  mounted: function () {

  },
  render: h=>h(app)
});
