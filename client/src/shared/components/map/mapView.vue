 <template>
  <GmapMap
    style="width: 100%; height: 100%; position: absolute; left:0; top:0"
    :center="center"
    :zoom="12"
    @resize="clientGesture($event)"
    @drag="clientGesture($event)"
    v-bind:options="mapOptions"
    ref="gmap"
  >
    <DirectionsRenderer
      v-if="directionsOrigin && directionsDest&&status!='inTransit'"
      travelMode="DRIVING"
      :origin="directionsOrigin"
      :destination="directionsDest"
      @direction="emitDirectionPos($event)"
    />
    <GmapMarker
      :ref="`marker-center`"
      :position="center"
      :clickable="true"
      :icon="icons.center"
      v-if="!directionsOrigin&&!pickingFromMap"
    />
    <!-- from Icon marker -->

    <gmap-custom-marker
      :marker="directionsOrigin"
      v-if="directionsOrigin && showMarker&&status!='inTransit'"
      :ref="`marker-center`"
    >
      <img :src="this.fromUrl||icons.center.url" class="imageIcon border" />
    </gmap-custom-marker>
    <!-- Driver Icon marker -->

    <gmap-custom-marker
      :marker="{lat:deepFind(driverLocation, 'position.lat'),lng:deepFind(driverLocation, 'position.lng')}"
      v-if="deepFind(driverLocation, 'position')&&status!='droppedOff'"
      :ref="`marker-driver`"
    >
      <img :src="require('../../static/img/driverCar.png')" class="driverIcon" />
    </gmap-custom-marker>
    <gmap-polyline
      v-if="deepFind(driverLocation, 'polyline') &&status!='droppedOff'"
      v-bind:path="decode(deepFind(driverLocation, 'polyline'))"
      v-bind:options="{ strokeColor:'#C18DF3'}"
    ></gmap-polyline>
    <!-- to icon marker -->

    <gmap-custom-marker :marker="directionsDest" v-if="directionsDest" :ref="`marker-center`">
      <img :src="require('../../static/img/Bttn.png')" class="driverIcon" />
    </gmap-custom-marker>
  </GmapMap>
</template>
<script>
import DirectionsRenderer from "../map/directionsRender";
export default {
  components: { DirectionsRenderer },
  props: {
    status: { type: String },
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
    },
    pickingFromMap: {
      type: Boolean
    }
  },
  computed: {
    userInfo() {
      return this.$store.getters["userInfo"];
    },
    icons() {
      let iconOptions = {};

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
  mounted() {
    this.$store.dispatch("logger/log", {
      userType: this.$store.getters.appName,
      callType: "mapLoad",
      route: this.$route.path
    });
  },
  methods: {
    clientGesture() {
      let map = this.$refs["gmap"].$mapObject;
      if (map) {
        this.$emit("centerChangedByClient", {
          lat: map.center.lat(),
          lng: map.center.lng()
        });
      }
    },
    reRenderMarker() {
      this.showMarker = false;
      setTimeout(() => {
        this.showMarker = true;
        this.mapFit();
      }, 200);
    },
    mapFit() {
      var mapMarkersList = [
        "driverLocation",
        "directionsDest",
        "directionsOrigin"
      ];
      if (this.status == "onTheWay") {
        mapMarkersList = ["driverLocation", "directionsOrigin"];
      } else if (this.status == "inTransit") {
        mapMarkersList = ["driverLocation", "directionsDest"];
      }

      var bounds = new window.google.maps.LatLngBounds();
      for (var i = 0, listLen = mapMarkersList.length; i < listLen; i++) {
        let bound;
        let marker = this[mapMarkersList[i]];

        //check if variable exist in this
        if (marker) {
          //check if marker is driverLocation
          if (marker.position) {
            bound = new window.google.maps.LatLng(
              marker.position.lat,
              marker.position.lng
            );
          } else if (marker.lat) {
            bound = new window.google.maps.LatLng(marker.lat, marker.lng);
          }

          bounds.extend(bound);
        }
        //  And increase the bounds to take this point
      }
      let map = this.$refs["gmap"].$mapObject;

      map.fitBounds(bounds);
      map.setZoom(map.getZoom() - 1);

      if (map.getZoom() > 16) map.setZoom(16);

      //console.log(map);
    },

    emitDirectionPos(pos) {
      this.reRenderMarker();
      this.$emit("directionChanged", pos);
    }
  },
  watch: {
    driverLocation: {
      deep: true,
      handler: function() {
        if (this.status == "inTransit") {
          this.mapFit();
        }
      }
    },
    directionsOrigin: {
      deep: true,
      handler: function(newVal) {
        if (newVal.lat && newVal.lng) {
          this.mapFit();
        }
      }
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
  width: auto;
  height: 30px;
}
</style>
