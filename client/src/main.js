import Vue from "vue";
import App from "./App.vue";
import router from "./router.js";
import store from "./store/store";
import "./config/firebase";
import {
  library
} from "@fortawesome/fontawesome-svg-core";
import {
  faEnvelope,
  faShoppingCart,
  faChevronLeft,
  faSignInAlt,
  faPowerOff,
  faLocationArrow,
  faUserCircle,
  faPaperPlane,
  faCalendarAlt,
  faClock,
  faRoute,
  faTrash,
  faLongArrowAltRight,
  faPlus
} from "@fortawesome/free-solid-svg-icons";
import {
  FontAwesomeIcon
} from "@fortawesome/vue-fontawesome";

// import { apolloClient } from "./config/apollo";
// import { DefaultApolloClient } from "@vue/apollo-composable";
library.add({
  faEnvelope,
  faShoppingCart,
  faChevronLeft,
  faSignInAlt,
  faPowerOff,
  faLocationArrow,
  faUserCircle,
  faPaperPlane,
  faCalendarAlt,
  faClock,
  faRoute,
  faTrash,
  faLongArrowAltRight,
  faPlus
});
import BaseButton from "./components/ui/BaseButton";
import Panel from "./components/ui/panel";
import Avatar from "./components/ui/avatar";
import Logo from "./components/SVG/logo";
import "./registerServiceWorker";

// app.provide(DefaultApolloClient, apolloClient)
Vue.use(require("vue-moment"));
Vue.component("fa", FontAwesomeIcon);

Vue.component("logo", Logo);
Vue.component("base-button", BaseButton);
Vue.component("panel", Panel);
Vue.component("avatar", Avatar);

Vue.config.productionTip = false;
// app.provide(DefaultApolloClient, apolloClient)

new Vue({
  render: (h) => h(App),
  router,
  store,
}).$mount("#app");