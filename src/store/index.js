/**
 * Created by hyt on 2017/1/11.
 */
import Vue from 'vue'
import Vuex from 'vuex'
import user from './user.js'
Vue.use(Vuex);
const store = new Vuex.Store({
    state: {
        home: {
            pageIndex: 0//当前页数
        }
    },
    getters:{

    },
    mutations:{

    },
    actions:{

    },
    modules:{
        user
    }
});
export default store





