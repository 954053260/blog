<template>
  <div id="app">
    <side-bar></side-bar>
    <div ref="wrap" class="wrap" :style="{ minWidth: minWidth + 'px'}">
      <a class="nav-icon" @click="toggleSide()">
        <i class="icon ion-navicon-round"></i>
      </a>
      <div class="content">
        <v-header></v-header>
        <router-view :style="{ minHeight: minHeight + 'px' ,position: 'relative'}"></router-view>
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
      var w = document.body.clientWidth;
      var h = document.body.clientHeight;
      this.minHeight = h - 118 - 117;
      this.minWidth = w > 510 ? 510 : w;
    },
    mounted: function () {
      this.isRender = true;
    },
    components: {'vHeader': header, 'toTop': toTop, 'sideBar': sideBar},
    data: function () {
      return {
        isRender: false,
        isToggleSide: true,
        minHeight: 0,
        minWidth: 0
      }
    },
    methods: {
      toggleSide: function () {
        this.isToggleSide = !this.isToggleSide;
        this.$refs.wrap.style.left = this.isToggleSide ? '300px' : 0;
      }
    }
  }
</script>
<style scoped>
  .wrap{
    position: absolute;
    left: 300px;
    right: 0;
    top: 0;
    bottom: 0;
    overflow-x: hidden;
    overflow-y: auto;
    background: #fff;
    transition: left .3s;
    -moz-transition: left .3s;	/* Firefox 4 */
    -webkit-transition: left .3s;	/* Safari 和 Chrome */
    -o-transition: left .3s;	/* Opera */
  }
  .nav-icon{
    position: absolute;
    left: 10px;
    font-size: 25px;
    color: #39f;
  }
  .content{
    max-width: 800px;
    margin: auto;
    padding: 0 15px;
  }
  .footer{
    margin-top: 16px;
    padding: 35px 0;
    height: 30px;
    line-height: 30px;
    color: #999;
    font-size: 14px;
    text-align: center;
    border-top: 1px solid #ccc;
  }
</style>

