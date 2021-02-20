import VueRouter from 'vue-router'
import Vue from 'vue'

import MessagesPage from './pages/Messages'
import OrdersPage from './pages/Orders'
import CustomersPage from './pages/Customers'
import TaxisPage from './pages/Taxis'
import LoginPage from "@/shared/pages/user/Login";

import NotFoundPage from './pages/NotFound'
import store from './store/store';

Vue.use(VueRouter)

const router = new VueRouter({
  mode: 'history',
  routes: [
    { path: '/', redirect: '/messages' },
    { path: '/messages', component: MessagesPage, meta: { requiresAuth: true },  name: 'home'},
    { path: '/orders', component: OrdersPage, meta: { requiresAuth: true } },
    { path: '/customers', component: CustomersPage, meta: { requiresAuth: true },  name: 'home'},
    { path: '/taxis', component: TaxisPage, meta: { requiresAuth: true } },
    { path: '/auth', component: LoginPage, meta: { requiresUnauth: true } },
    { path: '/:notFound(.*)', component: NotFoundPage }
  ]
})

router.beforeEach(async function (to, from, next) {
  if (to.meta.requiresAuth && !store.getters.loggedIn) {
    next({ path: '/auth', query: { redirect: to.path } });
  } else if (to.meta.requiresUnauth && store.getters.loggedIn) {
    next('/');
  } else {
    next();
  }
});


export default router
