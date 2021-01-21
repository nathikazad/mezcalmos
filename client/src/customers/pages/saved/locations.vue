<template>
  <!-- TODO: taskId #81774 make it dynamic -->
  <div>
    <!-- location picker component -->
    <transition name="slide-fade">
      <pick-location
        v-if="openPicker"
        class="popUp"
        title="Add New Location"
        @close="openPicker=false"
      ></pick-location>
    </transition>
    <!--*************** End location picker component ****************-->
    <h1 class="regular">Saved Locations</h1>
    <div class="field">
      <h3 class="bold flex space_between">
        <span>Locations</span>
        <span class="regular">{{Object.keys(locations).length}} Location</span>
      </h3>
      <card class="bg_secondary border card" v-for="(location, index) in locations" :key="index">
        <img src="@/shared/static/img/Map.png" slot="image" class="image" />
        <div slot="text" class="text_details">
          <div slot="cardTitle" class="bold">{{ location.name }}</div>
          <div slot="description">{{ location.address }}</div>
        </div>
        <div slot="actions" class="flex">
          <base-button :mode="{ dark: true, bg_white: true }" class="edit icon elevate_1">
            <span class="t-8 text_grey">
              <fa icon="pencil-alt"></fa>
            </span>
          </base-button>
          <base-button
            :mode="{ dark: true, bg_white: true }"
            class="icon elevate_1"
            :loading="loading"
            @click.native="removeLocation(index)"
          >
            <span class="t-8 text_grey">
              <fa icon="trash"></fa>
            </span>
          </base-button>
        </div>
      </card>
      <base-button
        class="fill_width"
        :mode="{ dark: true, bg_diagonal: true }"
        @click.native="openPicker = true"
      >
        <span class="t-8">
          <fa icon="plus"></fa>&nbsp;Add New Location
        </span>
      </base-button>
    </div>
  </div>
</template>
<script>
import Card from "../../../shared/components/ui/card";
export default {
  components: {
    Card
  },
  computed: {
    locations() {
      return this.$store.getters["savedLocations/locations"] || {};
    }
  },
  data() {
    return {
      openPicker: false,
      loading: false
    };
  },
  methods: {
    async removeLocation(id) {
      this.loading = true;
      await this.$store.dispatch("savedLocations/removeLocation", {
        savedLocationId: id
      });
      this.loading = false;
    }
  },
  async beforeCreate() {
    this.isLoaded = false;
    await this.$store.dispatch("savedLocations/loadLocations");
    this.isLoaded = true;
  }
};
</script>
<style lang="scss" scoped>
.image {
  width: 3.75rem;
  height: 3.75rem;
}
.edit {
  margin-right: 0.5rem;
}
.icon {
  width: 2rem;
  height: 2rem;
}
.card {
  border-radius: 4px;
  margin: 1rem 0;
}
.popUp {
  position: absolute;
  width: 100%;
  height: 100vh;
  background: white;
  top: 0;
  left: 0;
  z-index: 9;
  padding: 1rem;
}
.text_details {
  margin-left: 1rem;
}
</style>
