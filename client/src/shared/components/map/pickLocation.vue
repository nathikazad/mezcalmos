<template>
  <div>
    <h1 class="regular">{{ title }}</h1>
    <div class="field" id="placeName">
      <h3 class="bold flex space_between">
        <span>Name</span>
      </h3>
      <input
        type="text"
        class="input bg_secondary text_blackD"
        placeholder="Enter Name..."
        v-model="name"
      />
    </div>
    <div class="field address_input relative" id="note">
      <h3 class="bold flex space_between">
        <span>Address</span>
      </h3>
      <input
        @blur="blured()"
        type="text"
        placeholder="Enter Address"
        class="input bg_secondary text_blackD"
        v-model="saved.address"
        ref="from"
      />
      <!-- Drop down menu for search-->
      <div class="dropdown bg_white border elevate_2" v-if="deepFind(saved, 'searching')">
        <span v-if="saved.results.length && saved.searching">
          <h3
            @click="pickedLocation(res)"
            v-for="(res, index) in saved.results"
            :key="index"
            class="flex t-10 regular"
          >
            <fa icon="search " class="icon text_primary"></fa>
            {{ res.description }}
          </h3>
        </span>
        <div v-else>
          <h3 class="flex t-10 regular">Searching...</h3>
        </div>
      </div>
    </div>

    <div class="map field fill_width">
      <map-view :center="saved.pos" ref="map" @markerDragged="saved.pos = $event"></map-view>
    </div>
    <div class="field">
      <base-button
        class="fill_width"
        :mode="{ dark: true, bg_diagonal: true }"
        :loading="loading"
        @click.native="pickLocation"
      >
        <span class="t-8">PICK</span>
      </base-button>
    </div>
  </div>
</template>

<script>
export default {
  props: {
    title: {
      type: String,
      required: true
    },
    editId: {
      type: String
    }
  },
  data() {
    return {
      name: "",
      loading: false,
      saved: {
        address: "",
        results: [],
        searching: false,
        pos: { lat: 30.2672, lng: -97.7431 }
      },
      delayer: null
    };
  },

  mounted() {
    if (this.customerLocation && !this.editId) {
      this.saved.pos = this.customerLocation;
      setTimeout(async () => {
        this.saved.address = await this.geocodedAddress(this.customerLocation);
        setTimeout(() => {
          this.saved.searching = false;
        }, 100);
      }, 200);
    } else {
      //console.log("Geo Location not supported by browser");
    }
  },
  computed: {
    isLoggedIn() {
      return this.$store.getters.loggedIn;
    },
    customerLocation() {
      return this.$store.getters.userLocation;
    }
  },
  watch: {
    "saved.address": {
      deep: true,

      handler: function(newVal) {
        if (newVal) {
          this.saved.searching = true;
          clearTimeout(this.delayer);

          this.delayer = setTimeout(() => {
            var service = new window.google.maps.places.AutocompleteService();
            let location = new window.google.maps.LatLng(
              this.saved.pos.lat,
              this.saved.pos.lng
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
                this.saved.results = predections;
              }
            );
          }, 3000);
        } else {
          this.saved.searching = false;
          this.saved.results = [];
        }
      }
    }
  },
  methods: {
    blured() {
      setTimeout(() => {
        this.saved.searching = false;
      }, 200);
    },
    async pickLocation() {
      let place = {
        name: this.name,
        lat: this.saved.pos.lat,
        long: this.saved.pos.lng,
        address: this.saved.address
      };
      this.loading = true;
      if (this.editId) {
        await this.$store.dispatch("savedLocations/editLocation", {
          savedLocationId: this.editId,
          newLocation: place
        });
      } else {
        await this.$store.dispatch("savedLocations/saveLocation", place);
      }

      this.loading = false;
      this.$router.go(-1);
    },

    async pickedLocation(place) {
      let map = this.$refs["map"].$refs["marker-center"].$map;
      this.saved.address = place.description;

      var service = new window.google.maps.places.PlacesService(map);
      await service.getDetails({ placeId: place["place_id"] }, res => {
        this.saved.searching = false;

        this.saved.pos = {
          lat: res.geometry.location.lat(),
          lng: res.geometry.location.lng()
        };
      });
    }
  }
};
</script>
<style lang="scss" scoped>
.pill {
  border-radius: 6px !important;
  padding: 0.4rem 0.5rem;
}
.field {
  margin-top: 1rem;
}
.circle {
  width: 7.25rem;
  height: 7.25rem;
  background: map-get($gradients, diagonal);
  border-radius: 50%;
  margin: 1rem auto;

  .logo {
    width: 4.25rem;
    height: auto;
    animation: rotation 1s infinite ease-in-out;
  }
}

.dropdown {
  position: absolute;
  width: 100%;
  border-radius: 4px;
  min-height: 5rem;
  top: 5.5rem;
  padding: 1rem;
  z-index: 5;

  h3 {
    margin: 0.5rem 0;
    padding: 0.5rem;
    &:hover {
      background: map-get($colors, secondary);
    }
  }
}
.map {
  height: 12rem;
  position: relative;
}
</style>
