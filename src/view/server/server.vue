<template>
  <div id="server">
    <div class="header">
      <img src="../../assets/logo.png" class="logo">
      <div class="logo-title">
        <p>博客管理</p>
        <p class="text">开始新的旅途，记录每个瞬间</p>
      </div>
    </div>
  </div>
</template>
<script type="text/ecmascript-6">
  export default {
    name:'server',
    created: function () {
//      this.$toast.info('你不是管理员!',20000);
    },
    destroyed: function () {
//      this.$toast.remove();
    },
    data: function () {
      return {

      }
    },
    computed: {

    },
    methods: {

    },
    watch: {

    }
  }
</script>
<style scoped>
  .header {
    padding: 20px;
    /* text-align: center; */
    background: #eee;
  }
  .logo{
    display: inline-block;
    vertical-align: middle;
    height: 40px;
  }
  .logo-title{
    display: inline-block;
    vertical-align: middle;
    line-height: 20px;
    font-size: 16px;
    font-weight: bold;
    color: #39f;
  }
  .logo-title .text{
    color: #999;
    font-size: 14px;
    font-weight: normal;
  }
</style>
