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
  height: 3rem;
  width: 6rem;
  border-radius: 2rem;
  padding: 0.5rem 0.7rem;
  .on {
    margin-left: 0.25rem;
  }
  .off {
    margin-right: 0.25rem;
  }
  &.closed {
    .on {
      z-index: 2;
      color: map-get($map: $colors, $key: green) !important;
      margin-left: 0.25rem;
    }
    .off {
      z-index: 2;
      color: map-get($map: $colors, $key: white) !important;
      margin-right: 0.25rem;
    }
    .layer {
      background: map-get($map: $colors, $key: error);
      right: 0;
      left: auto;
    }
  }
  .layer {
    position: absolute;
    width: 56%;
    height: 100%;
    border-radius: inherit;
    transition: all 1s;
    top: 0;
    left: 0;
    background: map-get($map: $colors, $key: green);
  }
}
</style>