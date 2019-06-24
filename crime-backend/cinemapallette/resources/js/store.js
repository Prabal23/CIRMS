/**
 * THIS IS THE DEFAULT STORE...
 */
import Vue from 'vue';
import Vuex from 'vuex';
import teststore from './modules/test/store'
// load modules 
import modules from './modules'
Vue.use(Vuex);

export default new Vuex.Store({
    modules,
    state: {
        
    }
});