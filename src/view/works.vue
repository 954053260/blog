<template>
  <div id="works">
    <ul class="navigation-list">
      <li class="navigation-item">
        <a @click="toAudio">
          <span class="c-000">1.</span>
          音乐播放器组件
        </a>
      </li>
    </ul>
  </div>
</template>
<style scoped>
  .navigation-list{
    padding: 0 20px;
  }
  .navigation-item{
    margin: 10px 0;
  }
  .navigation-item a{
    color: #39f;
    font-size: 14px;
  }
</style>
<script>
  export default {
    name:'works',
    data: function () {
      return {

      }
    },
    methods: {
      toAudio: function () {
        this.$store.state.works.showAudio = true;
      }
    }
  }
</script>

