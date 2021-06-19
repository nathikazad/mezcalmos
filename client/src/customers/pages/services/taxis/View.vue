<template>
  <div class="non_refreshable">
    <div id="taxiRequest" v-if="orderDetails">
      <!-- ******************pop up Cancel ************************-->
      <pop-up
        v-if="cancelPopUp"
        @picked="cancelRide($event)"
        :choiceList="choiceList"
        translatePath="customer.cancelOrder"
        @close="cancelPopUp=false"
        :title="$t('customer.cancelOrder.question') "
        :icon="'times-circle'"
      ></pop-up>
      <!-- ******************pop up Warning Taxi taken ************************-->
      <pop-up
        v-if="cancelReport"
        :choiceList="['cancelRide','postAgain']"
        translatePath="customer.cancelOrder"
        @picked="submitReposting($event)"
        @close="cancelPopUp=false"
        :title="$t(`customer.cancelOrder.${popUpTitleI18n}`)"
        :icon="'do-not-enter'"
      ></pop-up>
      <input-location
        :disabled="true"
        :to="orderDetails.to"
        :from="orderDetails.from"
        :directionsBorns="calculateBorns"
        ref="inputLocation"
        :fromUrl="deepFind(userInfo, 'photo')"
        :driverLocation="deepFind(orderDetails, 'driver.location')"
        :status="deepFind(orderDetails,'status')"
        :polyline="deepFind(orderDetails,'polyline')"
      >
        <!-- Searching fo Someone  Status-->
        <looking
          v-if="orderDetails.status == 'lookingForTaxi'"
          :loading="loading"
          @cancelPopUp="cancelPopUp=true"
          :orderDetails="orderDetails"
          type="customer"
          slot="details"
          class="routePill"
        ></looking>

        <!-- Found Someone  Status-->
        <onTheWay
          v-else-if="orderDetails.status == 'onTheWay'"
          :orderDetails="orderDetails"
          :messageLink="messageLink"
          :orderMessages="orderMessages"
          :loading="loading"
          @cancelPopUp="cancelPopUp=true"
          type="customer"
          slot="details"
          class="routePill"
        ></onTheWay>

        <!-- In Transit  Status-->
        <inTransit
          :orderDetails="orderDetails"
          type="customer"
          slot="details"
          class="routePill"
          :messageLink="messageLink"
          :orderMessages="orderMessages"
          :loading="loading"
          @cancelPopUp="cancelPopUp=true"
          v-else-if="orderDetails.status == 'inTransit'"
        ></inTransit>

        <!-- Droped off  Status-->
        <droppedOff
          v-else-if="orderDetails.status == 'droppedOff'"
          :orderDetails="orderDetails"
          type="customer"
          slot="details"
          class="routePill"
        ></droppedOff>
        <!-- Cancelled  Status-->
        <cancelled
          v-else-if="orderDetails.status == 'cancelled'"
          :orderDetails="orderDetails"
          type="customer"
          slot="details"
          class="routePill"
        ></cancelled>
      </input-location>
    </div>
    <div v-else class="flex align_center center wrap">
      <img class="w-80 mt-4" src="@/shared/static/img/noRide.svg" />
      <p class="fill_width pa-3 text_grey txt_center">{{$t('customer.taxiView.noRide')}}</p>
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
      choiceList: ["noShow", "mistake", "other"],
      cancelReport: false,
      popUpTitleI18n: ""
    };
  },
  computed: {
    notifications() {
      return this.$store.getters["notifications/list"];
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

      if (this.orderDetails) {
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
          if (oldVal) {
            if (newVal.status == "cancelled") {
              this.popUpTitleI18n = "taxiCancelled";
              this.cancelReport = true;
            } else if (newVal.status == "expired") {
              this.popUpTitleI18n = "orderExpired";
              this.cancelReport = true;
            }
          }
        }
      }
    }
  },
  methods: {
    async cancelRide(reason) {
      this.loading = true;
      this.cancelPopUp = false;
      await this.$store.dispatch("taxis/cancelTaxi", {
        reason: this.$t(`customer.cancelOrder.${reason}`, "EN")
      });
      this.$router.push({ name: "home" });
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
      if (cmd == "cancelRide") {
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
.routePill {
  position: absolute;
  width: calc(100% - 2rem) !important;
  z-index: 9;
  bottom: 2rem;
  left: 1rem;
}
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
