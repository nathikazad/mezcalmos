<template>
  <div class="flex center align_center wrap login">
    <div class="brand fill_width">
      <div class="flex center align_center">
        <taxi3 :light="true" class="logo"></taxi3>
      </div>
    </div>
    <div class="login_action txt_center">
      <h3 class="regular" v-html="$t('taxi.introduction.confirmation')"></h3>
    </div>
  </div>
</template>
<script>
import Taxi3 from "@/shared/components/SVG/taxi-3.vue";
export default {
  data() {
    return {
      isLoading: false,
      error: null
    };
  },
  components: { Taxi3 },
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
