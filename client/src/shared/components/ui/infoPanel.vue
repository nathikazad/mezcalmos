<template>
  <div class="flex column center align_center">
    <slot name="graphic" id="graphic"></slot>
    <h2 class="regular">{{title}}</h2>
    <h4 class="regular text_grey">{{desc}}</h4>
  </div>
</template>
<script>
export default {
  props: {
    title: {
      type: String
    },
    desc: {
      type: String
    }
  }
};
</script>
<style lang="scss" scoped>
::v-deep svg {
  margin: 2rem 0;
}
h4,
h2 {
  margin: 5px 0;
}
</style>