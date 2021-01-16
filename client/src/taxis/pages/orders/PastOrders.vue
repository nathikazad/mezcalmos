<template>
  <div>
    <h2>Orders</h2>
    <div v-if="!isLoaded">Loading...</div>
    <div v-else-if="hasOrders">
      <router-link
        :to="linkToOrder(orderId)"
        tag="div"
        class="pointer"
        v-for="(order, orderId) in orders"
        :key="orderId"
      >
        <card class="bg_secondary border card">
          <img src="@/shared/static/img/Map.png" slot="image" class="image" />

          <div slot="description">
            <span class="bold">From:&nbsp;</span>
            {{ orderId }},
          </div>
        </card>
      </router-link>
    </div>
    <h3 v-else>No orders found</h3>
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
    orders() {
      return this.$store.getters["pastOrders/list"];
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
}
</style>
