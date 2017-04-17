<template>
    <div id="vue-audio" class="vue-audio">
        <audio ref="audio" :src="list[index].url" style="display: none"></audio>
        <div class="a-img">
            <img v-imgload :src="list[index].picture" height="50" width="50">
        </div>
        <div class="a-main-area">
            <div class="a-main">
                <div class="a-music-info">
                    <div class="a-chanel">
                        {{list[index].singer}}
                    </div>
                    <div class="a-song-info">
                        <p class="a-song-info-scroll">{{list[index].name}}</p>
                    </div>
                </div>
                <div class="a-control-btn">
                    <a class="a-prev-btn hover" title="上一首" @click="clickPrev"></a>
                    <a class="a-play-btn hover" :class="{'a-pause-btn': isPlay, 'a-play-btn': !isPlay}" title="播放" @click="clickPlay()"></a>
                    <a class="a-next-btn hover" title="下一首" @click="clickNext"></a>
                    <a class="hover"
                       :title="switchText"
                       :class="{'a-switch-btn': !isLoop, 'a-switch-singe-btn': isLoop}"
                       @click="toggleLoop()"></a>
                    <a class="a-progress-wrapper hover" @click="clickProgress($event)">
                        <div class="a-progress-bar">
                            <div ref="progress" class="a-progress-bar-past">
                                <span class="a-progress-point"></span>
                            </div>
                        </div>
                    </a>
                    <span class="time-total hover">{{time}}</span>
                    <a class="a-lrc-btn hover" title="歌词"></a>
                    <a class="a-volume-btn hover">
                        <a class="a-volume-progress" @click="clickProgress($event)">
                            <div class="a-volume-progress-bar">
                                <div ref="volume-progress" class="a-volume-progress-bar-past">
                                    <span class="a-progress-point"></span>
                                </div>
                            </div>
                        </a>
                    </a>
                    <a class="a-more-btn hover" title="更多" @click="toggleList"></a>
                </div>
            </div>
        </div>
        <ul ref="list" class="a-list">
            <li v-for="(item, i) in list" :class="{active: i == index}" @click="select(i)">
                <b>{{i + 1}}</b>
                <span>{{item.name}}</span>
                <span class="note">{{item.singer}}</span>
            </li>
        </ul>
    </div>
</template>
<script type="text/ecmascript-6">
    export default {
        name:'vue-audio',
        created: function () {

        },
        mounted: function () {
            var audio = this.$refs.audio;
            audio.volume = 1;
            audio.onloadstart = () => {
                this.$refs.progress.style.width = 0;
                this.isPlay ? audio.play() : audio.pause();
                this.ontimeupdate();
            };
            audio.ontimeupdate = () => {
                this.ontimeupdate();
            };
            audio.onended = () => {
                if (!audio.loop) {
                    this.isPlay = true;
                    this.clickNext();
                }
            };
            audio.onplay = () => {
                this.isPlay = true;
            };
            audio.onpause = () => {
                this.isPlay = false;
            };
            audio.onerror = () => {
                this.$toast.info('音乐加载失败！');
            };
        },
        data: function () {
            return {
                isPlay: false,
                isLoop: false,
                time: '00:00',
                index: 0,
                list: [
                    {
                        picture: 'https://ss0.baidu.com/8_1ZdTmk2RIF8t7jm9iCKT-xh_/data2/pic/261061922/261061922.jpg@s_0,w_90',
                        singer: '歌手1',
                        name: '歌名1',
                        url: 'http://www.codebasehero.com/files/music-player-1.0.1/demo/mix/1.mp3'
                    },
                    {
                        picture: 'https://ss0.baidu.com/8_1ZdTmk2RIF8t7jm9iCKT-xh_/data2/pic/261061922/261061922.jpg@s_0,w_90',
                        singer: '歌手2',
                        name: '歌名2',
                        url: 'http://www.codebasehero.com/files/music-player-1.0.1/demo/mix/2.mp3'
                    },
                    {
                        picture: 'https://ss0.baidu.com/8_1ZdTmk2RIF8t7jm9iCKT-xh_/data2/pic/261061922/261061922.jpg@s_0,w_90',
                        singer: '歌手3',
                        name: '歌名3',
                        url: 'http://www.codebasehero.com/files/music-player-1.0.1/demo/mix/3.mp3'
                    },
                    {
                        picture: 'https://ss0.baidu.com/8_1ZdTmk2RIF8t7jm9iCKT-xh_/data2/pic/261061922/261061922.jpg@s_0,w_90',
                        singer: '歌手4',
                        name: '歌名4',
                        url: 'http://www.codebasehero.com/files/music-player-1.0.1/demo/mix/4.mp3'
                    },
                    {
                        picture: 'https://ss0.baidu.com/8_1ZdTmk2RIF8t7jm9iCKT-xh_/data2/pic/261061922/261061922.jpg@s_0,w_90',
                        singer: '歌手5',
                        name: '歌手5',
                        url: 'http://www.codebasehero.com/files/music-player-1.0.1/demo/mix/5.mp3'
                    },
                    {
                        picture: 'https://ss0.baidu.com/8_1ZdTmk2RIF8t7jm9iCKT-xh_/data2/pic/261061922/261061922.jpg@s_0,w_90',
                        singer: '歌手6',
                        name: '歌名6',
                        url: 'http://www.codebasehero.com/files/music-player-1.0.1/demo/mix/6.mp3'
                    }
                ]
            }
        },
        computed: {
          switchText: function () {
             return this.isLoop ? '单曲循环' : '循环播放'
          }
        },
        methods: {
            clickPlay: function () {
                console.log(this.isPlay)
                if (this.isPlay) {
                    this.$refs.audio.pause();
                } else {
                    this.$refs.audio.play();
                }
            },
            toggleLoop: function () {
                this.isLoop = !this.isLoop;
                this.$refs.audio.loop = this.isLoop;
            },
            toggleList: function () {
                var listNode = this.$refs.list;
                if (listNode.offsetHeight) {
                    listNode.style.height = 0;
                } else {
                    listNode.style.height = 37*this.list.length + 'px';
                }
            },
            select: function (index) {
                this.index = index;
            },
            clickPrev: function () {
                if (this.index == 0) {
                    this.index = this.list.length - 1;
                } else {
                    this.index -= 1;
                }
            },
            clickNext: function () {
                if (this.index == this.list.length - 1) {
                    this.index = 0;
                } else {
                    this.index += 1;
                }
            },
            clickProgress: function (e) {
                var target = e.target;
                var x = e.offsetX;
                var y = target.offsetHeight - e.offsetY;
                switch (target.className) {
                    case 'a-progress-wrapper hover':
                    case 'a-progress-bar':
                        target = target.querySelector('.a-progress-bar-past');
                        break;
                    case 'a-volume-progress':
                    case 'a-volume-progress-bar':
                        target = target.querySelector('.a-volume-progress-bar-past');
                        break;
                    case 'a-progress-bar-past':
                    case 'a-volume-progress-bar-past':
                        break;
                    default :
                        return;
                }
                if (target.className == 'a-progress-bar-past') {
                    target.style.width = x + 'px';
                    this.setTime(x/(target.parentNode.offsetWidth)*this.$refs.audio.duration);
                } else {
                    target.style.height = y + 'px';
                    this.setVolume(y/target.parentNode.offsetHeight);
                }
            },
            ontimeupdate: function () {
                var audio = this.$refs.audio;
                var duration = audio.duration;
                var currentTime = audio.currentTime;
                if (isNaN(duration) || isNaN(currentTime)) {
                    return;
                }
                var time = duration - currentTime;
                var minute = parseInt(time/60);
                var second = Math.ceil(time%60);
                if (minute < 10) minute = '0' + minute;
                if (second < 10) second = '0' + second;
                this.time = minute + ':' + second;
                this.$refs.progress.style.width = currentTime/duration*100 + '%';
            },
            setTime: function (time) {
                this.$refs.audio.currentTime = time;
            },
            setVolume: function (volume) {
                this.$refs.audio.volume = Math.min(volume.toFixed(1), 1);
            }
        }
    }
