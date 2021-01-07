<template> 
  <div>
    <router-link to="/orders">Go to Orders</router-link>
    <h2>Taxi Ride</h2>
    <div v-if="isLoaded">
      <h3>FROM</h3>
      <label >lat:&nbsp;{{ orderDetails.from.lat }}</label><br/> 
      <label>long:&nbsp;{{ orderDetails.from.long }}</label><br/>
      <label>address:&nbsp;{{ orderDetails.from.address }}</label><br/>
      <h3>TO</h3>
      <label>lat:&nbsp;{{ orderDetails.to.lat }}</label><br/>
      <label>long:&nbsp;{{ orderDetails.to.long }}</label><br/>
      <label>address:&nbsp;{{ orderDetails.to.address }}</label><br/> 
      <h4>Status:&nbsp;{{ orderDetails.status }}</h4>
      <div> Customer:&nbsp; {{ orderDetails.customer }}</div>
      <button v-if="orderStatusLooking" @click="acceptOrder">Accept Order</button>
    </div>
  </div>
</template>

<script>
export default {
  computed: {
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
      return this.$store.getters["order/getOrder"].status == "lookingForTaxi"
    }
  },
  async beforeCreate() {
    this.$store.dispatch("order/loadOrder", {
      orderId: this.$route.params.orderId,
    });
  },
  async beforeUnmount() {
    console.log("before unmount")
    await this.$store.dispatch("order/unloadOrder");
  },
  methods: {
    async acceptOrder() {
      let response = await this.$store.dispatch("order/acceptOrder")
      console.log(response)
    },
  }
};
</script>