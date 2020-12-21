import { createApp } from "vue";
import App from "./App.vue";
import router from "./router.js";
import store from "./store/store";

import "./config/firebase";
// import { apolloClient } from "./config/apollo";
// import { DefaultApolloClient } from "@vue/apollo-composable";

import BaseCard from "./components/ui/BaseCard";
import BaseButton from "./components/ui/BaseButton";
import BaseBadge from "./components/ui/BaseBadge";
import BaseSpinner from "./components/ui/BaseSpinner";
import BaseDialog from "./components/ui/BaseDialog";
import Logo from "./components/SVG/logo";
const app = createApp(App);
app.use(router);
app.use(store);
// app.provide(DefaultApolloClient, apolloClient)
app.component("logo", Logo);
app.component("base-card", BaseCard);
app.component("base-button", BaseButton);
app.component("base-badge", BaseBadge);
app.component("base-spinner", BaseSpinner);
app.component("base-dialog", BaseDialog);
app.mount("#app");
