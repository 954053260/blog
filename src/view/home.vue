<template>
  <div id="home">
    <ul class="post-list">
      <li class="post-list-item" v-for="item in list">
        <article class="post-block">
          <h2 class="post-title">
            <a class="post-title-link">{{item.title}}</a>
          </h2>
          <div class="post-info">{{item.date | date('yyyy-MM-dd')}}
            <a v-for="tag in item.tags" :title="tag.name" class="post-tag">#{{tag.name}}</a>
          </div>
          <div class="post-content">{{item.content}}
            <router-link :to="'/articleDetail?id='+ item.id" title="阅读全文" class="read-more">[阅读全文]</router-link>
          </div>
        </article>
      </li>
    </ul>
  </div>
</template>
<script>
  export default {
    name:'home',
    data: function () {
      return {
        list: [
          {
            title: '[文] 笔记：IE 下透明度问题',
            date: new Date(),
            tags: [
              {
                name: 'CSS',
                id: '1'
              },
              {
                name: 'HTML5',
                id: '2'
              }
            ],
            content: 'IE8 下面遇到奇怪的问题。本来半透明的 png 图片，竟然一片黑。然而，我明明按照习惯使用了 opacity + filter 的方式。img { opacity: 1; filter: alpha(opacity=1...',
            id: '2990'
          },
          {
            title: '[文] 笔记：IE 下透明度问题',
            date: new Date(),
            reprint: 'https:www.baidu.com',
            tags: [
              {
                name: 'CSS',
                href: '#/home'
              },
              {
                name: 'HTML5',
                href: '#/home'
              }
            ],
            content: 'IE8 下面遇到奇怪的问题。本来半透明的 png 图片，竟然一片黑。然而，我明明按照习惯使用了 opacity + filter 的方式。img { opacity: 1; filter: alpha(opacity=1...',
            href: '#/home'
          },
          {
            title: '[文] 笔记：IE 下透明度问题',
            date: new Date(),
            reprint: 'https:www.baidu.com',
            tags: [
              {
                name: 'CSS',
                href: '#/home'
              },
              {
                name: 'HTML5',
                href: '#/home'
              }
            ],
            content: 'IE8 下面遇到奇怪的问题。本来半透明的 png 图片，竟然一片黑。然而，我明明按照习惯使用了 opacity + filter 的方式。img { opacity: 1; filter: alpha(opacity=1...',
            href: '#/home'
          },
          {
            title: '[文] 笔记：IE 下透明度问题',
            date: new Date(),
            reprint: 'https:www.baidu.com',
            tags: [
              {
                name: 'CSS',
                href: '#/home'
              },
              {
                name: 'HTML5',
                href: '#/home'
              }
            ],
            content: 'IE8 下面遇到奇怪的问题。本来半透明的 png 图片，竟然一片黑。然而，我明明按照习惯使用了 opacity + filter 的方式。img { opacity: 1; filter: alpha(opacity=1...',
            href: '#/home'
          },
          {
            title: '[文] 笔记：IE 下透明度问题',
            date: new Date(),
            reprint: 'https:www.baidu.com',
            tags: [
              {
                name: 'CSS',
                href: '#/home'
              },
              {
                name: 'HTML5',
                href: '#/home'
              }
            ],
            content: 'IE8 下面遇到奇怪的问题。本来半透明的 png 图片，竟然一片黑。然而，我明明按照习惯使用了 opacity + filter 的方式。img { opacity: 1; filter: alpha(opacity=1...',
            href: '#/home'
          },
          {
            title: '[文] 笔记：IE 下透明度问题',
            date: new Date(),
            reprint: 'https:www.baidu.com',
            tags: [
              {
                name: 'CSS',
                href: '#/home'
              },
              {
                name: 'HTML5',
                href: '#/home'
              }
            ],
            content: 'IE8 下面遇到奇怪的问题。本来半透明的 png 图片，竟然一片黑。然而，我明明按照习惯使用了 opacity + filter 的方式。img { opacity: 1; filter: alpha(opacity=1...',
            href: '#/home'
          },
          {
            title: '[文] 笔记：IE 下透明度问题',
            date: new Date(),
            reprint: 'https:www.baidu.com',
            tags: [
              {
                name: 'CSS',
                href: '#/home'
              },
              {
                name: 'HTML5',
                href: '#/home'
              }
            ],
            content: 'IE8 下面遇到奇怪的问题。本来半透明的 png 图片，竟然一片黑。然而，我明明按照习惯使用了 opacity + filter 的方式。img { opacity: 1; filter: alpha(opacity=1...',
            href: '#/home'
          },
          {
            title: '[文] 笔记：IE 下透明度问题',
            date: new Date(),
            reprint: 'https:www.baidu.com',
            tags: [
              {
                name: 'CSS',
                href: '#/home'
              },
              {
                name: 'HTML5',
                href: '#/home'
              }
            ],
            content: 'IE8 下面遇到奇怪的问题。本来半透明的 png 图片，竟然一片黑。然而，我明明按照习惯使用了 opacity + filter 的方式。img { opacity: 1; filter: alpha(opacity=1...',
            href: '#/home'
          },
          {
            title: '[文] 笔记：IE 下透明度问题',
            date: new Date(),
            reprint: 'https:www.baidu.com',
            tags: [
              {
                name: 'CSS',
                href: '#/home'
              },
              {
                name: 'HTML5',
                href: '#/home'
              }
            ],
            content: 'IE8 下面遇到奇怪的问题。本来半透明的 png 图片，竟然一片黑。然而，我明明按照习惯使用了 opacity + filter 的方式。img { opacity: 1; filter: alpha(opacity=1...',
            href: '#/home'
          },
          {
            title: '[文] 笔记：IE 下透明度问题',
            date: new Date(),
            reprint: 'https:www.baidu.com',
            tags: [
              {
                name: 'CSS',
                href: '#/home'
              },
              {
                name: 'HTML5',
                href: '#/home'
              }
            ],
            content: 'IE8 下面遇到奇怪的问题。本来半透明的 png 图片，竟然一片黑。然而，我明明按照习惯使用了 opacity + filter 的方式。img { opacity: 1; filter: alpha(opacity=1...',
            href: '#/home'
          },
          {
            title: '[文] 笔记：IE 下透明度问题',
            date: new Date(),
            reprint: 'https:www.baidu.com',
            tags: [
              {
                name: 'CSS',
                href: '#/home'
              },
              {
                name: 'HTML5',
                href: '#/home'
              }
            ],
            content: 'IE8 下面遇到奇怪的问题。本来半透明的 png 图片，竟然一片黑。然而，我明明按照习惯使用了 opacity + filter 的方式。img { opacity: 1; filter: alpha(opacity=1...',
            href: '#/home'
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

