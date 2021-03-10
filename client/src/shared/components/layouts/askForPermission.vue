<template>
  <div class="flex center align_center wrap login">
    <div class="brand fill_width">
      <div class="flex center align_center">
        <no-location></no-location>
      </div>
    </div>
    <div class="login_action txt_center">
      <h2 class="regular" v-html="$tc('taxi.permissions.askForNotif',0)"></h2>
      <h4 class="regular text_grey" v-html="$tc('taxi.permissions.askForNotif',1)"></h4>
      <h4 class="regular text_grey" v-html="$tc('taxi.permissions.askForNotif',3)"></h4>
    </div>
  </div>
</template>
<script>
import noLocation from "../SVG/noLocation";
export default {
  data() {
    return {
      isLoading: false,
      error: null
    };
  },
  components: { noLocation },
  mounted() {},
  methods: {
    handleError() {
      this.error = null;
    },
    askForLocation() {
      if (navigator.geolocation) {
        navigator.permissions
          .query({ name: "geolocation" })
          .then(permission => {
            if (permission.state == "denied") {
              window.location.replace(
                "chrome://settings/content/siteDetails?site=http%3A%2F%2Flocalhost%3A8080"
              );
            } else {
              navigator.geolocation.getCurrentPosition(function(pos) {
                console.log(pos);
              });
            }
          });
      }
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
