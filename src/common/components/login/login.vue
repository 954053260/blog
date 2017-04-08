<template>
    <div id="login" class="login">
        <h3 class="login-title">登录</h3>
        <div>
            <label class="login-input">
                <i class="icon ion-person"></i>
                <input placeholder="用户名" v-model="username">
            </label>
            <label class="login-input">
                <i class="icon ion-locked"></i>
                <input type="password" placeholder="密码" v-model="password">
            </label>
            <a class="login-btn btn btn-39f" @click="login">登录</a>
        </div>
    </div>
</template>
<script type="text/ecmascript-6">
    export default {
        name:'login',
        created: function () {

        },
        props: [],
        data: function () {
            return {
                username: '',
                password: ''
            }
        },
        methods: {
            login: function () {
                this.$emit('login',{
                    username: this.username,
                    password: this.password
                });
            }
        }
    }
</script>
<style scoped>
    .login{
        position: fixed;
        left: 50%;
        margin-left: -150px;
        width: 258px;
        padding: 20px;
        background: #fff;
        border: 1px solid #ddd;
        box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.7);
        transition: all .3s ease-in;
        z-index: 1000;
    }
    .login-title{
        font-size: 16px;
        color: #39f;
        text-align: center;
    }
    .login-input{
        display:-webkit-box;
        display:-webkit-flex;
        display:-ms-flexbox;
        display:flex;
        margin-top: 10px;
    }
    .login-input > i {
        padding: 8px 14px;
        font-size: 20px;
        color: #39f;
        border: 1px solid #ddd;
        border-right: none;
    }
    .login-input > input{
        -webkit-box-flex:1;
        -webkit-flex:1;
        -ms-flex:1;
        flex:1;
        padding: 5px;
        border: 1px solid #ddd;
    }
    .login-btn{
        margin-top: 10px;
        line-height: 25px;
        display: block;
        text-align: center;
    }
</style>
