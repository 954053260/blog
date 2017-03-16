<template>
    <header id="header" class="header">
        <img height="78" width="196" title="logo" class="header-logo" src="src/assets/logo.png">
        <nav class="header-nav">
            <router-link :to="item.to"
                         v-for="(item,i) in navArr">
                <span>{{item.name}}</span>
            </router-link>
        </nav>
    </header>
</template>
<script>
    export default {
        name:'header',
        created: function () {

        },
        data: function () {
            return {
                navArr: [
                    {to: '/home', name: '首页'},
                    {to: '/home', name: '归档'},
                    {to: '/navigation', name: '导航'},
                    {to: '/home', name: '关于'}
                ]
            }
        }
    }
</script>
<style>

</style>
