<template>
  <div>
    <div id="taxiRequest" v-if="orderDetails">
      <!-- ******************pop up component ************************-->
      <h1 class="regular">Taxi</h1>
      <input-location
        :disabled="true"
        :to="orderDetails.to"
        :from="orderDetails.from"
        :directionsBorns="calculateBorns"
      >
        <!-- Searching fo Someone  Status-->
        <div
          class="flex align_center space_between btnP bg_white elevate_2"
          slot="action"
          v-if="orderDetails.status == 'lookingForTaxi'"
        >
          <div class="w-70">
            <h5 class="text_grey regular t-9">Searching Available Taxi...</h5>
          </div>
          <base-button
            class="w-30 elevate_1"
            :mode="{ dark: true, bg_error: true }"
            @click.native="requestTaxi()"
          >
            <span class="t-8 regular">Cancel</span>
          </base-button>
        </div>
        <!-- Found Someone  Status-->
        <div
          class="flex align_center space_between btnP bg_white elevate_2"
          slot="action"
          v-else-if="orderDetails.status == 'onTheWay'"
        >
          <div class="w-70">
            <div class="flex align_center">
              <avatar
                size="2.4rem"
                url="https://scontent.ftun11-1.fna.fbcdn.net/v/t1.0-9/107473085_10220372571378093_8626273449961856030_n.jpg?_nc_cat=111&ccb=2&_nc_sid=09cbfe&_nc_ohc=jN2qfU0I-z0AX-BsJ9G&_nc_ht=scontent.ftun11-1.fna&oh=c1ee5219e203f447022a8037b899cfc4&oe=60050203"
              ></avatar>
              <div class="user_name">
                <h4 class="text_blackL">Yassine</h4>
                <h5 class="regular text_grey">Arrival In 30 Mins</h5>
              </div>
            </div>
          </div>
          <base-button
            class="w-30 elevate_1"
            :mode="{ dark: true, bg_diagonal: true }"
            @click.native="requestTaxi()"
            :link="true"
            :to="{
              path: `/messages/${orderId}`,
              query: { redirect: $route.path },
            }"
          >
            <span class="t-8 regular">Message</span>
          </base-button>
        </div>
      </input-location>
    </div>
    <div v-else>
      <h3>Loading ...</h3>
    </div>
  </div>
</template>

<script>
export default {
  computed: {
    orderDetails() {
      return this.$store.getters["taxis/value"];
    },
    isLoaded() {
      return this.$store.getters["taxis/value"] != null;
    },
    messageLink() {
      return `/messages/${this.$route.params.orderId}`;
    },
    calculateBorns() {
      let borns = {
        start: null,
        end: null,
      };

      if (this.orderDetails) {
        borns.start = {
          lat: this.orderDetails.from.lat,
          lng: this.orderDetails.from.long,
        };

        borns.end = {
          lat: this.orderDetails.to.lat,
          lng: this.orderDetails.to.long,
        };
      }
      return borns;
    },
  },
  mounted() {},
  async beforeCreate() {
    this.$store.dispatch("taxis/loadTaxi", {
      orderId: this.$route.params.orderId,
    });
  },
};
</script>
<style lang="scss" scoped>
::v-deep .map {
  position: absolute;
  height: calc(100% - 6.25rem);
  left: 0;
  width: 100%;
  top: 6.25rem;
  z-index: 0;
}
.btnP {
  position: absolute;
  width: calc(100% - 2rem);
  z-index: 9;
  bottom: 2rem;
  left: 1rem;
  padding: 0.5rem;
  border-radius: 4px;
  &::v-deep .btn {
    height: 2.3rem;
  }
  .user_name {
    margin-left: 0.8rem;
    h5,
    h4 {
      margin: 0;
    }
  }
}
</style>
