import VueRouter from 'vue-router'
import Vue from 'vue'
import ServicesListPage from './pages/services/List'
import TaxiViewPage from './pages/services/taxis/View'
import TaxiRequestPage from './pages/services/taxis/Request'
import GroceryViewPage from './pages/services/groceries/View'
import GroceryRequestPage from './pages/services/groceries/Request'

import OrdersListPage from './pages/orders/List'
import UserInformationPage from './pages/user/Information'
import MessagesPage from './pages/messages/View'
import LoginPage from './pages/user/Login'


import NotFoundPage from './pages/NotFound'
import store from '@/store/store';

Vue.use(VueRouter)

const router = new VueRouter({
  mode: 'history',
  routes: [
    { path: '/', redirect: '/services' },
    { path: '/services', component: ServicesListPage },
    { path: '/services/taxi/request', component: TaxiRequestPage },
    { path: '/services/grocery/request', component: GroceryRequestPage },
    { path: '/services/taxi/:orderId', component: TaxiViewPage, meta: { requiresAuth: true } },
    { path: '/services/grocery/:orderId', component: GroceryViewPage, meta: { requiresAuth: true } },
    { path: '/messages/:orderId', component: MessagesPage, meta: { requiresAuth: true } },
    { path: '/orders', component: OrdersListPage, meta: { requiresAuth: true } },
    { path: '/userinfo', component: UserInformationPage, meta: { requiresAuth: true } },
    { path: '/auth', component: LoginPage, meta: { requiresUnauth: true } },
    { path: '/:notFound(.*)', component: NotFoundPage }
  ]
})

router.beforeEach(async function (to, from, next) {
  if (to.meta.requiresAuth && !store.getters.loggedIn) {
    next({ path: '/auth', query: { redirect: to.path } });
  } else if (to.meta.requiresUnauth && store.getters.loggedIn) {
    next('/services');
  } else {
    next();
  }
});


export default router
