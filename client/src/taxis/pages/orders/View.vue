<template>
  <div>
    <!-- ******************pop up component ************************-->
    <pop-up
      v-if="cancelPopUp"
      @picked="cancelRide($event)"
      :choiceList="choiceList"
      @close="cancelPopUp=false"
      :title="$t('taxi.cancelOrder.question') "
      translatePath="taxi.cancelOrder"
      :icon="'times-circle'"
    ></pop-up>
    <!-- ******************pop up Warning Taxi taken ************************-->
    <pop-up
      v-if="cancelReport"
      :choiceList="[]"
      translatePath="taxi.cancelOrder"
      @picked="submitReposting($event)"
      @close="cancelPopUp=false"
      :title="reportTitle "
      :icon="'do-not-enter'"
    ></pop-up>
    <div id="taxiRequest" v-if="orderDetails">
      <!-- <h1 class="regular flex align_center space_between">
        {{ orderDetails.customer.name }}
        <span class="arrows" v-if="showArrows">
          <span @click="precedentOrder" v-if="precedentOrderId" class="text_violet">
            <fa icon="chevron-square-left"></fa>
          </span>
          <span class="text_violet" @click="nextOrder" v-if="nextOrderId">
            <fa icon="chevron-square-right"></fa>
          </span>
        </span>
      </h1>-->
    <div  v-if="showArrows">
        <div @click="nextOrder" v-if="nextOrderId" class="bg_white right_chevron chevron flex align_center center elevate_2">
        <fa icon="chevron-right"></fa>
      </div>
      <div @click="precedentOrder" v-if="precedentOrderId" class="bg_white left_chevron chevron flex align_center center elevate_2">
        <fa icon="chevron-left"></fa>
      </div>
    </div>
      <input-location
        :disabled="true"
        :to="orderDetails.to"
        :from="orderDetails.from"
        :directionsBorns="calculateBorns"
        :fromUrl="deepFind(orderDetails, 'customer.image')"
        :driverLocation="deepFind(orderDetails, 'driver.location')"
        :status="deepFind(orderDetails,'status')"
      >
        <!-- Alert statment -->
        <div
          class="flex align_center space_between alert_statment bg_white elevate_2"
          slot="alert"
          v-if="alertStatment"
        >
          <div class="fill_width">
            <h5 class="text_blackL regular t-9">
              <fa icon="ban" class="text_light_error"></fa>
              {{$t(`taxi.taxiView.${alertStatment}`)}}
            </h5>
          </div>
        </div>

        <looking
          v-if="orderStatusLooking"
          :loading="loading"
          @acceptRide="acceptRide()"
          :orderDetails="orderDetails"
          type="taxi"
          slot="details"
          class="routePill"
        ></looking>
        <!-- On the way  Status-->
        <onTheWay
          :orderDetails="orderDetails"
          type="taxi"
          slot="details"
          class="routePill"
          :messageLink="messageLink"
          :orderMessages="orderMessages"
          @cancelPopUp="cancelPopUp=true"
          @startRide="startRide"
          v-else-if="orderStatusOnTheWay"
        ></onTheWay>

        <!-- Finish ride  Status-->
        <inTransit
          :orderDetails="orderDetails"
          v-else-if="orderStatusInTransit"
          type="taxi"
          slot="details"
          class="routePill"
          :messageLink="messageLink"
          :orderMessages="orderMessages"
          @cancelPopUp="cancelPopUp=true"
          @finishRide="finishRide"
        ></inTransit>

        <!-- Finished ride  Status-->
        <droppedOff
          v-else-if="orderStatusDroppedOff"
          :orderDetails="orderDetails"
          type="taxi"
          slot="details"
          class="routePill"
        ></droppedOff>

        <!-- Finished ride  Status-->
        <cancelled
          v-else-if="orderStatusCancelled"
          :orderDetails="orderDetails"
          type="taxi"
          slot="details"
          class="routePill"
        ></cancelled>
      </input-location>
    </div>
    <div v-else>
      <h3>{{$t('taxi.taxiView.loading')}} ...</h3>
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
      choiceList: ["otherRide", "trafficJam", "other"],
      cancelReport: false,
      reportTitle: this.$t("taxi.cancelOrder.customerCancelled"),
      sameInstance: false,
      alertStatment: "",
      cancelledByTaxi: false
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
    showArrows() {
      return (
        !this.inTaxi &&
        this.orderDetails.status != "droppedOff" &&
        this.orderDetails.status != "cancelled"
      );
    },
    inTaxi() {
      return this.$store.getters.isInTaxi;
    },
    nextOrderId() {
      let orderId = this.$route.params.orderId;
      let orderIndex = this.sortedOrderIds.findIndex(id => {
        return id == orderId;
      });

      let nextOrderId = this.sortedOrderIds[orderIndex + 1];
      return nextOrderId;
    },
    precedentOrderId() {
      let orderId = this.$route.params.orderId;
      let orderIndex = this.sortedOrderIds.findIndex(id => {
        return id == orderId;
      });

      let precedentOrderId = this.sortedOrderIds[orderIndex - 1];
      return precedentOrderId;
    },
    sortedOrderIds() {
      return this.$store.getters["incomingOrders/sortedOrderIds"];
    },
    orderDetails() {
      return this.$store.getters["order/getOrder"];
    },

    isLoaded() {
      return this.$store.getters["order/isLoaded"];
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
    },
    orderStatusLooking() {
      if (this.isLoaded) {
        return this.$store.getters["order/orderStatusLooking"];
      } else {
        return false;
      }
    },
    orderStatusOnTheWay() {
      return this.$store.getters["order/orderStatusOnTheWay"];
    },
    orderStatusInTransit() {
      return this.$store.getters["order/orderStatusInTransit"];
    },
    orderStatusDroppedOff() {
      return this.$store.getters["order/orderStatusDroppedOff"];
    },
    orderStatusCancelled() {
      return this.$store.getters["order/orderStatusCancelled"];
    }
  },
  watch: {
    orderDetails: {
      deep: true,

      handler: function(newVal, oldVal) {
        console.log("inside handler", newVal, oldVal);
        if (this.cancelledByTaxi) {
          // driver cancelled
          this.cancelledByTaxi = false;
          return;
        }
        if (newVal) {
          //customer cancelled after ride accepted
          console.log("newval", newVal);
          if (
            newVal.status == "cancelled" &&
            this.deepFind(oldVal, "status") == "onTheWay"
          ) {
            this.reportTitle = this.$t("taxi.cancelOrder.customerCancelled");
            this.cancelReport = true;
            setTimeout(() => {
              this.nextAvailableOrder();
            }, 4000);
          }
        } else if (oldVal) {
          // The order taken before order accepted
          // order cancelled before accepted
          console.log("!newval&&oldVal", oldVal.customer.id);
          if (!this.sameInstance) {
            this.reportTitle = this.$t("taxi.cancelOrder.rideUnavailble");
            this.cancelReport = true;

            setTimeout(() => {
              this.nextAvailableOrder();
            }, 4000);
          }
          this.sameInstance = false;
        }
      }
    }
  },
  async beforeCreate() {
    this.$store.dispatch("order/loadOrder", {
      orderId: this.$route.params.orderId
    });
  },
  async beforeRouteUpdate(to, _, next) {
    this.sameInstance = true;
    await this.$store.dispatch("order/loadOrder", {
      orderId: to.params.orderId
    });
    next();
  },
  async beforeUnmount() {
    await this.$store.dispatch("order/unloadOrder");
  },
  methods: {
    submitReposting() {
      this.$router.push("/");
    },
    async cancelRide(reason) {
      this.loading = true;
      this.cancelPopUp = false;
      this.cancelledByTaxi = true;
      await this.$store.dispatch("order/cancelRide", {
        reason: this.$t(`taxi.cancelOrder.${reason}`, "EN")
      });
      this.cancelledByTaxi = true;
      // this.nextAvailableOrder()
      this.loading = false;
    },
    async acceptRide() {
      this.loading = true;
      await this.$store.dispatch("order/acceptRide");

      this.loading = false;
    },
    async startRide() {
      this.loading = true;
      let response = await this.$store.dispatch("order/startRide");
      if (response.status == "Error") {
        this.alertStatment = response.i18nCode;
        setTimeout(() => {
          this.alertStatment = "";
        }, 4000);
      }
      this.loading = false;
    },
    async finishRide() {
      this.loading = true;
      let response = await this.$store.dispatch("order/finishRide");
      console.log(response);

      if (response.status == "Error") {
        this.alertStatment = response.i18nCode;
        setTimeout(() => {
          this.alertStatment = "";
        }, 4000);
      }
      this.loading = false;
    },
    nextOrder() {
      if (this.nextOrderId) {
        this.$router.push(`/orders/${this.nextOrderId}`);
      }
    },
    precedentOrder() {
      if (this.precedentOrderId) {
        this.$router.replace({
          name: "taxiView",
          params: { orderId: this.precedentOrderId }
        });
      }
    },
    nextAvailableOrder() {
      if (this.precedentOrderId) {
        console.log("available precedent", this.precedentOrderId);
        this.precedentOrder();
      } else if (this.nextOrderId) {
        console.log("available next", this.nextOrderId);
        this.nextOrder();
      } else {
        console.log("available incoming");
        this.$router.push("/incoming");
      }
      this.cancelReport = false;
    }
  }
};
</script>
<style lang="scss" scoped>
@import "@/shared/assets/scss/_taxiView.scss";
.arrows {
  span {
    margin: 0 0.3rem;
  }
}
.chevron{
   height: 3rem;
  width: 2rem;
  position: absolute;
  top: calc(50% - 1.5rem);
  right: 0;
  z-index: 99;
}
.right_chevron {
  right: 0;
    border-radius: 12px 0 0 12px;

}
.left_chevron {
 left: 0;
   border-radius:0 12px 12px 0;

}
.nav-btn {
  height: 2rem;
  width: 2.5rem;
  border-radius: 10px;
  margin: 0 0.3rem;
}
.routePill {
  position: absolute;
  width: calc(100% - 2rem) !important;
  z-index: 9;
  bottom: 2rem;
  left: 1rem;
}
.btnP {
  @media (max-width: 400px) {
    .w-70 {
      width: 80% !important;
    }

    .ride_details {
      margin-left: 0.5rem;
    }
  }
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
.alert_statment {
  position: absolute;
  width: 80%;
  padding: 1rem;
  right: 10%;
  bottom: 9rem;
  text-align: center;
}
</style>
