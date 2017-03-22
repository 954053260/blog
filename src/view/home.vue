<template>
  <div id="home">
    <ul class="post-list">
      <li class="post-list-item" v-for="item in article.viewList">
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
    <div class="page-btn">
      <Button v-show="pageIndex" type="info" :loading="isLoading" @click="prePage()">
        <span>上一页</span>
      </Button>
      <Button v-show="isLastPage" type="info" :loading="isLoading" @click="lastPage()">
        <span>下一页</span>
      </Button>
    </div>
  </div>
</template>
<script type="text/ecmascript-6">
  export default {
    name:'home',
    created: function () {
      this.getArticles();
    },
    data: function () {
      return {
        isLoading: false,
        pageIndex: 0,
        article: {
          isHasData: true,//是否还有数据
          list: [],//文章数据
          viewList: []//当前展示数据
        }
      }
    },
    computed: {
      isLastPage: function () {
        console.log(Math.ceil(this.article.list/1),this.pageIndex != (Math.ceil(this.article.list/1) - 1),this.article.isHasData)
        return this.pageIndex != (Math.ceil(this.article.list.length/1) - 1) || this.article.isHasData;
      }
    },
    methods: {
      getArticles: function () {
        let start = this.pageIndex*1;
        let end = (this.pageIndex + 1)*1;
        let list = this.article.list.slice(start,end);
        if (list.length) {
          this.article.viewList = list;
          return;
        }
        this.$http.get('article/getList',{data: {
          start: this.article.list.length,
          len: 1
        }}).then((data) => {
          if (data.status == 0) {
            this.article.list = this.article.list.concat(data.data.list);
            this.article.isHasData = data.data.isHasData;
            this.article.viewList = this.article.list.slice(start,end);
          } else {
            this.$Message.error(data.msg);
          }
        },(err) => {
          this.$Message.error(err.msg);
        });
      },
      prePage: function () {
        if (this.pageIndex) {
          this.pageIndex -= 1;
          this.getArticles();
        }
      },
      lastPage: function () {
        this.pageIndex += 1;
        this.getArticles();
      }
    }
  }
</script>
<style scoped>
  .post-list{
    margin: 5px 0 10px;
    padding: 0 20px;
  }
  .post-list-item{
    margin-bottom: 16px;
    padding-bottom: 16px;
    font-size: 14px;
    border-bottom: 1px dashed #ddd;
  }
  .post-list-item:last-child{
    border-bottom: none;
  }
  .post-title{
    font-size: 16px;
    color: #2c3e50;
  }
  .post-title-link{
    padding-bottom: 6px;
  }
  .post-from,
  .post-tag{
    display: inline-block;
    margin-left: 5px;
    color: #39f;
  }
  .post-from{
    color: #E36B6B;
  }
  .post-info {
    color: #7f8c8d;
    margin: 8px 0;
  }
  .post-content{
    line-height: 1.7;
    font-weight: 400;
    text-align: justify;
    word-wrap: break-word;
    word-break: break-all;
    color: #333;
  }
  .read-more{
    color: #39f;
    word-break: break-all;
  }
  .page-btn{
    text-align: center;
  }
  .page-btn > button{
    margin: 0 10px;
  }
</style>
