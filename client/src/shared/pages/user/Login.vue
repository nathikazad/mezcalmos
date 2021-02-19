<template>
  <div class="flex center align_center wrap login">
    <div class="brand fill_width">
      <div class="circle flex center align_center">
        <logo :light="true" class="logo"></logo>
      </div>
      <h1 class="regular txt_center">
        MEZ
        <span>CALMOS</span>
      </h1>
    </div>
    <div class="login_action txt_center">
      <h1 class="regular" v-html="$t('shared.login.customer')"></h1>
      <button class="btn" @click="submitForm">
        <span>{{$t('shared.login.fbBtn')}}</span>
      </button>
    </div>
  </div>
</template>
<script>
export default {
  data() {
    return {
      isLoading: false,
      error: null
    };
  },
  computed: {},
  methods: {
    handleError() {
      this.error = null;
    },
    async submitForm() {
      this.isLoading = true;
      try {
        await this.$store.dispatch("login");
        if (this.$route.query.redirect) {
          this.$router.push({ path: this.$route.query.redirect });
        } else {
          this.$router.push({ path: "/" });
        }
      } catch (e) {
        this.error = e.message;
      }
      this.isLoading = false;
    }
  }
};
</script>
<style lang="scss" scoped>
.login {
  flex-direction: column;
}
.circle {
  width: 7.25rem;
  height: 7.25rem;
  background: map-get($gradients, diagonal);
  border-radius: 50%;
  margin: 2rem auto;
  .logo {
    width: 4.25rem;
    height: auto;
  }
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
  h1 {
    margin: 2.5rem 0 !important;
  }
  .btn {
    background: map-get($colors, fb);
    color: map-get($colors, white);
    width: 18.75rem;
  }
}
</style>
