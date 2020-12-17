<template>
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
    <label v-if="orderDetails.taxiId">taxiId:&nbsp;{{ orderDetails.taxiId }}</label><br/>
  </div>
</template>

<script>
export default {
  data() {
    return {
      isLoaded: false
    }
  },
  computed: {
    orderDetails() {
      return this.$store.getters["taxis/value"];
    },
  },
  async beforeCreate() {
    this.isLoaded = false;
    console.log("beforeCreate");
    await this.$store.dispatch("taxis/loadTaxi", {
      orderId: this.$route.params.orderId,
    });
    this.isLoaded = true;
  },
};
</script>