<template>
  <div>
    <transition name="slide-fade">
      <add-item v-if="addOpen" class="AddItem" @addItem="addItem($event)"></add-item>
    </transition>

    <h1>Groceries</h1>
    <div>
      <h3 class="bold flex space_between">
        <span>Orders</span>
        <span class="regular">{{items.length}} Items</span>
      </h3>
      <panel :color="`bg_grocery`" v-for="(order, orderId) in items" :key="orderId">
        <span slot="name" class="t-10">{{ order.name }}</span>

        <span slot="param" class="t-9 text_grey bg_white pill">
          <fa icon="trash"></fa>
        </span>
      </panel>
    </div>
    <div class="field">
      <base-button
        class="fill_width"
        :mode="{ dark: true, bg_diagonal: true } "
        @click.native="addOpen=true"
      >
        <span class="t-8">
          <fa icon="plus"></fa>&nbsp; ADD ITEM
        </span>
      </base-button>
    </div>
    <div class="field" id="note">
      <h3 class="bold flex space_between">
        <span>Notes</span>
      </h3>
      <textarea type="text" class="input bg_secondary text_blackD rows" placeholder="Write Here..."></textarea>
    </div>
    <div class="field" id="delveredTo">
      <h3 class="bold flex space_between">
        <span>Delivered To</span>
      </h3>
      <input type="text" class="input bg_secondary text_blackD" placeholder="Enter Address..." />
    </div>
    <div class="field">
      <base-button class="fill_width" :mode="{ dark: true, bg_diagonal: true }">
        <span class="t-8">
          ORDER NOW &nbsp;
          <fa icon="long-arrow-alt-right"></fa>
        </span>
      </base-button>
    </div>

    <!-- <h2>Buy Groceries</h2>
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
    <button v-else @click="login">Sign in with Facebook to Buy</button><br />-->
  </div>
</template>

<script>
// import PickLocation from "@/shared/components/map/GetLocation";
import AddItem from "./AddItem";
export default {
  components: {
    AddItem
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
      },
      items: [],
      notes: "",
      addOpen: false
    };
  },
  computed: {
    isLoggedIn() {
      return this.$store.getters.loggedIn;
    }
  },
  methods: {
    async requestGrocery() {
      let response = (
        await this.$store.dispatch("groceries/requestGrocery", {
          to: this.to,
          from: this.from,
          notes: this.notes,
          items: this.items
        })
      ).data;
      if (response.status == "Success") {
        this.$router.push({ path: `${response.orderId}` });
      } else {
        this.errorMessage = response.errorMessage;
      }
    },
    addItem(item) {
      this.items.push(item);
      this.addOpen = false;
    },
    async login() {
      await this.$store.dispatch("login");
    }
  }
};
</script>
<style lang="scss">
.AddItem {
  position: absolute;
  width: 100%;
  height: 100vh;
  background: white;
  top: 0;
  left: 0;
  z-index: 9;
  padding: 1rem;
}
.pill {
  border-radius: 6px !important;
  padding: 0.4rem 0.5rem;
}
.field {
  margin-top: 2rem;
}
.circle {
  width: 7.25rem;
  height: 7.25rem;
  background: map-get($gradients, diagonal);
  border-radius: 50%;
  margin: 1rem auto;

  .logo {
    width: 4.25rem;
    height: auto;
    animation: rotation 1s infinite ease-in-out;
  }
}
.rows {
  height: 16rem;
}
</style>