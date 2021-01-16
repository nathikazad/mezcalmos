<template> 
  <div>
    <router-link to="/incoming" v-if="orderStatusLooking">Go to Incoming Orders</router-link>
    <router-link to="/orders" v-else>Go to Orders</router-link>
    <h2>Grocery Order</h2>
    <div v-if="isLoaded">
      <h3>FROM</h3>
      <label >lat:&nbsp;{{ orderDetails.from.lat }}</label><br/> 
      <label>long:&nbsp;{{ orderDetails.from.long }}</label><br/>
      <label>address:&nbsp;{{ orderDetails.from.address }}</label><br/>
      <h3>TO</h3>
      <label>lat:&nbsp;{{ orderDetails.to.lat }}</label><br/>
      <label>long:&nbsp;{{ orderDetails.to.long }}</label><br/>
      <label>address:&nbsp;{{ orderDetails.to.address }}</label><br/>
      <h3>Items</h3>
      <label>{{ orderDetails.items }}</label><br/>
      <h3>Notes</h3>
      <label>{{ orderDetails.notes }}</label><br/>
      <h4>Status:&nbsp;{{ orderDetails.status }}</h4>
      <div v-if="orderDetails.customer">
        <label>Customer Name:&nbsp;{{ orderDetails.customer.name }}</label>&nbsp;&nbsp;
        <router-link v-if="!orderStatusLooking" :to="messageLink">Message</router-link>
      </div>
      <button v-if="orderStatusLooking" @click="acceptOrder">Accept Order</button>
      <button v-else-if="orderStatusOnTheWay" @click="itemsPicked">Items Picked</button>
      <button v-else-if="orderStatusItemsPickedUp" @click="finishOrder">Finish Order</button>
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
    orderStatusItemsPickedUp() {
      return this.$store.getters["order/orderStatusItemsPickedUp"]
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
    async acceptOrder() {
      let response = await this.$store.dispatch("order/acceptOrder")
      console.log(response)
    },
    async itemsPicked() {
      let response = await this.$store.dispatch("order/itemsPicked")
      console.log(response)
    },
    async finishOrder() {
      let response = await this.$store.dispatch("order/finishOrder")
      console.log(response)
    }
  }
};
</script>