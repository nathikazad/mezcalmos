<template>
  <div>
    <h2>Orders</h2>
    <div v-if="!isLoaded">Loading...</div>
    <div v-else-if="hasOrders">
      <router-link
        :to="linkToOrder(orderId)"
        tag="div"
        class="pointer"
        v-for="(orderId, key) in sortedOrders"
        :key="key"
      >
        <card class="bg_secondary border card wrap">
          <avatar
            size="2.4rem"
            :url="orders[orderId].customer.image"
            slot="image"
          ></avatar>
          <div slot="text" class="card_text">
            <div slot="cardTitle" class="bold">
              {{ orders[orderId].customer.name }}
            </div>
            <div slot="description">
              <span slot="param" class="t-8">
                <fa icon="calendar-alt"></fa>
                &nbsp;{{ orders[orderId].rideFinishTime | moment("l") }}
                &nbsp;
                <fa icon="clock"></fa>
                &nbsp;
                {{ orders[orderId].rideFinishTime | moment("LT") }}
              </span>
            </div>
          </div>
        </card>
      </router-link>
    </div>
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
    sortedOrders() {
      if (this.orders) {
        return Object.keys(this.orders).reverse();
      } else {
        return [];
      }
    },
    hasOrders() {
      return this.$store.getters["pastOrders/hasOrders"];
    },
    linkToOrder() {
      return function(orderId) {
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
<style lang="scss" scoped>
.image {
  width: 3.75rem;
  height: 3.75rem;
}
.edit {
  margin-right: 0.5rem;
}
.icon {
  width: 2rem;
  height: 2rem;
}
.card {
  border-radius: 4px;
  margin: 0.8rem 0;
  padding: 0.5rem;
  .card_text {
    margin-left: 1rem;
  }
}
</style>
