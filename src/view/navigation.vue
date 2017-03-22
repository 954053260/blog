<template>
  <div id="navigation">
    <ul class="navigation-list">
      <li class="navigation-item" v-for="(item,index) in navList">
        <a :href="item.href">
            <em class="c-000">{{index+1}}.</em>
            {{item.name || item.href}}
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
    name:'navigation',
    data: function () {
      return {
        navList: [
          {
            name: 'minimal虾米博客',
            href: 'http://www.cnblogs.com/xt911129/'
          },
          {
            name: '阮一峰的网络日志',
            href: 'http://www.ruanyifeng.com/blog/'
          }
        ]
      }
    },
    computed: {

    },
    methods: {

    }
  }
</script>

