<template>
  <div>
    <!-- customer side -->
    <div>
      <route-pill
        slot="details"
        class="routePill w-100 mb-2"
        :classes1="{'w-50':true,}"
        :classes2="{'w-50':true,}"
        :classes3="{'none':true,}"
      >
        <paymentToggle class="flex align_center" slot="part3"></paymentToggle>

        <price
          class="flex align_center"
          slot="part1"
          :price="price"
          :plusMinus="true"
          @plusClicked="$emit('increasePrice')"
          @minusClicked="$emit('reducePrice')"
        ></price>

        <div class="flex align_center" slot="part2">
          <routeInfo :distance="distance" :duration="duration"></routeInfo>
        </div>
      </route-pill>
    </div>
  </div>
</template>
<script>
export default {
  props: {
    orderDetails: Object,
    type: String,
    loading: Boolean,
    price: [Number, String],
    duration: String,
    distance: String
  },

};
</script>
<style lang="scss" scoped>
</style>