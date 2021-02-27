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
  components: { Taxi1 },
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
