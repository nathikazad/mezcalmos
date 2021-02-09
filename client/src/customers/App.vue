<template>
  <main :class="{ overlay: navDrawer }">
    <transition name="slide-fade">
      <nav-drawer v-if="navDrawer" class="navDrawer bg_white" @toggle="navDrawer = !navDrawer"></nav-drawer>
    </transition>
    <the-header v-show="routeName != 'login'" @toggle="navDrawer = !navDrawer"></the-header>
    <router-view class="container outlet"></router-view>
  </main>
</template>

<script>
import TheHeader from "@/shared/components/layouts/TheHeader.vue";
import NavDrawer from "@/shared/components/layouts/navDrawer.vue";

export default {
  components: {
    TheHeader,
    NavDrawer
  },
  data() {
    return {
      navDrawer: false
    };
  },
  mounted() {
    this.$store.dispatch("loadCustomerLocation");
  },
  computed: {
    routeName() {
      return this.$route.name;
    }
  },

  watch: {
    $route: {
      deep: true,
      immediate: true,
      handler: function() {
        this.navDrawer = false;
      }
    }
  }
};
</script>

<style lang="scss">
@import "@/shared/assets/scss/_typography.scss";
@import "@/shared/assets/scss/_mixins.scss";
@import "@/shared/assets/scss/_base.scss";
@import "@/shared/assets/scss/_colors.scss";
* {
  box-sizing: border-box;
}
html {
  font-family: $regular;
}

body {
  margin: 0;
  color: map-get($colors, blackL);
}
main {
  width: 100%;
  min-height: 100vh;
  position: relative;
}
.outlet {
  min-height: calc(100vh - 5rem);
  position: relative;
  overflow: auto;
  padding: 0 1rem;
}
.navDrawer {
  height: 100%;
  position: absolute;
  top: 0;
  left: 0;
  width: 80%;
  z-index: 9;
  padding: 0 1.25rem;
}
/* Enter and leave animations can use different */
/* durations and timing functions.              */
.slide-fade-enter-active {
  transition: all 0.5s ease-out;
}
.slide-fade-leave-active {
  transition: all 0.5s ease-in;
}

/* Enter and leave animations can use different */
/* durations and timing functions.              */
.slide-down-fade-enter-active {
  transition: all 0.5s ease-out;
}
.slide-down-fade-leave-active {
  transition: all 0.5s ease-in;
}
.slide-fade-enter, .slide-fade-leave-to
/* .slide-fade-leave-active below version 2.1.8 */ {
  transform: translateX(-100%);
}
.slide-down-fade-enter, .slide-fade-leave-to
/* .slide-fade-leave-active below version 2.1.8 */ {
  transform: translateX(-100%);
}
.slide-fade-reverse-enter-active {
  transition: all 0.5s ease-out;
}
.slide-fade-reverse-leave-active {
  transition: all 0.5s ease-in;
}
.slide-fade-reverse-enter, .slide-fade-reverse-leave-to
/* .slide-fade-leave-active below version 2.1.8 */ {
  transform: translateX(100%);
}
.slide-down-fade-reverse-enter, .slide-fade-reverse-leave-to
/* .slide-fade-leave-active below version 2.1.8 */ {
  transform: translateX(100%);
}
</style>
