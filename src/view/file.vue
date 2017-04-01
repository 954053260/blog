<template>
  <div id="file">
    <div class="file-list">
      <div v-for="(item, index) in list">
        <h3>
          <a class="file-toggle" @click="toggleFile(index)">
            <i class="icon " :class="{'ion-android-folder-open': !item.isHide, 'ion-android-folder': item.isHide}"></i>
          </a>
          {{item.date | date('yyyy-MM')}}
        </h3>
        <transition name="fade">
          <ul v-show="!item.isHide">
            <li class="file-item" v-for="value in item.list">
              <i class="icon ion-ios-paper-outline"></i>
              <router-link :to="'/app/articleDetail?id='+ value.id" title="阅读全文" class="read-more">{{value.title}}
              </router-link>
              <span class="file-item-note">{{value.date | date('yyyy-MM-dd')}}</span>
            </li>
          </ul>
        </transition>
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
      },
      toggleFile: function (index) {
        var item = this.list[index];
        if (item.isHide == undefined) {
          this.$set(item, 'isHide', true);
        } else {
          item.isHide = !item.isHide;
        }
      }
    }
  }
</script>
<style scoped>
  .file-list h3{
    margin: 10px 0;
    font-size: 16px;
  }
  .file-toggle{
    position: relative;
    top: 2px;
    font-size: 22px;
    color: #ff9900;
  }
  .file-item{
    position: relative;
    margin: 10px 0 10px 48px;
    font-size: 14px;
    height: 16px;
  }
  .file-item .ion-ios-paper-outline{
    position: absolute;
    top: -1px;
    left: -20px;
    font-size: 18px;
    color: #39f;
  }
  .file-item:before{
    content: '';
    position: absolute;
    top: 50%;
    left: 0;
    right: 0;
    border-top: 1px dotted #999;
    z-index: 0;
  }
  .file-item-note{
    position: absolute;
    right: 0;
    padding-left: 5px;
    color: #999;
    background-color: #fff;
  }
  .read-more{
    position: absolute;
    left: 0;
    padding-right: 5px;
    color: #333;
    background-color: #fff;
  }
</style>
