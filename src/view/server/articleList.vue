<template>
    <div id="articleList">
        <h2 class="title">文章列表</h2>
        <ul v-if="!isLoad" class="m20 i-table">
            <li class="i-tr">
                <b class="i-td i-td-1">标题</b>
                <b class="i-td w100 tc">时间</b>
                <b class="i-td w40 tc">操作</b>
                <b class="i-td w40 tc">操作</b>
            </li>
            <li class="i-tr" v-for="(item, index) in articleList">
                <span class="i-td i-td-1 font-hide">{{item.title}}</span>
                <span class="i-td w100 tc">{{item.date | date('yyyy-MM-dd')}}</span>
                <a class="i-td w40 tc c-39f" @click="edit(index)">编辑</a>
                <a class="i-td w40 tc c-39f" @click="remove(index)">删除</a>
            </li>
        </ul>
    </div>
</template>
<script type="text/ecmascript-6">
    export default {
        name:'articleList',
        created: function () {
            this.$loading.show();
            this.$http.get('article/getAll',{}).then((data) => {
                this.isLoad = this.$loading.hide();
                if (data.status == 0) {
                    this.articleList = data.data.list;
                } else {
                    this.$toast.info(data.msg);
                }
            },(err) => {
                this.isLoad = this.$loading.hide();
                this.$toast.info(err.msg);
            });
        },
        destroyed: function () {

        },
        data: function () {
            return {
                articleList: [],
                isLoad: true
            }
        },
        methods: {
            edit: function (index) {
                this.$toast.info('编辑文章接口暂未实现！')
            },
            remove: function (index) {
                this.$dialog.confirm({
                    content: '确定要删除此篇文章吗？',
                    onOk: () => {
                        this.articleList.splice(index,1);
                        this.$toast.info('删除文章接口暂未实现！')
                    }
                });
            }
        }
    }
</script>
<style scoped>
    .title{
        margin-top: 20px;
        font-size: 16px;
        text-align: center;
    }
</style>
