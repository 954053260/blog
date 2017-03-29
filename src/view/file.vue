<template>
  <div id="file">
    <Timeline>
      <Timeline-item v-for="item in list" class="file-item">
        <p class="time">{{item.date | date('yyyy-MM')}}</p>
        <p class="content" v-for="value in item.list">
          <router-link :to="'/app/articleDetail?id='+ value.id" title="阅读全文" class="read-more">{{value.title}}
            <span class="file-item-note">{{value.date | date('yyyy-MM-dd')}}</span>
          </router-link>
        </p>
      </Timeline-item>
    </Timeline>
  </div>
</template>
<script type="text/ecmascript-6">
  export default {
    name: 'file',
    created: function () {
      this.getFile();
    },
    data: function () {
      return {
        list: []
      }
    },
    methods: {
      getFile: function () {
        this.$http.get('article/arrange',{}).then((data) => {
          if (data.status == 0) {
            this.list = data.data;
          } else {
            this.$Message.error(data.msg);
          }
        },(err) => {
          this.$Message.error(err.msg);
        });
      }
    }
  }
</script>
<style scoped>
  .file-item{
    padding: 0;
  }
  .file-item-note{
    float: right;
    color: #999;
  }
  .time{
    margin-top: -1px;
    font-size: 16px;
    font-weight: bold;
  }
  .content{
    padding-left: 5px;
    line-height: 30px;
    font-size: 14px;
    color: #39f;
  }
</style>
