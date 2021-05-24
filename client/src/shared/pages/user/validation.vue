<template>
  <div>
    <h1 class="txt_center">Phone number confirmation</h1>
    <hr />
    <h3
      class="regular text_grey txt_center"
    >We sent you SMS-code. Please, enter the code for confirm phone number.</h3>
    <h3 class="regular">Enter sms code</h3>
    <input
      type="text"
      class="input bg_secondary text_blackD fill_width"
      placeholder="Please, enter your sms code "
      v-model="OTPCode"
    />
    <base-button
      @click.native="validatePhoneNumber"
      :mode="{ dark: true, bg_whatsApp: true ,disabled:!OTPCode}"
      class="float_btn flex align_center center fill_width"
      :loading="isLoading"
    >Confirm</base-button>
  </div>
</template>
<script>
export default {
  data() {
    return {
      OTPCode: null,
      isLoading: false
    };
  },

  methods: {
    async validatePhoneNumber() {
      if (this.OTPCode) {
        this.isLoading = true;

        await this.$store.dispatch("confirmOTP", {
          OTPCode: this.OTPCode
        });
        this.isLoading = false;
      }
    }
  }
};
</script>
<style lang="scss">
hr {
  border: $border;
}
input {
  margin: 0.5rem 0 1rem 0;
}
</style>