<template>
    <div id="server">
        <div class="server-header">
            <router-link to="/app/home"><img src="../../assets/logo.png" class="server-logo"></router-link>
            <div class="server-logo-title">
                <p>博客管理</p>
                <p class="text">开始新的旅途，记录每个瞬间</p>
            </div>
        </div>
        <div class="server-side-bar">
            <ul class="server-nav">
                <li v-for="(item, index) in navArr">
                    <router-link :to="item.to" class="server-nav-item" :class="{'active': index == navIndex}">
                        <i class="icon" :class="item.icon"></i>
                        <span class="name">{{item.title}}</span>
                        <i class="icon ion-ios-arrow-right ion-right"></i>
                    </router-link>
                </li>
            </ul>
        </div>
        <div class="server-content">
            <router-view></router-view>
        </div>
    </div>
</template>
<script type="text/ecmascript-6">
    export default {
        name:'server',
        created: function () {
            this.setNavIndex(this.$router.currentRoute.path);
        },
        destroyed: function () {

        },
        data: function () {
            return {
                navArr: [
                    {
                        icon: 'ion-edit',
                        to: '/server/write',
                        title: '发布文章'
                    },
                    {
                        icon: 'ion-ios-list',
                        to: '/server/list',
                        title: '文章列表'
                    },
                    {
                        icon: 'ion-ios-pricetags',
                        to: '/server/addTag',
                        title: '添加标签'
                    }
                ],
                navIndex: 0
            }
        },
        computed: {

        },
        methods: {
            setNavIndex: function (path) {
                switch (path) {
                    case '/server/write':
                        this.navIndex = 0;
                        break;
                    case '/server/list':
                        this.navIndex = 1;
                        break;
                    case '/server/addTag':
                        this.navIndex = 2;
                        break;
                }
            }
        },
        watch: {
            '$route': function (to, from) {
                this.setNavIndex(to.path);
            }
        }
    }
</script>
<style scoped>
    .server-header {
        padding: 20px;
        background: #eee;
    }
    .server-logo{
        display: inline-block;
        vertical-align: middle;
        height: 40px;
    }
    .server-logo-title{
        display: inline-block;
        vertical-align: middle;
        line-height: 20px;
        font-size: 16px;
        font-weight: bold;
        color: #39f;
    }
    .server-logo-title .text{
        color: #999;
        font-size: 14px;
        font-weight: normal;
    }
    .server-side-bar{
        position: fixed;
        top: 80px;
        bottom: 0;
        left: 0;
        width: 200px;
        color: #fff;
        font-size: 14px;
        background: #36648B;
        overflow-y: auto;
        overflow-x: hidden;
    }
    .server-nav{

    }
    .server-nav-item{
        display: block;
        line-height: 25px;
        padding: 8px 16px;
        border-bottom: 1px solid #104E8B;
    }
    .server-nav-item.active{
        background: #104E8B;
    }
    .server-nav-item .name{
        margin-left: 10px;
    }
    .server-nav-item .icon{
        float: left;
        font-size: 20px;
    }
    .server-nav-item .ion-right{
        float: right;
        margin-right: 0;
        margin-left: 10px;
    }
    .server-content{
        position: absolute;
        top: 80px;
        right: 0;
        bottom: 0;
        left: 200px;
        padding: 10px;
        overflow-y: auto;
        overflow-x: hidden;
    }
</style>
