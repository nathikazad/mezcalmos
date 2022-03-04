<template>
  <div class="flex center align_center wrap login">
    <div class="brand fill_width">
      <div class="flex center align_center">
        <location-permission></location-permission>
      </div>
    </div>
    <div class="login_action txt_center">
      <h2 class="regular" v-html="$tc('taxi.permissions.askForNotif',1)"></h2>
      <h4 class="regular text_grey" v-html="$tc('taxi.permissions.askForNotif',2)"></h4>
      <base-button class="w-90 elevate_1" :mode="{ dark: true, bg_diagonal: true }">
        <span class="t-8 regular">{{$t('taxi.permissions.permissionBtn')}}</span>
      </base-button>
    </div>
  </div>
</template>
<script>
import locationPermission from "@/shared/components/SVG/locationPermission.vue";
export default {
  data() {
    return {
      isLoading: false,
      error: null
    };
  },
  components: { locationPermission },
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
