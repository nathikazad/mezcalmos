import VueRouter from 'vue-router'
import Vue from 'vue'
import { deepFind } from '@/shared/mixins/functions'
import PastOrderstPage from './pages/orders/PastOrders'
import IncomingOrdersPage from './pages/orders/Incoming'
import TaxiViewPage from './pages/orders/View'
import UserInformationPage from '@/shared/pages/user/Information'
import MessagesPage from '@/shared/pages/messages/View'
import NotificationsPage from '@/shared/pages/notification/view'
import LoginPage from '@/shared/pages/user/Login'
import HowToTaxi from './pages/introduction/howToTaxi'
import SignUpTaxi from './pages/introduction/signUpTaxi'
import EnterPhone from "@/shared/pages/user/enterPhone";
import Validation from "@/shared/pages/user/validation";
import Confirmation from './pages/introduction/confirmation'
import MessageAdmin from "@/shared/pages/contact/View";
import EditPhoneNumber from "@/shared/pages/user/editPhoneNumber";
import ConfirmPhoneNumber from "@/shared/pages/user/confirmePhoneNumber";


import NotFoundPage from '@/shared/pages/NotFound'
import store from './store/store';

Vue.use(VueRouter)

const router = new VueRouter({
  mode: 'history',
  routes: [
    { path: '/', redirect: '/incoming' },
    { path: '/incoming', component: IncomingOrdersPage,
      meta: { requiresAuth: true }, name: 'home' },
    { path: "/contactAdmin", component: MessageAdmin,
      meta: { requiresAuth: true }, name: "contactAdmin" },
    { path: '/messages/:orderId', component: MessagesPage,
      meta: { requiresAuth: true }, name: "messages" },
    { path: "/notifications", component: NotificationsPage,
      meta: { requiresAuth: true }, name: "notifications" },
    { path: '/orders/:orderId', component: TaxiViewPage,
      meta: { requiresAuth: true }, name: "taxiView" },
    { path: '/orders', component: PastOrderstPage,
      meta: { requiresAuth: true }, name: "orders" },
    { path: '/userinfo', component: UserInformationPage,
      meta: { requiresAuth: true }, name:"userinfo" },
    { path: '/updateNumber', component: EditPhoneNumber,
      meta: { requiresAuth: true }, name:"updateNumber" },
    { path: '/confirmNumber', component: ConfirmPhoneNumber,
      meta: { requiresAuth: true }, name:"confirmNumber" },
    { path: '/auth', component: LoginPage,
      meta: { requiresUnauth: true } , name: "login"},
      { path: "/validation", component: Validation,
      meta: { requiresUnauth: true }, name: "validation" },
    { path: "/enterNumber", component: EnterPhone,
      meta: { requiresUnauth: true }, name: "enterPhone" },
    { path: '/howToTaxi', component: HowToTaxi, 
      meta: { requiresCannotTaxi: true }, name: "howToTaxi" },
    { path: '/signUpTaxi', component: SignUpTaxi,
      meta: { requiresCannotTaxi: true } },
    { path: '/confirmation', component: Confirmation, 
      meta: { requiresCannotTaxi: true }, name: "applicationUnderReview" },
    { path: '/:notFound(.*)', component: NotFoundPage },
  ]
})

router.redirectAuthorizationPendingUsers = function () {
  
  if (store.getters["admin/messageCount"] > 0 &&
    router.currentRoute.path != '/contactAdmin') {
    router.push('/contactAdmin')
  } else if (router.currentRoute.path != '/confirmation') {
    router.push('/confirmation')
  }
}

router.beforeEach(async function (to, from, next) {
  if(store.getters.loggedIn && to.name != "userinfo") {
    let userInfo=store.getters["userInfo"];
    if (!deepFind(userInfo,'photo')||!deepFind(userInfo,'displayName'))
      next('/userinfo?edit=true')
  }
  if (to.path == "/incoming") {
    if (store.getters.authorizationPending) {
      router.redirectAuthorizationPendingUsers()
    } else if (!store.getters.canTaxi && to.path != '/howToTaxi') {
      next('/howToTaxi')
    } else if (store.getters.isInTaxi && to.path != `/orders/${store.getters.currentOrderId}`) {
      next(`/orders/${store.getters.currentOrderId}`);
    } else {
      next()
    }
  } else if (to.meta.requiresAuth && !store.getters.loggedIn) {
    next({ path: '/auth', query: { redirect: to.path } });
  } else if (to.meta.requiresAuth && store.getters.loggedIn &&
    !store.getters.canTaxi && to.name != "messageAdmin" && to.name != "userinfo") {
    next('/howToTaxi');
  } else if (to.meta.requiresCannotTaxi && store.getters.canTaxi) {
    next('/');
  } else if (to.meta.requiresUnauth && store.getters.loggedIn) {
    next('/');
  } else if (to.path != "/" && to.name == "notifications" 
    && store.getters["notifications/length"] == 0) {
    next('/')
  } else {
    next();
  }
});


export default router