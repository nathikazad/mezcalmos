import VueRouter from 'vue-router'
import Vue from 'vue'

import MessagesPage from './pages/Messages'
import OrdersPage from './pages/Orders'
import CustomersPage from './pages/Customers'
import TaxisPage from './pages/Taxis'
import AdminAreas from './pages/areas'
import LoginPage from "@/shared/pages/user/Login";

import NotFoundPage from '@/shared/pages/NotFound'
import UnauthorizedPage from '@/shared/pages/Unauthorized'
import store from './store/store';

Vue.use(VueRouter)

const router = new VueRouter({
  mode: 'history',
  routes: [
    { path: '/', redirect: '/messages' },
    { path: '/messages', component: MessagesPage, name: 'home', meta: { requiresAuth: true}},
    { path: '/orders', component: OrdersPage, meta: { requiresAuth: true}},
    { path: '/customers', component: CustomersPage, meta: { requiresAuth: true}},
    { path: '/taxis', component: TaxisPage, meta: { requiresAuth: true}},
    { path: '/mapAreas', component: AdminAreas, meta: { requiresAuth: true}},
    { path: '/auth', component: LoginPage},
    { path: '/unauthorized', component: UnauthorizedPage },
    { path: '/:notFound(.*)', component: NotFoundPage }
  ]
})

router.beforeEach(async function (to, from, next) {
  console.log("auth ", to.path)
  if (to.meta.requiresAuth){
    if(!store.getters.loggedIn) {
      next({path: "/auth", query: { redirect: to.path }});
    } else if (!store.getters.isAdmin) {
      next({ path: '/unauthorized'})
    } else {
      next()
    }
  } else {
    next();
  }
});


export default router
