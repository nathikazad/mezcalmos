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
        :driverLocation="deepFind(orderDetails, 'driver.location')"
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
                <h5
                  class="regular text_grey"
                >{{ deepFind(orderDetails, "customer.distance") }}km {{$t('taxi.incoming.far')}}</h5>
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
            <span class="t-8 regular">{{$t('taxi.taxiView.acceptOrders')}}</span>
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
            <span class="t-8 regular">{{$t('taxi.taxiView.startRide')}}</span>
          </base-button>
          <base-button
            class="w-30 elevate_1"
            :mode="{ dark: true, bg_diagonal: true }"
            :link="true"
            :to="{
              path: messageLink,
              
            }"
          >
            <span class="t-8 regular">{{$t('taxi.taxiView.message')}}</span>
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
            <span class="t-8 regular">{{$t('taxi.taxiView.finishRide')}}</span>
          </base-button>
          <base-button
            class="w-30 elevate_1"
            :mode="{ dark: true, bg_diagonal: true }"
            :link="true"
            :to="{
              path: messageLink,
             
            }"
          >
            <span class="t-8 regular">{{$t('taxi.taxiView.message')}}</span>
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
                <h5 class="regular text_grey">{{$t('taxi.taxiView.droppedOf')}}</h5>
              </div>
            </div>
          </div>
          <base-button
            class="w-30 elevate_1"
            :mode="{ dark: true, bg_info: true }"
            :loading="loading"
          >
            <span class="t-8 regular">{{$t('taxi.taxiView.review')}}</span>
          </base-button>
        </div>
      </input-location>
    </div>
    <div v-else>
      <h3>{{$t('taxi.taxiView.loading')}} ...</h3>
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
  beforeRouteUpdate(to) {
    this.$store.dispatch("order/loadOrder", {
      orderId: to.params.orderId
    });
  },
  async beforeUnmount() {
    await this.$store.dispatch("order/unloadOrder");
  },
  methods: {
    async acceptRide() {
      this.loading = true;
      await this.$store.dispatch("order/acceptRide");
      this.loading = false;
    },
    async startRide() {
      this.loading = true;
      await this.$store.dispatch("order/startRide");
      this.loading = false;
    },
    async finishRide() {
      this.loading = true;
      await this.$store.dispatch("order/finishRide");
      this.loading = false;
    }
  }
};
</script>
<style lang="scss" scoped>
@import "@/shared/assets/scss/_taxiView.scss";
.btnP {
  @media (max-width: 400px) {
    .w-70 {
      width: 80% !important;
    }

    .w-30 {
      width: 20% !important;
    }

    .ride_details {
      margin-left: 0.5rem;
    }
  }
}
</style>
