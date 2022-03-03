<template>
  <div class="image_container">
    <div class="avatar" :style="{backgroundImage:background,width:size,height:size}"></div>
  </div>
</template>
<script>
export default {
  props: {
    url: {
      type: String
    },
    size: {
      type: String,
      default: "3rem"
    }
  },
  computed: {
    background() {
      return `url("${this.url}")`;
    }
  }
};
</script>
<style lang="scss">
.image_container {
  background: map-get($map: $colors, $key: secondary);
  border-radius: 50%;
}
.avatar {
  background-position: center center;
  background-size: cover;
  background-repeat: no-repeat;
  border-radius: 50%;
}
</style>