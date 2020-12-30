<template>
  <div>
    <div class="nav_header flex align_center">
      <base-button
        @click.native="$emit('toggle')"
        :mode="{ dark: true, bg_diagonal: true, small: true }"
        class="nav-btn menu"
      >
        <fa icon="chevron-left"></fa>
      </base-button>
    </div>
    <div class="visitor nav_body flex align_center center" v-if="!isLoggedIn">
      <router-link to="/auth" class="text_blackD">
        <h2>
          <fa icon="sign-in-alt"></fa>&nbsp;Login
        </h2>
      </router-link>
    </div>
    <div class="user nav_body" v-else>
      <div class="identity flex center wrap">
        <avatar
          size="6.875rem"
          url="https://scontent.ftun11-1.fna.fbcdn.net/v/t1.0-9/107473085_10220372571378093_8626273449961856030_n.jpg?_nc_cat=111&ccb=2&_nc_sid=09cbfe&_nc_ohc=jN2qfU0I-z0AX-BsJ9G&_nc_ht=scontent.ftun11-1.fna&oh=c1ee5219e203f447022a8037b899cfc4&oe=60050203"
        ></avatar>
        <h2 class="fill_width txt_center t-16 bold">Bouassida Yassine</h2>
      </div>
      <div class="nav_links flex align_center start wrap">
        <router-link :to="link.to" class="text_blackD" v-for="(link, index) in links" :key="index">
          <h4>
            <fa :icon="link.icon" class="icon"></fa>
            &nbsp; {{ link.text }}
          </h4>
        </router-link>
        <span class="text_blackD" @click="logout">
          <h4>
            <fa icon="power-off" class="icon"></fa>&nbsp; Logout
          </h4>
        </span>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  computed: {
    isLoggedIn() {
      return this.$store.getters.loggedIn;
    }
  },
  data() {
    return {
      links: [
        { text: "User Information", icon: "user-circle", to: "/services" },
        { text: "My Orders", icon: "shopping-cart", to: "/orders" },
        { text: "Message", icon: "envelope", to: "/services" },
        { text: "Saved Location", icon: "location-arrow", to: "/services" }
      ]
    };
  },
  methods: {
    logout() {
      this.$store.dispatch("logout");
      this.$router.push("/services");
    },
    async login() {
      try {
        console.log("login");
        await this.$store.dispatch("login");
        if (this.$route.query.redirect) {
          this.$router.push({ path: this.$route.query.redirect });
        } else {
          this.$router.push({ path: "/" });
        }
      } catch (e) {
        this.error = e.message;
        console.log(this.error);
      }
    }
  }
};
</script>
<style lang="scss">
.nav_header {
  width: 100%;
  height: 5rem;
}
.nav-btn {
  height: 2rem;
  width: 2rem;
  border-radius: 10px;
}
.visitor {
  flex-direction: column;
}
.nav_body {
  height: calc(100% - 5rem);
}
.identity {
  margin: 10% 0;
}
.nav_links {
  width: 10rem;
  margin: auto;
  .icon {
    margin-right: 15px;
  }
}
</style>
