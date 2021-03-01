<template>
  <div>
    <no-location></no-location>
    <h2>Location Service Turned Off</h2>
    <h4>App cannot work without the location service</h4>
    <base-button :mode="{ dark: true, bg_diagonal: true }" class="message_btn">Turn On Now</base-button>
  </div>
</template>
<script>
import noLocation from "../SVG/noLocation";
export default {};
</script>
<style lang="scss" scoped>
</style>