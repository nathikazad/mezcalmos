<template>
  <div>
    <button v-if="isLooking" @click="turnOff">Off</button>
    <button v-else @click="turnOn">On</button>
    <h2>Orders</h2>
    <div v-if="!isLoaded">Loading...</div>
    <ul v-else-if="hasOrders">
      <li v-for="(order, orderId) in orders" :key="orderId">
        <!-- {{ order }}  -->
        <!-- TODO: show distance from current location and journey length -->
        {{ linkToOrder(orderId) }}
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
      return this.$store.getters["incomingOrders/list"];
    },
    hasOrders() {
      return this.$store.getters["incomingOrders/hasOrders"];
    },
    linkToOrder() {
      return function (orderId) {
        return `/incoming/${orderId}`;
      };
    },
    isLooking() {
      return this.$store.getters["isLooking"];
    }
  },
  methods: {
    turnOn() {
      this.$store.dispatch("turnOn")
    },
    turnOff() {
      this.$store.dispatch("turnOff")
    },
  },
  async beforeCreate() {
    this.isLoaded = false;
    await this.$store.getters["incomingOrders/list"];
    this.isLoaded = true;
  },
};
</script>