</script>
<style scoped>
    .vue-audio{
        position: fixed;
        left: 50%;
        margin-left: -335px;
        bottom: 0;
        z-index: 10000;
        color: #fff;
        width: 670px;
        box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.7);
        background: rgba(51, 153, 255, 0.9);
    }
    .vue-audio:after,
    .a-main-area:after{
        clear: both;
        content: '.';
        display: block;
        width: 0;
        height: 0;
        visibility: hidden;
    }
    .a-main-area{
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
    }
    .a-prev-btn,
    .a-play-btn,
    .a-pause-btn,
    .a-next-btn,
    .a-switch-btn,
    .a-switch-singe-btn,
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
    .a-pause-btn{
        width: 16px;
        background-position: -44px -98px;
    }
    .a-next-btn{
        width: 16px;
        background-position: -83px -98px;
    }
    .a-switch-btn{
        width: 20px;
        background-position: -119px -98px;
    }
    .a-switch-singe-btn{
        width: 20px;
        background-position: -232px -99px;
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
        background-color: #fff;
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
    .a-volume-progress{
        display: none;
        width: 2px;
        background: rgba(21, 75, 130, 0.9);
        height: 70px;
        position: absolute;
        bottom: 20px;
        left: -3px;
        padding: 5px 9px;
    }
    .a-volume-btn:hover .a-volume-progress{
        display: block;
    }
    .a-volume-progress-bar{
        position: relative;
        height: 100%;
        background: #ccc;
    }
    .a-volume-progress-bar-past{
        position: absolute;
        bottom: 0;
        width: 2px;
        height: 70px;
        background: #fff;
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
    .a-list{
        position: relative;
        height: 0;
        font-size: 14px;
        max-height: 370px;
        overflow: auto;
        background: rgba(0, 0, 0, 0.7);
        transition: all .3s ease-in;
    }
    .a-list::-webkit-scrollbar-thumb {
        background-color: #47a3ff;
    }
    .a-list > li{
        padding: 10px;
        border-bottom: 1px solid #154b82;
    }
    .a-list > li.active{
        font-size: 15px;
        color: #FF9800;
    }
    .a-list > li:last-child{
        border-bottom: none;
    }
    .a-list > li > .note{
        float: right;
    }
    .hover:hover{
        opacity: 1;
    }
</style>
