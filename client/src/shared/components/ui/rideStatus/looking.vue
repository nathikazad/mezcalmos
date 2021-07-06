<template>
  <div>
    <!-- customer side -->
    <div v-if="type=='customer'">
      <route-pill
        slot="details"
        class="routePill w-100 mb-2"
        :classes1="{'w-40':true,}"
        :classes2="{'w-40':true,}"
        :classes3="{'w-20':true,}"
      >
        <userPart class="flex align_center" slot="part1" :extra="$t('customer.taxiView.searching')"></userPart>

        <price
          class="flex align_center"
          slot="part2"
          :price="deepFind(orderDetails, 'estimatedPrice')"
          :plusMinus="true"
          @plusClicked="increasePrice"
          @minusClicked="reducePrice"
        ></price>

        <div class="flex align_center" slot="part3">
          <routeInfo
            :distance="deepFind(orderDetails, 'distance.text')"
            :duration="deepFind(orderDetails, 'duration.text')"
          ></routeInfo>
        </div>
      </route-pill>
      <base-button
        class="elevate_1 nav-btn text_white w-100"
        :mode="{
            bg_error: true,
            small: true,
          }"
        @click.native="$emit('cancelPopUp')"
        :loading="loading"
      >{{$t('customer.taxiView.cancel')}}</base-button>
    </div>

    <!-- Taxi side -->
    <div v-if="type=='taxi'">
      <route-pill
        slot="details"
        class="routePill w-100 mb-2"
        :classes1="{'w-40':true,}"
        :classes2="{'w-40':true,}"
        :classes3="{'w-20':true,}"
      >
        <userPart
          class="flex align_center"
          slot="part1"
          :avatar="orderDetails.customer.image"
          :name="orderDetails.customer.name"
          :extra="deepFind(orderDetails, 'customer.distance')+' km ' +$t('taxi.incoming.far')"
        ></userPart>

        <price
          class="flex align_center"
          slot="part2"
          :price="deepFind(orderDetails, 'estimatedPrice')"
          :cash="true"
        ></price>

        <div class="flex align_center" slot="part3">
          <routeInfo
            :distance="deepFind(orderDetails, 'distance.text')"
            :duration="deepFind(orderDetails, 'duration.text')"
          ></routeInfo>
        </div>
      </route-pill>
      <base-button
        class="elevate_1 nav-btn text_white w-100"
        :mode="{
            bg_info: true,
            small: true,
          }"
        @click.native="$emit('acceptRide')"
        :loading="loading"
      >{{$t('taxi.taxiView.acceptOrders')}}</base-button>
    </div>
  </div>
</template>
<script>
export default {
  props: {
    orderDetails: Object,
    type: String,
    loading: Boolean,
    orderId: String
  },
  methods: {
    reducePrice() {
      this.$store.dispatch("taxis/reduceTaxiPrice", { orderId: this.orderId });
    },
    increasePrice() {
      this.$store.dispatch("taxis/increaseTaxiPrice", {
        orderId: this.orderId
      });
    }
  }
};
</script>
<style lang="scss" scoped>
</style>