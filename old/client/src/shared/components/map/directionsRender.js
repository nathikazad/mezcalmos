import {
  MapElementFactory
} from "vue2-google-maps";

export default MapElementFactory({
  name: "directionsRenderer",

  ctr() {
    return window.google.maps.DirectionsRenderer;
  },

  events: [],

  mappedProps: {},

  props: {
    origin: {
      type: Object,
    },
    destination: {
      type: Object,
    },
    travelMode: {
      type: String,
    },
    rendredOnce: {
      type: Boolean
    }
  },
  computed: {
    isRequest() {
      return this.$route.path == '/services/taxi/request'
    }
  },
  afterCreate(directionsRenderer) {
    directionsRenderer.constructor({
      polylineOptions: {
        strokeColor: "#AC59FC"
      },
      markerOptions: {
        visible: false,
      },
    });
    let directionsService = new window.google.maps.DirectionsService();

    this.$watch(
      () => [this.origin, this.destination, this.travelMode, this.isRequest], {
        deep: true,
        immediate: true,
        handler: () => {
          let {
            origin,
            destination,
            travelMode,

            isRequest
          } = this;

          if (!origin || !destination || !travelMode || !isRequest) return;
          this.$store.dispatch("logger/log", {
            userType: this.$store.getters.appName,
            callType: "directions load",
            route: this.$route.path
          });
          directionsService.route({
              origin,
              destination,
              travelMode,
            },
            (response, status) => {
              var leg = response.routes[0].legs[0];

              this.$emit("direction", {
                leg,
                polyline: response.routes[0].overview_polyline
              });
              if (status !== "OK") return;
              directionsRenderer.setDirections(response);
            }
          );
        }
      }
    );
  },
});