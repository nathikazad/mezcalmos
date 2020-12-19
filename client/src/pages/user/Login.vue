<template>
  <div>
    <base-dialog :show="!!error" title="An error occured" @close="handleError"> 
    <p>{{ error }}</p>
    </base-dialog>
    <base-dialog :show="isLoading" title="Authenticating..." fixed>
      <base-spinner></base-spinner>
    </base-dialog>
    <base-card>
      <base-button type="button" @click="submitForm">Sign In With Facebook</base-button>
    </base-card>
  </div>
</template>

<script>
export default {
  data() {
    return {
      isLoading: false,
      error: null,
    };
  },
  computed: {
  },
  methods: {
    handleError(){
      this.error = null
    },
    async submitForm() {
      this.isLoading = true;
      try {
        await this.$store.dispatch('login');
        this.$router.push({path:this.$router.currentRoute.value.query.redirect})
      } catch (e) {
        this.error = e.message;
        console.log(this.error)
      }
      this.isLoading = false;
    }
  },
};
</script>