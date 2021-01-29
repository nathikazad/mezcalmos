<template>
  <div>
    <div>
      <h1 class="flex space_between align_center">
        <span>
          Incoming
          <br />Orders
        </span>
        <switcher @click.native="toggle()" :open="isLooking"></switcher>
      </h1>

      <div v-if="!isLoaded">Loading...</div>
      <h3 v-else-if="isInTaxi">
        Please finish
        <router-link :to="currentOrderIdLink">your ride</router-link>
        to accept new orders
      </h3>
      <div v-else-if="hasOrders">
        <router-link
          :to="linkToOrder(orderId)"
          tag="div"
          class="pointer"
          v-for="(orderId, key) in sortedOrderIds"
          :key="key"
        >
          <card class="bg_secondary border card">
            <div slot="text" class="flex align_center fill_width space_between">
              <div slot="cardTitle" class="bold">
                <h4 class="text_blackL">
                  {{ deepFind(orders[orderId], "customer.name") }}
                </h4>
                <h5 class="regular text_grey">
                  {{ deepFind(orders[orderId], "customer.distance") }}km far
                </h5>
              </div>
              <div
                slot="description"
                class="text_grey text"
                v-if="orders[orderId].routeInformation"
              >
                <fa icon="route"></fa>
                <span class="text_blackL">
                  &nbsp;{{
                    deepFind(orders[orderId], "routeInformation.distance.text")
                  }}
                </span>
                <br />
                <fa icon="stopwatch"></fa>
                <span class="text_blackL">
                  &nbsp;{{
                    deepFind(orders[orderId], "routeInformation.duration.text")
                  }}
                </span>
              </div>
            </div>
          </card>
        </router-link>
      </div>

      <h3 v-else>No orders found</h3>
    </div>
  </div>
</template>

<script>
import Card from "@/shared/components/ui/card";
export default {
  components: {
    Card,
  },
  data() {
    return {
      isLoaded: false,
    };
  },
  computed: {
    sortedOrderIds() {
      return this.$store.getters["incomingOrders/sortedOrderIds"];
    },
    orders() {
      return this.$store.getters["incomingOrders/list"];
    },
    hasOrders() {
      return this.$store.getters["incomingOrders/hasOrders"];
    },
    linkToOrder() {
      return function(orderId) {
        return `orders/${orderId}`;
      };
    },
    isLooking() {
      return this.$store.getters["isLooking"];
    },
    isInTaxi() {
      return this.$store.getters["isInTaxi"];
    },
    currentOrderIdLink() {
      return `orders/${this.$store.getters["currentOrderId"]}`;
    },
  },
  methods: {
    toggle() {
      if (!this.isLooking) {
        this.$store.dispatch("startLooking");
      } else {
        this.$store.dispatch("stopLooking");
      }
    },
  },
  async beforeCreate() {
    this.isLoaded = false;
    await this.$store.getters["incomingOrders/list"];
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
}
</style>
