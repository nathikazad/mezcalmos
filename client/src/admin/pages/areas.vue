<template>
  <v-container class="map_container" fluid>
    <div class="my-2">
      <v-spacer></v-spacer>
      <v-btn elevation="2">Save</v-btn>
    </div>
    <div class="ranger">
      <v-slider
        label="distance"
        thumb-label="always"
        v-model="circles[clicked].distance"
        max="1000"
        min="10"
        step="10"
        ticks
      ></v-slider>
      <v-text-field name="name" label="Name" id="id" outlined v-model="circles[clicked].name"></v-text-field>
    </div>
    <div class="py-8 map_part">
      <GmapMap
        style="width: 100%; height: 100%; "
        :center="center"
        :zoom="14"
        v-bind:options="mapOptions"
        ref="gmap"
        @click="addMarker($event)"
      >
        <GmapCircle
          v-for="(pin, index) in circles"
          :key="pin.id"
          :center="pin.position"
          :radius="pin.distance"
          :visible="true"
          :options="{fillColor:'#5184ff',fillOpacity:0.3,strokeOpacity:0}"
          @click="clicked=index"
        ></GmapCircle>
        <GmapMarker
          v-for="(pin, index) in circles"
          :key="index"
          :ref="`marker-center`"
          :position="pin.position"
          :clickable="true"
          :draggable="true"
          @drag="updateMarker($event,index)"
          @click="removeCircle(index)"
        />
      </GmapMap>
    </div>
  </v-container>
</template>

<script>
export default {
  data() {
    return {
      clicked: 0,
      range: 500,
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
      zoom: 10,
      center: { lat: 15.867251158382286, lng: -97.07948455797843 },
      circles: [
        {
          Id: 1,
          distance: 300,
          name: "area1",
          position: { lat: 15.867251158382286, lng: -97.07948455797843 }
        },
        {
          Id: 2,
          name: "area2",
          distance: 500,
          position: { lat: 15.872617509283694, lng: -97.08472022981 }
        }
      ]
    };
  },
  methods: {
    updateMarker(location, id) {
      this.circles[id].position = {
        lat: location.latLng.lat(),
        lng: location.latLng.lng()
      };
    },
    addMarker(location) {
      let circle = {
        Id: this.circles.length,
        distance: 100,
        name: "",
        position: { lat: location.latLng.lat(), lng: location.latLng.lng() }
      };
      this.circles.push(circle);
      this.clicked = this.circles.length - 1;
    },
    removeCircle(index) {
      if (index > 0) {
        this.clicked -= 1;
        this.circles.splice(index, 1);
      }
    }
  }
};
</script>
<style lang="scss" scoped>
.v-item--active {
  background: map-get($map: $colors, $key: secondary);
}
.map_container {
  height: calc(100vh - 62px);
}
.ranger {
  height: auto;
}
.map_part{
  height: 600px;
}
</style>