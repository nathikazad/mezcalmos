<template>
  <div>
    <h2>Orders</h2>
    <div v-if="!isLoaded">Loading...</div>
    <ul v-else-if="hasOrders">
      <li v-for="(order, orderId) in orders" :key="orderId">
        {{ orderId }}
        <router-link :to="linkToOrder(orderId)">Link</router-link>
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
      return this.$store.getters["pastOrders/list"];
    },
    hasOrders() {
      return this.$store.getters["pastOrders/hasOrders"];
    },
    linkToOrder() {
      return function (orderId) {
        return `/orders/${orderId}`;
      };
    },
  },
  async beforeCreate() {
    this.isLoaded = false;
    await this.$store.dispatch("pastOrders/loadList");
    this.isLoaded = true;
  },
};
</script>