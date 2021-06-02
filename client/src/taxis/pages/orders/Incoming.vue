<template>
  <div>
    <div>
      <h1 class="flex space_between align_center regular">
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
              <span slot="aside" class="bold align_center flex" v-if="deepFind(orders[orderId], 'routeInformation.estimatedPrice')">
                <img src="@/shared/static/img/money.svg" class="money_icon mr-1" />
                &nbsp;{{ Number.parseFloat(deepFind(orders[orderId], 'routeInformation.estimatedPrice')).toFixed(2)}}
              </span>
              <div slot="desc" class="flex align_center desc_slot">
                <span class="t-8 flex align_center fill_width">
                  <span :title="orders[orderId].from.address" class="grow2 ellipsis">
                    <fa icon="map-marker"></fa>
                    {{ orders[orderId].from.address}}
                  </span>
                  <strong class="text_blackD t-10 point">.</strong>
                  <span class="shrink0">
                    <fa icon="map-pin"></fa>
                    {{deepFind(orders[orderId], "customer.distance") }}km
                  </span>
                  <strong class="text_blackD t-10 point">.</strong>
                  <span class="shrink0">
                    <fa icon="route"></fa>
                    {{deepFind(orders[orderId], "routeInformation.distance.text")}}
                  </span>
                  <strong class="text_blackD t-10 point">.</strong>
                  <span class="shrink0">
                    <fa icon="stopwatch"></fa>
                    {{deepFind(orders[orderId], "routeInformation.duration.text")}}
                  </span>
                </span>
              </div>
            </card2>
          </router-link>
        </div>

        <info-panel
          v-else
          :title="$tc('taxi.incoming.noOrders',1)"
          :desc="$tc('taxi.incoming.noOrders',2)"
        >
          <no-orders slot="graphic"></no-orders>
        </info-panel>
      </div>
      <div v-else>
        <info-panel :title="$tc('taxi.incoming.toggle',1)" :desc="$tc('taxi.incoming.toggle',2)">
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
      isLoaded: false,
      ordersPrices: {}
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
.money_icon {
  width: 1.5rem;
}
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
.point {
  margin: 0 0.3rem;
}
.desc_slot {
  margin-top: 0.3jhrem;
}
</style>
