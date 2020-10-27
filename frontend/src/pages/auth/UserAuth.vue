<template>
  <div>
    <base-dialog :show="!!error" title="An error occured" @close="handleError"> 
    <p>{{ error }}</p>
    </base-dialog>
    <base-dialog :show="isLoading" title="Authenticating..." fixed>
      <base-spinner></base-spinner>
    </base-dialog>
    <base-card>
      <form @submit.prevent="submitForm">
        <div class="form-control">
          <label for="email"> Email </label>
          <input id="email" type="email" v-model="email" />
        </div>
        <div class="form-control">
          <label for="password"> Password </label>
          <input id="password" type="password" v-model="password" />
        </div>
        <div>
          <p v-if="!formIsValid">Please enter a valid email and password</p>
          <base-button>{{ submitButtonCaption }}</base-button>
          <base-button type="button" mode="outline" @click="switchForm">{{
            switchButtonCaption
          }}</base-button>
        </div>
      </form>
    </base-card>
  </div>
</template>

<script>
export default {
  data() {
    return {
      email: '',
      password: '',
      formIsValid: true,
      mode: 'login',
      isLoading: false,
      error: null,
    };
  },
  computed: {
    submitButtonCaption() {
      if (this.mode == 'login') {
        return 'Login';
      } else {
        return 'Sign Up';
      }
    },
    switchButtonCaption() {
      if (this.mode == 'login') {
        return 'Sign Up instead';
      } else {
        return 'Login instead';
      }
    },
  },
  methods: {
    handleError(){
      this.error = null
    },
    async submitForm() {
      this.isLoading = true;
      if (this.email === '' || this.password.length < 6) {
        this.formIsValid = false;
        return;
      }
      try {
        if (this.mode == 'login') {
          await this.$store.dispatch('login', {
            email: this.email,
            password: this.password,
          });
        } else {
          await this.$store.dispatch('signUp', {
            email: this.email,
            password: this.password,
          });
        }
        this.$router.push('/')
      } catch (e) {
        this.error = e.message;
        console.log(this.error)
      }
      this.isLoading = false;
    },
    switchForm() {
      if (this.mode == 'login') {
        this.mode = 'signUp';
      } else {
        this.mode = 'login';
      }
    },
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