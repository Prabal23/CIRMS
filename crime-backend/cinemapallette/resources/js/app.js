require('./bootstrap');
window.Vue = require('vue');
// import routes 
import router from './router'
// initial components for loading vue app
Vue.component('mainapp', require('./components/mainapp.vue'));

// IMPORT THE STORE 
import store from './store';





const app = new Vue({
    el: '#app', 
    router,
    store,
});
