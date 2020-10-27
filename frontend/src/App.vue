<template>
  <the-header></the-header>
  <router-view v-if="dataLoaded"></router-view>
</template>

<script>
import TheHeader from './components/layouts/TheHeader.vue';

export default {
  components: {
    TheHeader,
  },
  data() {
    return {
      dataLoaded: false,
    };
  },
  created() {
    try {
      this.$store.dispatch('tryLogin')
      this.$store.dispatch('coaches/loadCoaches');
      this.dataLoaded = true;
    } catch (e) {
      console.log(e);
    }
  },

};
</script>

<style scoped>
@import url('https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap');

* {
  box-sizing: border-box;
}

html {
  font-family: 'Roboto', sans-serif;
}

body {
  margin: 0;
}
</style>