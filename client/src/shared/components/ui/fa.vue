<template>
  <i :class="{ [`fa-${icon}`]: true }" class="fal"></i>
</template>
<script>
export default {
  props: {
    icon: {
      type: String,
    },
  },
};
</script>
