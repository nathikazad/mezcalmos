<template>
  <div class="flex align_center space_between route_pill bg_white elevate_1">
    <div class="part1 fill_height flex align_center start" :class="classes1">
      <slot name="part1"></slot>
    </div>
    <div class="part2 fill_height flex align_center center" :class="classes2">
      <slot name="part2"></slot>
    </div>
    <div class="part3 fill_height flex align_center end" :class="classes3">
      <slot name="part3"></slot>
    </div>
  </div>
</template>
<script>
export default {
  props: {
    classes1: { type: Object },
    classes2: { type: Object },
    classes3: { type: Object }
  }
};
</script>
<style lang="scss" scoped>
.route_pill {
  border-radius: 5px;
  padding: 0.5rem;
  height: 3rem;
  .part1 {
    border-right: $border;
    
  }
  .part3 {
    border-left: $border;
  }
}
</style>