<template>
  <div class="slide">
    <h1>Add Items</h1>
    <div class="field" id="delveredTo">
      <h3 class="bold flex space_between">
        <span>Name</span>
      </h3>
      <ValidationObserver ref="observer" tag="form">
        <ValidationProvider rules="required" v-slot="{ errors, classes }">
          <span :class="classes">
            <input
              type="text"
              class="input bg_secondary text_blackD"
              placeholder="Enter Name..."
              v-model="item.name"
            />
            <span>{{ errors[0] }}</span>
          </span>
        </ValidationProvider>
      </ValidationObserver>
    </div>
    <div class="field" id="note">
      <h3 class="bold flex space_between">
        <span>Notes</span>
      </h3>
      <textarea
        type="text"
        class="input bg_secondary text_blackD rows"
        placeholder="Write Here..."
        v-model="item.notes"
      ></textarea>
    </div>
    <div class="field">
      <base-button
        class="fill_width"
        :mode="{ dark: true, bg_diagonal: true }"
        @click.native="emitAddEvent"
      >
        <span class="t-8">
          <fa icon="plus"></fa>&nbsp; ADD ITEM
        </span>
      </base-button>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      item: { name: "", notes: "" }
    };
  },
  computed: {
    isLoggedIn() {
      return this.$store.getters.loggedIn;
    }
  },
  methods: {
    addItem(item) {
      this.items.push(item);
      this.name = "";
      this.notes = "";
    },
    async emitAddEvent() {
      const valid = await this.$refs.observer.validate();

      if (valid) {
        this.$emit("addItem", this.item);
        this.$router.push("/services/grocery/request");
      }
    }
  }
};
</script>
<style lang="scss">
.pill {
  border-radius: 6px !important;
  padding: 0.4rem 0.5rem;
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
</style>
