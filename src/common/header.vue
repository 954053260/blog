<template>
    <header id="header" class="header">
        <img title="logo" class="header-logo" src="../assets/logo.png">
        <div class="text">
            <p>work space</p>
            <p>开始新的旅途记录每个瞬间</p>
        </div>
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
    }
    .header-logo{
        float: left;
        height: 78px;
    }
    .header .text{
        float: left;
        text-align: left;
        padding: 15px 10px;
        line-height: 24px;
        color: #999;
        font-size: 14px;
    }
    .header .text p:first-child{
        font-size: 20px;
        font-weight: bold;
        color: #333;
    }
</style>
