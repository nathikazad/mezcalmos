<template>
  <div class="switch bg_light flex align_center space_between pointer" :class="{closed:!open}">
    <span class="layer"></span>
    <span class="bold t-8 text_white on relative">ON</span>
    <span class="bold t-8 text_error off relative">OFF</span>
  </div>
</template>
<script>
export default {
  props: {
    open: {
      type: Boolean,
      default: true
    }
  }
};
</script>
<style lang="scss" scoped>
.switch {
  position: relative;
  height: 2rem;
  width: 5rem;
  border-radius: 1rem;
  padding: 0.5rem;
  &.closed {
    .on {
      z-index: 2;
      color: map-get($map: $colors, $key: green) !important;
    }
    .off {
      z-index: 2;
      color: map-get($map: $colors, $key: white) !important;
    }
    .layer {
      background: map-get($map: $colors, $key: error);
      right: 0;
      left: auto;
    }
  }
  .layer {
    position: absolute;
    width: 50%;
    height: 100%;
    border-radius: inherit;
    transition: all 1s;
    top: 0;
    left: 0;
    background: map-get($map: $colors, $key: green);
  }
}
</style>