<template>
  <div>
    <h1>Taxi</h1>
    <div class="field relative locationPicker">
      <div class="fromTo flex space_between align_center bg_white elevate_2">
        <div class="from fill_height side">
          <h5>From</h5>
          <input type="text" placeholder="Enter Address" class="input" />
        </div>
        <base-button
          :mode="{ dark: true, bg_diagonal: true }"
          class="float_btn "
        >
          <i class="fal fa-repeat icon "></i>
        </base-button>
        <div class="to fill_height side">
          <h5>To</h5>
          <input type="text" placeholder="Enter Address" class="input" />
        </div>
      </div>
    </div>
    <div class="map">
      <map-view
        :center="{ lat: 30.2672, lng: -97.7431 }"
        :directionsOrigin="directionsBorns.start"
        :directionsDest="directionsBorns.end"
        @directionsChanged="changeDirection($event)"
      ></map-view>
    </div>
  </div>

  <!-- <h2>Request Taxi</h2>
    <h3>FROM</h3>
    <pick-location v-model="from"></pick-location>
    <h3>TO</h3>
    <pick-location v-model="to"></pick-location>

    <button v-if="isLoggedIn" @click="requestTaxi">Get Taxi</button>
    <button v-else @click="login">Sign in with Facebook to Get Taxi</button
  ><br />-->
  <!-- testing -->
  <!-- <label>lat:&nbsp;{{ to.lat }}</label><br/>
  <label>long:&nbsp;{{ to.long }}</label><br/>
  <label>address:&nbsp;{{ to.address }}</label><br/>-->
</template>

<script>
//import PickLocation from "../../../components/map/GetLocation";
export default {
  data() {
    return {
      from: {
        lat: 22.29924,
        long: 73.16584,
        address: "Chick Tacos, 54 something avenue, Mexico",
      },
      to: {
        lat: 22.29924,
        long: 73.16584,
        address: "Chick Tacos, 54 something avenue, Mexico",
      },
      directionsBorns: {
        start: { lat: 31, lng: -97 },
        end: { lat: 31.55, lng: -97.7431 },
      },
    };
  },
  computed: {
    isLoggedIn() {
      return this.$store.getters.loggedIn;
    },
  },
  mounted() {
    setTimeout(() => {
      console.log("timeOut");

      this.directionsBorns.start = { lat: 41.5, lng: -87 };
    }, 2000);
  },
  methods: {
    changeDirection(direction) {
      console.log(direction);

      if (direction.start) {
        this.directionsBorns.start = {
          lat: direction.start.lat(),
          lng: direction.start.lng(),
        };
      } else if (direction.end) {
        this.directionsBorns.end = {
          lat: direction.end.lat(),
          lng: direction.end.lng(),
        };
      }
    },
    async requestTaxi() {
      let response = (
        await this.$store.dispatch("taxis/requestTaxi", {
          to: this.to,
          from: this.from,
        })
      ).data;
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
  },
};
</script>
<style lang="scss">
.fromTo {
  height: 3.5rem;
  border-radius: 4px;
  position: relative;
  .side {
    padding: 0.8rem 1rem;
    width: 50%;
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
  }
}
.float_btn {
  width: 2rem;
  height: 2rem;
  border-radius: 50%;
  font-size: 1rem;
  position: absolute;
  left: calc(50% - 0.95rem);
}
.locationPicker {
  z-index: 9;
}
.map {
  position: absolute;
  height: calc(100% - 8.25rem);
  width: 100%;
  top: 8.25rem;
  z-index: 0;
}
</style>
