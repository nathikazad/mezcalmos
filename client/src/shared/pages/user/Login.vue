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
      <!-- <h1 class="regular" v-html="$t('shared.login.customer')"></h1> -->
      <h1 class="regular">Login With Your Phone Number</h1>
      <div class="sign_in_with_phone">
        <div class="text_field flex align_center t-19 space_between">
          <div class="icon_container">
            <fa icon="mobile"></fa>
          </div>&nbsp;
          <input
            type="text"
            class="input bg_secondary text_blackD w-25"
            placeholder="+52 "
            v-model="countryCode "
          />
          <input
            type="text"
            class="input bg_secondary text_blackD w-75"
            placeholder="123 456 7890 "
            v-model="phoneNumber "
          />
        </div>
        <br />
        <div id="recaptcha-container"></div>
      </div>
      <base-button
        @click.native="loginWithPhoneNumber"
        :mode="{ dark: true, bg_whatsApp: true, disabled:disabled }"
        class="float_btn flex align_center center"
        :loading="isLoading"
      >Login with number</base-button>
      <h5 class="regular">Or</h5>
      <button class="btn" @click="submitForm">
        <span>{{$t('shared.login.fbBtn')}}</span>
      </button>
    </div>
  </div>
</template>
<script>
import { firebaseAuth } from "@/shared/config/firebase";
export default {
  data() {
    return {
      isLoading: false,
      error: null,
      phoneNumber: null,
      countryCode: null,
      appVerifier: ""
    };
  },
  created() {
    // this.initReCaptcha();
  },
  computed: {
    disabled() {
      return !(this.phoneNumber && this.countryCode);
    }
  },
  methods: {
    handleError() {
      this.error = null;
    },
    async loginWithPhoneNumber() {
      if (this.phoneNumber) {
        this.isLoading = true;
        // this.appVerifier.render().then(widgetId => {

        // });
        await this.$store.dispatch("sendOTP", {
          apiKey: "999",
          phoneNumber: this.countryCode.toString() + this.phoneNumber.toString()
        });
        this.isLoading = false;
        this.$router.push("/validation");
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
    },
    initReCaptcha() {
      setTimeout(() => {
        // let vm = this;
        window.recaptchaVerifier = new firebaseAuth.RecaptchaVerifier(
          "recaptcha-container",
          {
            size: "normal",
            callback: function(response) {
              console.log(response);

              // reCAPTCHA solved, allow signInWithPhoneNumber.
              // ...
            },
            "expired-callback": function() {
              // Response expired. Ask user to solve reCAPTCHA again.
              // ...
            }
          }
        );
        //
        this.appVerifier = window.recaptchaVerifier;
      }, 1000);
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
