<template>
  <div>
    <h1 class="regular">{{title}}</h1>
    <div class="field" id="placeName" v-if="place.name!=undefined">
      <h3 class="bold flex space_between">
        <span>Name</span>
      </h3>
      <input
        type="text"
        class="input bg_secondary text_blackD"
        placeholder="Enter Name..."
        v-model="place.name"
      />
    </div>
    <div class="field" id="note">
      <h3 class="bold flex space_between">
        <span>Address</span>
      </h3>
      <gmap-autocomplete @place_changed="setPlace" class="input bg_secondary text_blackD"></gmap-autocomplete>
    </div>
    <div class="map field fill_width">
      <map-view :center="pos"></map-view>
    </div>
    <div class="field">
      <base-button class="fill_width" :mode="{ dark: true, bg_diagonal: true }">
        <span class="t-8">PICK</span>
      </base-button>
    </div>
  </div>
</template>

<script>
export default {
  props: {
    place: {
      type: Object
    },
    title: {
      type: String,
      required: true
    }
  },
  data() {
    return {
      item: { name: "", notes: "" },
      pos: { lat: 30.2672, lng: -97.7431 }
    };
  },
  computed: {
    isLoggedIn() {
      return this.$store.getters.loggedIn;
    }
  },
  methods: {
    setPlace(place) {
      console.log(place);
      this.pos = {
        lat: place.geometry.location.lat(),
        lng: place.geometry.location.lng()
      };
    }
  }
};
</script>
<style lang="scss" scoped>
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
.map {
  height: 12rem;
  position: relative;
}
</style>