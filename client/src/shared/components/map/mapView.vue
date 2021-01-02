<template>
  <GmapMap
    style="width: 100%; height: 100%; position: absolute; left:0; top:0"
    :center="center"
    :zoom="12"
    v-bind:options="mapOptions"
  >
    <DirectionsRenderer
      v-if="directionsOrigin"
      travelMode="DRIVING"
      :origin="directionsOrigin"
      :destination="directionsDest"
      @direction="emitDirectionPos($event)"
    />
    <GmapMarker
      :ref="`marker-center`"
      :position="center"
      :clickable="true"
      :icon="{ url: require('../../static/img/Bttn.png') }"
    />
    <div v-for="(marker, index) in markers" :key="index">
      <GmapMarker
        :ref="`marker${marker.type}${index}`"
        :position="marker.pos"
        :clickable="true"
        :draggable="true"
        :icon="{ url: require('../../static/img/Bttn.png') }"
        @dragend="dragging($event, index)"
      />
    </div>
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
    }
  },
  data() {
    return {
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
    console.log(this.directionsOrigin);
  },
  methods: {
    dragging(event, index) {
      let marker = this.markers[index];
      let start = marker.start ? marker.pos : null;
      let end = marker.end ? marker.pos : null;

      this.$emit("directionsChanged", {
        start: start,
        end: end
      });
    },
    emitDirectionPos(pos) {
      console.log(pos);
      this.markers.push({
        pos: pos.start_location,
        type: "direction",
        start: true
      });
      this.markers.push({
        pos: pos.start_location,
        type: "direction",
        end: true
      });
    }
  }
};
</script>
