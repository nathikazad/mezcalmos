<template>
  <GmapMap
    style="width: 100%; height: 100%; position: absolute; left:0; top:0"
    :center="center"
    :zoom="12"
    v-bind:options="mapOptions"
    ref="gmap"
  >
    <DirectionsRenderer
      v-if="directionsOrigin && directionsDest"
      travelMode="DRIVING"
      :origin="directionsOrigin"
      :destination="directionsDest"
      @direction="emitDirectionPos($event)"
    />
    <GmapMarker
      :draggable="true"
      :ref="`marker-center`"
      :position="center"
      :clickable="true"
      :icon="icons.center"
      v-if="!directionsOrigin"
      @dragend="dragend"
    />
    <!-- from Icon marker -->

    <gmap-custom-marker
      :marker="directionsOrigin"
      v-if="directionsOrigin && showMarker"
      :ref="`marker-center`"
    >
      <img :src="this.fromUrl" class="imageIcon border" />
    </gmap-custom-marker>
    <!-- from Icon marker -->

    <gmap-custom-marker
      :marker="{lat:deepFind(driverLocation, 'position.lat'),lng:deepFind(driverLocation, 'position.long')}"
      v-if="deepFind(driverLocation, 'position')"
      :ref="`marker-driver`"
    >
      <img :src="require('../../static/img/driverCar.png')" class="driverIcon" />
    </gmap-custom-marker>
    <!-- to icon marker -->
    <GmapMarker
      v-if="directionsDest"
      :ref="`marker-center`"
      :position="directionsDest"
      :clickable="true"
      :icon="icons.end"
    />
  </GmapMap>
</template>
<script>
import DirectionsRenderer from "../map/directionsRender";
export default {
  components: { DirectionsRenderer },
  props: {
    center: {
      type: Object
    },
    directionsDest: {
      type: Object
    },
    directionsOrigin: {
      type: Object
    },
    fromUrl: {
      type: String
    },
    driverLocation: {
      type: Object
    }
  },
  computed: {
    userInfo() {
      return this.$store.getters["userInfo"];
    },
    icons() {
      let iconOptions = {};
      console.log(this.userInfo);

      if (window.google) {
        iconOptions = {
          size: new window.google.maps.Size(25, 29),

          origin: new window.google.maps.Point(0, 0),

          anchor: new window.google.maps.Point(12.5, 29)
        };
      }

      return {
        start: {
          url: this.fromUrl,
          ...iconOptions
        },
        end: {
          url: require("../../static/img/Bttn.png"),
          ...iconOptions
        },
        center: {
          url: require("../../static/img/currentPos.png")
        }
      };
    }
  },
  data() {
    return {
      showMarker: true,
      shape: {
        coords: [1, 1, 1, 20, 18, 20, 18, 1],
        type: "poly"
      },
      mapOptions: {
        disableDefaultUI: true,
        styles: [
          {
            featureType: "all",
            elementType: "geometry.fill",
            stylers: [
              {
                weight: "2.00"
              }
            ]
          },
          {
            featureType: "all",
            elementType: "geometry.stroke",
            stylers: [
              {
                color: "#9c9c9c"
              }
            ]
          },
          {
            featureType: "all",
            elementType: "labels.text",
            stylers: [
              {
                visibility: "on"
              }
            ]
          },
          {
            featureType: "landscape",
            elementType: "all",
            stylers: [
              {
                color: "#f2f2f2"
              }
            ]
          },
          {
            featureType: "landscape",
            elementType: "geometry.fill",
            stylers: [
              {
                color: "#ffffff"
              }
            ]
          },
          {
            featureType: "landscape.man_made",
            elementType: "geometry.fill",
            stylers: [
              {
                color: "#ffffff"
              }
            ]
          },
          {
            featureType: "poi",
            elementType: "all",
            stylers: [
              {
                visibility: "off"
              }
            ]
          },
          {
            featureType: "road",
            elementType: "all",
            stylers: [
              {
                saturation: -100
              },
              {
                lightness: 45
              }
            ]
          },
          {
            featureType: "road",
            elementType: "geometry.fill",
            stylers: [
              {
                color: "#eeeeee"
              }
            ]
          },
          {
            featureType: "road",
            elementType: "labels.text.fill",
            stylers: [
              {
                color: "#7b7b7b"
              }
            ]
          },
          {
            featureType: "road",
            elementType: "labels.text.stroke",
            stylers: [
              {
                color: "#ffffff"
              }
            ]
          },
          {
            featureType: "road.highway",
            elementType: "all",
            stylers: [
              {
                visibility: "simplified"
              }
            ]
          },
          {
            featureType: "road.arterial",
            elementType: "labels.icon",
            stylers: [
              {
                visibility: "off"
              }
            ]
          },
          {
            featureType: "transit",
            elementType: "all",
            stylers: [
              {
                visibility: "off"
              }
            ]
          },
          {
            featureType: "water",
            elementType: "all",
            stylers: [
              {
                color: "#46bcec"
              },
              {
                visibility: "on"
              }
            ]
          },
          {
            featureType: "water",
            elementType: "geometry.fill",
            stylers: [
              {
                color: "#c8d7d4"
              }
            ]
          },
          {
            featureType: "water",
            elementType: "labels.text.fill",
            stylers: [
              {
                color: "#070707"
              }
            ]
          },
          {
            featureType: "water",
            elementType: "labels.text.stroke",
            stylers: [
              {
                color: "#ffffff"
              }
            ]
          }
        ]
      },
      markers: []
    };
  },
  mounted() {},
  methods: {
    reRenderMarker() {
      this.showMarker = false;
      setTimeout(() => {
        this.showMarker = true;
      }, 200);
    },
    dragend(event, index) {
      console.log(event, index);
      this.$emit("markerDragged", {
        lat: event.latLng.lat(),
        lng: event.latLng.lng()
      });
    },
    emitDirectionPos(pos) {
      console.log(this.$refs);
      this.reRenderMarker();
      this.$emit("directionChanged", pos);
    }
  }
};
</script>
<style lang="scss" scoped>
.imageIcon {
  height: 34px;
  border-radius: 50%;
  width: 34px;
  display: block;
}
.driverIcon {
  width: 80px;
  height: 88px;
}
</style>
