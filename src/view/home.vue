<template>
  <div id="home">
    <div class="post-list">
      <transition-group name="fade" tag="div">
        <div class="post-list-item" v-for="(item, index) in article.data[pageIndex]" :key="index">
          <article class="post-block">
            <h2 class="post-title">
              <a class="post-title-link">{{item.title}}</a>
            </h2>
            <div class="post-info">{{item.date | date('yyyy-MM-dd')}}
              <a v-for="tag in item.tags" :title="tag.name" class="post-tag">#{{tag.name}}</a>
            </div>
            <div class="post-content">{{item.desc}}
              <router-link :to="'/app/articleDetail?id='+ item.id" title="阅读全文" class="read-more">[阅读全文]</router-link>
            </div>
          </article>
        </div>
      </transition-group>
    </div>
    <div class="page-btn">
      <button v-show="pageIndex" @click="prePage()">上一页</button>
      <button v-show="isLastPage" @click="lastPage()">下一页</button>
    </div>
  </div>
</template>
<script type="text/ecmascript-6">
  export default {
    name:'home',
    created: function () {
      this.init().getArticles();
    },
    data: function () {
      return {
        isLoading: false,
        article: {
          isHasData: true,//是否还有数据
          total: 0,//文章数量
          data: {}//文章数据
        }
      }
    },
    computed: {
      total: function () {
        return Math.max(this.article.total,this.pageIndex*10 + 1);
      },
      pageIndex: function () {
        return this.$store.state.home.pageIndex;
      },
      isLastPage: function () {
        return this.$store.state.home.pageIndex != (Math.floor((this.total-1)/10)) || this.article.isHasData;
      }
    },
    methods: {
      init: function () {
        this.isLoading = false;
        this.article = {
          isHasData: true,//是否还有数据
          total: 0,//文章数量
          data: {}//文章数据
        }
        return this;
      },
      getArticles: function () {

        if (this.article.data[this.pageIndex]) {
          return;
        }
        this.$loading.show();

        this.$http.get('article/getList', {data: {
          tag: this.$route.query.tag,
          start: this.pageIndex*10,
          len: 10
        }}).then((data) => {
          this.$loading.hide();

          if (data.status == 0) {
            this.article.total += data.data.list.length;
            this.article.data[this.pageIndex] = data.data.list;

            if (this.article.isHasData) {
              this.article.isHasData = data.data.isHasData;
            }

          } else {
            this.$loading.hide();
            this.$toast.info(data.msg);
          }

        },(err) => {
          this.$loading.hide();
          this.$toast.info(err.msg);
        });
      },
      prePage: function () {
        if (this.pageIndex) {
          this.$store.state.home.pageIndex -= 1;
          this.getArticles();
        }
      },
      lastPage: function () {
        this.$store.state.home.pageIndex += 1;
        this.getArticles();
      }
    },
    watch: {
      '$route': function (to, from) {
        this.init().getArticles();
      }
    }
  }
</script>
<style scoped>
  #home{
    padding-bottom: 32px;
  }
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
    padding-bottom: 5px;
    font-size: 16px;
    color: #2c3e50;
  }
  .post-title-link{

  }
  .post-info{
    padding-bottom: 5px;
    color: #999;
  }
  .post-tag{
    display: inline-block;
    margin-left: 5px;
    color: #39f;
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
    position: absolute;
    bottom: 0;
    width: 100%;
    text-align: center;
  }
  .page-btn > button{
    margin: 0 10px;
    display: inline-block;
    color: #fff;
    background-color: #39f;
    cursor: pointer;
    user-select: none;
    padding: 6px 15px;
    font-size: 12px;
    border-radius: 4px;
    border: 1px solid #39f;
    white-space: nowrap;
    line-height: 1.5;
  }
</style>
