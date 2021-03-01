<template>
  <div>
    <div>
      <h1 class="flex space_between align_center">
        <span v-html="$t('taxi.incoming.title')"></span>
        <switcher @click.native="toggle()" :open="isLooking"></switcher>
      </h1>

      <div v-if="isLooking">
        <div v-if="!isLoaded">{{$t('taxi.incoming.loading')}}...</div>
        <h3 v-else-if="isInTaxi">
          {{$tc('taxi.incoming.loading',1)}}
          <router-link :to="currentOrderIdLink">{{$tc('taxi.incoming.loading',2)}}</router-link>
          {{$tc('taxi.incoming.loading',3)}}
        </h3>
        <div v-else-if="hasOrders">
          <router-link
            :to="linkToOrder(orderId)"
            tag="div"
            class="pointer"
            v-for="(orderId, key) in sortedOrderIds"
            :key="key"
          >
            <card2 class="bg_white border card wrap">
              <avatar size="2.4rem" :url="orders[orderId].customer.image" slot="image"></avatar>
              <div slot="title" class="bold">{{ orders[orderId].customer.name }}</div>
              <div slot="desc" class="flex align_center">
                <span class="t-7"><fa icon="map-marker"></fa> {{ orders[orderId].from.address | formatMessage(8) }}</span>
              </div>
            </card2>
          </router-link>
        </div>

        <info-panel
          v-else
          :title="'No Orders Found'"
          :desc="'There are no orders and to try again later'"
        >
          <no-orders slot="graphic"></no-orders>
        </info-panel>
      </div>
      <div v-else>
        <info-panel :title="'No Orders Found'" :desc="'There are no orders and to try again later'">
          <incomingToggle slot="graphic"></incomingToggle>
        </info-panel>
      </div>
    </div>
  </div>
</template>

<script>
import noOrders from "@/shared/components/SVG/noOrders";
import incomingToggle from "@/shared/components/SVG/incomingToggle";
export default {
  components: {
    noOrders,
    incomingToggle
  },
  data() {
    return {
      isLoaded: false
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
    }
  },
  methods: {
    toggle() {
      if (!this.isLooking) {
        this.$store.dispatch("startLooking");
      } else {
        this.$store.dispatch("stopLooking");
      }
    }
  },
  async beforeCreate() {
    this.isLoaded = false;
    await this.$store.getters["incomingOrders/list"];
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
}
</style>
