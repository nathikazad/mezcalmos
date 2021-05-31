<template>
  <div class="flex center align_center wrap login">
    <div class="brand fill_width">
      <div class="circle flex center align_center">
        <logo :light="false" class="logo"></logo>
      </div>
      <h1 class="bold txt_center flex center">
        MEZ
        <span class="logo_second">CALMOS</span>
      </h1>
    </div>
    <div class="login_action txt_center">
      <!-- <h1 class="regular" v-html="$t('shared.login.customer')"></h1> -->
      <h1 class="regular" v-html="$t('shared.login.customer')"></h1>

      <button class="btn mb-1" @click="submitForm">
        <span>
          <fa :solid="true" icon="facebook-f" class="mr-1"></fa>
          {{$t('shared.login.fbBtn')}}
        </span>
      </button>
      <!-- <base-button
        :link="true"
        to="/enterNumber?method=whatsApp"
        :mode="{ dark: true, bg_whatsApp: true }"
        class="float_btn flex mb-1 align_center center"
      >
        <fa :solid="true" icon="whatsapp"></fa>
        {{$t('shared.login.whatsAppLogin')}}
      </base-button>-->
      <base-button
        :link="true"
        to="/enterNumber?method=SMS"
        :mode="{ dark: true, bg_SMS: true }"
        class="float_btn flex align_center center"
      >
        <fa icon="envelope" class="mr-1"></fa>
        {{$t('shared.login.loginWithSms')}}
      </base-button>
    </div>
  </div>
</template>
<script>
export default {
  data() {
    return {
      isLoading: false,
      error: null,
      phoneNumber: null,
      countryCode: null,
      appVerifier: "",
      countryCodeValidator: true,
      phoneNumberValidator: true,
      alertMessage: ""
    };
  },
  created() {},
  computed: {
    disabled() {
      return !(
        this.phoneNumber &&
        this.countryCode &&
        this.countryCodeValidator &&
        this.phoneNumberValidator
      );
    }
  },
  methods: {
    checkCountryCode(e) {
      if (e.target.value.length > 3) {
        e.target.nextElementSibling.focus();
      }
      var regex = /^\+(?:[0-9] ?){0,2}[0-9]$/;
      this.countryCodeValidator = regex.test(e.target.value);
      if (!regex.test(e.target.value)) {
        this.alertMessage = this.$t("shared.login.verifyCountryCode");
      } else {
        this.alertMessage = "";
      }
    },
    checkPhoneNumber(e) {
      var regex = /^[0-9]+$/;
      this.phoneNumberValidator = regex.test(e.target.value);

      if (!regex.test(e.target.value)) {
        this.alertMessage = this.$t("shared.login.verifyPhoneNumber");
      } else {
        this.alertMessage = "";
      }
    },
    handleError() {
      this.error = null;
    },
    async loginWithPhoneNumber() {
      if (!this.disabled) {
        this.isLoading = true;
        // this.appVerifier.render().then(widgetId => {

        // });
        let response = await this.$store.dispatch("sendOTPForLogin", {
          messageType: "SMS",
          phoneNumber: this.countryCode.toString() + this.phoneNumber.toString()
        });
        if (response.status == "Error") {
          this.alertMessage = response.errorMessage;
        } else {
          this.isLoading = false;
          this.$router.push("/validation");
        }
      }
    },
    async submitForm() {
      this.isLoading = true;
      try {
        await this.$store.dispatch("login");
      } catch (e) {
        this.error = e.message;
      }
      this.isLoading = false;
    }
  }
};
</script>
<style lang="scss" scoped>
.mb-1 {
  margin-bottom: 0.8rem !important;
}
input {
  margin: 0.5rem 0 1rem 0;
}

.error_input {
  border: $border;
  border-color: map-get($map: $colors, $key: error);
}
.alert_field {
  height: 1rem;
  margin: 0.5rem 0;
}
.login {
  flex-direction: column;
}
.circle {
  width: 7.25rem;
  height: 7.25rem;
  border-radius: 50%;
  margin: 2rem auto;
  background: transparent;
  .logo {
    width: 100%;
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
.sign_in_with_phone {
  width: 18.75rem;
  margin: auto;
  .text_field {
    .icon_container {
      width: 3rem;
      display: flex;
      justify-content: center;
    }
    input {
      margin-left: 0.5rem;
      width: 15.75rem;
    }
  }
}

.login_action {
  h1 {
    margin: 2.5rem 0 !important;
  }
  .float_btn {
    width: 18.75rem;
    margin: auto;
  }
  .btn {
    background: map-get($colors, fb);
    color: map-get($colors, white);
    width: 18.75rem;
  }
}
</style>
