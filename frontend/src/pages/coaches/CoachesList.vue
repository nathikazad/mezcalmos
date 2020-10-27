<template>
  <base-dialog :show="!!error" @close="handleErrorClose">
    {{ error }}
  </base-dialog>
  <section>
    <coach-filter>FILTER</coach-filter>
  </section>
  <section>
    <base-card>
      <div class="controls">
        <base-button mode="outline" @click="loadCoaches">Refresh</base-button>
        <base-button link to="/auth?redirect=register" v-if="!isLoggedIn">Login to Register</base-button>
        <base-button v-else-if="!isActive" link to="/register"
          >Registed New Coach</base-button
        >
      </div>
      <div v-if="isLoading">
        <base-spinner></base-spinner>
      </div>
      <ul v-else-if="hasCoaches">
        <coach-item
          v-for="coach in coachList"
          :key="coach.id"
          :id="coach.id"
          :firstName="coach.firstName"
          :lastName="coach.lastName"
          :description="coach.description"
          :areas="coach.areas"
          :hourlyRate="coach.hourlyRate"
        >
        </coach-item>
      </ul>
      <h3 v-else>No coaches found</h3>
    </base-card>
  </section>
</template>

<script>
import CoachItem from '../../components/coaches/CoachItem';
import CoachFilter from '../../components/coaches/CoachFilter';
export default {
  components: {
    CoachItem,
    CoachFilter,
  },
  data() {
    return {
      isLoading: false,
      error: null,
    };
  },
  computed: {
    coachList() {
      return this.$store.getters['coaches/list'];
    },
    hasCoaches() {
      return this.$store.getters['coaches/hasCoaches'];
    },
    isActive() {
      return this.$store.getters['coaches/isActive'];
    },
    isLoggedIn() {
      return this.$store.getters.loggedIn;
    },
  },
  methods: {
    async loadCoaches() {
      try {
        this.isLoading = true;
        await this.$store.dispatch('coaches/loadCoaches');
      } catch (e) {
        this.error = e.message || 'Something went wrong';
      }
      this.isLoading = false;
    },
    handleErrorClose() {
      this.error = null;
    },
  },
};
</script>

<style scoped>
ul {
  list-style: none;
  margin: 0;
  padding: 0;
}

.controls {
  display: flex;
  justify-content: space-between;
}
</style>