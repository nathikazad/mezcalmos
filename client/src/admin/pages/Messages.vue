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
              <template v-for="(user,id) in users">
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
      selectedUser: null
    };
  },
  computed: {
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
  beforeCreate() {
    this.$store.dispatch("messages/loadMessages");
  },
  beforeUnmount() {},
  methods: {}
};
</script>