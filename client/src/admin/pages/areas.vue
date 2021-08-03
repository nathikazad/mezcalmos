<template>
  <v-container class="map_container" fluid>
    <v-snackbar top :width="900" v-model="snackbar">
      {{ text }}
      <template v-slot:action="{ attrs }">
        <v-btn :color="color" text v-bind="attrs" @click="snackbar = false">Close</v-btn>
      </template>
    </v-snackbar>
    <div class="ranger" v-if="clicked">
      <v-slider
        label="distance"
        thumb-label="always"
        v-model="currentArea.distance"
        max="1000"
        min="10"
        step="10"
        ticks
        @change="alertUser(1)"
      ></v-slider>
      <v-text-field
        name="name"
        label="Name"
        id="id"
        outlined
        v-model="currentArea.name"
        @input="alertUser(1)"
      ></v-text-field>
      <div class="d-flex">
        <v-text-field
          name="lat"
          label="Lat"
          id="id"
          outlined
          v-model="currentArea.position.lat"
          disabled
        ></v-text-field>
        <v-text-field
          name="Lng"
          label="Lng"
          id="id"
          outlined
          v-model="currentArea.position.lng"
          disabled
        ></v-text-field>
      </div>
      <v-btn
        :loading="loading"
        block
        color="success"
        elevation="2"
        class="fill_width"
        @click="updateArea"
      >Save</v-btn>
    </div>
    <div class="py-8 map_part">
      <GmapMap
        style="width: 100%; height: 100%; "
        :center="center"
        :zoom="14"
        v-bind:options="mapOptions"
        ref="gmap"
        @rightclick="addMarker($event)"
        class="map"
      >
        <GmapCircle
          v-for="(pin, index) in copiedList"
          :key="index"
          :center="pin.position"
          :radius="pin.distance"
          :visible="true"
          :options="{fillColor:'#5184ff',fillOpacity:0.3,strokeOpacity:0}"
          @click="clicked=index"
        ></GmapCircle>
        <GmapMarker
          v-for="(pin, index) in copiedList"
          :key="index+'M'"
          :ref="`marker-center`"
          :position="pin.position"
          :clickable="true"
          :draggable="true"
          :label="{text:pin.name,color:'black',className:'labelMarker'}"
          :icon="{
            url: ' https://maps.gstatic.com/mapfiles/api-3/images/spotlight-poi.png',
            fillColor: 'yellow',
            fillOpacity: 1,
            strokeColor: 'black',
            strokeWeight: 1,
            labelOrigin: {x: 40, y: 15}
}"
          @dragstart="clicked=index"
          @drag="changeMarkerPosition($event,index)"
          @click="clicked=index"
        />
        <gmap-info-window
          v-for="(pin, index) in copiedList"
          :key="index+'I'"
          :opened="clicked==index"
          :position="pin.position"
          :options="{
          pixelOffset: {
            width: 0,
            height: -35
          }
        }"
        >
          <div class="d-flex align-center justify-center w-100">
            <span class="px-2">{{pin.name}}</span>
            <v-btn icon outlined color="red" size="12" @click="removeArea(index)">
              <v-icon>mdi-delete</v-icon>
            </v-btn>
          </div>
        </gmap-info-window>
      </GmapMap>
    </div>
  </v-container>
</template>

<script>
export default {
  beforeCreate() {
    this.$store.dispatch("areas/fetchAreas");
  },
  data() {
    return {
      loading: false,
      clicked: null,
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
      snackbar: false,
      text: `Hello, I'm a snackbar`,
      color: "pink"
    };
  },
  computed: {
    copiedList() {
      let list = this.$store.getters["areas/areasList"];
      console.log(list);

      if (list) {
        return list;
      } else {
        return {};
      }
    },

    currentArea() {
      let copiedArea;
      if (this.clicked) {
        copiedArea = this.copiedList[this.clicked];
      }
      console.log(copiedArea);

      return copiedArea;
    }
  },
  methods: {
    changeMarkerPosition(location, id) {
      this.copiedList[id].position = {
        lat: location.latLng.lat(),
        lng: location.latLng.lng()
      };
      this.alertUser(1);
    },
    async updateArea() {
      if (this.clicked) {
        this.loading = true;
        await this.$store.dispatch("areas/updateArea", {
          id: this.clicked,
          ...this.currentArea
        });
        this.loading = false;
        this.clicked = null;
        this.alertUser(2);
      }
    },
    async addMarker(location) {
      let area = {
        distance: 100,
        name: "",
        position: { lat: location.latLng.lat(), lng: location.latLng.lng() }
      };
      let resp = await this.$store.dispatch("areas/addArea", { ...area });
      this.clicked = resp.key;
    },
    async removeArea(id) {
      this.$store.dispatch("areas/removeArea", { id: id, ...this.currentArea });
      this.clicked = null;
      this.alertUser(3);
    },
    alertUser(code) {
      switch (code) {
        case 1:
          this.snackbar = true;
          this.text = "Please make sure to save your changes";
          this.color = "pink";
          break;
        case 2:
          this.snackbar = true;
          this.text = "Area updated successfully";
          this.color = "green";
          break;
        case 3:
          this.snackbar = true;
          this.text = "Area removed successfully";
          this.color = "green";
          break;

        default:
          break;
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
.map_part {
  height: 600px;
}
::v-deep .map .labelMarker {
  transform: translateY(-300);
}
</style>