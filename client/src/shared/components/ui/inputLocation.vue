<template>
  <div>
    <!-- ******************pop up component ************************-->

    <div class="field relative locationPicker">
      <div
        class="fromTo flex space_between align_center bg_white elevate_2"
        :class="{ focusedTo: focusedTo, focusedFrom: focusedFrom }"
      >
        <div class="from fill_height side">
          <h5>{{$t('shared.inputLocation.from')}} {{ oneWay == "to" ? `(${$t('shared.inputLocation.optional')})` : "" }}</h5>
          <input
            :disabled="disabled"
            type="text"
            placeholder="Enter Address"
            class="input"
            @focus="focused('From')"
            @blur="blured('From')"
            v-model="from.address"
            ref="from"
          />
        </div>
        <base-button
          :mode="{ dark: true, bg_diagonal: true }"
          class="float_btn flex align_center center"
        >
          <logo class="icon_logo" :light="true"></logo>
        </base-button>
        <div class="to fill_height side">
          <h5>{{$t('shared.inputLocation.to')}} {{ oneWay == "from" ? "(Optional)" : "" }}</h5>
          <input
            :disabled="disabled"
            type="text"
            placeholder="Enter Address"
            class="input"
            @focus="focused('To')"
            @blur="blured('To')"
            v-model="to.address"
            ref="to"
          />
        </div>
      </div>
      <!-- Drop down menu for saved locations-->
      <div class="dropdown bg_white border elevate_2" v-if="deepFind(saved, 'opened')">
        <h3 @click="pickCuerrentLocation()" class="flex t-10 regular">
          <fa icon="crosshairs" class="icon text_primary"></fa>
          {{$t('shared.inputLocation.currentLoc')}}
        </h3>
        <h3
          @click="pickedFromSaved(res)"
          class="flex t-10 regular"
          v-for="(res, index) in savedLocations"
          :key="index"
        >
          <fa icon="search" class="icon text_primary"></fa>
          {{ res.name }}
        </h3>
      </div>
      <!-- Drop down menu for search-->
      <div class="dropdown bg_white border elevate_2" v-if="deepFind(search, 'searching')">
        <span v-if="search.results.length">
          <h3
            @click="pickedLocation(res)"
            v-for="(res, index) in search.results"
            :key="index"
            class="flex t-10 regular"
          >
            <fa icon="search " class="icon text_primary"></fa>
            {{ res.description }}
          </h3>
        </span>
        <div v-else>
          <h3 class="flex t-10 regular">{{$t('shared.inputLocation.searching')}}...</h3>
        </div>
      </div>
    </div>
    <div class="map">
      <map-view
        @directionChanged="sendDirection($event)"
        :center="center"
        ref="map"
        :directionsOrigin="directionsBorns.start"
        :directionsDest="directionsBorns.end"
        :fromUrl="fromUrl"
        v-if="withMap && center"
        :driverLocation="driverLocation"
        :status="status"
      ></map-view>

      <slot name="action"></slot>
      <slot name="alert"></slot>
    </div>
  </div>
</template>

