<template>
  <i :class="{ [`fa-${icon}`]: true }" class="fal" v-if="!solid"></i>
  <i :class="{ [`fa-${icon}`]: true }" class="fas" v-else></i>
</template>
<script>
export default {
  props: {
    icon: {
      type: String
    },
    solid: {
      type: Boolean,
      default: false
    }
  }
};
</script>
