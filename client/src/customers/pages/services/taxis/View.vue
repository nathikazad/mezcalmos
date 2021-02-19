<template>
  <div>
    <div id="taxiRequest" v-if="orderDetails">
      <!-- ******************pop up component ************************-->
      <h1 class="regular">{{$t('customer.taxiView.taxi')}}</h1>
      <input-location
        :disabled="true"
        :to="orderDetails.to"
        :from="orderDetails.from"
        :directionsBorns="calculateBorns"
        ref="inputLocation"
        :fromUrl="deepFind(userInfo, 'photo')"
        :driverLocation="deepFind(orderDetails, 'driver.location')"
      >
        <!-- Searching fo Someone  Status-->
        <div
          class="flex align_center space_between btnP bg_white elevate_2"
          slot="action"
          v-if="orderDetails.status == 'lookingForTaxi'"
        >
          <div class="w-70">
            <h5 class="text_grey regular t-9">{{$t('customer.taxiView.searching')}}...</h5>
          </div>
          <base-button
            class="w-30 elevate_1"
            :mode="{ dark: true, bg_error: true }"
            @click.native="requestTaxi()"
            :loading="loading"
          >
            <span class="t-8 regular">{{$t('customer.taxiView.cancel')}}</span>
          </base-button>
        </div>
        <!-- Found Someone  Status-->
        <div
          class="flex align_center space_between btnP bg_white elevate_2"
          slot="action"
          v-else-if="orderDetails.status == 'onTheWay'"
        >
          <div class="w-70">
            <div class="flex align_center">
              <avatar size="2.4rem" :url="orderDetails.driver.image"></avatar>
              <div class="user_name">
                <h4 class="text_blackL">{{ orderDetails.driver.name }}</h4>
                <h5
                  class="regular text_grey"
                  v-if="
                    deepFind(
                      orderDetails,
                      'driver.location.estimatedArrivalTime'
                    )
                  "
                >
                  {{$t('customer.taxiView.arrival')}}
                  {{
                  deepFind(
                  orderDetails,
                  "driver.location.estimatedArrivalTime"
                  ) | moment("from", "now")
                  }}
                </h5>
                <h5 class="regular text_grey" v-else>
                  {{$t('customer.taxiView.arrival')}}
                  {{ "TBD" }}
                </h5>
              </div>
            </div>
          </div>
          <base-button
            class="w-30 elevate_1"
            :mode="{ dark: true, bg_diagonal: true }"
            :link="true"
            :to="{
              path: messageLink,
              
            }"
          >
            <span class="t-8 regular">{{$t('customer.taxiView.message')}}</span>
          </base-button>
        </div>
        <!-- In Transit  Status-->
        <div
          class="flex align_center space_between btnP bg_white elevate_2"
          slot="action"
          v-else-if="orderDetails.status == 'inTransit'"
        >
          <div class="w-70">
            <div class="flex align_center">
              <avatar size="2.4rem" :url="orderDetails.driver.image"></avatar>
              <div class="user_name">
                <h4 class="text_blackL">{{ orderDetails.driver.name }}</h4>
                <h5 class="regular text_grey">{{$t('customer.taxiView.rideStarted')}}</h5>
              </div>
            </div>
          </div>
          <base-button
            class="w-30 elevate_1"
            :mode="{ dark: true, bg_diagonal: true }"
            :link="true"
            :to="{
              path: messageLink,
              
            }"
          >
            <span class="t-8 regular">{{$t('customer.taxiView.message')}}</span>
          </base-button>
        </div>
        <!-- Droped off  Status-->
        <div
          class="flex align_center space_between btnP bg_white elevate_2"
          slot="action"
          v-else-if="orderDetails.status == 'droppedOff'"
        >
          <div class="w-70">
            <div class="flex align_center">
              <avatar size="2.4rem" :url="orderDetails.driver.image"></avatar>
              <div class="user_name">
                <h4 class="text_blackL">{{ orderDetails.driver.name }}</h4>
                <h5 class="regular text_grey">{{$t('customer.taxiView.droppedOf')}}</h5>
              </div>
            </div>
          </div>
          <base-button
            class="w-30 elevate_1"
            :mode="{ dark: true, bg_info: true }"
            :loading="loading"
          >
            <span class="t-8 regular">{{$t('customer.taxiView.review')}}</span>
          </base-button>
        </div>
      </input-location>
    </div>
    <div v-else>
      <h3>{{$t('customer.taxiView.loading')}} ...</h3>
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
    userInfo() {
      return this.$store.getters["userInfo"];
    },
    orderDetails() {
      return this.$store.getters["taxis/value"];
    },
    isLoaded() {
      return this.$store.getters["taxis/value"] != null;
    },
    messageLink() {
      return `/messages/${this.$route.params.orderId}`;
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
    }
  },
  async beforeCreate() {
    this.$store.dispatch("taxis/loadTaxi", {
      orderId: this.$route.params.orderId
    });
    this.$store.dispatch("notifications/clearOrderStatusNotifications", {
      orderId: this.$route.params.orderId
    });
  }
};
</script>
<style lang="scss" scoped>
@import "@/shared/assets/scss/_taxiView.scss";
</style>
