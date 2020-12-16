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
        this.$router.push('/')
      } catch (e) {
        this.error = e.message;
        console.log(this.error)
      }
      this.isLoading = false;
    }
  },
};
</script>

<style scoped>
form {
  margin: 1rem;
  padding: 1rem;
}

.form-control {
  margin: 0.5rem 0;
}

label {
  font-weight: bold;
  margin-bottom: 0.5rem;
  display: block;
}

input,
textarea {
  display: block;
  width: 100%;
  font: inherit;
  border: 1px solid #ccc;
  padding: 0.15rem;
}

input:focus,
textarea:focus {
  border-color: #3d008d;
  background-color: #faf6ff;
  outline: none;
}
</style>