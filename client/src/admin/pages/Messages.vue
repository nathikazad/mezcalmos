<template>
  <v-container class="py-8 px-6" fluid>
    <v-row>
      <v-col cols="3">
        <!-- customers list -->
        <v-card>
          <div class="d-flex justify-space-between align-center">
            <v-subheader class="title bold">Users</v-subheader>
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
              <template v-for="(user,id) in users" v-if="user.type=='general'">
                <v-list-item :key="id">
                  <v-list-item-avatar color="grey darken-1">
                    <img :src="deepFind(user,'userInfo.photo')" alt />
                  </v-list-item-avatar>

                  <v-list-item-content>
                    <v-list-item-title>{{deepFind(user,'userInfo.displayName')}}</v-list-item-title>

                    <v-list-item-subtitle>
                      Is
                      <span class="info--text">{{deepFind(user,'userType')}}</span>
                    </v-list-item-subtitle>
                  </v-list-item-content>
                </v-list-item>

                <v-divider
                  v-if="id !== Object.keys(user)[Object.keys(user).length-1]"
                  :key="`divider-${id}`"
                  inset
                ></v-divider>
              </template>
            </v-list-item-group>
          </v-list>
          <v-divider></v-divider>
        </v-card>
      </v-col>
      <v-col cols="3">
        <v-card>
          <chat :chat="selectedChat" v-if="selectedChat"></chat>
        </v-card>
      </v-col>
      <!-- Orderssx list -->
      <v-col cols="3">
        <v-card v-if="deepFind(currentCustomer,'orders')">
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
              <template v-for="(order,id) in currentCustomer.orders">
                <v-list-item :key="id">
                  <v-list-item-content>
                    <v-list-item-title>Order Id {{id}}</v-list-item-title>
                  </v-list-item-content>
                </v-list-item>

                <v-divider
                  v-if="id !== Object.keys(customers)[Object.keys(customers).length-1]"
                  :key="`divider-${id}`"
                  inset
                ></v-divider>
              </template>
            </v-list-item-group>
          </v-list>
        </v-card>
      </v-col>
      <!-- Orderssx Details -->
      <v-col cols="3">
        <v-card v-if="orderDetails">
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
                    >{{field.val(Object.keys(currentCustomer.orders)[selectedOrder])}}</span>
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
import chat from "../components/chat";
export default {
  components: { chat },
  data() {
    return {
      query: "",
      selectedUser: null,
      selectedOrder: null,
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
  computed: {
    orderDetails() {
      if (this.currentCustomer && this.selectedOrder != null) {
        return Object.values(this.currentCustomer.orders)[this.selectedOrder];
      } else {
        return null;
      }
    },
    currentCustomer() {
      return this.$store.getters["customers/currentCustomer"];
    },
    customers() {
      return this.$store.getters["messages/listCustomerMessages"];
    },
    taxis() {
      return this.$store.getters["messages/listTaxiMessages"];
    },
    users() {
      let users = {};
      if (this.customers) {
        users = { ...users, ...this.customers };
      }
      if (this.taxis) {
        users = { ...users, ...this.taxis };
      }
      return users;
    },
    selectedChat() {
      if (this.users && this.selectedUser != null) {
        return Object.values(this.users)[this.selectedUser];
      } else {
        return null;
      }
    }
  },
  watch: {
    selectedChat: {
      deep: true,
      immediate: true,
      handler: function(chat) {
        console.log(chat);

        if (chat != null) {
          this.$store.dispatch("customers/loadCustomer", {
            userId: chat.userId
          });
        } else {
          this.$store.dispatch("customers/loadCustomer", {
            userId: null
          });
        }
      }
    }
  },
  beforeCreate() {
    this.$store.dispatch("messages/loadMessages");
  },
  beforeUnmount() {},
  methods: {}
};
</script>