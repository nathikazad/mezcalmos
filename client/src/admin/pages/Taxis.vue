<template>
  <v-container class="py-8 px-6" fluid>
    <v-row>
      <v-col cols="12" class="col-lg-3">
        <!-- drivers list -->
        <v-card>
          <div class="d-flex justify-space-between align-center flex-wrap">
            <v-subheader class="title bold">Drivers</v-subheader>
            <v-responsive max-width="200" class="pr-2">
              <v-text-field
                dense
                flat
                hide-details
                rounded
                solo-inverted
                :placeholder="$t('shared.placeHolders.search')+'...'"
                v-model="query"
              ></v-text-field>
            </v-responsive>
          </div>
          <v-list two-line flat>
            <v-list-item-group v-model="selectedUser" color="primary">
              <template v-for="(driver,id) in drivers">
                <v-list-item :key="id">
                  <v-list-item-avatar color="grey darken-1">
                    <img :src="deepFind(driver,'info.photo')" alt />
                  </v-list-item-avatar>

                  <v-list-item-content>
                    <v-list-item-title>{{deepFind(driver,'info.displayName')}}</v-list-item-title>

                    <v-list-item-subtitle class="d-flex align-center justify-space-between">
                      <v-chip
                        class="ma-2 dark"
                        :color="deepFind(driver,'state.authorizationStatus')=='pending'?'warning':'success'"
                      >{{deepFind(driver,'state.authorizationStatus')}}</v-chip>
                      <v-spacer></v-spacer>
                      <div
                        class="d-flex"
                        v-if="deepFind(driver,'state.authorizationStatus')=='pending'"
                      >
                        <v-btn color="success" @click="acceptTaxi(id)">Accept</v-btn>
                        <v-btn color="info ml-2" @click="LoadMessages(id)">Message</v-btn>
                      </div>
                      <div class="d-flex" v-else>
                        <v-btn color="success" @click="sendTestNotification(id)">Test Notifs</v-btn>
                      </div>
                    </v-list-item-subtitle>
                  </v-list-item-content>
                </v-list-item>

                <v-divider
                  v-if="id !== Object.keys(drivers)[Object.keys(drivers).length-1]"
                  :key="`divider-${id}`"
                  inset
                ></v-divider>
              </template>
            </v-list-item-group>
          </v-list>
        </v-card>
      </v-col>
      <!-- Driver details -->
      <v-col cols="12" lg="3">
        <v-card v-if="selectedDriver">
          <div class="d-flex justify-space-between align-center">
            <v-subheader class="title bold">Driver Details</v-subheader>
          </div>
          <v-list two-line flat>
            <template v-for="(field,id) in userFields">
              <v-list-item :key="id">
                <v-list-item-content>
                  <v-list-item-title>
                    {{field.title}} :
                    <span v-if="!field.editable" class="info--text">{{field.val()}}</span>
                    <v-text-field
                      v-else
                      :value="field.val(selectedUser)"
                      counter="25"
                      hint="This field uses counter prop"
                      @change="driverDataChanged($event,field.param,Object.keys(drivers)[selectedUser])"
                    ></v-text-field>
                  </v-list-item-title>
                </v-list-item-content>
              </v-list-item>

              <v-divider
                v-if="id !== Object.keys(drivers)[Object.keys(drivers).length-1]"
                :key="`divider-${id}`"
                inset
              ></v-divider>
            </template>
          </v-list>
        </v-card>
      </v-col>
      <!-- chat component -->
      <v-col cols="12" lg="3" v-if="currentMessages">
        <v-card>
          <chat :chat="currentMessages"></chat>
        </v-card>
      </v-col>
      <!-- Orderssx list -->
      <v-col cols="12" lg="3">
        <v-card v-if="orders">
          <div class="d-flex justify-space-between align-center">
            <v-subheader class="title bold">Orders</v-subheader>
            <v-responsive max-width="200" class="pr-2">
              <v-text-field
                dense
                flat
                hide-details
                rounded
                solo-inverted
                :placeholder="$t('shared.placeHolders.search')+'...'"
                v-model="query"
              ></v-text-field>
            </v-responsive>
          </div>
          <v-list two-line flat>
            <v-list-item-group v-model="selectedOrder" color="primary">
              <template v-for="(order,id) in orders">
                <v-list-item :key="id">
                  <v-list-item-content>
                    <v-list-item-title>Order Id {{id}}</v-list-item-title>
                  </v-list-item-content>
                </v-list-item>

                <v-divider
                  v-if="id !== Object.keys(drivers)[Object.keys(drivers).length-1]"
                  :key="`divider-${id}`"
                  inset
                ></v-divider>
              </template>
            </v-list-item-group>
          </v-list>
        </v-card>
      </v-col>
      <!-- Orderssx Details -->
      <v-col cols="12" lg="3">
        <v-card v-if="orders">
          <div class="d-flex justify-space-between align-center">
            <v-subheader class="title bold">Order Details</v-subheader>
          </div>
          <v-list two-line flat>
            <template v-for="(field,id) in orderFields">
              <v-list-item :key="id">
                <v-list-item-content>
                  <v-list-item-title>
                    {{field.title}} :
                    <span
                      class="info--text"
                    >{{field.val(Object.keys(orders)[selectedOrder])}}</span>
                  </v-list-item-title>
                </v-list-item-content>
              </v-list-item>

              <v-divider
                v-if="id !== Object.keys(drivers)[Object.keys(drivers).length-1]"
                :key="`divider-${id}`"
                inset
              ></v-divider>
            </template>
          </v-list>
        </v-card>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
