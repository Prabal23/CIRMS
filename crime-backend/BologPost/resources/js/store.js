/**
 * THIS IS THE DEFAULT STORE...
 */
import Vue from 'vue';
import Vuex from 'vuex';
Vue.use(Vuex);

export default new Vuex.Store({
    state: {

    },
    //started getter
    getters: {
        // getAuthUser(state) {
        //     // return state.authUser
        // },
      
    }, // getter end

    //mutation started
    mutations: {
        // setFlag: (state, payload) => {
        //     state.tabFlag = payload;
        // },
    

    }, /// mutation end

    //action started 
    actions: {
        // setFlag: (context, payload) => {
        //     context.commit('setFlag', payload)
        // },
      


    } // action end 


});