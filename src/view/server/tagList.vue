<template>
    <div id="tagList">
        <h2 class="title">标签列表</h2>
        <a class="m20 mb10 btn btn-39f" @click="add()">
            <i class="icon ion-plus-round"></i>
            添加新标签
        </a>
        <ul v-if="!isLoad" class="m20 mt0 i-table">
            <li class="i-tr">
                <b class="i-td i-td-1">名称</b>
                <b class="i-td w40 tc">操作</b>
                <b class="i-td w40 tc">操作</b>
            </li>
            <li class="i-tr" v-for="(item, index) in tags">
                <span class="i-td i-td-1 font-hide">{{item.name}}</span>
                <a class="i-td w40 tc c-39f" @click="edit(index)">编辑</a>
                <a class="i-td w40 tc c-39f" @click="remove(index)">删除</a>
            </li>
        </ul>
    </div>
</template>
<script type="text/ecmascript-6">
    export default {
        name:'tagList',
        created: function () {
            this.$loading.show();
            this.$http.get('article/tags',{}).then((data) => {
                this.isLoad =  this.$loading.hide();
                if (data.status == 0) {
                    data.data.list.shift();
                    this.tags = data.data.list;
                } else {
                    this.$toast.info(data.msg);
                }
            },(err) => {
                this.isLoad =  this.$loading.hide();
                this.$toast.info(err.msg);
            });
        },
        destroyed: function () {

        },
        data: function () {
            return {
                tags: [],
                isLoad: true,
                tagName: 'ASDASD'
            }
        },
        methods: {
            add: function () {
                this.$dialog.confirm({
                    title: '添加新标签',
                    content: `<label class="tag-confirm"><b>名称:</b><input id="tag-name"/></label>`,
                    onOk: () => {
                        this.tagName = document.querySelector('#tag-name').value;
                        alert(this.tagName);
                    }
                });
            },
            edit: function (index) {
                this.$toast.info('编辑标签接口暂未实现！')
            },
            remove: function (index) {
                this.$dialog.confirm({
                    content: '确定要删除此标签吗？',
                    onOk: () => {
                        this.tags.splice(index,1);
                        this.$toast.info('删除标签接口暂未实现！')
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
