<template>
  <header>
    <nav class="container flex space_between align_center fill_height">
      <div class="right_side flex align_center">
        <base-button
          @click.native="$emit('toggle')"
          :mode="{ dark: true, bg_diagonal: true }"
          class="nav-btn menu"
          v-if="!backTo"
        >
          <menu-bars></menu-bars>
        </base-button>
        <base-button
          :mode="{ dark: true, bg_diagonal: true }"
          class="nav-btn menu"
          :link="true"
          :to="backTo"
          v-else
        >
          <fa icon="chevron-left"></fa>
        </base-button>
        <router-link to="/" class="flex align_center">
          <logo class="logo"></logo>
          <h2 class="regular txt_center flex">
            MEZ
            <span>CALMOS</span>
          </h2>
        </router-link>
      </div>
      <div class="left_side">
        <base-button
          :mode="{
           
            bg_diagonal: true,
            small: true,
          }"
          class="nav-btn text_primary ml-2 bg_light elevate_1"
          :link="true"
          :to="{
          path: `/orders`,
          query: { redirect: $route.path },
        }"
        >
          <fa icon="shopping-cart" />
        </base-button>
      </div>
    </nav>
  </header>
</template>

<script>
import menuBars from "../SVG/menuBars";
export default {
  components: {
    menuBars
  },
  computed: {
    isLoggedIn() {
      return this.$store.getters.loggedIn;
    },
    backTo() {
      let route = this.$route;
      if (route.name == "services") {
        return false;
      } else {
        return route.query.redirect || { name: "services" };
      }
    }
  },
  methods: {
    logout() {
      this.$store.dispatch("logout");
      this.$router.push({ name: "services" });
    }
  }
};
</script>

<style lang="scss" scoped>
header {
  width: 100%;
  height: 5rem;
}
h2 {
  color: map-get($colors, blackD);
  span {
    color: map-get($colors, brand);
  }
}
.logo {
  margin: 0 0.8rem;
  height: 2rem;
  width: auto;
  @media (max-width: 375px) {
    margin: 0 0.5rem;
  }
}
.menu {
  margin-right: 0.8rem;
}
.nav-btn {
  height: 2rem;
  width: 2rem;
  border-radius: 10px;
}
</style>
