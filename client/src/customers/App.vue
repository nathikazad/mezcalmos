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
    <transition :name="transitionName">
      <router-view class="container outlet" :style="{minHeight:minHeight + 'px'}"></router-view>
    </transition>
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
      minHeight: 500,
      lastRoute: "",
      transitionName: ""
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
      immediate: false,
      handler: function(from, to) {
        console.log(from);
        console.log(to);
        if (to.name == "taxiView" || to.name == "requestView") {
          this.transitionName = "slide-fade";
        } else if (from.name == "taxiView" || from.name == "requestView") {
          this.transitionName = "slide-fade-reverse";
        } else if (to.name == "orders" || to.name == "notifications") {
          this.transitionName = "slide-down";
        } else if (from.name == "orders" || from.name == "notifications") {
          this.transitionName = "slide-down-reverse";
        }
        this.lastRoute = from.path;
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
.slide-fade-enter-active,
.slide-fade-reverse-enter-active,
.slide-down-enter-active {
  transition: all 0.5s ease-out;
}
.slide-fade-reverse-leave-active,
.slide-fade-leave-active,
.slide-down-leave-active {
  transition: all 0.5s ease-in;
}
.slide-fade-reverse-enter, .slide-fade-reverse-leave-to
/* .slide-fade-leave-active below version 2.1.8 */ {
  transform: translateX(100%);
}
.slide-fade-enter, .slide-fade-leave-to
/* .slide-fade-leave-active below version 2.1.8 */ {
  transform: translateX(-100%);
}

.slide-down-enter, .slide-down-leave-to
/* .slide-fade-leave-active below version 2.1.8 */ {
  transform: translateY(100vh);
}

.slide-down-reverse-enter-to, .slide-down-reverse-leave
/* .slide-fade-leave-active below version 2.1.8 */ {
  transform: translateY(-100vh);
}
</style>
