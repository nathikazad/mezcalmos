<template>
  <v-container class="py-8 px-6" fluid>
    <v-row>
      <v-col cols="4">
        <!-- customers list -->
        <v-card>
          <div class="d-flex justify-space-between align-center">
            <v-subheader class="title bold">Status</v-subheader>
          </div>
          <v-list two-line flat>
            <v-list-item-group v-model="selectedStatus" color="primary">
              <template>
                <v-divider></v-divider>
                <v-list-item key="searching">
                  <v-list-item-content>
                    <v-list-item-title>Searching</v-list-item-title>
                  </v-list-item-content>
                </v-list-item>

                <v-divider></v-divider>
                <v-list-item key="inProgress">
                  <v-list-item-content>
                    <v-list-item-title>In Progress</v-list-item-title>
                  </v-list-item-content>
                </v-list-item>
              </template>
            </v-list-item-group>
          </v-list>
        </v-card>
      </v-col>
      <v-col cols="4" v-if="orders">
        <!-- customers list -->
        <v-card>
          <div class="d-flex justify-space-between align-center">
            <v-subheader class="title bold">Orders</v-subheader>
          </div>
          <v-list two-line flat>
            <v-list-item-group v-model="selectedOrder" color="primary">
              <template v-for="(order,id) in orders">
                <v-list-item :key="id">
                  <v-list-item-content>
                    <v-list-item-title>
                      Order Id :
                      <span class="info--text">{{id}}</span>
                    </v-list-item-title>
                  </v-list-item-content>
                </v-list-item>

                <v-divider
                  v-if="id !== Object.keys(orders)[Object.keys(orders).length-1]"
                  :key="`divider-${id}`"
                ></v-divider>
              </template>
            </v-list-item-group>
          </v-list>
        </v-card>
      </v-col>
      <!-- Orderssx Details -->
      <v-col cols="4" v-if="currentOrder.id">
        <v-card>
          <div class="d-flex justify-space-between align-center">
            <v-subheader class="title bold">Order Details</v-subheader>
          </div>
          <v-list two-line flat>
            <template v-for="(field,id) in orderFields">
              <v-list-item :key="id">
                <v-list-item-content>
                  <v-list-item-title>
                    {{field.title}} :
                    <span class="info--text">{{field.val(currentOrder.id)}}</span>
                  </v-list-item-title>
                </v-list-item-content>
              </v-list-item>
            </template>
          </v-list>
        </v-card>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
export default {
  data() {
    return {
      selectedStatus: null,
      selectedOrder: null,
      orderFields: [
        {
          title: "From",
          val: () => {
            return this.deepFind(this.currentOrder.info, `fromfh.address`);
          }
        },
        {
          title: "To",
          val: () => {
            return this.deepFind(this.currentOrder.info, `to.address`);
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
            return this.deepFind(this.currentOrder.info, `driver.id`);
          }
        },
        {
          title: "Pick up time",
          val: () => {
            return this.deepFind(this.currentOrder.info, `rideStartTime`);
          }
        },
        {
          title: "Drop off time",
          val: () => {
            return this.deepFind(this.currentOrder.info, `rideFinishTime`);
          }
        },
        {
          title: "Duration",
          val: () => {
            return this.deepFind(this.currentOrder.info, `duration.text`);
          }
        },
        {
          title: "Distance",
          val: () => {
            return this.deepFind(this.currentOrder.info, `distance.text`);
          }
        }
      ]
    };
  },
  computed: {
    orders() {
      if (this.selectedStatus == 0) {
        return this.$store.getters["orders/openTaxiOrders"];
      } else if (this.selectedStatus == 1) {
        return this.$store.getters["orders/inProcessTaxiOrders"];
      } else {
        return null;
      }
    },
    currentOrder() {
      return this.$store.getters["orders/currentOrder"];
    },
    orderDetails() {
      if (this.orders && this.selectedOrder != null) {
        return Object.values(this.orders)[this.selectedOrder];
      } else {
        return null;
      }
    }
  },
  watch: {
    selectedOrder: {
      deep: true,
      immediate: true,
      handler: function(orderIndex) {
        if (orderIndex != null && this.orders) {
          let orderId = Object.keys(this.orders)[orderIndex];
          this.$store.dispatch("orders/loadTaxiOrder", orderId);
        } else {
          this.$store.dispatch("orders/loadTaxiOrder", null);
        }
      }
    }
  },
  beforeCreate() {
    this.$store.dispatch("orders/loadTaxiOrders");
  },
  beforeUnmount() {},
  methods: {}
};
</script>