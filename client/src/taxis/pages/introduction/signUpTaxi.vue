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
        class="fill_width elevate_1 btn"
        :mode="{ dark: true }"
        :link="true"
        :to="{
              path: '/confirmation',
             
            }"
      >
        <span class="t-8 regular">{{$t('taxi.introduction.fbBtn')}}</span>
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
  components: { Taxi2 },
  methods: {
    handleError() {
      this.error = null;
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
