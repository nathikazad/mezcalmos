<template>
  <div class="flex align_center">
    <div class="flex align_center center">
      <img src="@/shared/static/img/money.svg" v-if="cash" />
      <img src="@/shared/static/img/creditCard.svg" v-if="creditCard" />
    </div>
    <div v-if="price" class="pl-1 price bold t-12 w-35">${{Number.parseFloat(price).toFixed(2)}}</div>
  </div>
</template>
<script>
export default {
  props: {
    price: { type: [String, Number] },
    cash: { type: Boolean },
    creditCard: { type: Boolean }
  }
};
</script>
<style lang="scss" scoped>
</style>