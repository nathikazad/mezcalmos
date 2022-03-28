<template>
  <div class="flex center align_center wrap login">
    <div class="brand fill_width">
      <div class="flex center align_center">
        <taxi2 :light="true" class="logo"></taxi2>
      </div>
    </div>
    <div class="login_action txt_center">
      <h3 class="regular" v-html="$t('taxi.introduction.signUpTaxi')"></h3>
      <base-button
        v-if="!isLoggedIn"
        class="fill_width elevate_1 btn bg_SMS"
        :mode="{ dark: true }"
        :link="true"
        to="/auth"
      >
        <span class="t-8 regular">{{$tc('taxi.introduction.logIn',1)}}</span>
      </base-button>
      <base-button
        v-else
        class="fill_width elevate_1 btn"
        :mode="{ dark: true, bg_diagonal: true }"
        @click.native="sendRequest()"
      >
        <span class="t-8 regular">Continue</span>
      </base-button>
    </div>
  </div>
</template>
<script>
import Taxi2 from "@/shared/components/SVG/taxi-2.vue";
export default {
  data() {
    return {
      isLoading: false,
      error: null
    };
  },
  computed: {
    isLoggedIn() {
      return this.$store.getters.loggedIn;
    }
  },
  components: { Taxi2 },
  methods: {
    async login() {
      await this.$store.dispatch("login");
      console.log("submit called");

      await this.sendRequest();
      this.$emit("closeNavDrawer");
    },
    handleError() {
      this.error = null;
    },
    async sendRequest() {
      let response = await this.$store.dispatch(
        "admin/submitAuthorizationRequest"
      );
      console.log(response);

      this.$router.push("/confirmation");
    }
  }
};
</script>
<style lang="scss" scoped>
.login {
  flex-direction: column;
}
.logo {
  width: auto;
  height: auto;
}
.brand {
  h1 {
    color: map-get($colors, blackD);
    span {
      color: map-get($colors, brand);
    }
  }
}
.login_action {
  h3 {
    margin: 2.5rem 0 !important;
    line-height: 1.8rem;
  }
  .btn {
    background: map-get($colors, fb);
    color: map-get($colors, white);
    width: 18.75rem;
  }
}
</style>
