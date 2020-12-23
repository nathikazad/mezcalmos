<template>
  <div>
    <h2>Request Taxi</h2>
    <h3>FROM</h3>
    <pick-location v-model="from"></pick-location>
    <h3>TO</h3>
    <pick-location v-model="to"></pick-location>

    <button v-if="isLoggedIn" @click="requestTaxi">Get Taxi</button>
    <button v-else @click="login">Sign in with Facebook to Get Taxi</button><br />
  </div>
  <!-- testing -->
  <!-- <label>lat:&nbsp;{{ to.lat }}</label><br/>
  <label>long:&nbsp;{{ to.long }}</label><br/>
  <label>address:&nbsp;{{ to.address }}</label><br/> -->
</template>

<script>
import PickLocation from "@/components/map/GetLocation";
export default {
  components: {
    PickLocation,
  },
  data() {
    return {
      from: {lat:22.29924, long:73.16584, address:"Chick Tacos, 54 something avenue, Mexico"},
      to: {lat:22.29924, long:73.16584, address:"Chick Tacos, 54 something avenue, Mexico"},
    };
  },
  computed: {
    isLoggedIn(){
      return this.$store.getters.loggedIn
    }
  },
  methods: {
    async requestTaxi() {
      let response = (await this.$store.dispatch("taxis/requestTaxi", {
        to: this.to,
        from: this.from
      })).data;
      if(response.status == "Success") {
        this.$router.push({ path: `${response.orderId}`})
      } else {
        this.errorMessage = response.errorMessage;
      }
    },
    async login() {
      await this.$store.dispatch('login');
    }
  },
};
</script>