<template>
  <div class="flex align_center">
    <div class="flex align_center center">
      <img src="@/shared/static/img/money.svg" v-if="cash" />
      <img src="@/shared/static/img/creditCard.svg" v-if="creditCard" />
    </div>
    <div
      v-if="price"
      class="price bold t-12 fill_width txt_center"
    >${{Number.parseFloat(price).toFixed(0)}}</div>
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