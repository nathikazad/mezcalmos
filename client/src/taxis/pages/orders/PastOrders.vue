<template>
  <div>
    <h1 class="regular">{{$t('taxi.orders.title')}}</h1>
    <div v-if="!isLoaded">{{$t('taxi.incoming.loading')}}...</div>
    <div v-else-if="hasOrders">
      <router-link
        :to="linkToOrder(orderId)"
        tag="div"
        class="pointer"
        v-for="(orderId, key) in sortedOrders"
        :key="key"
      >
        <card2 class="bg_white border card wrap">
          <avatar size="2.4rem" :url="orders[orderId].customer.image" slot="image"></avatar>
          <div slot="title" class="bold">{{ orders[orderId].customer.name }}</div>
          <div slot="desc" class="t-8 flex align_center fill_width space_between">
            <span>
              <fa icon="map-marker"></fa>&nbsp;
              <span
                :title="orders[orderId].to.address"
              >{{ orders[orderId].to.address | formatMessage(15) }}</span>
            </span>
            <strong class="text_blackD t-10 point">.</strong>
            <span>
              <fa icon="route"></fa>
              {{deepFind(orders[orderId], "routeInformation.distance.text")}}
            </span>
            <strong class="text_blackD t-10 point">.</strong>
            <span>
              <fa icon="stopwatch"></fa>
              {{deepFind(orders[orderId], "routeInformation.duration.text")}}
            </span>
          </div>
        </card2>
      </router-link>
    </div>
    <h3 v-else>{{$t('taxi.incoming.noOrders')}}</h3>
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
    }
  },
  async beforeCreate() {
    this.isLoaded = false;
    await this.$store.dispatch("pastOrders/loadList");
    this.isLoaded = true;
  }
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
.point {
  margin: 0 0.5rem;
}
</style>
