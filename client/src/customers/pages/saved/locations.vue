<template>
  <!-- TODO: taskId #81774 make it dynamic -->
  <div>
    <!-- location picker component -->
    <transition name="slide-fade">
      <pick-location
        v-if="openPicker"
        class="popUp"
        :title="!editId?'Add New Location':'Edit Location'"
        @close="openPicker = false"
        :editId="editId"
        ref="pickLocation"
      ></pick-location>
    </transition>
    <!--*************** End location picker component ****************-->
    <h1 class="regular">{{$t('customer.savedLocations.title')}}</h1>
    <div class="field">
      <h3 class="bold flex space_between">
        <span>{{$tc('customer.savedLocations.location',2)}}</span>
        <span
          class="regular"
        >{{ Object.keys(locations).length }} {{$tc('customer.savedLocations.location',Object.keys(locations).length==1?1:2)}}</span>
      </h3>
      <card class="bg_secondary border card" v-for="(location, index) in locations" :key="index">
        <img src="@/shared/static/img/Map.png" slot="image" class="image" />
        <div slot="text" class="text_details">
          <div slot="cardTitle" class="bold">{{ location.name }}</div>
          <div slot="description">{{ location.address }}</div>
        </div>
        <div slot="actions" class="flex">
          <base-button
            :mode="{ dark: true, bg_white: true }"
            class="edit icon elevate_1"
            :link="true"
            :to="{
              path: '/saved/locations',
              query: { editPlace: index, redirect: '/saved/locations' },
            }"
          >
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
        :link="true"
        :to="{
          path: '/saved/locations',
          query: { newPlace: true, redirect: '/saved/locations' },
        }"
      >
        <span class="t-8">
          <fa icon="plus"></fa>
          &nbsp;{{ actionText }}
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
  watch: {
    $route: {
      deep: true,
      immediate: true,
      handler: function(newVal) {
        if (newVal.query.newPlace) {
          this.openPicker = true;
        } else if (newVal.query.editPlace) {
          this.openPicker = true;

          this.editId = newVal.query.editPlace;
          setTimeout(() => {
            let pickLocation = this.$refs.pickLocation;
            let place = this.locations[this.editId];
            pickLocation.name = place.name;
            pickLocation.saved.address = place.address;
            pickLocation.saved.pos = { lat: place.lat, lng: place.long };
            setTimeout(() => {
              pickLocation.saved.searching = false;
            }, 200);
          }, 200);
        } else {
          this.openPicker = false;
        }
      }
    }
  },
  computed: {
    locations() {
      return this.$store.getters["savedLocations/locations"] || {};
    }
  },

  data() {
    return {
      openPicker: false,
      loading: false,
      actionText: "Add New Location",
      editId: ""
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
  height: calc(100vh - 5rem);
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
