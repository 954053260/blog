<template>
  <div id="server">
    <h2 class="title">博客管理</h2>
  </div>
</template>
<script type="text/ecmascript-6">
  export default {
    name:'server',
    created: function () {
      this.$toast.info('你不是管理员!',20000);
    },
    destroyed: function () {
      this.$toast.remove();
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
  .title {
    padding: 20px;
    text-align: center;
  }
</style>
