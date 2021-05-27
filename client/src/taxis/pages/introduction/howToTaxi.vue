<template>
  <div class="flex center align_center wrap login">
    <div class="brand fill_width">
      <div class="flex center align_center">
        <taxi1 :light="true" class="logo"></taxi1>
      </div>
    </div>
    <div class="login_action txt_center">
      <h3 class="regular" v-html="$t('taxi.introduction.howToTaxi')"></h3>
      <base-button
        class="w-90 elevate_1"
        :mode="{ dark: true, bg_diagonal: true }"
        :link="true"
        :to="{
              path: '/signUpTaxi',
             
            }"
      >
        <span class="t-8 regular">{{$t('taxi.introduction.yes')}}</span>
      </base-button>
      <h3
        v-if="!isLoggedIn"
        class="regular alreadyMember"
        v-html="$t('taxi.introduction.alreadyMember')"
      ></h3>
      <base-button
        v-if="!isLoggedIn"
        class="fill_width elevate_1 btn fbBtn"
        :link="true"
        to="/auth"
        :mode="{ dark: true }"
      >
        <span class="t-8 regular">{{$tc('taxi.introduction.fbBtn',2)}}</span>
      </base-button>
    </div>
  </div>
</template>
<script>
import Taxi1 from "@/shared/components/SVG/taxi-1.vue";
export default {
  data() {
    return {
      isLoading: false,
      error: null
    };
  },
  computed: {
    authorizationPending() {
      return this.$store.getters.authorizationPending;
    },
    isLoggedIn() {
      return this.$store.getters.loggedIn;
    }
  },
  components: { Taxi1 },
  watch: {
    authorizationPending: {
      immediate: true,
      deep: true,
      handler: function(newVal) {
        if (newVal) {
          this.$router.push("/confirmation");
        }
      }
    }
  },
  methods: {
    handleError() {
      this.error = null;
    },
    async login() {
      await this.$store.dispatch("login");
      this.$emit("closeNavDrawer");
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
    margin: 1rem 0 !important;
    line-height: 1.8rem;
  }
  .btn {
    background: map-get($colors, fb);
    color: map-get($colors, white);
    width: 18.75rem;
  }
  .alreadyMember {
    margin-bottom: 0.5rem !important;
  }
}
</style>
