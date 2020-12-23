<template>
  <ul>
    <li><router-link :to="requestTaxi">Taxi</router-link></li>
    <li><router-link :to="requestGrocery">Groceries</router-link></li>
  </ul>
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
    requestTaxi() {
      return '/services/taxi/request';
    },
    requestGrocery() {
      return '/services/grocery/request';
    },
  }
};
</script>

<style scoped>
ul {
  list-style: none;
  margin: 0;
  padding: 0;
}

</style>