<template>
    <div id="articleDetail">
        <div class="p0-20">
            <article>
                <h2 class="article-title">{{detail.title}}</h2>
                <p class="article-date">
                    <span>作者: <b>{{detail.author}}</b></span>
                    <span>日期: <b>{{detail.date | date('yyyy-MM-dd')}}</b></span>
                </p>
                <section class="markdown-body" v-html="detail.detail"></section>
            </article>
            <div class="comment-content">
                <h3>评论</h3>
                <comment-form :articleId="articleId" @submitComment="submitComment"></comment-form>
                <ul class="comment-list">
                    <li class="comment-item" v-for="(item,index) in commentList">
                        <b>{{index + 1}}.</b>
                        <div class="comment-item-content">
                            <p class="author"><b>{{item.author}}:</b></p>
                            <p class="date">{{item.date | date('yyyy-MMMM-dddd')}}</p>
                            <p class="text">{{item.text}}</p>
                            <a class="c-00afec" @click="reply(index)"><b>回复</b></a>
                            <a class="fr c-999" @click="getComment(item.id,index)">
                                <span v-if="item.reply && item.reply.isLoading">loading...</span>
                                <span v-else>查看回复详情<i class="icon ion-ios-arrow-right"></i></span>
                            </a>
                            <comment-form v-if="item.replyShow" :param="index" :refId="item.id" @submitComment="submitComment"></comment-form>
                            <ul v-if="item.reply && item.reply.list.length > 0"  class="comment-list">
                                <li class="comment-item" v-for="item in item.reply.list">
                                    <div class="comment-item-content">
                                        <p class="author"><b>{{item.author}}:</b></p>
                                        <p class="date">{{item.date | date('yyyy-MMMM-dddd')}}</p>
                                        <p class="text">{{item.text}}</p>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</template>
<script type="text/ecmascript-6">
    import commentForm from '../common/commentForm.vue'
    export default {
        name: 'articleDetail',
        created: function () {
            this.articleId = this.$route.query.id;
            this.getDetail();
            this.getComment();
        },
        components: {'commentForm': commentForm},
        data: function () {
            return {
                commentList: [],
                articleId: '',
                detail: ''
            }
        },
        methods: {
            getDetail: function () {
                this.$http.get('article/detail',{data: {
                    id: this.articleId
                }}).then((data) => {
                    if (data.status == 0) {
                        this.detail = data.data.detail;
                    } else {
                        this.$Message.error(data.msg);
                    }
                },(err) => {
                    this.$Message.error(err.msg);
                });
            },
            /**
             * @param id 评论id
             * @param index 评论索引
             */
            getComment: function (id,index) {
                var type = 1;
                if (id) {
                    type = 2;
                    if (this.commentList[index].reply == undefined) {
                        this.$set(this.commentList[index],'reply',{
                            isLoading: true,
                            list: []
                        });
                    } else {
                        if (type == 2) this.commentList[index].reply.isLoading = true;
                    }
                }
                var type = id ? 2 : 1;
                this.$http.get('article/comment',{data: {
                    id: id || this.articleId,
                    type: type
                }}).then((data) => {
                    if (type == 2) this.commentList[index].reply.isLoading = false;
                    if (data.status == 0) {
                        if (type == 1) {
                            this.commentList = data.data.list;
                        }else{
                            this.commentList[index].reply.list = data.data.list;
                        }
                    } else {
                        this.$Message.error(data.msg);
                    }
                },(err) => {
                    if (type == 2) this.commentList[index].reply.isLoading = false;
                    this.$Message.error(err.msg);
                });
            },
            reply: function (index) {
                if (this.commentList[index].replyShow === undefined) {
                    this.$set(this.commentList[index], 'replyShow', false);
                }
                this.commentList[index].replyShow = !this.commentList[index].replyShow;
            },
            submitComment: function (data) {
                var index = data.param;
                if (index || index == 0) {
                    this.reply(index);
                    if (this.commentList[index].reply == undefined) {
                        this.$set(this.commentList[index], 'reply', {
                            isLoading: false,
                            list: []
                        });
                    }
                    this.commentList[index].reply.list.unshift({
                        id: data.id,
                        text: data.text,
                        date: data.date,
                        author: data.author
                    });
                } else {
                    this.commentList.unshift({
                        id: data.id,
                        text: data.text,
                        date: data.date,
                        author: data.author
                    });
                }
            }
        }
    }
</script>
<style scoped>
    .article-title{
        margin: 0.65em 0;
        color: #2c3e50;
        font-size: 16px;
        text-align: center;
    }
    .article-date{
        margin-bottom: 16px;
        font-size: 14px;
        color: #2c3e50;
        text-align: center;
    }
    .article-date span{
        margin: 0 5px;
    }
    .article-date b{
        color: #39f;
    }
    .comment-content{
        margin-top: 20px;
    }
    .comment-content h3{
        margin-bottom: 10px;
        font-size: 16px;
    }
    .comment-list{
        font-size: 14px;
    }
    .comment-item > b{
        float: left;
        padding-right: 5px;
        line-height: 34px;
    }
    .comment-item .comment-item-content{
        margin-bottom: 20px;
        padding: 5px 10px;
        border: 1px solid #ddd;
        overflow: hidden;
        background: #f8f8f8;
    }
    .comment-list .comment-list{
        margin-top: 20px;
        font-size: 12px;
    }
    .comment-list .comment-list .comment-item-content{
        background: #eee;
    }
    .comment-item-content p{
        line-height: 1.5;
    }
    .comment-item-content .date{
        color: #39f;
    }
    .comment-item-content .text{
        margin: 10px 0;
    }
</style>
