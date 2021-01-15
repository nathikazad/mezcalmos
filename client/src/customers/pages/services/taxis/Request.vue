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
      @setPos="setDistanceDuration($event)"
    >
      <div class="flex align_center center btnP" slot="action">
        <base-button
          v-if="isLoggedIn"
          class="w-80"
          :mode="{ dark: true, bg_diagonal: true }"
          @click.native="requestTaxi()"
        >
          <span class="t-8 regular">CONFIRM</span>
        </base-button>
        <base-button
          v-else
          class="w-80"
          :mode="{ dark: true, bg_diagonal: true }"
          :link="true"
          to="/auth?redirect=/services/taxi/request"
          :loading="loading"
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
      loading:false,
      distance: null,
      duration: null,
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
            description: "Rte, mahdia km 5 Sfax,Tunisia",
            pos: { lat: () => 34.7667, lng: () => 10.7255 },
            name: "Home"
          },
          {
            description: "Rte, mahdia km 8.5 Sfax,Tunisia",
            pos: { lat: () => 34.7571, lng: () => 10.7715 },
            name: "Office"
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

  methods: {
    setDistanceDuration(pos) {
      this.distance = pos.distance;
      this.duration = pos.duration;
    },
    async requestTaxi() {
      this.loading=true
      let response = (
        await this.$store.dispatch("taxis/requestTaxi", {
          to: this.to,
          from: this.from,
          distance: this.distance,
          duration: this.duration
        })
      ).data;
      this.loading=false;
      if (response.status == "Success") {
        this.$router.push({ path: `${response.orderId}` });
      } else {
        this.errorMessage = response.errorMessage;
      }
    },
    async login() {
      await this.$store.dispatch("login");
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
