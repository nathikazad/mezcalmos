import { createRouter, createWebHistory } from 'vue-router'


import ServicesListPage from './pages/services/List'
import TaxiViewPage from './pages/services/taxis/View'
import TaxiRequestPage from './pages/services/taxis/Request'
import GroceryViewPage from './pages/services/groceries/View'
import GroceryRequestPage from './pages/services/groceries/Request'
import AddItemPage from './pages/services/groceries/AddItem'

import OrdersListPage from './pages/orders/List'
import UserInformationPage from './pages/user/Information'
import MessagesPage from './pages/messages/View'
import LoginPage from './pages/user/Login'


import NotFoundPage from './pages/NotFound'
import store from './store/store';

const router = createRouter({
  history: createWebHistory(),
  routes: [
    { path: '/', redirect: '/services' },
    { path: '/services', component: ServicesListPage },
    { path: '/services/taxi/request', component: TaxiRequestPage },
    { path: '/services/grocery/request', component: GroceryRequestPage },
    {
      path: '/services/taxi/:orderId', component: TaxiViewPage, children: [
        { path: 'messages', component: MessagesPage }
      ],
      meta: { requiresAuth: true }
    },
    {
      path: '/services/grocery/:orderId', component: GroceryViewPage, children: [
        { path: 'addItem', component: AddItemPage },
        { path: 'messages', component: MessagesPage }
      ],
      meta: { requiresAuth: true }
    },
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
