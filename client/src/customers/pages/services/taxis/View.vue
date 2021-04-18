<template>
  <div>
    <div id="taxiRequest" v-if="orderDetails">
      <!-- ******************pop up Cancel ************************-->
      <pop-up
        v-if="cancelPopUp"
        @picked="cancelRide($event)"
        :choiceList="choiceList"
        @close="cancelPopUp=false"
        :title="$t('customer.cancelOrder.question') "
        :icon="'times-circle'"
      ></pop-up>
      <!-- ******************pop up Warning Taxi taken ************************-->
      <pop-up
        v-if="cancelReport"
        :choiceList="[$t('customer.cancelOrder.cancelRide'),$t('customer.cancelOrder.postAgain')]"
        @picked="submitReposting($event)"
        @close="cancelPopUp=false"
        :title="$t('customer.cancelOrder.taxiCancelled')"
        :icon="'do-not-enter'"
      ></pop-up>
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
            class="elevate_1 nav-btn text_white"
            :mode="{
            bg_error: true,
            small: true,
          }"
            @click.native="cancelPopUp=true"
            :loading="loading"
          >
            <fa icon="times-circle" />
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
            class="dark bg_light elevate_1 nav-btn text_primary"
            :mode="{
            bg_diagonal: true,
            small: true,
          }"
            :link="true"
            :to="{
              path: messageLink,
              
            }"
          >
            <fa icon="envelope" />
            <span class="badge bg_error" v-if="orderMessages"></span>
          </base-button>
          <base-button
            class="elevate_1 nav-btn text_white"
            :mode="{
            bg_error: true,
            small: true,
          }"
            @click.native="cancelPopUp=true"
            :loading="loading"
          >
            <fa icon="times-circle" />
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
            class="dark bg_light elevate_1 nav-btn text_primary"
            :mode="{
            bg_diagonal: true,
            small: true,
          }"
            :link="true"
            :to="{
              path: messageLink,
              
            }"
          >
            <fa icon="envelope" />
            <span class="badge bg_error" v-if="orderMessages"></span>
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
                <h5 class="regular text_grey">{{$t('customer.taxiView.droppedOff')}}</h5>
              </div>
            </div>
          </div>
        </div>
        <!-- Cancelled  Status-->
        <div
          class="flex align_center space_between btnP bg_white elevate_2"
          slot="action"
          v-else-if="orderDetails.status == 'cancelled'"
        >
          <div class="w-70">
            <div class="flex align_center">
              <avatar size="2.4rem" :url="orderDetails.driver.image" v-if="orderDetails.driver"></avatar>
              <div class="user_name">
                <h4 class="text_blackL" v-if="orderDetails.driver">{{ orderDetails.driver.name }}</h4>
                <h5 class="regular text_grey">{{$t('customer.taxiView.cancelled')}}</h5>
              </div>
            </div>
          </div>
        </div>
      </input-location>
    </div>
    <div v-else>
      <h3>{{$t('customer.taxiView.loading')}} ...</h3>
    </div>
  </div>
</template>

<script>
import popUp from "@/shared/components/ui/popUp";

export default {
  components: {
    popUp
  },
  data() {
    return {
      loading: false,
      cancelPopUp: false,
      choiceList: [
        this.$t("customer.cancelOrder.noShow"),
        this.$t("customer.cancelOrder.other")
      ],
      cancelReport: false
    };
  },
  computed: {
    notifications() {
      return this.$store.getters["notifications/ungroupedList"];
    },
    orderMessages() {
      let orderId = this.$route.params.orderId;
      if (this.notifications) {
        return Object.values(this.notifications).find(notif => {
          return (
            notif.notificationType == "newMessage" && notif.orderId == orderId
          );
        });
      } else {
        return 0;
      }
    },
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
      console.log(this.orderDetails);

      if (this.orderDetails) {
        // if (this.orderDetails.status == "onTheWay") {
        //   borns.start = {
        //     lat: this.deepFind(
        //       this.orderDetails,
        //       "driver.location.position.lat"
        //     ),
        //     lng: this.deepFind(
        //       this.orderDetails,
        //       "driver.location.position.lng"
        //     )
        //   };
        //   borns.end = {
        //     lat: this.orderDetails.from.lat,
        //     lng: this.orderDetails.from.lng
        //   };
        // } else if (this.orderDetails.status == "inTransit") {
        //   borns.start = {
        //     lat: this.deepFind(
        //       this.orderDetails,
        //       "driver.location.position.lat"
        //     ),
        //     lng: this.deepFind(
        //       this.orderDetails,
        //       "driver.location.position.lng"
        //     )
        //   };
        //   borns.end = {
        //     lat: this.orderDetails.to.lat,
        //     lng: this.orderDetails.to.lng
        //   };
        // } else {
        //   borns.start = {
        //     lat: this.orderDetails.from.lat,
        //     lng: this.orderDetails.from.lng
        //   };

        //   borns.end = {
        //     lat: this.orderDetails.to.lat,
        //     lng: this.orderDetails.to.lng
        //   };
        // }
        borns.start = {
          lat: this.orderDetails.from.lat,
          lng: this.orderDetails.from.lng
        };

        borns.end = {
          lat: this.orderDetails.to.lat,
          lng: this.orderDetails.to.lng
        };
      }
      return borns;
    }
  },
  watch: {
    orderDetails: {
      deep: true,
      immediate: true,
      handler: function(newVal, oldVal) {
        if (newVal) {
          if (newVal.status == "cancelled" && oldVal) {
            this.cancelReport = true;
          }
        }
      }
    }
  },
  methods: {
    async cancelRide(reason) {
      this.loading = true;
      this.cancelPopUp = false;
      await this.$store.dispatch("taxis/cancelTaxi", reason);
      this.$router.push({ name: "home" });
      this.loading = false;
    },

    async requestTaxi(ride) {
      let data = {
        to: ride.to,
        from: ride.from,
        distance: ride.distance,
        duration: ride.duration
      };

      this.loading = true;
      let response = (await this.$store.dispatch("taxis/requestTaxi", data))
        .data;
      this.loading = false;

      if (response.status == "Success") {
        console.log(response);

        this.$router.push({ path: `${response.orderId}` });
        window.location.reload();
      } else {
        this.errorMessage = response.errorMessage;
      }
    },
    async submitReposting(cmd) {
      if (cmd == this.$t("customer.cancelOrder.cancelRide")) {
        await this.cancelRide("taxi cancelled");
        this.$router.push({ name: "home" });
      } else {
        await this.$store.dispatch("taxis/saveAddress", this.orderDetails);
        this.$router.push("/services/taxi/request");
        //this.requestTaxi(this.orderDetails);
      }
    }
  },
  async beforeCreate() {
    this.$store.dispatch("taxis/loadTaxi", {
      orderId: this.$route.params.orderId
    });
    this.$store.dispatch("notifications/clearOrderStatusNotifications", {
      orderId: this.$route.params.orderId
    });
  },
  async beforeRouteUpdate(to, _, next) {
    console.log("route update ");

    this.$store.dispatch("taxis/loadTaxi", {
      orderId: to.params.orderId
    });
    next();
  }
};
</script>
<style lang="scss" scoped>
@import "@/shared/assets/scss/_taxiView.scss";
.badge {
  position: absolute;
  width: 10px;
  height: 10px;
  border: 2px solid #f6efff;
  line-height: 1rem;
  border-radius: 50%;
  color: map-get($map: $colors, $key: white);
  font-size: 0.8rem;
  text-align: center;
  top: -0.4rem;
  right: -0.4rem;
}
</style>
