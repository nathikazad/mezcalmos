<template>
  <div>
    <h2>Buy Groceries</h2>
    <h3>FROM</h3>
    <pick-location v-model="from"></pick-location>
    <h3>TO</h3>
    <pick-location v-model="to"></pick-location>
    <h3>Items</h3>
    <div>
      {{items}}
    </div>
    <add-item v-on:new-item="addItem($event)"></add-item>
    <h3>Notes</h3>
    <input type="text" v-model="notes" /> <br/><br/>
    <button v-if="isLoggedIn" @click="requestGrocery">Buy</button>
    <button v-else @click="login">Sign in with Facebook to Buy</button><br />
  </div>
  <!-- testing -->
  <!-- <label>lat:&nbsp;{{ to.lat }}</label><br/>
  <label>long:&nbsp;{{ to.long }}</label><br/>
  <label>address:&nbsp;{{ to.address }}</label><br/> -->
</template>

<script>
import PickLocation from "@/shared/components/map/GetLocation";
import AddItem from "@/shared/components/services/groceries/AddItem";
export default {
  components: {
    PickLocation,
    AddItem
  },
  data() {
    return {
      from: {lat:22.29924, long:73.16584, address:"Chick Tacos, 54 something avenue, Mexico"},
      to: {lat:22.29924, long:73.16584, address:"Chick Tacos, 54 something avenue, Mexico"},
      items: [],
      notes: ""
    };
  },
  computed: {
    isLoggedIn(){
      return this.$store.getters.loggedIn
    }
  },
  methods: {
    async requestGrocery() {
      let response = (await this.$store.dispatch("groceries/requestGrocery", {
        to: this.to,
        from: this.from,
        notes: this.notes,
        items: this.items
      })).data;
      if(response.status == "Success") {
        this.$router.push({ path: `${response.orderId}`})
      } else {
        this.errorMessage = response.errorMessage;
      }
    },
    addItem(item) {
      this.items.push(item)
    },
    async login() {
      await this.$store.dispatch('login');
    }
  },
};
</script>