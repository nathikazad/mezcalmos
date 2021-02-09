<template>
  <div class="alert flex align_center elevate_2 space_between" :class="{ [bg]: true }">
    <slot name="sender" class="sender"></slot>
    <div class="actions"></div>
  </div>
</template>
<script>
export default {
  props: {
    alertType: {
      type: String,
      default: "newMessage"
    }
  },
  computed: {
    bg() {
      if (this.alertType == "newMessage") {
        return "bg_white";
      } else {
        return "bg_taxi";
      }
    }
  }
};
</script>
<style lang="scss" scoped>
.alert {
  width: 100%;
  height: 4rem;
  position: fixed;
  top: 4.75rem;
  left: 0;
  z-index: 99999;
  padding: 0 1rem;
}
</style>
