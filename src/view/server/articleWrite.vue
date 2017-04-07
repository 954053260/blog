<template>
    <div id="articleWrite">
        <h2 class="title">发布文章</h2>
        <div class="write-content">
            <p>作者:</p>
            <label class="input-title">
                <input v-model="author">
            </label>
            <p>标题:</p>
            <label class="input-title">
                <input v-model="title">
            </label>
            <p>内容:</p>
            <label class="input-content">
                <textarea v-model="content"></textarea>
            </label>
            <p>分类:</p>
            <div class="write-tags">
                <p v-if="!tags.length" class="loading">加载...</p>
                <div v-if="tags.length">
                    <checkbox  v-for="tag in tags" v-model="tag.checked" name="tags" class="write-tag">{{tag.name}}</checkbox>
                </div>
            </div>
            <div class="write-submit">
                <button class="btn btn-39f" @click="submit">{{isSubmitting ? '提交中...' : '提交'}}</button>
            </div>
        </div>
    </div>
</template>
<script type="text/ecmascript-6">
    export default {
        name:'articleWrite',
        created: function () {
            this.$http.get('article/tags',{}).then((data) => {
                if (data.status == 0) {
                    data.data.list.shift();
                    data.data.list.forEach(function (item) {
                        item.checked = false;
                    });
                    this.tags = data.data.list;
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
                author: '唐正',
                title: '',
                content: '',
                tags: [],
                isSubmitting: false
            }
        },
        methods: {
            init: function () {
                this.author = '唐正';
                this.title = '';
                this.content = '';
                return this;
            },
            submit: function () {
                if (this.isSubmitting) {
                    return;
                }
                this.isSubmitting = true;
                var tag = [];
                this.tags.forEach(function (item) {
                    item.checked && tag.push(item.id);
                });
                this.$http.post('article/save',{data: {
                    author: this.author,
                    title: this.title,
                    detail: this.content,
                    tag: tag.join()
                }}).then((data) => {
                    this.isSubmitting = false;
                    if (data.status == 0) {
                        this.$toast.info('保存文章成功！');
                        this.init();
                    } else {
                        this.$toast.info(data.msg);
                    }
                },(err) => {
                    this.isSubmitting = false;
                    this.$toast.info(err.msg);
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
    .write-content{
        margin: 20px;
    }
    .write-content > p{
        margin-top: 10px;
        font-size: 14px;
        font-weight: bold;
        line-height: 25px;
    }
    .input-title{
        display: block;
        border: 1px solid #ddd;
    }
    .input-title > input{
        width: 100%;
        line-height: 25px;
        border: none;
    }
    .input-content{
        display: block;
        border: 1px solid #ddd;

    }
    .input-content textarea{
        width: 100%;
        max-width: 100%;
        min-height: 200px;
        border: none;
    }
    .write-tags{
        height: 25px;
        line-height: 25px;
    }
    .write-tag{
        margin-right: 10px;
    }
    .write-submit{
        margin-top: 20px;
        text-align: center;
    }
    .write-submit button{
        width: 300px;
        height: 23px;
    }
</style>
