<template>
  <div class="avatar" :style="{backgroundImage:background,width:size,height:size}"></div>
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
.avatar {
  background-position: center center;
  background-size: cover;
  background-repeat: no-repeat;
  border-radius: 50%;
}
</style>