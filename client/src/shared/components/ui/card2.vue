<template>
  <div class="card flex align_center space_between wrap">
    <div class="flex align_center fill_width">
      <slot name="image"></slot>
      <div class="fill_width text desc_part">
        <h3 class="flex align_center space_between fill_width t-10">
          <slot name="title"></slot>
          <span class="t-8">
            <slot name="aside"></slot>
          </span>
        </h3>
        <h4 class="regular">
          <slot name="desc"></slot>
        </h4>
      </div>
    </div>
    <slot name="footer"></slot>
  </div>
</template>
<script>
export default {};
</script>
<style lang="scss" scoped>
.card {
  padding: 1rem;
  .text {
    padding-left: 0.5rem;
  }
  h3,
  h4 {
    margin: 0;
  }
  .desc_part {
    width: calc(100% - 2.5rem);
  }
}
</style>
