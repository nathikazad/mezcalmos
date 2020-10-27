<template>
  <base-dialog :show="!isValid" @close="handleErrorClose">
    <p>Cannot have empty strings</p>
  </base-dialog>
  <div v-if="sendingMessage">
    <base-spinner></base-spinner>
  </div>
  <form v-else @submit.prevent="submitForm">
    <div class="form-control">
      <label for="email"> Email </label>
      <input id="email" name="email" type="text" v-model="email" />
    </div>
    <div class="form-control">
      <label for="message"> Message </label>
      <textarea id="message" name="message" rows="5" v-model="message" />
    </div>
    <div>
      <base-button @click="sendMessage">Send Message</base-button>
    </div>
  </form>
</template>

<script>
export default {
  data() {
    return {
      email: '',
      message: '',
      isValid: true,
      sendingMessage: false
    };
  },
  methods: {
    async sendMessage() {
        
      if (this.email === '' || this.message === '') {
        this.isValid = false;
        return;
      }
      this.sendingMessage = true;
      await this.$store.dispatch('requests/submit', {
        coachId:this.$route.params.id, 
        email: this.email,
        message: this.message,
      });
      this.sendingMessage = false;
      this.$router.replace('/coaches/'+this.$route.params.id);
    },
    handleErrorClose() {
      this.isValid = true;
    },
  },
};
</script>

<style scoped>
form {
  margin: 1rem;
  border: 1px solid #ccc;
  border-radius: 12px;
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

.errors {
  font-weight: bold;
  color: red;
}

.actions {
  text-align: center;
}
</style>