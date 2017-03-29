<template>
  <div id="app">
    <side-bar></side-bar>
    <div ref="wrap" class="wrap">
      <!--<div class="spin">-->
        <!--<div class="spin-content">-->
          <!--<Spin>-->
            <!--<Icon type="load-c" size=25 class="spin-icon-load"></Icon>-->
            <!--<p>加载中...</p>-->
          <!--</Spin>-->
        <!--</div>-->
      <!--</div>-->
      <a class="nav-icon" @click="toggleSide()">
        <Icon type="navicon-round" color="#39f" size="25"/>
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
        isToggleSide: true,
        minHeight: 0
      }
    },
    methods: {
      toggleSide: function () {
        this.isToggleSide = !this.isToggleSide;
        this.$refs.wrap.style.marginLeft = this.isToggleSide ? '300px' : 0;
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
  .nav-icon{
    position: absolute;
    left: 10px;
    font-size: 25px;
    color: #39f;
  }
  .spin{
    position: fixed;
    left: 0;
    top: 0;
    bottom: 0;
    right: 0;
    background: rgba(0, 0, 0, 0.5);
    z-index: 99999;
  }
  .spin-content{
    position: absolute;
    left: 50%;
    top: 50%;
    margin-top: -22.5px;
    margin-left: -22.5px;
  }
  .spin-content p{
    color: #fff;
    font-size: 14px;
  }
  .spin-icon-load{
    color: #fff;
    animation: ani-spin 1s linear infinite;
  }
  @keyframes ani-spin {
    from { transform: rotate(0deg);}
    50%  { transform: rotate(180deg);}
    to   { transform: rotate(360deg);}
  }

</style>

