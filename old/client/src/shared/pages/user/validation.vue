<template>
  <div>
    <h1 class="regular my-4">{{$t('shared.login.OtpConfirmation')}}</h1>

    <section class="bg_white border">
      <h3 class="regular">
        {{$t('shared.login.enterOtpCode')}}
        <span class="text_SMS">{{phoneNumber}}</span>
      </h3>
      <div class="sign_in_with_phone">
        <div class="text_field flex align_center t-19 space_between">
          <input
            v-for="index in 6"
            :key="index"
            type="number"
            class="input bg_secondary text_blackD fill_width w-15"
            placeholder="#"
            v-model="OTPCode[index-1]"
            :id="`digit-${index}`"
            maxlength="1"
            @input="checkDigit"
          />
        </div>
        <div @click="loginWithPhoneNumber" class="pa-1 pointer resend">{{$t('shared.login.resend')}}</div>

        <!-- <div id="recaptcha-container"></div> -->
      </div>
    </section>

    <div class="text_error txt_center alert_field" v-show="alertMessage">{{alertMessage}}</div>

    <base-button
      @click.native="validatePhoneNumber"
      :mode="{ dark: true, bg_whatsApp: true ,disabled:disabled}"
      class="float_btn flex align_center center fill_width"
      :loading="isLoading"
    >{{$t('shared.login.confirm')}}</base-button>
  </div>
</template>
<script>
export default {
  beforeRouteEnter(to, from, next) {
    next(vm => {
      if (vm.$store.getters.phoneNumber) {
        return;
      } else {
        vm.$router.push("/auth");
      }
    });
  },
  computed: {
    disabled() {
      return this.OTPCode.join("").length < 6;
    },
    phoneNumber() {
      return this.$store.getters.phoneNumber;
    }
  },
  data() {
    return {
      OTPCode: [],
      isLoading: false,
      alertMessage: ""
    };
  },

  methods: {
    checkDigit(e) {
      if (
        e.target.value &&
        this.deepFind(e, "target.nextElementSibling.tagName") == "INPUT"
      ) {
        e.target.nextElementSibling.focus();
      }
    },
    async validatePhoneNumber() {
      if (this.OTPCode.join("").length == 6) {
        this.isLoading = true;

        let response = await this.$store.dispatch("signInUsingOTP", {
          OTPCode: this.OTPCode.join("")
        });
        if (response.status == "Error") {
          this.alertMessage = response.errorMessage;
          this.isLoading = false;
          setTimeout(() => {
            this.alertMessage = "";
          }, 3000);
        } else {
          // this.$router.push("/");
          this.isLoading = false;
        }
      } else {
        this.alertMessage = "Please check code format";
      }
    },
    async loginWithPhoneNumber() {
      console.log(this.phoneNumber);

      if (this.phoneNumber) {
        this.isLoading = true;

        let loginType = this.$route.query.method;

        let response = await this.$store.dispatch("sendOTPForLogin", {
          messageType: loginType,
          phoneNumber: this.phoneNumber
        });
        console.log(response);

        if (response.status == "Error") {
          this.alertMessage = response.errorMessage;
          this.isLoading = false;
          setTimeout(() => {
            this.alertMessage = "";
          }, 3000);
        } else {
          this.isLoading = false;
        }
      }
    }
  }
};
</script>
<style lang="scss" scoped>
.resend {
  text-decoration: underline;
}
.alert_field {
  height: 1rem;
  margin: 0.5rem 0;
}
.my-4 {
  margin: 1.8rem 0;
}
.mb-1 {
  margin-bottom: 0.8rem !important;
}
section {
  padding: 1rem;
  border-radius: 5px;
  margin: 0.5rem 0 1rem 0;
  h3 {
    font-size: 1rem;
  }
}
hr {
  border: $border;
}
input {
  margin: 0.5rem 0 1rem 0;
}
</style>