/**
 * TEST MODULE ROUTES. THIS IS A CUSTOM ROUTES. 
 * A TEST SET UP... 
 * ALL TEAM MEMBERS SHOULD JUST COPY AND PASTE TO EXTENDS THE APP
 */
import testpage from '../pages/test_page.vue'
const routes = [
    {
        path: '/user-test',
        name: 'test page name',
        component: testpage,
        title: 'This is a test page',
        meta: {
            guest : true,
            allowedUserType: ['All']
        }
        
    }
]

export default routes
