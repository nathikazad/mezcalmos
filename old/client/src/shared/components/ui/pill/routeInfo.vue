<template>
  <div class="ride_details t-8" >
    <fa icon="route"></fa>
    {{ distance }}
    <br />
    <fa icon="stopwatch"></fa>
    {{ duration }}
  </div>
</template>
<script>
export default {
  props: {
    duration: { type: String },
    distance: { type: String }
  }
};
</script>
<style lang="scss" scoped>
</style>