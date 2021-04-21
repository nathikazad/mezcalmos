<template>
  <div id="taxiRequest">
    <!-- pop up component -->
    <pop-up v-if="pickLocation"></pop-up>
    <!-- ******************pop up component ************************-->
    <h1 class="regular">{{$t('customer.taxiView.taxi')}}</h1>
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
      <div class="flex align_center center btnP" slot="action">
        <base-button
          class="w-80"
          :class="{bg_fb:!isLoggedIn}"
          :mode="{ dark: true, bg_diagonal: isLoggedIn, disabled:disabled }"
          @click.native="requestTaxi()"
          :loading="loading"
          :disabled="disabled"
        >
          <span
            class="t-8 regular"
          >{{isLoggedIn?$t('customer.taxiView.confirm'):$t('customer.taxiView.fbLogin')}}</span>
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
      }
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
    setDistanceDuration(pos) {
      this.distance = pos.distance;
      this.duration = pos.duration;
    },
    async requestTaxi() {
      if (!this.disabled) {
        let data = {
          to: this.to,
          from: this.from,
          distance: this.distance,
          duration: this.duration
        };
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
          await this.$store.dispatch("login");
        }
      }
    }
  }
};
</script>
<style lang="scss" scoped>
::v-deep .map {
  position: absolute;
  height: calc(100% - 6.25rem);
  width: 100%;
  left: 0;
  top: 6.25rem;
  z-index: 0;
}
.btnP {
  position: absolute;
  width: 100%;
  z-index: 9;
  bottom: 2rem;
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
