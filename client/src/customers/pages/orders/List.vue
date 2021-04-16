<template>
  <div>
    <h1 class="regular">{{$t('customer.orders.title')}}</h1>

    <div v-if="hasOrders" class="orders">
      <div v-for="(date, index) in sortedDates" :key="index">
        <h3 class="bold t-10">
          <fa icon="calendar-alt"></fa>&nbsp;
          <span>{{date}}</span>
        </h3>
        <router-link
          :to="`/services/${orders[date][orderId].orderType}/${orderId}`"
          tag="div"
          class="pointer"
          v-for="(orderId, key) in Object.keys(orders[date]).reverse()"
          :key="key"
        >
          <!-- looking for taxi -->
          <card2
            class="bg_white border card wrap"
            v-if="orders[date][orderId].status=='lookingForTaxi'"
          >
            <div
              class="statusCircle searchCircle flex align_center center"
              slot="image"
              :class="{[`bg_${statusFormatting(orders[date][orderId]).bg}`]:true,[`text_${statusFormatting(orders[date][orderId]).color}`]:true}"
            >
              <fa :icon="statusFormatting(orders[date][orderId]).icon"></fa>
            </div>
            <div slot="title" class="bold">{{ statusFormatting(orders[date][orderId]).text }}</div>

            <span slot="aside" class="regular">
              <fa icon="clock"></fa>
              &nbsp;{{ orders[date][orderId].orderTime | moment("LT") }}
            </span>
            <div slot="footer" class="flex align_center fill_width card_footer">
              <span class="t-8 flex align_center fill_width space_between">
                <span>
                  <fa icon="map-marker"></fa>&nbsp;
                  <span
                    :title="orders[date][orderId].to.address"
                  >{{ orders[date][orderId].to.address | formatMessage(23) }}</span>
                </span>
                <strong class="text_blackD t-10 point">.</strong>
                <span>
                  <fa icon="route"></fa>
                  {{deepFind(orders[date][orderId], "routeInformation.distance.text")}}
                </span>
                <strong class="text_blackD t-10 point">.</strong>
                <span>
                  <fa icon="stopwatch"></fa>
                  {{deepFind(orders[date][orderId], "routeInformation.duration.text")}}
                </span>
              </span>
            </div>
          </card2>
          <!-- cancelled for taxi -->
          <card2
            class="bg_white border card wrap"
            v-else-if="orders[date][orderId].status=='cancelled'"
          >
            <div
              class="statusCircle searchCircle flex align_center center"
              slot="image"
              :class="{[`bg_${statusFormatting(orders[date][orderId]).bg}`]:true,[`text_${statusFormatting(orders[date][orderId]).color}`]:true}"
            >
              <fa :icon="statusFormatting(orders[date][orderId]).icon"></fa>
            </div>
            <div slot="title" class="bold">{{ statusFormatting(orders[date][orderId]).text }}</div>

            <span slot="aside" class="regular">
              <fa icon="clock"></fa>
              &nbsp;{{ orders[date][orderId].orderTime | moment("LT") }}
            </span>
            <div slot="footer" class="flex align_center fill_width card_footer">
              <span class="t-8 flex align_center fill_width space_between">
                <span>
                  <fa icon="map-marker"></fa>&nbsp;
                  <span
                    :title="orders[date][orderId].to.address"
                  >{{ orders[date][orderId].to.address | formatMessage(23) }}</span>
                </span>
                <strong class="text_blackD t-10 point">.</strong>
                <span>
                  <fa icon="route"></fa>
                  {{deepFind(orders[date][orderId], "routeInformation.distance.text")}}
                </span>
                <strong class="text_blackD t-10 point">.</strong>
                <span>
                  <fa icon="stopwatch"></fa>
                  {{deepFind(orders[date][orderId], "routeInformation.duration.text")}}
                </span>
              </span>
            </div>
          </card2>
          <!-- looking for taxi -->

          <card2 class="bg_white border card wrap" v-else>
            <div slot="image" class="flex relative align_center">
              <div
                class="statusCircle flex align_center center"
                :class="{[`bg_${orders[date][orderId].orderType}`]:true}"
              >
                <fa icon="taxi"></fa>
              </div>
              <avatar
                size="1.5rem"
                :url="orders[date][orderId].driver.image"
                slot="image"
                class="avatar_img"
              ></avatar>
            </div>

            <div slot="title" class="bold">{{ orders[date][orderId].driver.name }}</div>
            <div
              slot="desc"
              class="regular"
              v-if=" orders[date][orderId].status!='droppedOff'"
            >{{ statusFormatting(orders[date][orderId]).text }}</div>
            <span slot="aside" class="regular">
              <fa icon="clock"></fa>
              &nbsp;{{ orders[date][orderId].orderTime | moment("LT") }}
            </span>
            <div slot="footer" class="flex align_center fill_width card_footer">
              <span class="t-8 flex align_center fill_width space_between">
                <span>
                  <fa icon="map-marker"></fa>&nbsp;
                  <span
                    :title="orders[date][orderId].to.address"
                  >{{ orders[date][orderId].to.address | formatMessage(23) }}</span>
                </span>
                <strong class="text_blackD t-10 point">.</strong>
                <span>
                  <fa icon="route"></fa>
                  {{deepFind(orders[date][orderId], "routeInformation.distance.text")}}
                </span>
                <strong class="text_blackD t-10 point">.</strong>
                <span>
                  <fa icon="stopwatch"></fa>
                  {{deepFind(orders[date][orderId], "routeInformation.duration.text")}}
                </span>
              </span>
            </div>
          </card2>
        </router-link>
      </div>
    </div>
    <info-panel v-else :title="$tc('taxi.incoming.noOrders',1)">
      <no-orders slot="graphic"></no-orders>
    </info-panel>
  </div>
