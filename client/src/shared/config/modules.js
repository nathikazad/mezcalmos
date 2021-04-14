import * as VueGoogleMaps from "vue2-google-maps";
import GmapCustomMarker from "vue2-gmap-custom-marker";

import {
    ValidationProvider,
    ValidationObserver,
    extend,
    configure,
} from "vee-validate";
import {
    required,
    email
} from "vee-validate/dist/rules";

import {
    gmapsConfig
} from "@/shared/config/gmaps";

import infoPanel from "@/shared/components/ui/infoPanel";
import BaseButton from "@/shared/components/ui/BaseButton";
import Alert from "@/shared/components/ui/alert";
import Panel from "@/shared/components/ui/panel";
import Avatar from "@/shared/components/ui/avatar";
import Logo from "@/shared/components/SVG/logo";
import MapView from "@/shared/components/map/mapView";
import Fa from "@/shared/components/ui/fa";
import PickLocation from "@/shared/components/map/pickLocation";
import InputLocation from "@/shared/components/ui/inputLocation";
import notificationBtn from "@/shared/components/ui/notificationBtn";
import Card from "@/shared/components/ui/card";
import Card2 from "@/shared/components/ui/card2";
import Switch from "@/shared/components/ui/switch";

import {
    deepFind,
    geocodedAddress,
    decode,
    latLngformat

} from "@/shared/mixins/functions";
import {
    formatMessage
} from "@/shared/mixins/filters";

//init modules
export function initModules(Vue) {



    //Vue google maps
    Vue.use(VueGoogleMaps, gmapsConfig);
    Vue.component("gmap-custom-marker", GmapCustomMarker);

    //Vue Components
    Vue.component("card2", Card2);
    Vue.component("card", Card);
    Vue.component("infoPanel", infoPanel);
    Vue.component("alert", Alert);
    Vue.component("switcher", Switch);
    Vue.component("notification-btn", notificationBtn);
    Vue.component("logo", Logo);
    Vue.component("base-button", BaseButton);
    Vue.component("panel", Panel);
    Vue.component("avatar", Avatar);
    Vue.component("fa", Fa);
    Vue.component("pick-location", PickLocation);
    Vue.component("input-location", InputLocation);
    // vee validate configuration
    configure({
        classes: {
            valid: "is-valid",
            invalid: "is-invalid",
        },
    });
    extend("email", email);

    extend("required", {
        ...required,
        message: "This field is required",
    });
    Vue.component("ValidationProvider", ValidationProvider);
    Vue.component("ValidationObserver", ValidationObserver);
    Vue.component("map-view", MapView);
    //Vue mixins
    Vue.mixin({
        methods: {
            deepFind,
            geocodedAddress,
            decode,
            latLngformat
        },
    });
    //Vue filters
    Vue.filter('formatMessage', formatMessage);

    //Vue moment configuration
    Vue.use(require("vue-moment"));
}