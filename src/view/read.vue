<template>
  <div id="read">
    <ul class="book-list">
      <li v-for="book in bookList" class="book-item">
        <a href="https://pan.baidu.com/s/1eRSCEki?zfif" target="_blank">
          <img class="picture" :src="book.picture">
        </a>
        <div class="book-item-content">
          <p class="name">{{book.name}}</p>
          <p class="score">
            <i v-for="value in book.stars" class="icon"
               :class="{'ion-ios-star': value == 2,
                        'ion-ios-star-half': value == 1,
                        'ion-ios-star-outline': value == 0}"></i>
            <span>{{book.score}}分</span>
          </p>
        </div>
      </li>
    </ul>
  </div>
</template>
<script type="text/ecmascript-6">
  import '../assets/js-1.jpg'
  import '../assets/js-2.jpg'
  import '../assets/js-3.jpg'
  import '../assets/js-4.jpg'
  import '../assets/js-5.jpg'
  import '../assets/js-6.jpg'
  import '../assets/js-7.jpg'
  import '../assets/css-1.jpg'
  import '../assets/node-1.jpg'
  import '../assets/mysql-1.jpg'
  import '../assets/algorithm-1.jpg'

  export default {
    name: 'read',
    data: function () {
      return {
        bookList: [
          {
            picture: '/dist/js-1.jpg',
            name: 'JavaScript高级程序设计（第三版）',
            score: 9.3,
            stars: [2, 2, 2, 2, 1]
          },
          {
            picture: '/dist/js-2.jpg',
            name: '编写可维护的javascript',
            score: 8.2,
            stars: [2, 2, 2, 1, 0]
          },
          {
            picture: '/dist/js-3.jpg',
            name: '高性能JavaScript编程',
            score: 8.9,
            stars: [2, 2, 2, 2, 0]
          },
          {
            picture: '/dist/js-4.jpg',
            name: 'JavaScript设计模式',
            score: 8.4,
            stars: [2, 2, 2, 1, 0]
          },
          {
            picture: '/dist/js-5.jpg',
            name: '你不知道的JavaScript（上卷）',
            score: 9.4,
            stars: [2, 2, 2, 2, 1]
          },
          {
            picture: '/dist/js-6.jpg',
            name: '你不知道的JavaScript（中卷）',
            score: 9.0,
            stars: [2, 2, 2, 2, 0]
          },
          {
            picture: '/dist/js-7.jpg',
            name: 'JavaScript DOM编程艺术（第二版）',
            score: 8.8,
            stars: [2, 2, 2, 2, 0]
          },
          {
            picture: '/dist/css-1.jpg',
            name: '深入浅出Node.js',
            score: 8.7,
            stars: [2, 2, 2, 2, 0]
          },
          {
            picture: '/dist/node-1.jpg',
            name: 'css揭秘',
            score: 9.4,
            stars: [2, 2, 2, 2, 1]
          },
          {
            picture: '/dist/mysql-1.jpg',
            name: '高性能MySQL（第3版）',
            score: 9.3,
            stars: [2, 2, 2, 2, 1]
          },
          {
            picture: '/dist/algorithm-1.jpg',
            name: '算法（第4版）',
            score: 9.4,
            stars: [2, 2, 2, 2, 1]
          }
        ]
      }
    },
    methods: {

    }
  }
</script>
<style scoped>
  .book-list{
    margin-bottom: 20px;
    overflow: hidden;
  }
  .book-item{
    margin: 0 20px;
    padding: 15px 0;
    overflow: hidden;
    border-top: 1px solid #ddd;
  }
  .book-item .picture{
    float: left;
    width: 80px;
    height: 102px;
    box-shadow: 2px 2px 8px rgba(0, 0, 0, 0.8);
  }
  .book-item .book-item-content{
    overflow: hidden;
  }
  .book-item .name{
    margin: 10px 15px;
    font-size: 14px;
    color: #555;
    line-height: 20px;
  }
  .book-item .score{
    margin: 10px 15px;
    color: #E91E63;
  }
  .score > span{
    font-size: 14px;
  }
</style>
