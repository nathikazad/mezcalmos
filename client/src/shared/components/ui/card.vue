<template>
  <div class="card flex align_center space_between">
    <div class="flex align_center fill_width mainSlots">
      <slot name="image"></slot>
      <slot class="text " name="text">
        <slot name="cardTitle"></slot>
        <slot name="description" class="regular"></slot>
      </slot>
    </div>
    <slot name="actions" class="flex"></slot>
  </div>
</template>
<script>
export default {};
</script>
<style lang="scss" scoped>
.card {
  padding: 1rem;
  .text {
    padding-left: 1rem;
  }
}
</style>
