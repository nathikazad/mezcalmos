<template>
  <div>
    <h1 class="regular my-4">OTP Code</h1>
    <label class="bold mb-1">Enter Phone Number</label>
    <section class="bg_white border">
      <h3 class="regular">Enter Phone Number To Recieve OTP Code</h3>
      <div class="sign_in_with_phone">
        <div class="text_field flex align_center t-19 space_between">
          <input
            :class="{'error_input':!countryCodeValidator}"
            type="text"
            class="input bg_input text_blackD w-25 code_input"
            placeholder="+52"
            v-model="countryCode "
            @input="checkCountryCode"
          />
          <input
            :class="{'error_input':!phoneNumberValidator}"
            type="text"
            class="input bg_input text_blackD w-75 phone_input"
            placeholder="123 456 7890 "
            v-model="phoneNumber "
            @input="checkPhoneNumber"
          />
        </div>

        <!-- <div id="recaptcha-container"></div> -->
        <div class="text_error txt_center alert_field" v-show="alertMessage">{{alertMessage}}</div>
      </div>
    </section>
    <base-button
      @click.native="loginWithPhoneNumber"
      :mode="{ dark: true, bg_diagonal: true,disabled:disabled }"
      class="float_btn flex align_center center fill_width bold"
      :loading="isLoading"
    >SUBMIT</base-button>
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
    async loginWithPhoneNumber() {
      if (!this.disabled) {
        this.isLoading = true;
        // this.appVerifier.render().then(widgetId => {

        // });
        let loginType = this.$route.query.method;
       

        let response = await this.$store.dispatch("sendOTP", {
          apiKey: "999",
          messageType: loginType,
          phoneNumber: this.countryCode.toString() + this.phoneNumber.toString()
        });
        if (response.status == "Error") {
          this.alertMessage = response.errorMessage;
        } else {
          this.isLoading = false;
          this.$router.push(`/validation?method=${loginType}`);
        }
      }
    }
  }
};
</script>
<style lang="scss" scoped>
section {
  padding: 1rem;
  border-radius: 5px;
  margin: 0.5rem 0 1rem 0;
  h3 {
    font-size: 1rem;
  }
}
.my-4 {
  margin: 1.8rem 0;
}
.mb-1 {
  margin-bottom: 0.8rem !important;
}
.phone_input {
  margin: 0.5rem 0 1rem 0.5rem;
}
.code_input {
  margin: 0.5rem 0 1rem 0;
}
.logo_second {
  margin-left: -0.5rem;
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
.sign_in_with_phone {
  margin: auto;
  .text_field {
    .icon_container {
      width: 3rem;
      display: flex;
      justify-content: center;
    }
    input {
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
