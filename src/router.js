/**
 * Created by tz on 2016/12/9.
 */
import Vue from 'vue'
import VueRouter from 'vue-router'
import app from './view/app.vue'
import home from './view/home.vue'
import works from './view/works.vue'
import navigation from './view/navigation.vue'
import file from './view/file.vue'
import email from './view/email.vue'
import articleDetail from './view/articleDetail.vue'
import server from './view/server/server.vue'
import articleWrite from './view/server/articleWrite.vue'
import articleList from './view/server/articleList.vue'
import tagAdd from './view/server/tagAdd.vue'
Vue.use(VueRouter);
const router = new VueRouter({
    mode: 'history',
    routes: [
        { path: '/', redirect: '/app/home' },
        { path: '/app/', component: app,
            children: [
                { path: 'home', component: home},
                { path: 'works', component: works},
                { path: 'navigation', component: navigation},
                { path: 'file', component: file},
                { path: 'email', component: email},
                { path: 'articleDetail', component: articleDetail}
            ]
        },
        { path: '/server/', component: server,
            children: [
                { path: 'write', component: articleWrite},
                { path: 'list', component: articleList},
                { path: 'addTag', component: tagAdd}
            ]
        }
    ]
});
export default router;

