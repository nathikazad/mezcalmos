<template>
  <div>
    <transition name="slide-fade">
      <add-item v-if="addOpen" class="dialog" @addItem="addItem($event)"></add-item>
    </transition>
    <transition name="slide-fade">
      <div class="dialog" v-if="pickLocation">
        <input-location
          slot="body"
          :search.sync="search"
          :saved.sync="saved"
          :directionsBorns.sync="directionsBorns"
          :to.sync="to"
          :from.sync="from"
          oneWay="to"
          :fromUrl="deepFind(userInfo, 'photo')"
        >
          <div class="flex align_center space_between btnP" slot="action">
            <base-button
              class="w-45"
              :mode="{ dark: true, bg_diagonal: true }"
              @click.native="pickLocation=false"
            >
              <span class="t-8 regular">CONFIRM</span>
            </base-button>
            <base-button
              class="w-45"
              :mode="{ dark: true, bg_error: true }"
              @click.native="pickLocation=false"
            >
              <span class="t-8 regular">CANCEL</span>
            </base-button>
          </div>
        </input-location>
      </div>
    </transition>

    <h1>Groceries</h1>
    <div>
      <h3 class="bold flex space_between">
        <span>Orders</span>
        <span class="regular">{{ items.length }} Items</span>
      </h3>
      <panel :color="`bg_grocery`" v-for="(item, itemId) in items" :key="itemId">
        <span slot="name" class="t-10">{{ item.name }}</span>
        <base-button
          slot="param"
          :mode="{
            small: true,
          }"
          @click.native="items.splice(itemId, 1)"
          class="nav-btn text_primary ml-2 bg_secondary elevate_1"
        >
          <fa icon="trash"></fa>
        </base-button>
      </panel>
    </div>
    <div class="field">
      <base-button
        class="fill_width"
        :class="{required:required}"
        :mode="{ dark: true, bg_diagonal: true }"
        :link="true"
        :to="{
          path: '/services/grocery/request',
          query: { redirect: '/services/grocery/request' },
        }"
      >
        <span class="t-8">
          <fa icon="plus"></fa>&nbsp; ADD ITEM
        </span>
      </base-button>
    </div>
    <ValidationObserver ref="observer" tag="form">
      <div class="field" id="note">
        <h3 class="bold flex space_between">
          <span>Notes</span>
        </h3>

        <textarea
          type="text"
          class="input bg_secondary text_blackD rows"
          placeholder="Write Here..."
          v-model="notes"
        ></textarea>
      </div>
      <div class="field" id="delveredTo">
        <h3 class="bold flex space_between">
          <span>Delivered To</span>
        </h3>
        <ValidationProvider rules="required" v-slot="{ errors, classes }">
          <span :class="classes" @click="pickLocation=true">
            <input
              disabled="true"
              type="text"
              class="input bg_secondary text_blackD"
              placeholder="Enter Address..."
              v-model="fromTo"
            />
            <span>{{ errors[0] }}</span>
          </span>
        </ValidationProvider>
      </div>
    </ValidationObserver>
    <div class="field">
      <base-button
        v-if="isLoggedIn"
        class="fill_width"
        :mode="{ dark: true, bg_diagonal: true }"
        @click.native="requestGrocery()"
      >
        <span class="t-8">
          ORDER NOW &nbsp;
          <fa icon="long-arrow-alt-right"></fa>
        </span>
      </base-button>
      <base-button
        v-else
        class="fill_width"
        :mode="{ dark: true, bg_diagonal: true }"
        :link="true"
        to="/auth?redirect=/services/grocery/request"
      >
        <span class="t-8">
          ORDER NOW &nbsp;
          <fa icon="long-arrow-alt-right"></fa>
        </span>
      </base-button>
    </div>

    <!-- TODO: check if logged in, if not link to login
    <button v-if="isLoggedIn" @click="requestGrocery">Buy</button>
    <button v-else @click="login">Sign in with Facebook to Buy</button><br />-->
  </div>
</template>

<script>
import AddItem from "./AddItem";
export default {
  components: {
    AddItem
  },

  data() {
    return {
      items: [],
      required: false,
      notes: "",
      addOpen: false,
      search: {
        to: "",
        from: "",
        results: [],
        searching: false,
        origin: "to"
      },
      pickLocation: false,
      directionsBorns: {
        start: null,
        end: null
      },
      saved: {
        locations: [
          {
            description: "Rte, mahdia km 5 Sfax,Tunisia",
            pos: { lat: () => 34.7667, lng: () => 10.7255 },
            name: "Home"
          },
          {
            description: "Rte, mahdia km 8.5 Sfax,Tunisia",
            pos: { lat: () => 34.7571, lng: () => 10.7715 },
            name: "Office"
          }
        ],
        origin: "from",
        opened: false
      },
      from: {
        address: "",
        by: "search"
      },
      to: {
        lat: 22.29924,
        long: 73.16584,
        address: "",
        by: "search"
      }
    };
  },
  computed: {
    userInfo() {
      return this.$store.getters["userInfo"];
    },
    isLoggedIn() {
      return this.$store.getters.loggedIn;
    },
    fromTo() {
      let fromTo = "";
      if (this.from.address) {
        fromTo += `from: ${this.from.address},`;
      }
      if (this.to.address) {
        fromTo += `To:${this.to.address}`;
      }
      return fromTo;
    }
  },
  watch: {
    $route: {
      deep: true,
      immediate: true,
      handler: function(newVal) {
        if (newVal.query.redirect) {
          console.log(newVal);
          this.addOpen = true;
        } else {
          this.addOpen = false;
        }
      }
    }
  },
  methods: {
    async requestGrocery() {
      const valid = await this.$refs.observer.validate();

      if (valid) {
        if (this.items.length > 0) {
          let data = {
            to: this.to,
            notes: this.notes,
            items: this.items
          };
          if (this.from.address) {
            data["from"] = this.from;
          }
          console.log({ data });

          let response = (
            await this.$store.dispatch("groceries/requestGrocery", data)
          ).data;
          if (response.status == "Success") {
            this.$router.push({ path: `${response.orderId}` });
          } else {
            this.errorMessage = response.errorMessage;
          }
        } else {
          this.required = false;
          setTimeout(() => {
            this.required = true;
          }, 200);
        }
      }
    },
    addItem(item) {
      this.items.push(item);
    },
    async login() {
      await this.$store.dispatch("login");
    }
  }
};
</script>
<style lang="scss" scoped>
.dialog {
  position: absolute;
  width: 100%;
  height: 100%;
  background: white;
  top: 0;
  left: 0;
  z-index: 9;
  padding: 1rem;
  padding-top: 0;
}
.pill {
  border-radius: 6px !important;
  padding: 0.4rem 0.5rem;
}
.field {
  margin-top: 1rem;
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
  height: 8rem;
}
::v-deep .map {
  position: absolute;
  height: calc(100% - 4.25rem);
  width: calc(100% - 2rem);
  top: 4.25rem;
  z-index: 0;
}
.btnP {
  position: absolute;
  width: 100%;
  z-index: 9;
  bottom: 2rem;
}
</style>
