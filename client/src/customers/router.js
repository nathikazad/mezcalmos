import VueRouter from "vue-router";
import Vue from "vue";
import ServicesListPage from "./pages/services/List";
import TaxiViewPage from "./pages/services/taxis/View";
import TaxiRequestPage from "./pages/services/taxis/Request";
import GroceryViewPage from "./pages/services/groceries/View";
import GroceryRequestPage from "./pages/services/groceries/Request";
import GroceryAddItemPage from "./pages/services/groceries/AddItem";

import OrdersListPage from "./pages/orders/List";
import MessageAdmin from "@/shared/pages/contact/View";
import UserInformationPage from "@/shared/pages/user/Information";
import MessagesPage from "@/shared/pages/messages/View";
import NotificationsPage from "@/shared/pages/notification/view";
import LoginPage from "@/shared/pages/user/Login";
import SavedLocation from './pages/saved/locations'

import NotFoundPage from '@/shared/pages/NotFound'
import store from './store/store';

Vue.use(VueRouter)

const router = new VueRouter({
  mode: "history",
  routes: [{
      path: "/",
      redirect: "/services",
    },
    {
      path: "/saved/locations",
      component: SavedLocation,
      meta: {
        requiresAuth: true,
      },
    },
    {
      path: "/services",
      component: ServicesListPage,
      name: "home",
    },
    {
      path: "/services/taxi/request",
      component: TaxiRequestPage,
      name: "requestView"
    },
    {
      path: "/services/grocery/request",
      component: GroceryRequestPage,
    },
    {
      path: "/services/taxi/:orderId",
      component: TaxiViewPage,
      meta: {
        requiresAuth: true,
      },
      name: "taxiView"
    },
    {
      path: "/services/grocery/:orderId",
      component: GroceryViewPage,
      meta: {
        requiresAuth: true,
      },
      name: "groceryView"
    },
    {
      path: "/services/grocery/:orderId/add",
      component: GroceryAddItemPage,
      meta: {
        requiresAuth: true,
      },
    },
    {
      path: "/messages/:orderId",
      component: MessagesPage,
      meta: {
        requiresAuth: true,
      },
      name: "messages"
    },

    {
      path: "/orders",
      component: OrdersListPage,
      meta: {
        requiresAuth: true,
      },
      name: "orders"
    },
    {
      path: "/userinfo",
      component: UserInformationPage,
      meta: {
        requiresAuth: true,
      },
    },
    {
      path: "/auth",
      component: LoginPage,
      meta: {
        requiresUnauth: true,
      },
      name: "login",
    },
    {
      path: "/notifications",
      component: NotificationsPage,
      meta: {
        requiresAuth: true,
      },
      name: "notifications"
    },
    {
      path: "/contactAdmin",
      component: MessageAdmin,
      meta: {
        requiresAuth: true,
      },
      name: "contactAdmin"
    },
    {
      path: "/:notFound(.*)",
      component: NotFoundPage,
    },
  ],
});

router.beforeEach(async function (to, from, next) {
  if (to.meta.requiresAuth && !store.getters.loggedIn) {
    next({
      path: "/auth",
      query: {
        redirect: to.path,
      },
    });
  } else if (to.meta.requiresUnauth && store.getters.loggedIn) {
    next("/services");
  } else if (to.path != "/" && to.name == "notifications" && store.getters["notifications/length"] == 0) {
    next("/")
  } else {
    next();
  }
});

export default router;