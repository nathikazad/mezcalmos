<template>
  <div class="card flex align_center space_between">
    <div class="flex align_center">
      <slot name="image"></slot>
      <div class="text">
        <slot name="cardTitle"></slot>
        <slot name="description" class="regular"></slot>
      </div>
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
  .text{
      padding-left: 1rem;
  }
}
</style>