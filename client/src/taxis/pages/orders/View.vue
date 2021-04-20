<template>
  <div>
    <!-- ******************pop up component ************************-->
    <pop-up
      v-if="cancelPopUp"
      @picked="cancelRide($event)"
      :choiceList="choiceList"
      @close="cancelPopUp=false"
      :title="$t('taxi.cancelOrder.question') "
      :icon="'times-circle'"
    ></pop-up>
    <!-- ******************pop up Warning Taxi taken ************************-->
    <pop-up
      v-if="cancelReport"
      :choiceList="[$t('taxi.cancelOrder.backToIncoming')]"
      @picked="submitReposting($event)"
      @close="cancelPopUp=false"
      :title="reportTitle "
      :icon="'do-not-enter'"
    ></pop-up>
    <div id="taxiRequest" v-if="orderDetails">
      <h1 class="regular flex align_center space_between">
        {{ orderDetails.customer.name }}
        <span class="arrows" v-if="showArrows">
          <span @click="precedentOrder" v-if="precedentOrderId" class="text_violet">
            <fa icon="chevron-square-left"></fa>
          </span>
          <span class="text_violet" @click="nextOrder" v-if="nextOrderId">
            <fa icon="chevron-square-right"></fa>
          </span>
        </span>
      </h1>

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

          <span>
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
          </span>
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
                <h5 class="regular text_grey">{{$t('taxi.taxiView.droppedOff')}}</h5>
              </div>
            </div>
          </div>
        </div>
        <!-- Finished ride  Status-->
        <div
          class="flex align_center space_between btnP bg_white elevate_2"
          slot="action"
          v-else-if="orderStatusCancelled"
        >
          <div class="w-70">
            <div class="flex align_center">
              <avatar size="2.4rem" :url="orderDetails.customer.image"></avatar>
              <div class="user_name">
                <h4 class="text_blackL">{{ orderDetails.customer.name }}</h4>
                <h5 class="regular text_grey">{{$t('taxi.taxiView.cancelled')}}</h5>
              </div>
            </div>
          </div>
        </div>
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
      choiceList: [
        this.$t("taxi.cancelOrder.otherRide"),
        this.$t("taxi.cancelOrder.trafficJam"),
        this.$t("taxi.cancelOrder.other")
      ],
      cancelReport: false,
      reportTitle: this.$t("taxi.cancelOrder.customerCancelled"),
      sameInstance: false,
      alertStatment: ""
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
          lng: this.orderDetails.from.lng
        };

        borns.end = {
          lat: this.orderDetails.to.lat,
          lng: this.orderDetails.to.lng
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
    },
    orderStatusCancelled() {
      return this.$store.getters["order/orderStatusCancelled"];
    }
  },
  watch: {
    orderDetails: {
      deep: true,

      handler: function(newVal, oldVal) {
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
              this.$router.push("/");
            }, 2000);
          }
        } else if (oldVal) {
          //The order taken before order accepted
          //order cancelled before accepted
          console.log("!newval&&oldVal", oldVal.customer.id);
          if (!this.sameInstance) {
            this.reportTitle = this.$t("taxi.cancelOrder.rideUnavailble");
            this.cancelReport = true;
            if (this.nextOrderId) {
              setTimeout(() => {
                this.cancelReport = false;
                this.nextOrder();
              }, 2000);
            } else {
              setTimeout(() => {
                this.$router.push("/");
              }, 2000);
            }
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
      await this.$store.dispatch("order/cancelRide", { reason: reason });
      if (this.precedentOrderId) {
        this.precedentOrder();
      } else if (this.nextOrderId) {
        this.nextOrder();
      } else {
        this.$router.push("/incoming");
      }
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
.nav-btn {
  height: 2rem;
  width: 2.5rem;
  border-radius: 10px;
  margin: 0 0.3rem;
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
