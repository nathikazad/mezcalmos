<template>
  <section>
    <base-card>
      <h2>Register as coach</h2>
      <base-card>
        <form @submit.prevent="registerCoach">
          <div class="form-control">
            <label for="firstName"> First Name </label>
            <input
              id="firstName"
              name="firstName"
              type="text"
              v-model="firstName"
            />
          </div>
          <div class="form-control">
            <label for="lastName"> Last Name </label>
            <input
              id="lastName"
              name="lastName"
              type="text"
              v-model="lastName"
            />
          </div>
          <div class="form-control">
            <label for="description"> Description </label>
            <textarea
              id="description"
              name="description"
              rows="5"
              v-model="description"
            />
          </div>
          <div class="form-control">
            <h3>Areas of expertise</h3>
            <label for="areas"> Areas </label>
            <div>
              <input
                id="frontend"
                type="checkbox"
                value="frontend"
                v-model="areas"
              />
              <label for="frontend">Front End Development</label>
            </div>
            <div>
              <input
                id="backend"
                type="checkbox"
                value="backend"
                v-model="areas"
              />
              <label for="backend">Back End Development</label>
            </div>
            <div>
              <input
                id="career"
                type="checkbox"
                value="career"
                v-model="areas"
              />
              <label for="career">Career Development</label>
            </div>
          </div>
          <div class="form-control">
            <label for="hourlyRate"> Hourly Rate </label>
            <input
              id="hourlyRate"
              name="hourlyRate"
              type="number"
              v-model.number="hourlyRate"
            />
          </div>
          <div>
            <base-button @click="registerCoach">Register Coach</base-button>
          </div>
        </form>
      </base-card>
    </base-card>
  </section>
</template>

<script>
export default {
  data() {
    return {
      firstName: "",
      lastName: "",
      description: "",
      hourlyRate: null,
      areas : []
    }
  },
  methods: {
    validateForm(){

    },
    registerCoach() {
      this.$store.dispatch('coaches/register', {
        firstName: this.firstName,
        lastName: this.lastName,
        description: this.description,
        areas: this.areas,
        hourlyRate: this.hourlyRate,
      });
      this.$router.replace('/coaches');
    },
  },
};
</script>

<style scoped>
.form-control {
  margin: 0.5rem 0;
}

label {
  font-weight: bold;
  display: block;
  margin-bottom: 0.5rem;
}

input[type='checkbox'] + label {
  font-weight: normal;
  display: inline;
  margin: 0 0 0 0.5rem;
}

input,
textarea {
  display: block;
  width: 100%;
  border: 1px solid #ccc;
  font: inherit;
}

input:focus,
textarea:focus {
  background-color: #f0e6fd;
  outline: none;
  border-color: #3d008d;
}

input[type='checkbox'] {
  display: inline;
  width: auto;
  border: none;
}

input[type='checkbox']:focus {
  outline: #3d008d solid 1px;
}

h3 {
  margin: 0.5rem 0;
  font-size: 1rem;
}

.invalid label {
  color: red;
}

.invalid input,
.invalid textarea {
  border: 1px solid red;
}
</style>