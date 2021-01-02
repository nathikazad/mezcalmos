import VueRouter from 'vue-router'
import Vue from 'vue'
import TaxiViewPage from './pages/services/taxis/View'

import OrdersListPage from './pages/orders/List'
import OrdersIncomingPage from './pages/orders/Incoming'
import UserInformationPage from '@/shared/pages/user/Information'
import MessagesPage from '@/shared/pages/messages/View'
import LoginPage from '@/shared/pages/user/Login'


import NotFoundPage from './pages/NotFound'
import store from './store/store';

Vue.use(VueRouter)

const router = new VueRouter({
  mode: 'history',
  routes: [
    { path: '/', redirect: '/incoming' },
    { path: '/incoming', component: OrdersIncomingPage, meta: { requiresAuth: true }},
    { path: '/incoming/:orderId', component: TaxiViewPage, meta: { requiresAuth: true } },
    { path: '/messages/:orderId', component: MessagesPage, meta: { requiresAuth: true } },
    { path: '/past', component: OrdersListPage, meta: { requiresAuth: true } },
    { path: '/past/:orderId', component: TaxiViewPage, meta: { requiresAuth: true } },
    { path: '/userinfo', component: UserInformationPage, meta: { requiresAuth: true } },
    { path: '/auth', component: LoginPage, meta: { requiresUnauth: true } },
    // TODO: how to taxi page
    { path: '/:notFound(.*)', component: NotFoundPage }
  ]
})

router.beforeEach(async function (to, from, next) {
  console.log(store.getters.canTaxi)
  // TODO: check if currently in transit, if yes redirect to current transit page
  if (to.meta.requiresAuth && !store.getters.loggedIn) {
    next({ path: '/auth', query: { redirect: to.path } });
  } else if (to.meta.requiresAuth && store.getters.loggedIn && 
          !store.getters.canTaxi) {
    next('/howToTaxi');
  } else if (to.meta.requiresUnauth && store.getters.loggedIn) {
    next('/');
  } else {
    next();
  }
});


export default router
