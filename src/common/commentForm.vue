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
                <label class="dp-n"><input  name="articleId" :value="articleId"/></label>
                <label class="dp-n"><input  name="refId" :value="refId"/></label>
                <input type="submit" class="submit" value="提交评论" @click="submitComment()">
            </p>
        </div>
    </div>
</template>
<script>
    export default {
        name:'commentForm',
        created: function () {

        },
        props: ['param','articleId','refId'],
        data: function () {
            return {
                author: '',
                email: '',
                text: ''
            }
        },
        methods: {
            submitComment: function () {
                this.$emit('submitComment',{
                    id: '',
                    date: new Date(),
                    author: this.author,
                    email: this.email,
                    text: this.text,
                    param: this.param
                });
            }
        }
    }
</script>
<style>

</style>
