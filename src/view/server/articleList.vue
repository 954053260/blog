<template>
    <div id="articleList">
        <h2 class="title">文章列表</h2>
        <p v-if="!isLoad" class="loading mt10 tc">加载...</p>
        <ul v-if="isLoad" class="article-table">
            <li class="row">
                <b class="col">标题</b>
                <b class="w100 tc">时间</b>
                <b class="w40 tc">操作</b>
                <b class="w40 tc">操作</b>
            </li>
            <li class="row" v-for="item in articleList">
                <span class="col font-hide">{{item.title}}</span>
                <span class="w100 tc">{{item.date | date('yyyy-MM-dd')}}</span>
                <a class="w40 tc c-39f">编辑</a>
                <a class="w40 tc c-39f">删除</a>
            </li>
        </ul>
    </div>
</template>
<script type="text/ecmascript-6">
    export default {
        name:'articleList',
        created: function () {
            this.$http.get('article/getAll',{}).then((data) => {
                this.isLoad = true;
                if (data.status == 0) {
                    this.articleList = data.data.list;
                } else {
                    this.$toast.info(data.msg);
                }
            },(err) => {
                this.$toast.info(err.msg);
            });
        },
        destroyed: function () {

        },
        data: function () {
            return {
                articleList: [],
                isLoad: false
            }
        },
        methods: {

        }
    }
</script>
<style scoped>
    .title{
        margin-top: 20px;
        font-size: 16px;
        text-align: center;
    }
    .article-table{
        margin: 20px;
        font-size: 14px;
        color: #333;
        border-left: 1px solid #ccc;
        border-top: 1px solid #ccc;
    }
    .article-table span,
    .article-table b,
    .article-table a{
        padding: 8px 10px;
        border-right: 1px solid #ccc;
        border-bottom: 1px solid #ccc;
    }
</style>
