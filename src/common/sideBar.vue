<template>
    <div id="sideBar" class="side-bar">
        <img height="60" src="src/assets/myQR.png">
        <ul class="nav">
            <li v-for="(item,i) in navArr">
                <router-link :to="item.to">
                    <i class="icon" :class="item.icon"></i>
                    <span class="name">{{item.name}}</span>
                    <i class="icon ion-ios-arrow-right"></i>
                </router-link>
            </li>
            <li class="title">文章分类</li>
            <li class="tags" v-for="(item,i) in tags">
                <a>
                    <span class="tag-number">{{i + 1}}</span>
                    <span class="name">{{item.name}}</span>
                    <i class="icon ion-ios-arrow-right"></i>
                    <span class="nav-note">{{item.number}}</span>
                </a>
            </li>
        </ul>
    </div>
</template>
<script>
    export default {
        name:'sideBar',
        created: function () {

        },
        data: function () {
            return {
                toggle: true,
                navArr: [
                    {to: '/home', icon: 'ion-ios-home', name: '首页'},
                    {to: '/file', icon: 'ion-ios-paper', name: '归档'},
                    {to: '/works', icon: 'ion-ios-camera', name: '作品'},
                    {to: '/navigation', icon: 'ion-ios-navigate', name: '导航'},
                    {to: '/email', icon: 'ion-ios-email', name: '留言'}
                ],
                tags: [
                    {
                        id: '1',
                        name: 'HTML',
                        number: 10
                    },
                    {
                        id: '2',
                        name: 'CSS',
                        number: 12
                    },
                    {
                        id: '3',
                        name: 'JavaScript',
                        number: 52
                    }
                ]
            }
        },
        methods: {

        }
    }
</script>
<style scoped>
    .side-bar{
        position: fixed;
        top: 0;
        bottom: 0;
        left: 0;
        width: 299px;
        color: #555;
        font-size: 14px;
        border-right: 1px solid #ddd;
        text-align: center;
        overflow-y: auto;
        overflow-x: hidden;
    }
    .side-bar > img{
        padding: 20px;
    }
    .side-bar .nav{
        margin-bottom: 20px;
        text-align: left;
    }
    .side-bar .nav a{
        display: block;
        line-height: 25px;
        padding: 10px 20px;
    }
    .side-bar .nav li{
        border-bottom: 1px solid #ddd;
    }
    .side-bar .nav li:first-child{
        border-top: 1px solid #eee;
    }
    .side-bar .nav .icon{
        float: left;
        margin-right: 10px;
        font-size: 25px;
        color: #0678b7;
    }
    .side-bar .nav .ion-ios-arrow-right{
        float: right;
        margin-right: 0;
        margin-left: 10px;
    }
    .side-bar .title{
        padding: 10px 20px;
        font-weight: bold;
    }
    .side-bar .nav-note{
        float: right;
        color: #888;
    }
    .side-bar .tag-number{
        float: left;
        margin-top: 2.5px;
        margin-right: 10px;
        width: 20px;
        height: 20px;
        line-height: 20px;
        text-align: center;
        font-size: 12px;
        color: #fff;
        background: #0678b7;
        border-radius: 4px;
    }
</style>
