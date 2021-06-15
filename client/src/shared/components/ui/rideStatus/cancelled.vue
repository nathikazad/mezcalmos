<template>
  <div>
    <!-- customer side -->
    <route-pill
      v-if="type=='customer'"
      slot="details"
      class="routePill w-100 mb-2"
      :classes1="{'w-100':true,}"
      :classes2="{'none':true,}"
      :classes3="{'none':true,}"
    >
      <userPart
        class="flex align_center"
        slot="part1"
        :avatar="orderDetails.driver.image"
        :name="orderDetails.driver.name"
        :extra="$t('taxi.taxiView.cancelled')"
        :taxiNumber="deepFind(orderDetails, 'driver.taxiNumber')"
      ></userPart>

      <!-- <price
        class="flex align_center"
        slot="part2"
        :price="deepFind(orderDetails, 'estimatedPrice')"
        :cash="true"
      ></price>-->
    </route-pill>
    <!-- Taxi side -->
    <route-pill
      v-if="type=='taxi'"
      slot="details"
      class="routePill w-100 mb-2"
      :classes1="{'w-100':true,}"
      :classes2="{'none':true,}"
      :classes3="{'none':true,}"
    >
      <userPart
        class="flex align_center"
        slot="part1"
        :avatar="orderDetails.customer.image"
        :name="orderDetails.customer.name"
        :extra="$t('taxi.taxiView.cancelled')"
      ></userPart>

      <!-- <price
        class="flex align_center start"
        slot="part2"
        :price="deepFind(orderDetails, 'estimatedPrice')"
        :cash="true"
      ></price>-->
    </route-pill>
  </div>
</template>
<script>
export default {
  props: {
    orderDetails: Object,
    type: String
  }
};
</script>
<style lang="scss" scoped>
</style>