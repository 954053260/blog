<template>
  <div id="navigation">
    <ul class="navigation-list">
      <li class="navigation-item" v-for="(item,index) in navList">
        <a :href="item.href" target="_blank">
            <span class="c-000">{{index+1}}.</span>
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
            name: 'css参考文档',
            href: 'http://www.css88.com/book/css/'
          },
          {
            name: 'jquery参考文档',
            href: 'http://www.css88.com/jqapi-1.9/'
          },
          {
            name: 'ES6入门教程-阮一峰',
            href: 'http://es6.ruanyifeng.com/'
          },
          {
            name: 'vue官方文档',
            href: 'https://vuefe.cn/v2/api/'
          },
          {
            name: 'weex官方文档',
            href: 'https://weex-project.io/cn/'
          },
          {
            name: 'Flexible移动终极适配',
            href: 'https://github.com/amfe/lib-flexible'
          },
          {
            name: 'loading图标生成网站',
            href: 'http://loading.io/'
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

