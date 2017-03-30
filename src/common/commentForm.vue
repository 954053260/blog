<template>
    <div id="commentForm">
        <div class="comment-form">
            <p>
                <label>
                    昵称: <input name="author" maxlength="20" v-model="author">
                </label>
            </p>
            <p>
                <label>
                    邮件: <input name="email" maxlength="20" v-model="email">
                </label>
            </p>
            <p>
                <label>
                    <textarea placeholder="输入评论..." v-model="text"></textarea>
                </label>
            </p>
            <p>
                <button class="submit" @click="submitComment()">
                    <span v-if="!loading">提交评论</span>
                    <span v-else>Loading...</span>
                </button>
            </p>
        </div>
    </div>
</template>
<script type="text/ecmascript-6">
    export default {
        name:'commentForm',
        created: function () {

        },
        props: ['param','articleId','refId'],
        data: function () {
            return {
                loading: false,
                author: '',
                email: '',
                text: ''
            }
        },
        methods: {
            submitComment: function () {
                this.loading = true;
                this.$http.post('article/submitComment',{data: {
                    text: this.text,
                    author: this.author,
                    email: this.email,
                    refId: this.refId,
                    articleId: this.articleId,
                }}).then((data) => {
                    this.loading = false;
                    if (data.status == 0) {
                        this.$emit('submitComment',{
                            id: data.data.id,
                            date: new Date(),
                            author: this.author,
                            email: this.email,
                            text: this.text,
                            param: this.param
                        });
                    } else {
                        this.$toast.info(data.msg);
                    }
                },(err) => {
                    this.loading = false;
                    this.$toast.info(err.msg);
                });
            }
        }
    }
</script>
<style scoped>
    .comment-form p{
        margin: 10px 0;
        line-height: 30px;
    }
    .comment-form label{
        color: #666;
    }
    .comment-form input{
        height: 28px;
        width: 250px;
        border: 1px solid #39f;
    }
    .comment-form textarea{
        display: block;
        padding: 5px;
        width: 100%;
        max-width: 450px;
        height: 200px;
        border: 1px solid #39f;
    }
    .comment-form .submit{
        display: inline-block;
        color: #fff;
        background-color: #39f;
        cursor: pointer;
        user-select: none;
        padding: 6px 15px;
        font-size: 12px;
        border-radius: 4px;
        border: 1px solid #39f;
        white-space: nowrap;
        line-height: 1.5;
    }
</style>
