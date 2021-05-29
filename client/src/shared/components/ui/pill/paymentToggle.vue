<template>
  <div class="payments_part flex align_center space_between w-90 fill_height bg_secondary">
    <div class="cash flex align_center center w-50 fill_height pointer">
      <img src="@/shared/static/img/money.svg" />
    </div>
    <div class="credit_card flex align_center center w-50 fill_height pointer">
      <img src="@/shared/static/img/creditCard.svg" />
    </div>
  </div>
</template>
<script>
export default {
  props: {
    duration: { type: String },
    distance: { type: String }
  }
};
</script>
<style lang="scss" scoped>
.payments_part {
  border-radius: 5px;
  height: 2.3rem;
  .cash,
  .credit_card {
    border-radius: 5px;
  }
  .cash {
    background: #8962d2;
  }
  .credit_card {
    opacity: 0.3;
  }
}
</style>