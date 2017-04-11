<template>
    <div id="vue-audio" class="vue-audio">
        <audio rel="audio" style="display: none"></audio>
        <div class="a-img">
            <img v-imgload :src="picture" height="50px" width="50px">
        </div>
        <div class="a-main-area">
            <div class="a-main">
                <div class="a-music-info">
                    <div class="a-chanel">
                        {{singer}}
                    </div>
                    <div class="a-song-info">
                        <p class="a-song-info-scroll">{{name}}</p>
                    </div>
                </div>
                <div class="a-control-btn">
                    <div class="a-prev-btn hover" title="上一首"></div>
                    <div class="a-play-btn hover" title="播放"></div>
                    <div class="a-next-btn hover" title="下一首"></div>
                    <div class="a-switch-btn hover" title="循环播放"></div>
                    <div class="a-progress-wrapper hover" @click="setProgress($event)">
                        <div class="a-progress-bar">
                            <div class="a-progress-bar-past">
                                <span class="a-progress-point"></span>
                            </div>
                        </div>
                    </div>
                    <div class="time-total hover">00:51</div>
                    <div class="a-lrc-btn hover" title="歌词"></div>
                    <div class="a-volume-btn hover"></div>
                    <div class="a-more-btn hover" title="更多"></div>
                </div>
            </div>
        </div>
    </div>
</template>
<script type="text/ecmascript-6">
    export default {
        name:'vue-audio',
        created: function () {

        },
        mounted: function () {

        },
        data: function () {
            return {
                process: 20,
                picture: 'https://ss0.baidu.com/8_1ZdTmk2RIF8t7jm9iCKT-xh_/data2/pic/261061922/261061922.jpg@s_0,w_90',
                singer: 'Eminem',
                name: '国语你说我说-千与千寻',
                url: 'http://www.codebasehero.com/files/music-player-1.0.1/demo/mix/2.mp3',
            }
        },
        methods: {
            setProgress: function (e) {
                var target = e.target;
                var x = e.offsetX;
                switch (target.className) {
                    case 'a-progress-wrapper hover':
                    case 'a-progress-bar':
                        target.querySelector('.a-progress-bar-past').style.width = x + 'px';
                        break;
                    case 'a-progress-bar-past':
                        target.style.width = x + 'px';
                        break;
                }
            }
        }
    }
</script>
<style scoped>
    .vue-audio{
        position: fixed;
        left: 300px;
        right: 0;
        z-index: 99999;
        background: #10141d;
        color: #fff;
        width: 663px;
        overflow: hidden;
        box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.7);
    }
    .a-img{
        float: left;
    }
    .a-img > img{
        display: block;
    }
    .a-music-info{
        float: left;
        margin: 0 15px 0 10px;
        width: 120px;
        height: 50px;
        font-size: 13px;
        overflow: hidden;
    }
    .a-chanel{
        margin-top: 5px;
        padding-left: 26px;
        line-height: 23px;
        height: 20px;
        background: url('../assets/music-spirit.png') no-repeat 0 0;
        background-position: -149px 0;
        z-index: 1;
    }
    .a-song-info{
        position: relative;
        height: 25px;
        line-height: 25px;
    }
    .a-song-info-scroll{
        position: absolute;
        top: 0;
        left: 0;
        white-space: nowrap;
    }
    .a-control-btn{
        float: left;
        height: 50px;
        overflow: hidden;
    }
    .a-prev-btn,
    .a-play-btn,
    .a-next-btn,
    .a-switch-btn,
    .a-lrc-btn,
    .a-volume-btn,
    .a-more-btn{
        float: left;
        margin: 15px 15px 0 0;
        height: 20px;
        cursor: pointer;
        opacity: .8;
        background: url('../assets/music-spirit.png') no-repeat 0 0;
    }
    .a-prev-btn{
        width: 15px;
        background-position: -4px -98px;
    }
    .a-play-btn{
        width: 16px;
        background-position: -188px -98px;
    }
    .a-next-btn{
        width: 16px;
        background-position: -83px -98px;
    }
    .a-switch-btn{
        width: 20px;
        background-position: -119px -98px;
    }
    .a-lrc-btn{
        width: 16px;
        background-position: -32px -196px;
    }
    .a-volume-btn{
        position: relative;
        width: 16px;
        background-position: -59px -196px;
    }
    .a-more-btn{
        width: 16px;
        background-position: -85px -196px;
    }
    .a-progress-wrapper{
        float: left;
        margin-top: 5px;
        padding: 19px 0;
        width: 180px;
        cursor: pointer;
        opacity: .8;
    }
    .a-progress-bar{
        float: left;
        width: 100%;
        height: 2px;
        background-color: #ccc;
        text-align: left;
        overflow: visible;
    }
    .a-progress-bar-past{
        position: relative;
        height: 100%;
        width: 0;
        background-color: #39f;
    }
    .a-progress-point{
        position: absolute;
        width: 10px;
        height: 10px;
        right: -3px;
        top: -4px;
        cursor: pointer;
        background: url('../assets/music-spirit.png') no-repeat -53px -750px;
    }
    .time-total{
        float: left;
        margin-left: 10px;
        margin-right: 25px;
        line-height: 50px;
        color: #fff;
        font-size: 13px;
        opacity: .8;
    }
    .hover:hover{
        opacity: 1;
    }
</style>
