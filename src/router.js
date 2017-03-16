/**
 * Created by tz on 2016/12/9.
 */
import Vue from 'vue'
import VueRouter from 'vue-router'
import home from './view/home.vue'
import navigation from './view/navigation.vue'
import articleDetail from './view/articleDetail.vue'
Vue.use(VueRouter);
const router = new VueRouter({
    mode: 'history',
    routes: [
        { path: '/',component: home},
        { path: '/home',component: home},
        { path: '/navigation',component: navigation},
        { path: '/articleDetail',component: articleDetail}
    ]
});

export default router;

