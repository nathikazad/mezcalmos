<template>
  <div>
    <h1 class="regular">{{$t('taxi.orders.title')}}</h1>
    <div v-if="!isLoaded">{{$t('taxi.incoming.loading')}}...</div>
    <div v-else-if="hasOrders">
      <div v-for="(date, index) in sortedDates" :key="index">
        <h3 class="bold t-10">
          <fa icon="calendar-alt"></fa>&nbsp;
          <span>{{date}}</span>
        </h3>

        <router-link
          :to="linkToOrder(orderId)"
          tag="div"
          class="pointer"
          v-for="(order, orderId) in orders[date]"
          :key="orderId"
        >
          <card2 class="bg_white border card wrap" v-if="order.status!='cancelled'">
            <avatar size="2.4rem" :url="order.customer.image" slot="image"></avatar>
            <div slot="title" class="bold">{{ order.customer.name }}</div>
            <span slot="aside" class="regular">
              <span
                class="bold align_center flex"
                v-if="deepFind(orders[orderId], 'routeInformation.estimatedPrice')"
              >
                <img src="@/shared/static/img/money.svg" class="money_icon mr-1" />
                &nbsp;{{ Number.parseFloat(deepFind(orders[orderId], 'routeInformation.estimatedPrice')).toFixed(2)}}
              </span>
              &nbsp;
              <fa icon="clock"></fa>
              &nbsp;{{ order.acceptRideTime | moment("LT") }}
            </span>
            <div slot="desc" class="t-8 flex align_center fill_width space_between">
              <span>
                <fa icon="map-marker"></fa>&nbsp;
                <span :title="order.to.address">{{ order.to.address | formatMessage(15) }}</span>
              </span>
              <strong class="text_blackD t-10 point">.</strong>
              <span>
                <fa icon="route"></fa>
                {{deepFind(order, "routeInformation.distance.text")}}
              </span>
              <strong class="text_blackD t-10 point">.</strong>
              <span>
                <fa icon="stopwatch"></fa>
                {{deepFind(order, "routeInformation.duration.text")}}
              </span>
            </div>
          </card2>
          <!-- order status is cancelled -->
          <card2 class="bg_white border card wrap" v-else>
            <div
              class="statusCircle searchCircle flex align_center center"
              slot="image"
              :class="{[`bg_light_error`]:true,[`text_white`]:true}"
            >
              <fa icon="ban"></fa>
            </div>
            <div slot="title" class="bold">Cancelled</div>
            <span slot="aside" class="regular">
              <span
                class="bold align_center flex"
                v-if="deepFind(orders[orderId], 'routeInformation.estimatedPrice')"
              >
                <img src="@/shared/static/img/money.svg" class="money_icon mr-1" />
                &nbsp;{{ Number.parseFloat(deepFind(orders[orderId], 'routeInformation.estimatedPrice')).toFixed(2)}}
              </span>
              <fa icon="clock"></fa>
              &nbsp;{{ order.acceptRideTime | moment("LT") }}
            </span>
            <div slot="desc" class="t-8 flex align_center fill_width space_between">
              <span>
                <fa icon="map-marker"></fa>&nbsp;
                <span :title="order.to.address">{{ order.to.address | formatMessage(15) }}</span>
              </span>
              <strong class="text_blackD t-10 point">.</strong>
              <span>
                <fa icon="route"></fa>
                {{deepFind(order, "routeInformation.distance.text")}}
              </span>
              <strong class="text_blackD t-10 point">.</strong>
              <span>
                <fa icon="stopwatch"></fa>
                {{deepFind(order, "routeInformation.duration.text")}}
              </span>
            </div>
          </card2>
        </router-link>
      </div>
    </div>
    <info-panel v-else :title="'No Orders Found'" :desc="'There are no orders'">
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
      return this.$store.getters["pastOrders/dateSortedOrders"]
        .dateSortedOrders;
    },

    sortedDates() {
      return this.$store.getters["pastOrders/dateSortedOrders"].date;
    },
    hasOrders() {
      return this.$store.getters["pastOrders/hasOrders"];
    },
    linkToOrder() {
      return function(orderId) {
        return `/orders/${orderId}`;
      };
    }
  },
  async beforeCreate() {
    this.isLoaded = false;
    await this.$store.dispatch("pastOrders/loadList");
    this.isLoaded = true;
  }
};
</script>
<style lang="scss" scoped>
.money_icon {
  width: 1.5rem;
}
.image {
  width: 3.75rem;
  height: 3.75rem;
}
.edit {
  margin-right: 0.5rem;
}
.icon {
  width: 2rem;
  height: 2rem;
}
.card {
  border-radius: 4px;
  margin: 0.8rem 0;
  padding: 0.5rem;
  .card_text {
    margin-left: 1rem;
  }
}
.point {
  margin: 0 0.5rem;
}
.statusCircle {
  border-radius: 50%;
  height: 2.4rem;
  width: 2.4rem;
  padding: 0.5rem;
  right: -0.1rem;
  position: relative;
}
</style>
