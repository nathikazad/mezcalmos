<template>
  <div>
    <h1 class="regular">{{$t('customer.orders.title')}}</h1>

    <div v-if="hasOrders" class="orders">
      <h3 class="bold flex space_between">
        <span>{{$t('customer.orders.title')}}</span>
        
      </h3>
      <router-link
        :to="`/services/${orders[orderId].orderType}/${orderId}`"
        tag="div"
        class="pointer"
        v-for="(orderId, key) in sortedOrders"
        :key="key"
      >
        <card2 class="bg_white border card wrap">
          <div slot="image" class="flex relative align_center">
            <div
              class="statusCircle flex align_center center"
              :class="{[`bg_${orders[orderId].orderType}`]:true}"
            >
              <fa icon="taxi"></fa>
            </div>
            <avatar
              size="1.5rem"
              :url="orders[orderId].driver.image"
              slot="image"
              class="avatar_img"
            ></avatar>
          </div>

          <div slot="title" class="bold">{{ orders[orderId].driver.name }}</div>
          <div slot="desc" class="regular">{{ statusFormatting(orders[orderId]).text }}</div>
          <span slot="aside" class="regular">
            <fa icon="clock"></fa>
            &nbsp;{{ orders[orderId].orderTime | moment("LT") }}
          </span>
          <div slot="footer" class="flex align_center fill_width card_footer">
            <span class="t-8 flex align_center fill_width space_between">
              <span>
                <fa icon="map-marker"></fa>&nbsp;
                <span
                  :title="orders[orderId].to.address"
                >{{ orders[orderId].to.address | formatMessage(25) }}</span>
              </span>
              <strong class="text_blackD t-10 point">.</strong>
              <span>
                <fa icon="route"></fa>
                {{deepFind(orders[orderId], "routeInformation.distance.text")}}
              </span>
              <strong class="text_blackD t-10 point">.</strong>
              <span>
                <fa icon="stopwatch"></fa>
                {{deepFind(orders[orderId], "routeInformation.duration.text")}}
              </span>
            </span>
          </div>
        </card2>
      </router-link>
    </div>
    <h3 v-else>{{$t('customer.orders.noOrders')}}</h3>
  </div>
</template>

<script>
export default {
  data() {
    return {
      isLoaded: false
    };
  },
  computed: {
    orders() {
      return this.$store.getters["orders/list"];
    },
    sortedOrders() {
      let orders = this.orders || {};
      return Object.keys(orders).reverse();
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
    statusFormatting(notif) {
      var returnvalue;
      switch (notif.status) {
        case "droppedOff":
          returnvalue = {
            bg: "light_green",
            color: "green",
            icon: "map-marker-check",
            text: this.$t("taxi.taxiView.droppedOf"),
            desc: "Your ride has ended"
          };
          break;
        case "onTheWay":
          returnvalue = {
            bg: "light_violet",
            color: "violet",
            icon: "car-building",
            text: this.$t("taxi.orders.onTheWay"),
            desc: `${notif.driver.name} on the way now to pick you up`
          };
          break;
        case "inTransit":
          returnvalue = {
            bg: "light_blue",
            color: "primary",
            icon: "route",
            text: this.$t("taxi.orders.inTransit"),
            desc: "Your ride has ended"
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
.avatar_img {
  left: -0.1rem;
  position: relative;

  background: map-get($map: $colors, $key: blackL) !important;
}
.point {
  margin: 0 0.5rem;
}
</style>
