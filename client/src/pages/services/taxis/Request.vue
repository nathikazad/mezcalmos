<template>
  <h2>Request Taxi</h2>
  <h3>FROM</h3>
  <pick-location v-model:location="from"></pick-location>
  <h3>TO</h3>
  <pick-location v-model:location="to"></pick-location>

  <button @click="requestTaxi">Get Taxi</button>
  <br />

  <!-- <label>lat:&nbsp;{{ to.lat }}</label>
  <br />
  <label>long:&nbsp;{{ to.long }}</label>
  <br />
  <label>address:&nbsp;{{ to.address }}</label>
  <br />-->
</template>

<script>
import PickLocation from "../../../components/map/GetLocation";
export default {
  components: {
    PickLocation
  },
  data() {
    return {
      from: {
        lat: 22.29924,
        long: 73.16584,
        address: "Chick Tacos, 54 something avenue, Mexico"
      },
      to: {
        lat: 22.29924,
        long: 73.16584,
        address: "Chick Tacos, 54 something avenue, Mexico"
      }
    };
  },
  methods: {
    async requestTaxi() {
      console.log("Getting Taxi");
      let response = (
        await this.$store.dispatch("taxis/requestTaxi", {
          to: this.to,
          from: this.from
        })
      ).data;
      console.log(response);
      if (response.status == "Success") {
        this.$router.push({ path: `${response.orderId}` });
      } else {
        this.errorMessage = response.errorMessage;
      }
    }
  }
};
</script>