<script>
export default {
  props: {
    search: {
      type: Object
    },
    saved: {
      type: Object,
      default() {
        return { opened: false };
      }
    },
    status: { type: String },
    directionsBorns: {
      type: Object
    },
    oneWay: {
      type: String
    },
    to: {
      type: Object
    },
    from: {
      type: Object
    },
    disabled: {
      type: Boolean
    },
    fromUrl: {
      type: String
    },

    withMap: {
      type: Boolean,
      default: true
    },
    driverLocation: {
      type: Object
    }
  },
  data() {
    return {
      focusedFrom: false,
      focusedTo: false,
      pickLocation: false,
      auxCenter: null,
      delayer: null
    };
  },
  computed: {
    isLoggedIn() {
      return this.$store.getters.loggedIn;
    },
    savedLocations() {
      return this.$store.getters["savedLocations/locations"] || {};
    },
    userDefaultLocation() {
      return this.$store.getters["getUserDefaultLocation"];
    },
    customerLocation() {
      let currentLoc =
        this.$store.getters.userLocation || this.userDefaultLocation;
      return {
        lat: this.deepFind(currentLoc, "lat"),
        lng: this.deepFind(currentLoc, "lng")
      };
    },
    center() {
      if (this.auxCenter) {
        return this.auxCenter;
      } else {
        return this.directionsBorns.start || this.customerLocation;
      }
    }
  },
  mounted() {},
  watch: {
    "to.address": {
      deep: true,

      handler: function(newVal) {
        //console.log("new val ", newVal);

        if (this.search) {
          if (newVal && this.to.by == "search") {
            //console.log("inside search  ", newVal);
            this.saved.opened = false;
            this.search.searching = true;
            clearTimeout(this.delayer);
            this.delayer = setTimeout(() => {
              var service = new window.google.maps.places.AutocompleteService();
              let location = new window.google.maps.LatLng(
                this.center.lat,
                this.center.lng
              );
              let circle = new window.google.maps.Circle({
                radius: 5000,
                center: location
              });

              service.getQueryPredictions(
                {
                  input: newVal,
                  bounds: circle.getBounds()
                },
                predections => {
                  this.search.results = predections;
                }
              );
              this.$store.dispatch("logger/log", {
                userType: this.$store.getters.appName,
                callType: "SearcForPlaces",
                route: this.$route.path
              });
            }, 1000);
          } else {
            this.search.searching = false;
            this.search.results = [];
          }
        }
      }
    },
    "from.address": {
      deep: true,

      handler: function(newVal) {
        if (this.search) {
          if (newVal && this.from.by == "search") {
            this.saved.opened = false;
            this.search.searching = true;
            clearTimeout(this.delayer);
            this.delayer = setTimeout(() => {
              var service = new window.google.maps.places.AutocompleteService();
              let location = new window.google.maps.LatLng(
                this.center.lat,
                this.center.lng
              );
              let circle = new window.google.maps.Circle({
                radius: 5000,
                center: location
              });

              service.getQueryPredictions(
                {
                  input: newVal,
                  bounds: circle.getBounds()
                },
                predections => {
                  this.search.results = predections;
                }
              );
              this.$store.dispatch("logger/log", {
                userType: this.$store.getters.appName,
                callType: "SearcForPlaces",
                route: this.$route.path
              });
            }, 1000);
          } else {
            this.search.searching = false;
            this.search.results = [];
          }
        }
      }
    }
  },
  methods: {
    sendDirection(pos) {
      this.$emit("setPos", pos);
    },

    focused(title) {
      this.focusedFrom = title == "From";
      this.focusedTo = title == "To";
      this.search.origin = title.toLowerCase();
      this.saved.opened = true;

      this.saved.origin = title.toLowerCase();
    },
    blured(title) {
      setTimeout(() => {
        this.search.searching = false;
        this.saved.opened = false;
      }, 200);
      title == "From" ? (this.focusedFrom = false) : (this.focusedTo = false);

      this.search.origin = title.toLowerCase();
    },
    changeDirection(direction, pos) {
      if (direction == "from") {
        this.directionsBorns.start = {
          lat: pos.lat(),
          lng: pos.lng()
        };
      } else if (direction == "to") {
        this.directionsBorns.end = {
          lat: pos.lat(),
          lng: pos.lng()
        };
      }
    },

    async login() {
      await this.$store.dispatch("login");
    },
    setDirctionsBorns(borns) {
      this.directionsBorns = borns;
    },
    async pickedLocation(place) {
      let map = this.$refs["map"].$refs["marker-center"].$map;
      this.search[this.search.origin] = place.description;
      this[this.search.origin].address = place.description;

      var service = new window.google.maps.places.PlacesService(map);
      await service.getDetails({ placeId: place["place_id"] }, res => {
        this.auxCenter = res.geometry.location;
        this.search.searching = false;
        this.$emit("changedDirection", {
          origin: this.search.origin,
          pos: res.geometry.location
        });
        this[this.search.origin].lat = res.geometry.location.lat();
        this[this.search.origin].lng = res.geometry.location.lng();
        this.$emit("centerChanged", res.geometry.location);
        this.changeDirection(this.search.origin, res.geometry.location);
      });
    },
    pickedFromSaved(place) {
      let pos = {
        lat: place.lat,
        lng: place.lng
      };
      this.changeDirection(this.saved.origin, {
        lat: () => {
          return pos.lat;
        },
        lng: () => {
          return pos.lng;
        }
      });
      this.auxCenter = pos;
      this[this.saved.origin].address = place.address;
      this[this.saved.origin].lat = place.lat;
      this[this.saved.origin].lng = place.lng;
      this.$emit("changedDirection", {
        origin: this.saved.origin,
        pos: pos
      });
      this.$emit("centerChanged", pos);
      this.saved.opened = false;
    },
    async pickCuerrentLocation() {
      let pos = {
        lat: this.customerLocation.lat,
        lng: this.customerLocation.lng
      };
      this.changeDirection(this.saved.origin, {
        lat: () => {
          return pos.lat;
        },
        lng: () => {
          return pos.lng;
        }
      });
      this.auxCenter = pos;
      this[this.saved.origin].by = "current";
      this[this.saved.origin].address = await this.geocodedAddress(pos);
      this[this.saved.origin].lat = pos.lat;
      this[this.saved.origin].lng = pos.lng;
      this.$emit("changedDirection", {
        origin: this.saved.origin,
        pos: pos
      });
      this.$emit("centerChanged", pos);
      this.saved.opened = false;
      this.search.searching = false;
      setTimeout(() => {
        this[this.saved.origin].by = "search";
      }, 200);
    }
  }
};
</script>
<style lang="scss" scoped>
.fromTo {
  height: 3.5rem;
  border-radius: 4px;
  position: relative;
  .side {
    padding: 0.8rem 1rem;
    width: 50%;
    transition: 0.5s all;
  }
  .to {
    padding-left: 2rem;
  }
  .from {
    border-right: $border;
  }
  h5 {
    margin: 0;
  }
  .input {
    height: 1.1rem;
    border: none;
    padding: 0;
    &:disabled {
      color: map-get($colors, blackL);
      opacity: 1 !important;
      -webkit-text-fill-color: map-get($colors, blackL);
    }
  }
}
.focusedFrom {
  .from {
    width: 80%;
  }
  .to {
    width: 20%;
  }
  .float_btn {
    left: calc(80% - 0.95rem);
  }
}
.focusedTo {
  .to {
    width: 80%;
  }
  .from {
    width: 20%;
  }
  .float_btn {
    left: calc(20% - 0.95rem);
  }
}
.float_btn {
  width: 2rem;
  height: 2rem;
  border-radius: 50%;
  font-size: 1rem;
  position: absolute;
  left: calc(50% - 0.95rem);
  transition: 0.5s all;
  ::v-deep span {
    display: flex;
    align-items: center;
    justify-content: center;
  }
}
.locationPicker {
  z-index: 5;
}
.dropdown {
  position: absolute;
  width: 100%;
  border-radius: 4px;
  min-height: 5rem;
  top: 4rem;
  padding: 1rem;
  h3 {
    margin: 0.5rem 0;
    padding: 0.5rem;
    &:hover {
      background: map-get($colors, secondary);
    }
  }
}
.icon {
  margin-right: 0.5rem;
}
.icon_logo {
  height: 1.4rem;
  margin-right: 0rem;
}
</style>
