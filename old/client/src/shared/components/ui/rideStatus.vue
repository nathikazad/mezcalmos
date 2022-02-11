<template>
  <div class="relative">
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
        :distance="deepFind(orderDetails, 'customer.distance')"
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