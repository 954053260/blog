<template>
    <div id="sideBar" class="side-bar" style="left: 0">
        <i class="toggle icon" :class="{'ion-ios-arrow-left': toggle,'ion-ios-arrow-right': !toggle}" @click="toggleSide()"></i>
        <img height="60" src="src/assets/myQR.png">
        <ul class="nav">
            <li v-for="(item,i) in navArr">
                <router-link :to="item.to">
                    <i class="icon" :class="item.icon"></i>
                    <span>{{item.name}}</span>
                    <i class="icon ion-ios-arrow-right"></i>
                </router-link>
            </li>
        </ul>
    </div>
</template>
<script>
    export default {
        name:'sideBar',
        created: function () {

        },
        data: function () {
            return {
                toggle: true,
                navArr: [
                    {to: '/home', icon: 'ion-ios-home', name: '首页'},
                    {to: '/works', icon: 'ion-ios-camera', name: '作品'},
                    {to: '/navigation', icon: 'ion-ios-navigate', name: '导航'},
                    {to: '/about', icon: 'ion-ios-paper', name: '关于'},
                    {to: '/email', icon: 'ion-ios-email', name: '留言'}
                ]
            }
        },
        methods: {
            toggleSide: function () {
                var left = parseInt(this.$el.style.left.replace('px',0));
                this.toggle = left != 0;
                if (this.toggle) {
                    this.$el.style.left = 0;
                } else {
                    this.$el.style.left = '-300px';
                }
                this.$emit('toggleSide', {toggle: this.toggle, width: 300});
            }
        }
    }
</script>
<style scoped>
    .side-bar{
        position: fixed;
        top: 0;
        bottom: 0;
        left: 0;
        width: 300px;
        color: #555;
        border-right: 1px solid #ddd;
        text-align: center;
        z-index: 9999;
        transition: left .3s;
        -moz-transition: left .3s;	/* Firefox 4 */
        -webkit-transition: left .3s;	/* Safari 和 Chrome */
        -o-transition: left .3s;	/* Opera */
    }
    .side-bar > img{
        padding: 20px;
    }
    .side-bar .nav{
        text-align: left;
    }

    .side-bar .nav a{
        display: block;
        line-height: 25px;
        padding: 10px 20px;
    }
    .side-bar .nav li{
        border-bottom: 1px solid #ddd;
    }
    .side-bar .nav li:first-child{
        border-top: 1px solid #eee;
    }
    .side-bar .nav .icon{
        float: left;
        margin-right: 10px;
        font-size: 25px;
    }
    .side-bar .nav .ion-ios-arrow-right{
        float: right;
        margin-right: 0;
    }
    .side-bar .toggle{
        position: absolute;
        right: -30px;
        top: 10px;
        color: #fff;
        width: 30px;
        background: rgba(0, 0, 0, 0.5);
        cursor: pointer;
    }
</style>
