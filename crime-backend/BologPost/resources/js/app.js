
/**
 * First we will load all of this project's JavaScript dependencies which
 * includes Vue and other libraries. It is a great starting point when
 * building robust, powerful web applications using Vue and Laravel.
 */

require('./bootstrap');

window.Vue = require('vue');
import store from './store';
import router from './router'
// import iView from 'iview';
// import 'iview/dist/styles/iview.css';
// import locale from 'iview/dist/locale/en-US';
// Vue.use(iView, {
//     locale
// });
import common from './common'
Vue.mixin(common)




Vue.component('mainapp', require('./components/mainapp.vue').default);


const app = new Vue({
    el: '#app',
     router,
     store,
});












