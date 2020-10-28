<template>
  <the-header></the-header>
  <router-view v-if="dataLoaded"></router-view>
</template>

<script>
import TheHeader from './components/layouts/TheHeader.vue';
import { useQuery } from '@vue/apollo-composable';
import gql from 'graphql-tag';
export default {
  components: {
    TheHeader,
  },
  setup() {
    const { result, loading } = useQuery(gql`
      query AllPages {
        Page {
          users {
            name
            about
          }
        }
      }
    `);
    console.log(result)
    return { result, loading };
  },
  data() {
    return {
      dataLoaded: false,
    };
  },
  created() {
    try {
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