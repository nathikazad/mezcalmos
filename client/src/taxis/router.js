import VueRouter from 'vue-router'
import Vue from 'vue'

import PastOrderstPage from './pages/orders/PastOrders'
import IncomingOrdersPage from './pages/orders/Incoming'
import TaxiViewPage from './pages/orders/View'
import UserInformationPage from '@/shared/pages/user/Information'
import MessagesPage from '@/shared/pages/messages/View'
import NotificationsPage from '@/shared/pages/notification/view'
import LoginPage from '@/shared/pages/user/Login'


import NotFoundPage from '@/shared/pages/NotFound'
import store from './store/store';

Vue.use(VueRouter)

const router = new VueRouter({
  mode: 'history',
  routes: [{
      path: '/incoming',
      component: IncomingOrdersPage,
      meta: {
        requiresAuth: true
      },
      name: 'home'
    },
    {
      path: '/messages/:orderId',
      component: MessagesPage,
      meta: {
        requiresAuth: true
      },
      name: "messages"
    },
    {
      path: "/notifications",
      component: NotificationsPage,
      meta: {
        requiresAuth: true,
      },
    },
    {
      path: '/orders/:orderId',
      component: TaxiViewPage,
      meta: {
        requiresAuth: true
      },
      name: "taxiView"
    },
    {
      path: '/orders',
      component: PastOrderstPage,
      meta: {
        requiresAuth: true
      }
    },
    {
      path: '/userinfo',
      component: UserInformationPage,
      meta: {
        requiresAuth: true
      }
    },
    {
      path: '/auth',
      component: LoginPage,
      meta: {
        requiresUnauth: true
      }
    },
    // TODO: how to taxi page
    {
      path: '/:notFound(.*)',
      component: NotFoundPage
    },

  ]
})

router.beforeEach(async function (to, from, next) {
  if (to.path == "/") {
    if (store.getters.isInTaxi) {
      next(`/orders/${store.getters.currentOrderId}`);
    } else {
      next("/incoming")
    }
  } else if (to.meta.requiresAuth && !store.getters.loggedIn) {
    next({
      path: '/auth',
      query: {
        redirect: to.path
      }
    });
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