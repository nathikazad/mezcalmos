<template>
  <div>
    <h1>Orders</h1>

    <div v-if="hasOrders" class="orders">
      <h3 class="bold flex space_between">
        <span>Orders</span>
        <span class="regular">{{ orders ? Object.keys(orders).length : 0 }} Items</span>
      </h3>
      <router-link
        :to="`/services/${orders[orderId].orderType}/${orderId}`"
        tag="div"
        class="pointer"
        v-for="(orderId, key) in sortedOrders"
        :key="key"
      >
        <panel :color="`bg_${orders[orderId].orderType}`">
          <span slot="name" class="t-10">{{ orders[orderId].orderType }}</span>
          <span slot="param" class="t-8" v-if="orders[orderId].status == 'droppedOff'">
            <fa icon="calendar-alt"></fa>
            &nbsp;{{ orders[orderId].rideFinishTime | moment("l") }}
            &nbsp;
            <fa icon="clock"></fa>
            &nbsp;
            {{ orders[orderId].rideFinishTime | moment("LT") }}
          </span>
          <span
            slot="param"
            class="t-8 text_grey bg_white pill"
            v-else-if="orders[orderId].status == 'onTheWay'"
          >
            <fa icon="route"></fa>&nbsp;On the way
          </span>
          <span
            slot="param"
            class="t-8 text_grey bg_white pill"
            v-else-if="orders[orderId].status == 'inTransit'"
          >
            <fa icon="route"></fa>&nbsp;In Transit
          </span>

          <span slot="param" class="t-8 text_grey bg_white pill" v-else>
            <fa icon="search-location"></fa>&nbsp;Searching..
          </span>
        </panel>
      </router-link>
      <!-- <div v-for="(order, orderId) in orders" :key="orderId">
        {{ order }}
        {{ linkToOrder(order.orderType, orderId) }}
        <router-link :to="linkToOrder(order.orderType, orderId)"
          >Link
        </router-link>
      </div>-->
    </div>
    <h3 v-else>No orders found</h3>
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
      console.log(this.orders);

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
</style>
