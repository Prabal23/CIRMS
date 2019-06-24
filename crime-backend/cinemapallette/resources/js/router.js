import Vue from 'vue'
import Router from 'vue-router'
Vue.use(Router)
import Home from './components/Home.vue'

const defaultroutes = [
    {
        path: '/',
        name: 'Home',
        title: 'Home',
        component: Home,
        meta: {
            guest : true,
            allowedUserType: ['All']
        }
    },
    {
        path: '*',
        redirect: { name: 'Home' },
        title: 'Not found',
        meta: {
            guest : true,
            allowedUserType: ['All']
        }
    },
]


/**
 * IMPORT ALL ROUTES DYNAMICALLY FROM THE MODULES FOLDERS....
*/

var allRoutes = []
import camelCase from 'lodash/camelCase'
const requireModule = require.context('./modules', true, /\.js$/)
const importedRoutes = []

requireModule.keys().forEach(fileName => {
    let str = fileName.split('/')
    str = str[1]
    if (fileName === `./${str}/router/index.js`){
        const moduleName = camelCase(
            fileName.replace(/(\.\/|\.js)/g, '')
        )
        importedRoutes.push(...requireModule(fileName).default)
    }
})

/**
 * CONCAT ALL THE IMPORTED ROUTES WITH MAIN ROUTES...
 */
allRoutes = allRoutes.concat(defaultroutes,importedRoutes)
const routes = allRoutes

export default new Router({
    mode: 'history',
    routes
})

