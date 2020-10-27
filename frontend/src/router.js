import {createRouter, createWebHistory} from 'vue-router'

import CoachesListPage from './pages/coaches/CoachesList'
import CoachViewPage from './pages/coaches/CoachView'
import CoachRegisterPage from './pages/coaches/Register'
import CoachContactPage from './pages/requests/CoachContact'
import RequestsPage from './pages/requests/Requests'
import UserAuth from './pages/auth/UserAuth'
import NotFoundPage from './pages/NotFound'
import store from './state/state.js';

const router = createRouter({
    history: createWebHistory(),
    routes:[
        {path: '/', redirect:'/coaches'},
        {path: '/coaches', component:CoachesListPage},
        {path: '/coaches/:id', component:CoachViewPage, children:[
            {path: 'contact', component:CoachContactPage}
        ]},
        {path: '/requests', component:RequestsPage, meta: { requiresAuth: true }},
        {path: '/register', component:CoachRegisterPage, meta: { requiresAuth: true }},
        {path: '/auth', component:UserAuth, meta: { requiresUnauth: true }},
        {path: '/:notFound(.*)', component:NotFoundPage}
    ]
})


router.beforeEach(function(to, _, next) {
    if (to.meta.requiresAuth && !store.getters.loggedIn) {
      next('/auth');
    } else if (to.meta.requiresUnauth && store.getters.loggedIn) {
      next('/coaches');
    } else {
      next();
    }
  });


export default router
