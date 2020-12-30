<template>
  <div>
    <h1>Orders</h1>

    <div v-if="hasOrders" class="orders">
      <h3 class="bold flex space_between">
        <span>Orders</span>
        <span class="regular">{{orders?Object.keys(orders).length:0}} Items</span>
      </h3>
      <router-link to="/services/grocery/-MOupwnywUJQtpv7dWtE" tag="div" class="pointer">
        <panel :color="`bg_${order.orderType}`" v-for="(order, orderId) in orders" :key="orderId">
          <span slot="name" class="t-10">{{ order.orderType }}</span>
          <span slot="param" class="t-8" v-if="order.status == 'delivered'">
            <fa icon="calendar-alt"></fa>
            &nbsp;{{
            order.deliveryTime | moment("l")
            }}
            &nbsp;
            <fa icon="clock"></fa>
            &nbsp;
            {{ order.deliveryTime | moment("LT") }}
          </span>
          <span slot="param" class="t-8 text_grey bg_white pill" v-else>
            <fa icon="route"></fa>&nbsp;On the way
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
