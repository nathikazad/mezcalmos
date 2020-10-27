<template>
  <div v-if="isLoaded">
     <section>
      <base-card>
        <h2>{{ fullName }}</h2>
        <h3>{{ rate }}/hour</h3>
      </base-card>
    </section>
    <section>
      <base-card>
        <header>
          <h2>Interest? Reach Out</h2>
          <base-button link :to="contactCoach">Contact</base-button>
        </header>
        <router-view></router-view>
      </base-card>
    </section>
    <section>
      <base-card>
        <base-badge
          v-for="area in areas"
          :key="area"
          :type="area"
          :title="area"
        ></base-badge>
        <p>{{ description }}</p>
      </base-card>
    </section>
  </div>
</template>

<script>
export default {
  data() {
    return {
      selectedCoach: {
        firstName: '',
        lastName: '',
        description: '',
        hourlyRate: '',
        areas: [],
      },
      isLoaded: false,
    };
  },
  computed: {
    contactCoach() {
      console.log(this.$route);
      return '/coaches/' + this.$route.params.id + '/contact';
    },
    fullName() {
      console.log('fullname');
      console.log(this.selectedCoach.firstName);
      return this.selectedCoach.firstName + ' ' + this.selectedCoach.lastName;
    },
    rate() {
      return this.selectedCoach.hourlyRate;
    },
    areas() {
      return this.selectedCoach.areas;
    },
    description() {
      return this.selectedCoach.description;
    },
  },
  async beforeCreate() {
    console.log('before create');
    this.selectedCoach = await this.$store.getters['coaches/coach'](
      this.$route.params.id
    );
    console.log(this.selectedCoach);
    this.isLoaded = true;
    // if (!this.selectedCoach) {
    //   this.$router.replace('/coaches');
    // }
  },
};
</script>