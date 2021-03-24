<template>
  <v-container class="py-8 px-6" fluid>
    <v-row>
      <v-col cols="4">
        <!-- drivers list -->
        <v-card>
          <div class="d-flex justify-space-between align-center">
            <v-subheader class="title bold">Drivers</v-subheader>
            <v-responsive max-width="200" class="pr-2">
              <v-text-field
                dense
                flat
                hide-details
                rounded
                solo-inverted
                placeholder="Search..."
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
                        <v-btn color="info ml-2">Message</v-btn>
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
      <v-col cols="4">
        <!-- Orderssx list -->
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
                placeholder="Search..."
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
      <v-col cols="4">
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
export default {
  computed: {
    drivers() {
      return this.$store.getters["taxis/list"](this.query);
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
      ]
    };
  },
  beforeCreate() {
    this.$store.dispatch("taxis/loadTaxis");
  },
  beforeUnmount() {
    // await this.$store.dispatch("order/unloadOrder");
  },
  methods: {
    async acceptTaxi(id) {
      let response = await this.$store.dispatch(
        "taxis/approveAuthorizationRequest",
        { userId: id }
      );
      console.log(response);
    }
  }
};
</script>
<style lang="scss" scoped>
.v-item--active {
  background: map-get($map: $colors, $key: secondary);
}
</style>