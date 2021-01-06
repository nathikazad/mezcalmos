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
      <div v-if="orderDetails.driver">
        <label>Driver Name:&nbsp;{{ orderDetails.driver.name }}</label>&nbsp;&nbsp;
        <router-link :to="messageLink">Message</router-link>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  computed: {
    orderDetails() {
      return this.$store.getters["taxis/value"];
    },
    isLoaded() {
      return this.$store.getters["taxis/value"] != null;
    },
    messageLink() {
      return `/messages/${this.$route.params.orderId}`;
    }
  },
  async beforeCreate() {
    this.$store.dispatch("taxis/loadTaxi", {
      orderId: this.$route.params.orderId,
    });
  }
};
</script>