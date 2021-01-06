<template> 
  <div>
    <router-link to="/orders">Go to Orders</router-link>
    <h2>Grocery Service</h2>
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
      <div v-if="orderDetails.driverId">
        <label>Driver Name:&nbsp;{{ orderDetails.driverName }}</label>&nbsp;&nbsp;
        <router-link :to="messageLink">Message</router-link>
      </div>
      <div>
        <h4>ITEMS</h4>
        {{orderDetails.items}}
      </div>
      <div v-if="orderDetails.notes">
        <h4>NOTES</h4>
        {{orderDetails.notes}}
      </div>
    </div>
  </div>
</template>

<script>
export default {
  computed: {
    orderDetails() {
      return this.$store.getters["groceries/value"];
    },
    isLoaded() {
      return this.$store.getters["groceries/value"] != null;
    },
    messageLink() {
      return `/messages/${this.$route.params.orderId}`;
    }
  },
  async beforeCreate() {
    this.$store.dispatch("groceries/loadGrocery", {
      orderId: this.$route.params.orderId,
    });
  }
};
</script>