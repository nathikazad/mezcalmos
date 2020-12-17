<template>
  <li>
    <input type="text" v-model="locationCopy.lat">
    <input type="text" v-model="locationCopy.long">
    <input type="text" v-model="locationCopy.address">
  </li>
</template>

<script>
export default {
  props: ["location"],
  data() {
    return { locationCopy: { ...this.location } };
  },
  watch: {
    locationCopy: {
      deep: true,
      handler(value) {
        this.$emit('update:location', value)
      },
    },
  },
};
</script>