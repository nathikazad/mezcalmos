<template>
  <div>
    <div id="taxiRequest" v-if="orderDetails">
      <!-- ******************pop up component ************************-->
      <h1 class="regular">{{ orderDetails.customer.name }}</h1>
      <input-location
        :disabled="true"
        :to="orderDetails.to"
        :from="orderDetails.from"
        :directionsBorns="calculateBorns"
        :fromUrl="deepFind(orderDetails, 'customer.image')"
      >
        <!-- Searching fo Someone  Status-->
        <div
          class="flex align_center space_between btnP bg_white elevate_2"
          slot="action"
          v-if="orderStatusLooking"
        >
          <div class="w-70 flex align_center">
            <div class="flex align_center">
              <avatar size="2.4rem" :url="orderDetails.customer.image"></avatar>
              <div class="user_name">
                <h4 class="text_blackL">{{ orderDetails.customer.name }}</h4>
                <h5 class="regular text_grey">5km far</h5>
              </div>
            </div>

            <div class="ride_details t-8" v-if="deepFind(orderDetails, 'distance.text')">
              <fa icon="route"></fa>
              {{ deepFind(orderDetails, "distance.text") }}
              <br />
              <fa icon="stopwatch"></fa>
              {{ deepFind(orderDetails, "duration.text") }}
            </div>
          </div>
          <base-button
            class="w-30 elevate_1"
            :mode="{ dark: true, bg_info: true }"
            @click.native="acceptRide()"
            :loading="loading"
          >
            <span class="t-8 regular">Accept Order</span>
          </base-button>
        </div>
        <!-- On the way  Status-->
        <div
          class="flex align_center space_between btnP bg_white elevate_2"
          slot="action"
          v-else-if="orderStatusOnTheWay"
        >
          <base-button
            class="w-30 elevate_1"
            :mode="{ dark: true, bg_info: true }"
            @click.native="startRide()"
            :loading="loading"
          >
            <span class="t-8 regular">Start Ride</span>
          </base-button>
          <base-button
            class="w-30 elevate_1"
            :mode="{ dark: true, bg_diagonal: true }"
            :link="true"
            :to="{
              path: messageLink,
              query: { redirect: $route.path },
            }"
          >
            <span class="t-8 regular">Message</span>
          </base-button>
        </div>
        <!-- Finish ride  Status-->
        <div
          class="flex align_center space_between btnP bg_white elevate_2"
          slot="action"
          v-else-if="orderStatusInTransit"
        >
          <base-button
            class="w-30 elevate_1"
            :mode="{ dark: true, bg_info: true }"
            @click.native="finishRide()"
            :loading="loading"
          >
            <span class="t-8 regular">Finish Ride</span>
          </base-button>
        </div>
        <!-- Finished ride  Status-->
        <div
          class="flex align_center space_between btnP bg_white elevate_2"
          slot="action"
          v-else-if="orderStatusDroppedOff"
        >
          <div class="w-70">
            <div class="flex align_center">
              <avatar size="2.4rem" :url="orderDetails.customer.image"></avatar>
              <div class="user_name">
                <h4 class="text_blackL">{{ orderDetails.customer.name }}</h4>
                <h5 class="regular text_grey">Dropped off</h5>
              </div>
            </div>
          </div>
          <base-button
            class="w-30 elevate_1"
            :mode="{ dark: true, bg_info: true }"
            :loading="loading"
          >
            <span class="t-8 regular">Review</span>
          </base-button>
        </div>
      </input-location>
    </div>
    <div v-else>
      <h3>Loading ...</h3>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      loading: false
    };
  },
  computed: {
    orderDetails() {
      return this.$store.getters["order/getOrder"];
    },
    isLoaded() {
      return this.$store.getters["order/isLoaded"];
    },
    messageLink() {
      return `/messages/${this.$route.params.orderId}`;
    },
    orderStatusLooking() {
      if (this.isLoaded) {
        return this.$store.getters["order/orderStatusLooking"];
      } else {
        return false;
      }
    },
    calculateBorns() {
      let borns = {
        start: null,
        end: null
      };

      if (this.orderDetails) {
        borns.start = {
          lat: this.orderDetails.from.lat,
          lng: this.orderDetails.from.long
        };

        borns.end = {
          lat: this.orderDetails.to.lat,
          lng: this.orderDetails.to.long
        };
      }
      return borns;
    },
    orderStatusOnTheWay() {
      return this.$store.getters["order/orderStatusOnTheWay"];
    },
    orderStatusInTransit() {
      return this.$store.getters["order/orderStatusInTransit"];
    },
    orderStatusDroppedOff() {
      return this.$store.getters["order/orderStatusDroppedOff"];
    }
  },
  async beforeCreate() {
    this.$store.dispatch("order/loadOrder", {
      orderId: this.$route.params.orderId
    });
  },
  async beforeUnmount() {
    console.log("before unmount");
    await this.$store.dispatch("order/unloadOrder");
  },
  methods: {
    async acceptRide() {
      this.loading = true;
      let response = await this.$store.dispatch("order/acceptRide");
      console.log(response);
      this.loading = false;
    },
    async updateDriverPosition(position) {
      position = {
        lat: 34.25, 
        lng: 31.58,
        distanceToLocation: 2.3,
        timeToLocation: 1500,
        estimatedArrivalTime: (new Date()).toUTCString(),
        lastUpdateTime: (new Date()).toUTCString()
      };
      this.$store.dispatch("order/updateDriverPosition", position)
    },
    async startRide() {
      this.loading = true;
      let response = await this.$store.dispatch("order/startRide");
      console.log(response);
      this.loading = false;
    },
    async finishRide() {
      this.loading = true;
      let response = await this.$store.dispatch("order/finishRide");
      console.log(response);
      this.loading = false;
    }
  }
};
</script>
<style lang="scss" scoped>
::v-deep .map {
  position: absolute;
  height: calc(100% - 6.25rem);
  left: 0;
  width: 100%;
  top: 6.25rem;
  z-index: 0;
}
.btnP {
  position: absolute;
  width: calc(100% - 2rem);
  z-index: 9;
  bottom: 2rem;
  left: 1rem;
  padding: 0.5rem;
  border-radius: 4px;
  &::v-deep .btn {
    height: 2.3rem;
  }
  .user_name {
    margin-left: 0.8rem;
    h5,
    h4 {
      margin: 0;
    }
  }
  .ride_details {
    margin-left: 1rem;
  }
}
</style>
