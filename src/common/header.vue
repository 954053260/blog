<template>
    <header id="header" class="header">
        <img height="78" width="196" title="logo" class="header-logo" src="src/assets/logo.png">
        <p class="text">开始新的旅途，记录每个瞬间</p>
    </header>
</template>
<script>
    export default {
        name:'header',
        created: function () {

        },
        data: function () {
            return {

            }
        }
    }
</script>
<style scoped>
    .header{
        padding: 20px;
        height: 78px;
        text-align: center;
        font-size: 16px;
    }
    .header-logo{
        float: left;
    }
    .header .text{
        float: right;
        font-family: 隶书;
        font-weight: bold;
        font-style: italic;
        color: #333;
    }
</style>
