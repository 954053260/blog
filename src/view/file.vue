<template>
  <div id="file">
    <div class="file-list">
      <div v-for="item in list">
        <h3>{{item.date | date('yyyy-MM')}}</h3>
        <ul>
          <li class="file-item" v-for="article in item.articles">
            <a>
              {{article.title}}
              <span class="file-item-note">{{article.date | date('yyyy-MM-dd')}}</span>
            </a>
          </li>
        </ul>
      </div>
    </div>
  </div>
</template>
<script type="text/ecmascript-6">
  export default {
    name: 'file',
    data: function () {
      return {
        list: [
          {
            date: new Date ().getTime(),
            articles: [
              {
                id: '2990',
                title: '[文] 笔记：IE 下透明度问题',
                date: new Date ().getTime(),
              },
              {
                id: '2990',
                title: '[文] 笔记：IE 下透明度问题',
                date: new Date ().getTime() - 1000*3600*24*3,
              },
              {
                id: '2990',
                title: '[文] 笔记：IE 下透明度问题',
                date: new Date ().getTime() - 1000*3600*24*5,
              }
            ]
          },
          {
            date: new Date ().getTime() - 1000*3600*24*30,
            articles: [
              {
                id: '2990',
                title: '[文] 笔记：IE 下透明度问题',
                date: new Date ().getTime(),
              },
              {
                id: '2990',
                title: '[文] 笔记：IE 下透明度问题',
                date: new Date ().getTime() - 1000*3600*24*35,
              },
              {
                id: '2990',
                title: '[文] 笔记：IE 下透明度问题',
                date: new Date ().getTime() - 1000*3600*24*40,
              }
            ]
          }
        ]
      }
  },
  methods: {

  }
  }
</script>
<style scoped>
  .file-list h3{
    margin: 15px 0;
    font-size: 16px;
  }
  .file-item{
    margin: 10px 0;
    color: #39f;
    font-size: 14px;
  }
  .file-item-note{
    float: right;
    color: #999;
  }
</style>
