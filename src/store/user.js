/**
 * Created by hyt on 2017/1/11.
 */
import Vue from 'vue'
export default {
    state: {
        user:{}
    },
    getters: {},
    mutations: {
        SET_USER: (state, user) => {
            state.user = user;
        }
    },
    actions: {
        login ({commit}, user) {
            return Vue.http.post('user/login', {data:user})
                .then(data => {
                    if (data.status == 0) {
                        commit('SET_USER', user);
                        return data;
                    } else {
                        return Promise.reject(data.msg);
                    }
                })
        }
    }
}