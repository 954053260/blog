<template>
  <div id="app">
    <side-bar @toggleSide="toggleSide"></side-bar>
    <div ref="wrap" class="wrap">
      <div class="content">
        <v-header></v-header>
        <router-view :style="{ minHeight: minHeight + 'px' }"></router-view>
        <footer v-show="isRender" class="footer" style="display: none">
          <p>blog制作中@小唐</p>
          <to-top></to-top>
        </footer>
      </div>
    </div>
  </div>
</template>
<script>
  import header from '../common/header.vue'
  import toTop from '../common/toTop.vue'
  import sideBar from '../common/sideBar.vue'
  export default {
    name:'app',
    created: function () {
      var h = document.body.clientHeight;
      this.minHeight = h - 118 - 117;
    },
    mounted: function () {
      this.isRender = true;
    },
    components: {'vHeader': header, 'toTop': toTop, 'sideBar': sideBar},
    data: function () {
      return {
        isRender: false,
        minHeight: 0
      }
    },
    methods: {
      toggleSide: function (data) {
        if (data.toggle) {
          this.$refs.wrap.style.marginLeft = data.width + 'px';
        } else {
          this.$refs.wrap.style.marginLeft = 0;
        }
      }
    }
  }
</script>
<style scoped>
 .wrap{
   transition: margin .3s;
   -moz-transition: margin .3s;	/* Firefox 4 */
   -webkit-transition: margin .3s;	/* Safari 和 Chrome */
   -o-transition: margin .3s;	/* Opera */
 }
</style>

