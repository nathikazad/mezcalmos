<template>
  <div id="taxiRequest">
    <!-- pop up component -->
    <pop-up v-if="pickLocation"></pop-up>
    <!-- ******************Price estimate alert ************************-->
    <pop-up
      class="estimate_price_popUp"
      v-if="priceReport&&estimatedPrice"
      :choiceList="['Ok']"
      @picked="answerPopUp($event)"
      @close="priceReport=false"
      :title="$t('customer.taxiView.priceEstimate')+estimatedPrice"
      :imgSrc="require('@/shared/static/img/money.svg')"
      :light="false"
    ></pop-up>
    <!-- ******************pop up component ************************-->
    <input-location
      :search.sync="search"
      :saved.sync="saved"
      :directionsBorns.sync="directionsBorns"
      :to.sync="to"
      :from.sync="from"
      @setPos="setDistanceDuration($event)"
      :fromUrl="deepFind(userInfo, 'photo')"
    >
      <!-- Alert statment -->
      <div
        class="flex align_center space_between alert_statment bg_white elevate_2"
        slot="alert"
        v-if="alertStatment"
      >
        <div class="fill_width">
          <h5 class="text_blackL regular t-9">
            <fa icon="ban" class="text_light_error"></fa>
            {{$t(`customer.taxiView.${alertStatment}`)}}
          </h5>
        </div>
      </div>
      <div
        v-if="showRideDetails"
        slot="details"
        class="request_details bg_white elevate_2 flex align_center space_between"
      >
        <div class="price bold t-12 w-35">${{Number.parseFloat(this.estimatedPrice).toFixed(2)}}</div>
        <div class="route_and_payment flex align_center end w-70">
          <div class="route_info t-8 w-40">
            <div class="info_field">
              <fa icon="route"></fa>
              <span>{{distance.text}}</span>
            </div>
            <div class="info_field">
              <fa icon="clock"></fa>
              <span>{{duration.text}}</span>
            </div>
          </div>
          <div class="payments_part flex align_center space_between w-60 fill_height bg_secondary">
            <div class="cash flex align_center center w-50 fill_height pointer">
              <img src="@/shared/static/img/money.svg" />
            </div>
            <div class="credit_card flex align_center center w-50 fill_height pointer">
              <img src="@/shared/static/img/creditCard.svg" />
            </div>
          </div>
        </div>
      </div>
      <div class="flex align_center center btnP" slot="action">
        <base-button
          class="w-80"
          :class="{bg_SMS:!isLoggedIn}"
          :mode="{ dark: true, bg_diagonal: isLoggedIn, disabled:disabled }"
          @click.native="requestTaxi()"
          :loading="loading"
          :disabled="disabled"
        >
          <span
            class="t-8 regular"
          >{{isLoggedIn?$t('customer.taxiView.confirm'):$t('customer.taxiView.logIn')}}</span>
        </base-button>
      </div>
    </input-location>
  </div>
</template>

<script>
//import PickLocation from "../../../components/map/GetLocation";
import popUp from "@/shared/components/ui/popUp";
export default {
  components: { popUp },
  data() {
    return {
      priceReport: false,
      showRideDetails: false,
      loading: false,
      distance: null,
      duration: null,
      focusedFrom: false,
      focusedTo: false,
      pickLocation: false,
      center: this.userDefaultLocation,
      alertStatment: "",
      from: {
        lat: this.deepFind(this.userDefaultLocation, "lat"),
        lng: this.deepFind(this.userDefaultLocation, "lng"),
        address: "",
        by: "search"
      },
      to: {
        lat: this.deepFind(this.userDefaultLocation, "lat"),
        lng: this.deepFind(this.userDefaultLocation, "lng"),
        address: "",
        by: "search"
      },
      search: {
        to: "",
        from: "",
        results: [],
        searching: false,
        origin: "to"
      },
      directionsBorns: {
        start: null,
        end: null
      },
      saved: {
        origin: "from",
        opened: false
      },
      estimatedPrice: 0
    };
  },
  computed: {
    disabled() {
      return !(this.directionsBorns.start && this.directionsBorns.end);
    },
    isLoggedIn() {
      return this.$store.getters.loggedIn;
    },
    userInfo() {
      return this.$store.getters["userInfo"];
    },
    userDefaultLocation() {
      return this.$store.getters["getUserDefaultLocation"];
    },
    temporaryAddresses() {
      return this.$store.getters["taxis/temporaryAddresses"];
    }
  },
  watch: {
    temporaryAddresses: {
      deep: true,
      immediate: true,
      handler: function(newVal) {
        if (newVal) {
          this.from = newVal.from;
          this.to = newVal.to;
          this.distance = newVal.distance;
          this.duration = newVal.duration;
          this.directionsBorns = {
            start: { lat: newVal.from.lat, lng: newVal.from.lng },
            end: { lat: newVal.to.lat, lng: newVal.to.lng }
          };
        }
      }
    }
  },
  methods: {
    answerPopUp() {
      this.priceReport = false;
    },
    async setDistanceDuration(pos) {
      this.distance = pos.distance;
      this.duration = pos.duration;
      let estimatePrice = this.$store.getters["taxis/estimatePrice"];
      this.estimatedPrice = await estimatePrice(pos.distance.value / 1000);
      this.showRideDetails = true;
      this.priceReport = true;
    },
    async requestTaxi() {
      if (!this.disabled) {
        let data = {
          to: this.to,
          from: this.from,
          distance: this.distance,
          duration: this.duration,
          estimatedPrice: this.estimatedPrice
        };
        console.log(data);

        if (this.isLoggedIn) {
          this.loading = true;
          let response = await this.$store.dispatch("taxis/requestTaxi", data);

          this.loading = false;
          console.log(response);

          if (response.status == "Success") {
            this.$router.push({ path: `${response.orderId}` });
          } else {
            this.alertStatment = response.data.i18nCode;
            setTimeout(() => {
              this.alertStatment = "";
            }, 4000);
          }
        } else {
          await this.$store.dispatch("taxis/saveAddress", data);
          await this.$router.push("/auth");
        }
      }
    }
  }
};
</script>
<style lang="scss" scoped>
::v-deep .popUp_body {
  padding: 2rem !important;
}
::v-deep .map {
  position: absolute;
  height: 100%;
  width: 100%;
  left: 0;
  top: 0rem;
  z-index: 0;
}
.estimate_price_popUp {
  ::v-deep button {
    background: map-get($map: $colors, $key: info) !important;
    color: map-get($map: $colors, $key: white) !important;
  }
}
.btnP {
  position: absolute;
  width: 100%;
  z-index: 9;
  bottom: 2rem;
}
.request_details {
  position: absolute;
  width: 80%;
  z-index: 10;
  bottom: 6rem;
  height: 3rem;
  margin: 0 10%;
  padding: 0.5rem 1rem;
  border-radius: 5px;
  .price {
    border-right: $border;
  }
  .route_info {
    margin: 0 0.5rem;
    .info_field {
      width: 100%;
      text-align: right;
      span {
        margin-left: 0.2rem;
      }
    }
  }
  .payments_part {
    border-radius: 5px;
    height: 2.3rem;
    .cash,
    .credit_card {
      border-radius: 5px;
    }
    .cash {
      background: #8962d2;
    }
    .credit_card {
      opacity: 0.3;
    }
  }
}
.alert_statment {
  position: absolute;
  width: 80%;
  padding: 1rem;
  right: 10%;
  bottom: 9rem;
  text-align: center;
}
</style>
