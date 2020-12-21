<template>
  <header>
    <nav class="container flex space_between align_center fill_height">
      <div class="right_side">
        <router-link to="/" class="flex align_center">
          <base-button :mode="{ dark: true, bg_diagonal: true }"
            >Men</base-button
          >
          <logo class="logo"></logo>
          <h2 class="regular txt_center">
            MEZ
            <span>CALMOS</span>
          </h2>
        </router-link>
      </div>
      <div class="left_side"></div>
    </nav>
  </header>
</template>

<script>
export default {
  computed: {
    isLoggedIn() {
      return this.$store.getters.loggedIn;
    },
  },
  methods: {
    logout() {
      this.$store.dispatch("logout");
      this.$router.push("/coaches");
    },
    async login() {
      try {
        await this.$store.dispatch("login");
        // this.$router.push('/')
      } catch (e) {
        this.error = e.message;
        console.log(this.error);
      }
    },
  },
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
}
</style>
