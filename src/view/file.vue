<template>
  <div id="file">
    <div class="file-list">
      <div v-for="item in list">
        <h3>{{item.date | date('yyyy-MM')}}</h3>
        <ul>
          <li class="file-item" v-for="value in item.list">
            <router-link :to="'/app/articleDetail?id='+ value.id" title="阅读全文" class="read-more">{{value.title}}
              <span class="file-item-note">{{value.date | date('yyyy-MM-dd')}}</span>
            </router-link>
          </li>
        </ul>
      </div>
    </div>
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
            this.$toast.info(data.msg);
          }
        },(err) => {
          this.$toast.info(err.msg);
        });
      }
    }
  }
</script>
<style scoped>
  .file-list h3{
    margin: 10px 0;
    font-size: 16px;
  }
  .file-item{
    margin: 10px 0;
    font-size: 14px;
    color: #39f;
  }
  .file-item-note{
    float: right;
    color: #999;
  }
</style>
