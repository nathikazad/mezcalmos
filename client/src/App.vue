<template>
  <main>
    <the-header v-show="routeName!='login'"></the-header>
    <router-view class="container"></router-view>
  </main>
</template>

<script>
import TheHeader from "./components/layouts/TheHeader.vue";
export default {
  components: {
    TheHeader
  },
  computed: {
    routeName() {
      return this.$route.name;
    }
  }
};
</script>

<style lang="scss" >
@import "assets/scss/_typography.scss";
@import "assets/scss/_mixins.scss";
@import "assets/scss/_base.scss";
@import "assets/scss/_colors.scss";
html {
  font-family: $regular;
}

body {
  margin: 0;
  color: map-get($colors, blackL);
}
main {
  width: 100%;
}
</style>