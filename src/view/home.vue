<template>
  <div id="home">
    <ul class="post-list">
      <li class="post-list-item" v-for="item in article.list">
        <article class="post-block">
          <h2 class="post-title">
            <a class="post-title-link">{{item.title}}</a>
          </h2>
          <div class="post-info">{{item.date | date('yyyy-MM-dd')}}
            <a v-for="tag in item.tags" :title="tag.name" class="post-tag">#{{tag.name}}</a>
          </div>
          <div class="post-content">{{item.desc}}
            <router-link :to="'/articleDetail?id='+ item.id" title="阅读全文" class="read-more">[阅读全文]</router-link>
          </div>
        </article>
      </li>
    </ul>
  </div>
</template>
<script type="text/ecmascript-6">
  export default {
    name:'home',
    created: function () {
      this.getArticles();
      setTimeout(() => {
        this.$toast('弹出一条消息！！！',1000);
      })
    },
    data: function () {
      return {
        article: {
          isHasData: true,//数据是否加载完成
          pageIndex: 0,//当前页号
          list: [],//文章数据
          viewList: []//当前展示数据
        }
      }
    },
    computed: {
    },
    methods: {
      getArticles: function () {
        this.$http.get('article/getList',{data: {
          start: this.article.list.length,
          len: 10
        }}).then((data) => {
          if (data.status == 0) {
            this.article.list = this.article.list.concat(data.data.list);
            this.article.isHasData = data.data.isHasData;
          } else {

          }
        },(err) => {

        })
      }
    }
  }
</script>

