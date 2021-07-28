<template>
  <div class="flex align_center relative w-80">
    <div class="flex align_center center">
      <img src="@/shared/static/img/money.svg" v-if="cash" />
      <img src="@/shared/static/img/creditCard.svg" v-if="creditCard" />
    </div>
    <div
      v-if="price"
      class="price bold t-12 fill_width txt_center"
    >${{Number.parseFloat(price).toFixed(0)}}</div>
    <div v-if="plusMinus" class="absolute plus_minus t-12 w-100 flex align_center space_between">
      <span @click="$emit('minusClicked')">
        <fa icon="minus-circle" class="pointer"></fa>
      </span>
      <span @click="$emit('plusClicked')">
        <fa icon="plus-circle" class="pointer"></fa>
      </span>
    </div>
  </div>
</template>
<script>
export default {
  props: {
    price: { type: [String, Number] },
    cash: { type: Boolean },
    creditCard: { type: Boolean },
    plusMinus: { type: Boolean }
  }
};
</script>
<style lang="scss" scoped>
</style>