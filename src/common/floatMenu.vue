<template>
    <div id="floatMenu" class="float-menu" v-clickoutside="toChat">
        <!--<svg viewBox="0 0 1080 1024" version="1.1" xmlns="http://www.w3.org/2000/svg"><path d="M347.048732 0l30.167601 0c-1.294053 14.477213 0.727905 16.256536 7.521681 21.675381 77.724034 61.710133 134.096201 146.955849 161.271306 252.744649-121.317431-0.647026-245.222968 1.294053-364.922834-0.970539 26.042809-94.061449 72.628702-173.483927 137.654846-231.958929 7.926072-7.117289 26.285443-18.44025 28.307401-25.476661C348.423663 11.161204 345.835558 1.374931 347.048732 0L347.048732 0zM174.454466 302.727431l379.076534 0c8.734855 43.512519 17.065319 91.068952 15.12424 138.625385C566.714162 488.423979 557.494037 534.20109 548.84006 574.316721c-18.278493 84.841324-40.520022 165.719611-63.165943 242.392228L244.252429 816.708949c-25.719295-73.68012-46.424137-156.014217-65.107022-240.451149-17.631467-79.665113-30.24848-185.1304-5.66148-270.61875C173.403049 304.18324 173.403049 302.889187 174.454466 302.727431L174.454466 302.727431zM290.433931 417.736356c-16.660927 52.813522 19.976937 102.230156 73.518363 101.825764 21.998894-0.161757 45.291841-11.80823 57.504463-25.476661 44.806571-49.740147 6.793776-136.846063-65.107022-129.162625C320.278019 368.804992 298.845273 391.208277 290.433931 417.736356L290.433931 417.736356zM0 600.683042 0 571.485981C8.168707 492.306137 59.122028 450.734697 124.471685 431.890056c10.514177 120.266014 35.101177 226.378327 68.827423 323.432272-25.638417 36.071716-54.188453 73.922755-51.842982 134.824106C61.710133 826.333465 8.97749 735.42627 0 600.683042L0 600.683042zM604.484322 431.890056c47.556433 14.558092 83.628149 38.174552 104.656504 76.349104 22.160651 40.277387 21.513625 98.428876 11.32296 154.639286-9.058368 49.821025-27.013348 92.767396-49.982782 131.103704-22.888555 38.174552-50.306295 73.033094-83.951663 95.274623 1.698444-44.88745-14.558092-79.82687-34.858542-110.317984-5.418845-8.087829-16.418292-18.116736-16.98444-23.535582-0.808783-7.845194 8.815733-25.719295 12.2935-36.799621 26.851592-86.863281 47.556433-181.329121 56.614801-284.772451C603.190269 431.970934 604.160809 430.353369 604.484322 431.890056L604.484322 431.890056zM277.25077 845.906011l172.594266 0c-10.514177 20.947477-23.61646 39.22597-33.968881 60.335203-10.271543-6.712898-16.903562-17.065319-26.366322-24.506121-8.653977 27.741253-17.712345 55.23987-26.4472 82.981123-11.403839-26.93247-21.27099-55.401627-32.027802-82.981123-7.845194 13.506674-14.315457 28.388279-21.675381 42.461101C297.55122 899.123924 287.603191 872.353211 277.25077 845.906011L277.25077 845.906011zM277.25077 845.906011"></path></svg>-->
        <a @click="toTop()">
            <i class="icon ion-chevron-up"></i>
        </a>
        <a @click="toChat(true)">
            <i class="icon ion-chatbox-working"></i>
        </a>
        <a @click="toAudio()">
            <i class="icon ion-music-note"></i>
        </a>
        <transition name="slide-bottom">
            <div v-if="isChatShow" class="chat">
                <div class="chat-content">
                    <h3>聊天板
                        <a class="chat-close" @click="toChat()">
                            <i class="icon ion-android-close"></i>
                        </a>
                    </h3>
                    <label>
                        <textarea v-model="chat"></textarea>
                    </label>
                    <div class="submit">
                        <button class="btn btn-39f" @click="submitChat()">提交</button>
                    </div>
                </div>
            </div>
        </transition>
        <transition name="slide-bottom">
            <vue-audio v-show="isAudioShow"></vue-audio>
        </transition>
    </div>
</template>
<script type="text/ecmascript-6">
    export default {
        name:'floatMenu',
        created: function () {

        },
        props: [],
        methods: {
            toTop: function () {
                var timer = setInterval (() => {
                    if ((document.body.scrollTop -= 100) <= 0) {
                        clearInterval(timer);
                    };
                },0);
            },
            toChat: function (bool) {
                if (typeof bool === 'boolean') {
                    this.isChatShow = !this.isChatShow;
                } else {
                    this.isChatShow = false;
                }
            },
            toAudio: function () {
                this.$store.state.works.showAudio = !this.$store.state.works.showAudio;
            },
            submitChat: function () {
                this.$socket.emit('chat',{text: this.chat});
                this.chat = '';
            }
        },
        data: function () {
            return {
                isChatShow: false,
                chat: ''
            }
        },
        computed: {
            isAudioShow : function () {
                return this.$store.state.works.showAudio;
            }
        }
    }
</script>
<style scoped>
    .float-menu{
        position: fixed;
        right: 20px;
        bottom: 20px;
        text-decoration: none;
        z-index: 9990;
    }
    .float-menu > a{
        display: block;
        margin-top: 5px;
        width: 25px;
        padding: 5px;
        height: 25px;
        text-align: center;
        line-height: 25px;
        font-size: 20px;
        color: #fff;
        background: rgba(51, 153, 255, 0.7);
    }
    .float-menu > a:first-child{
        margin-top: 0;
    }
    .chat{
        position: fixed;
        bottom: 0;
        left: 50%;
    }
    .chat-close{
        float: right;
        font-size: 20px;
        margin-top: -2px;
        color: #999;
    }
    .chat-content{
        position: relative;
        left: -50%;
        padding: 15px;
        width: 300px;
        background: #fff;
        border: 1px solid #ddd;
        border-bottom: none;
        box-shadow: 2px 2px 5px #666;
    }
    .chat-content h3{
        font-size: 14px;
    }
    .chat-content label{
        display: block;
        margin-top: 10px;
        padding: 5px;
        border:1px solid #ccc;
    }
    .chat-content textarea{
        width: 100%;
        height: 100px;
        resize: none;
        border: none;
    }
    .submit{
        margin-top: 10px;
        text-align: right;
    }
</style>
