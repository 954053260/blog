/**
 * Created by tz on 2017/3/31.
 */
export default {
    install: function (Vue, option) {
        let barrage,
            barrageNode = document.createElement('div'),
            clientWidth = document.body.clientWidth,
            clientHeight = document.body.clientHeight;
        barrageNode.className = 'barrage-content';
        document.body.appendChild(barrageNode);
        window.addEventListener('resize', function () {
            clientWidth = document.body.clientWidth;
            clientHeight = document.body.clientHeight;
        });

        barrage = Vue.barrage = Vue.prototype.$barrage = {};

        barrage.info = function (option) {
            option = {
                info: option.info || '', //文字
                speed: option.speed || 8, //延迟,单位秒,默认8
                top: option.top || Math.random()*(clientHeight - 35), //距离底部高度,单位px,默认随机
                color: option.color || '#fff', //颜色,默认白色
                bg: option.bg || 'rgba(0, 0, 0, 0.7)' //ie低版兼容色,不能与网页背景相同,默认黑色
            };
            var itemNode = document.createElement('div');
            itemNode.className = 'barrage-item';
            itemNode.textContent = option.info;
            barrageNode.appendChild(itemNode);
            itemNode.style.color = option.color;
            itemNode.style.background = option.bg;
            itemNode.style.left = clientWidth + itemNode.offsetWidth + 'px';
            itemNode.style.top = option.top + 'px';
            itemNode.style.transitionDuration = itemNode.style.webkitTransitionDuration = option.speed + 's';
            setTimeout(function () {
                itemNode.style.left = -itemNode.offsetWidth + 'px';
                setTimeout(function () {
                    itemNode.parentNode && itemNode.parentNode.removeChild(itemNode);
                }, option.speed*1000);
            }, 0);
        };

        barrage.clear = function () {
            barrageNode.innerHTML = '';
        };
    }
}