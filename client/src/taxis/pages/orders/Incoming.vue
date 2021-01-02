<template>
  <div>
    <h2>Orders</h2>
    <div v-if="!isLoaded">Loading...</div>
    <ul v-else-if="hasOrders">
      <li v-for="(order, orderId) in orders" :key="orderId">
        {{ order }}
        {{ linkToOrder(order.orderType, orderId) }}
        <router-link :to="linkToOrder(order.orderType, orderId)">Link</router-link>
      </li>
    </ul>
    <h3 v-else>No orders found</h3>
  </div>
</template>

<script>
export default {
  data() {
    return {
      isLoaded: false,
    };
  },
  computed: {
    orders() {
      return this.$store.getters["incomingOrders/list"];
    },
    hasOrders() {
      return this.$store.getters["incomingOrders/hasOrders"];
    },
    linkToOrder() {
      return function (orderType, orderId) {
        return `/services/${orderType}/${orderId}`;
      };
    },
  },
  async beforeCreate() {
    console.log(this)
    console.log("here")
    this.isLoaded = false;
    await this.$store.getters["incomingOrders/list"];
    this.isLoaded = true;
  },
};
</script>