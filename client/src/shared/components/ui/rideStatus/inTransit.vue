<template>
  <div>
    <!-- customer side -->
    <route-pill
      v-if="type=='customer'"
      slot="details"
      class="routePill w-100 mb-2"
      :classes1="{'w-55':true,}"
      :classes2="{'w-15':true,}"
      :classes3="{'w-30':true,}"
    >
      <userPart
        class="flex align_center"
        slot="part1"
        :avatar="orderDetails.driver.image"
        :name="orderDetails.driver.name"
        :extra="$t('customer.taxiView.rideStarted')"
        :taxiNumber="deepFind(orderDetails, 'driver.taxiNumber')"
      ></userPart>

      <price
        class="flex align_center"
        slot="part2"
        :price="deepFind(orderDetails, 'estimatedPrice')"
      ></price>
      <div class="flex align_center center w-90" slot="part3">
        <base-button
          class="dark bg_light elevate_1 nav-btn text_primary mr-2"
          :mode="{
            bg_diagonal: true,
            small: true,
          }"
          :link="true"
          :to="{
              path: messageLink,
              
            }"
        >
          <fa icon="envelope" />
          <span class="badge bg_error" v-if="orderMessages"></span>
        </base-button>
        <base-button
          class="elevate_1 nav-btn text_error"
          :mode="{
            bg_light_error: true,
            small: true,
          }"
          @click.native="$emit('cancelPopUp')"
          :loading="loading"
        >
          <fa icon="times-circle" />
        </base-button>
      </div>
    </route-pill>
    <!-- Taxi side -->
    <route-pill
      v-if="type=='taxi'"
      slot="details"
      class="routePill w-100 mb-2"
      :classes1="{'w-35':true,}"
      :classes2="{'w-20':true,}"
      :classes3="{'w-45':true,}"
    >
      <base-button
        slot="part1"
        class="w-95 my-1 elevate_1 base_btn"
        :mode="{ dark: true, bg_error: true }"
        @click.native="$emit('finishRide')"
        :loading="loading"
      >
        <span class="t-8 regular">{{$t('taxi.taxiView.finishRide')}}</span>
      </base-button>
      <price
        class="flex align_center"
        slot="part2"
        :price="deepFind(orderDetails, 'estimatedPrice')"
      ></price>

      <div class="flex align_center center w-90" slot="part3">
        <!-- Button for navigate -->
        <base-button
          class="elevate_1 nav-btn text_brand mr-2"
          :mode="{
            bg_light_blue: true,
            small: true,
          }"
          @click.native="navigateTo()"
          :loading="loading"
        >
          <fa icon="location-arrow" />
        </base-button>
        <base-button
          class="dark bg_light elevate_1 nav-btn text_primary mr-2"
          :mode="{
            bg_diagonal: true,
            small: true,
          }"
          :link="true"
          :to="{
              path: messageLink,
              
            }"
        >
          <fa icon="envelope" />
          <span class="badge bg_error" v-if="orderMessages"></span>
        </base-button>
        <base-button
          class="elevate_1 nav-btn text_error"
          :mode="{
            bg_light_error: true,
            small: true,
          }"
          @click.native="$emit('cancelPopUp')"
          :loading="loading"
        >
          <fa icon="times-circle" />
        </base-button>
      </div>
    </route-pill>
  </div>
</template>
<script>
export default {
  props: {
    orderDetails: Object,
    type: String,
    loading: Boolean,
    messageLink: String,
    orderMessages: [Boolean, Number, Object]
  },
  computed: {
    arrivalTime() {
      return this.deepFind(
        this.orderDetails,
        "driver.location.estimatedArrivalTime"
      )
        ? this.$t("customer.taxiView.arrival") +
            this.$moment(
              this.deepFind(
                this.orderDetails,
                "driver.location.estimatedArrivalTime"
              )
            ).fromNow()
        : this.$t("customer.taxiView.arrival") + "TBD";
    }
  },
  methods: {
    navigateTo() {
      let url = `https://www.google.com/maps/place/${this.orderDetails.from.lat},${this.orderDetails.from.lng}`;
      window.open(url);
    }
  }
};
</script>
<style lang="scss" scoped>
.base_btn {
  height: 2rem;
}
.badge {
  position: absolute;
  width: 10px;
  height: 10px;
  border: 2px solid #f6efff;
  line-height: 1rem;
  border-radius: 50%;
  color: map-get($map: $colors, $key: white);
  font-size: 0.8rem;
  text-align: center;
  top: -0.4rem;
  right: -0.4rem;
}
</style>