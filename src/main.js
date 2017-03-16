import './css/style.css'
import './css/github-markdown.css'
import Vue from 'vue'
import router from './router.js'
import header from './common/header.vue'
import toTop from './common/toTop.vue'
new Vue({
  el: '#app',
  created: function () {
    var h = document.body.clientHeight;
    this.minHeight = h - 118 - 117;
  },
  mounted: function () {
    this.isRender = true;
  },
  router,
  components: {'vHeader': header,'toTop': toTop},
  data: {
    isRender: false,
    minHeight: 0
  }
});
