<template>
  <section>
    <base-card>
      <header>
        <h2>Requests Recieved</h2>
      </header>
      <ul v-if="hasRequests">
        <request-item
          v-for="request in recievedRequests"
          :key="request.id"
          :email="request.email"
          :message="request.message">
        </request-item>
      </ul>
      <h3 v-else> No requests recieved </h3>
    </base-card>
  </section>
</template>
<script>
import RequestItem from '../../components/requests/RequestItem';
export default {
  components: { RequestItem },
  async created() {
    console.log("loading requests")
    this.dataLoaded = true
    try {
      await this.$store.dispatch('requests/loadRequests');
      this.dataLoaded = true
      console.log("finished loading requests")
    } catch (e) {
      console.log(e);
    }
  },
  computed: {
    recievedRequests() {
      return this.$store.getters['requests/list'];
    },
    hasRequests() {
      return this.$store.getters['requests/hasRequests'];
    },
  },
};
</script>
<style scoped>
header {
  text-align: center;
}

ul {
  list-style: none;
  margin: 2rem auto;
  padding: 0;
  max-width: 30rem;
}

h3 {
  text-align: center;
}
</style>