<template>
  <main :class="{ overlay: navDrawer }" @click="closeNav" id="main">
    <transition name="slide-fade">
      <nav-drawer
        v-if="navDrawer"
        class="navDrawer bg_white"
        @toggle="navDrawer = !navDrawer"
        @closeNavDrawer="navDrawer = false"
      ></nav-drawer>
    </transition>
    <transition name="slide-down">
      <askForPermission v-if="showPermessionPanel" class="dialogPanel bg_white"></askForPermission>
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
import askForPermission from "@/shared/components/layouts/askForPermission.vue";

export default {
  components: {
    TheHeader,
    NavDrawer,
    askForPermission
  },
  data() {
    return {
      navDrawer: false,
      minHeight: 500,
      transitionName: "",
      showPermessionPanel: false
    };
  },
  computed: {
    locationEnabled() {
      return this.$store.getters.locationEnabled;
    },
    routeName() {
      return this.$route.name;
    },
    showNavBtn() {
      //searching for the home page
      if (this.$store.getters.isInTaxi) {
        return this.routeName == "taxiView";
      } else if (
        this.routeName == "howToTaxi" ||
        this.routeName == "applicationUnderReview"
      ) {
        return true;
      } else {
        return this.routeName == "home";
      }
    },
    minHeightPx() {
      return this.minHeight;
    }
  },
  created() {
    this.$store.commit("setLocationEnabled", true);
  },
  mounted() {
    window.addEventListener("resize", this.handleResize);
    this.handleResize();
  },
  destroyed: function() {
    window.removeEventListener("resize", this.handleResize);
  },
  methods: {
    handleResize() {
      let innerHeight = window.innerHeight;
      this.minHeight = innerHeight - 80;
    },
    closeNav(e) {
      if (e.target.id == "main") {
        this.navDrawer = false;
      }
    }
  },
  watch: {
    $route: {
      deep: true,
      immediate: false,
      handler: function(to, from) {
        if (to.name == "orders" || to.name == "notifications") {
          //scene3

          this.transitionName = "slide-down";
          if (from.name == "orders" || from.name == "notifications") {
            //scene4
            this.transitionName = "slide-down";
          }
        } else if (from.name == "orders" || from.name == "notifications") {
          //scene5
          this.transitionName = "slide-down";
        } else if (to.name == "taxiView" || to.name == "requestView") {
          //scene1
          this.transitionName = "slide-fade";
        } else if (from.name == "taxiView" || from.name == "requestView") {
          //scene2
          this.transitionName = "slide-fade-reverse";
        }
        this.navDrawer = false;
      }
    },
    locationEnabled: {
      deep: true,
      immediate: true,
      handler: function(newVal) {
        console.log("locationEnabled", newVal);

        this.showPermessionPanel = !newVal;
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
  //min-height: 100vh;
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
.dialogPanel {
  position: absolute;
  width: 100%;
  height: calc(100% - 5rem);
  background: white;
  top: 5rem;
  left: 0;
  z-index: 9;
  padding: 1rem;
  padding-top: 0;
}
</style>