</template>

<script>
import noOrders from "@/shared/components/SVG/noOrders";

export default {
  components: {
    noOrders
  },
  data() {
    return {
      isLoaded: false
    };
  },
  computed: {
    orders() {
      return this.$store.getters["orders/dateSortedOrders"].dateSortedOrders;
    },

    sortedDates() {
      return this.$store.getters["orders/dateSortedOrders"].date;
    },
    hasOrders() {
      return this.$store.getters["orders/hasOrders"];
    },
    linkToOrder() {
      return function(orderType, orderId) {
        return `/services/${orderType}/${orderId}`;
      };
    }
  },
  methods: {
    sortInReverse(obj) {
      if (obj) {
        return Object.keys(obj).reverse;
      }
    },
    statusFormatting(notif) {
      var returnvalue;
      switch (notif.status) {
        case "droppedOff":
          returnvalue = {
            bg: "light_green",
            color: "green",
            icon: "map-marker-check",
            text: this.$t("taxi.taxiView.droppedOff"),
            desc: this.$t("taxi.taxiView.droppedOffMessage")
          };
          break;
        case "onTheWay":
          returnvalue = {
            bg: "light_violet",
            color: "violet",
            icon: "car-building",
            text: this.$t("taxi.orders.onTheWay"),
            desc: `${notif.driver.name} ${this.$t("taxi.orders.onTheWayMessage")}`
          };
          break;
        case "inTransit":
          returnvalue = {
            bg: "light_blue",
            color: "primary",
            icon: "route",
            text: this.$t("taxi.orders.inTransit"),
            desc: this.$t("taxi.orders.inTransitMessage")
          };
          break;
        case "lookingForTaxi":
          returnvalue = {
            bg: "light_blue",
            color: "primary",
            icon: "search",
            text: this.$t("taxi.orders.searching"),
            desc: this.$t("taxi.orders.searchingMessage"), 
          };
          break;
        case "cancelled":
          returnvalue = {
            bg: "light_error",
            color: "white",
            icon: "ban",
            text: this.$t("taxi.orders.cancelled") ,
            desc: this.$t("taxi.orders.cancelledMessage")
          };
          break;
      }
      return returnvalue;
    }
  },
  async beforeCreate() {
    this.isLoaded = false;
    await this.$store.dispatch("orders/loadList");
    this.isLoaded = true;
  }
};
</script>
<style lang="scss">
.orders {
  margin-top: 2rem;
}
.pill {
  padding: 0.5rem 0.8rem;
  border-radius: 2rem;
}
.card_footer {
  margin-top: 0.5rem;
  padding-top: 0.5rem;
  border-top: 1px solid #ececec;
}
.statusCircle {
  border-radius: 50%;
  height: 1.5rem;
  width: 1.5rem;
  padding: 0.5rem;
  right: -0.1rem;
  position: relative;
}
.searchCircle {
  right: 0 !important;
  height: 2rem;
  width: 2rem;
}
.avatar_img {
  left: -0.1rem;
  position: relative;

  background: map-get($map: $colors, $key: blackL) !important;
}
.point {
  margin: 0 0.5rem;
}
.card {
  margin: 0.8rem 0;
  border-radius: 4px;
}
</style>
