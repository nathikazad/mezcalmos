<template> 
  <div>
    <router-link to="/incoming" v-if="orderStatusLooking">Go to Incoming Orders</router-link>
    <router-link to="/orders" v-else>Go to Orders</router-link>
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
      <div v-if="orderDetails.customer">
        <label>Customer Name:&nbsp;{{ orderDetails.customer.name }}</label>&nbsp;&nbsp;
        <router-link v-if="!orderStatusLooking" :to="messageLink">Message</router-link>
      </div>
      <button v-if="orderStatusLooking" @click="acceptRide">Accept Order</button>
      <button v-else-if="orderStatusOnTheWay" @click="startRide">Start Ride</button>
      <button v-else-if="orderStatusInTransit" @click="finishRide">Finish Ride</button>
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
      if (this.isLoaded){
        return this.$store.getters["order/orderStatusLooking"]
      } else {
        return false
      }
    },
    orderStatusOnTheWay() {
      return this.$store.getters["order/orderStatusOnTheWay"]
    },
    orderStatusInTransit() {
      return this.$store.getters["order/orderStatusInTransit"]
    },
    orderStatusDroppedOff() {
      return this.$store.getters["order/orderStatusDroppedOff"]
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
    async acceptRide() {
      let response = await this.$store.dispatch("order/acceptRide")
      console.log(response)
    },
    async startRide() {
      let response = await this.$store.dispatch("order/startRide")
      console.log(response)
    },
    async finishRide() {
      let response = await this.$store.dispatch("order/finishRide")
      console.log(response)
    }
  }
};
</script>