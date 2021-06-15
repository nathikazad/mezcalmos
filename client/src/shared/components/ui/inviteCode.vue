<template>
  <div>
    <h1 class="regular my-4">{{$t('customer.inviteCode.inviteCodQuestion')}}</h1>

    <section class="bg_white border">
      <div class="sign_in_with_phone">
        <div class="text_field flex align_center t-19 space_between">
          <input
            v-for="index in 5"
            :key="index"
            type="text"
            class="input bg_secondary text_blackD fill_width w-15"
            placeholder="x"
            v-model="inviteCode[index-1]"
            :id="`digit-${index}`"
            maxlength="1"
            @input="checkDigit"
          />
        </div>

        <!-- <div id="recaptcha-container"></div> -->
      </div>
    </section>

    <div class="text_error txt_center alert_field" v-show="alertMessage">{{alertMessage}}</div>

    <div class="flex align_center space_between">
      <base-button
        @click.native="respondToInviteCode('no')"
        :mode="{ dark: true, bg_error: true }"
        class="float_btn flex align_center center w-45"
        :loading="isLoading"
      >{{'Cancel'}}</base-button>
      <base-button
        @click.native="respondToInviteCode('yes')"
        :mode="{ dark: true, bg_whatsApp: true ,disabled:disabled}"
        class="float_btn flex align_center center w-45"
        :loading="isLoading"
      >{{$t('shared.login.confirm')}}</base-button>
    </div>
  </div>
</template>
<script>
export default {
  computed: {
    disabled() {
      return this.inviteCode.join("").length < 5;
    },
    phoneNumber() {
      return this.$store.getters.phoneNumber;
    }
  },
  data() {
    return {
      inviteCode: [],
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

    async respondToInviteCode(cmd) {
      if (cmd == "yes") {
        let code = this.inviteCode.join("");

        if (code.length == 5) {
          this.$store.dispatch("saveInviteCode", code);
        } else {
          this.alertMessage = "Please check code format";
        }
      } else {
        this.$store.dispatch("saveInviteCode", null);
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