<template>
  <div class="panel">
    <h3 class="regular flex align_center space_between" :class="color">
      <slot name="name"></slot>
      <slot name="param"></slot>
    </h3>
    <div class="panel_details">
      <slot name="details"></slot>
    </div>
  </div>
</template>
<script>
export default {
  props: ["color"],
};
</script>
<style lang="scss" scoped>
.panel h3 {
  width: 100%;
  height: 3rem;
  border-radius: 4px;
  padding: 1rem;
}
</style>