import chat from "../components/chat";

export default {
  components: { chat },
  computed: {
    currentMessages() {
      return this.$store.getters["messages/currentMessages"];
    },
    drivers() {
      return this.$store.getters["taxis/list"](this.query.toLowerCase());
    },
    selectedDriver() {
      let drivers = this.$store.getters["taxis/list"]("");
      return this.deepFind(Object.values(drivers), `${this.selectedUser}.info`);
    },
    orders() {
      if (this.selectedUser != null) {
        return this.deepFind(
          Object.values(this.drivers),
          `${this.selectedUser}.orders`
        );
      } else {
        return null;
      }
    },
    orderDetails() {
      if (this.orders && this.selectedOrder != null) {
        return Object.values(this.orders)[this.selectedOrder];
      } else {
        return null;
      }
    }
  },
  data() {
    return {
      selectedUser: null,
      selectedOrder: null,
      query: "",
      orderFields: [
        {
          title: "Status",
          val: () => {
            return this.deepFind(this.orderDetails, `status`);
          }
        },
        {
          title: "To",
          val: () => {
            return this.deepFind(this.orderDetails, `to.address`);
          }
        },
        {
          title: "Customer Id",
          val: id => {
            return id;
          }
        },
        {
          title: "Driver Id",
          val: () => {
            return this.deepFind(this.orderDetails, `driver.id`);
          }
        },
        {
          title: "Pick up time",
          val: () => {
            return this.deepFind(this.orderDetails, `rideStartTime`);
          }
        },
        {
          title: "Drop off time",
          val: () => {
            return this.deepFind(this.orderDetails, `rideFinishTime`);
          }
        },
        {
          title: "Duration",
          val: () => {
            return this.deepFind(
              this.orderDetails,
              `routeInformation.duration.text`
            );
          }
        },
        {
          title: "Distance",
          val: () => {
            return this.deepFind(
              this.orderDetails,
              `routeInformation.distance.text`
            );
          }
        }
      ],
      userFields: [
        {
          title: "Display Name",
          param: "displayName",
          val: () => {
            return this.deepFind(this.selectedDriver, `displayName`);
          }
        },
        {
          title: "Phone",
          param: "phoneNumber",
          val: () => {
            return this.deepFind(this.selectedDriver, `phoneNumber`);
          }
        },
        {
          title: "Taxi Number",
          param: "taxiNumber",
          editable: true,
          val: () => {
            return this.deepFind(this.selectedDriver, `taxiNumber`);
          }
        },
        {
          title: "Email",
          param: "email",
          val: () => {
            return this.deepFind(this.selectedDriver, `email`);
          }
        }
      ]
    };
  },
  beforeCreate() {
    this.$store.dispatch("taxis/loadTaxis");
  },
  beforeUnmount() {
    // await this.$store.dispatch("order/unloadOrder");
  },
  watch: {
    selectedUser: {
      deep: true,
      immediate: true,
      handler: function(userIndex) {
        if (userIndex != null) {
          let userId = Object.keys(this.drivers)[userIndex];
          this.$store.dispatch("messages/loadCurrentMessages", {
            userId: userId,
            userType: "taxi"
          });
        } else {
          this.$store.dispatch("customers/loadCustomer", {
            userId: null
          });
        }
      }
    }
  },
  methods: {
    async driverDataChanged(e, param, id) {
      console.log(e, param, id);
      await this.$store.dispatch("taxis/taxiChangeInfoParam", {
        id,
        param,
        value: e
      });
      this.$store.dispatch("taxis/loadTaxis");
    },
    async LoadMessages(id) {
      this.$store.dispatch("messages/loadCurrentMessages", {
        userId: id,
        userType: "taxi"
      });
    },
    async acceptTaxi(id) {
      await this.$store.dispatch("taxis/approveAuthorizationRequest", {
        userId: id
      });
      this.$store.dispatch("taxis/loadTaxis");
    },
    async sendTestNotification(id) {
      await this.$store.dispatch("taxis/sendTestNotification", {
        userId: id
      });
    }
  }
};
</script>
<style lang="scss" scoped>
.v-item--active {
  background: map-get($map: $colors, $key: secondary);
}
</style>