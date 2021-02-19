<template>
  <main :class="{ overlay: navDrawer  }">
    <transition name="slide-fade">
      <nav-drawer v-if="navDrawer" class="navDrawer bg_white" @toggle="navDrawer = !navDrawer"></nav-drawer>
    </transition>
    <the-header
      v-show="routeName != 'login'"
      @toggle="navDrawer = !navDrawer"
      :showNavBtn="showNavBtn"
    ></the-header>
    <router-view class="container outlet" :style="{minHeight:minHeight + 'px'}"></router-view>
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
      navDrawer: false,
      minHeight: 500
    };
  },
  mounted() {
    this.$store.dispatch("loadCustomerLocation");
    window.addEventListener("resize", this.handleResize);
    this.handleResize();
  },
  computed: {
    routeName() {
      return this.$route.name;
    },
    showNavBtn() {
      //searching for the home page

      return this.routeName == "home";
    },
    minHeightPx() {
      return this.minHeight;
    }
  },
  destroyed: function() {
    window.removeEventListener("resize", this.handleResize);
  },
  methods: {
    handleResize() {
      let innerHeight = window.innerHeight;
      this.minHeight = innerHeight - 80;
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
  z-index: 10;
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
