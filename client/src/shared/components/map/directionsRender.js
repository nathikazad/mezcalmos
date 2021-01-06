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
    console.log(directionsRenderer);

    let directionsService = new window.google.maps.DirectionsService();
    console.log(this);

    this.$watch(
      () => [this.origin, this.destination, this.travelMode], {
        deep: true,
        immediate: true,
        handler: () => {
          let {
            origin,
            destination,
            travelMode
          } = this;
          console.log("origin");

          if (!origin || !destination || !travelMode) return;

          directionsService.route({
              origin,
              destination,
              travelMode,
            },
            (response, status) => {
              console.log(response);
              var leg = response.routes[0].legs[0];

              this.$emit("direction", leg);
              if (status !== "OK") return;
              directionsRenderer.setDirections(response);
            }
          );
        }
      }
    );
  },
});