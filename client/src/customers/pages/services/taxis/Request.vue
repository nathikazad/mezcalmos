<template>
  <div id="taxiRequest">
    <!-- pop up component -->
    <pop-up v-if="pickLocation"></pop-up>
    <!-- ******************pop up component ************************-->
    <h1 class="regular">Taxi</h1>
    <input-location
      :search.sync="search"
      :saved.sync="saved"
      :directionsBorns.sync="directionsBorns"
      :to.sync="to"
      :from.sync="from"
    >
      <div class="flex align_center center btnP" slot="action">
        <base-button
          class="w-80"
          :mode="{ dark: true, bg_diagonal: true }"
          @click.native="requestTaxi()"
        >
          <span class="t-8 regular">CONFIRM</span>
        </base-button>
      </div>
    </input-location>
  </div>

  <!-- 
    TODO: check if logged in, if not show login with facebook

    <button v-if="isLoggedIn" @click="requestTaxi">Get Taxi</button>
    <button v-else @click="login">Sign in with Facebook to Get Taxi</button
  ><br />-->
</template>

<script>
//import PickLocation from "../../../components/map/GetLocation";
import popUp from "@/shared/components/ui/popUp";
export default {
  components: { popUp },
  data() {
    return {
      focusedFrom: false,
      focusedTo: false,
      pickLocation: false,
      center: { lat: 30.2672, lng: -97.7431 },
      from: {
        lat: 22.29924,
        long: 73.16584,
        address: "",
        by: "search"
      },
      to: {
        lat: 22.29924,
        long: 73.16584,
        address: "",
        by: "search"
      },
      search: {
        to: "",
        from: "",
        results: [],
        searching: false,
        origin: "to"
      },
      directionsBorns: {
        start: null,
        end: null
      },
      saved: {
        locations: [
          {
            description: "Home",
            pos: { lat: () => 34.7667, lng: () => 10.7255 }
          },
          {
            description: "Office",
            pos: { lat: () => 34.7571, lng: () => 10.7715 }
          }
        ],
        origin: "from",
        opened: false
      }
    };
  },
  computed: {
    isLoggedIn() {
      return this.$store.getters.loggedIn;
    }
  },
  mounted() {
    setTimeout(() => {
      console.log("timeOut");

      this.directionsBorns.start = { lat: 41.5, lng: -87 };
    }, 2000);
  },
  watch: {
    "search.to": {
      deep: true,
      immediate: true,
      handler: function(newVal) {
        console.log(newVal);

        if (newVal) {
          this.saved.opened = false;
          this.search.searching = true;

          if (newVal.length > 4) {
            console.log(window.google.maps.places);

            var service = new window.google.maps.places.AutocompleteService();
            service.getQueryPredictions(
              { input: newVal },
              (predections, status) => {
                console.log({ predections });
                this.search.results = predections;
                console.log({ status });
              }
            );

            // service.textSearch({ query: newVal }, (res) => {
            //   console.log(res);

            //
            // });
          } else {
            this.search.results = [];
          }
        } else {
          this.search.searching = false;
          this.search.results = [];
        }
      }
    },
    "search.from": {
      deep: true,

      handler: function(newVal) {
        if (newVal) {
          this.saved.opened = false;
          this.search.searching = true;

          if (newVal.length > 4) {
            console.log(window.google.maps.places);

            var service = new window.google.maps.places.AutocompleteService();
            service.getQueryPredictions(
              { input: newVal },
              (predections, status) => {
                console.log({ predections });
                this.search.results = predections;
                console.log({ status });
              }
            );

            // service.textSearch({ query: newVal }, (res) => {
            //   console.log(res);

            //
            // });
          } else {
            this.search.results = [];
          }
        } else {
          this.search.searching = false;
          this.search.results = [];
        }
      }
    }
  },
  methods: {
    focused(title) {
      console.log(title);

      this.focusedFrom = title == "From";
      this.focusedTo = title == "To";
      this.search.origin = title.toLowerCase();
      this.saved.opened = true;
      this.saved.origin = title.toLowerCase();
    },
    blured(title) {
      setTimeout(() => {
        this.search.searching = false;
      }, 1000);
      title == "From" ? (this.focusedFrom = false) : (this.focusedTo = false);

      this.search.origin = title.toLowerCase();
    },
    changeDirection(direction, pos) {
      console.log(direction);

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
    async requestTaxi() {
      let response = (
        await this.$store.dispatch("taxis/requestTaxi", {
          to: this.to,
          from: this.from
        })
      ).data;
      console.log(response);

      if (response.status == "Success") {
        this.$router.push({ path: `${response.orderId}` });
      } else {
        this.errorMessage = response.errorMessage;
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

      var service = new window.google.maps.places.PlacesService(map);
      await service.getDetails({ placeId: place["place_id"] }, res => {
        this.center = res.geometry.location;
        this.search.searching = false;
        this.changeDirection(this.search.origin, res.geometry.location);
      });
    },
    pickedFromSaved(place) {
      this.changeDirection(this.saved.origin, place.pos);
      this.center = place.pos;
      this.saved.opened = false;
    }
  }
};
</script>
<style lang="scss" scoped>
::v-deep .map {
  position: absolute;
  height: calc(100% - 6.25rem);
  width: calc(100% - 2rem);
  top: 6.25rem;
  z-index: 0;
}
.btnP {
  position: absolute;
  width: 100%;
  z-index: 9;
  bottom: 2rem;
}
</style>
