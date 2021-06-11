<template>
  <div>
    <v-col cols="auto" class="flex-grow-1 flex-shrink-0">
      <v-responsive class="overflow-y-hidden fill-height" height="500">
        <v-card class="d-flex flex-column fill-height">
          <v-card-title>
            <v-avatar size="40" color="black" class="mx-2">
              <img :src="chat.userInfo.photo" alt="alt" />
            </v-avatar>
            {{chat.userInfo.displayName}}
            <v-spacer></v-spacer>
            <!-- <v-btn color="success" @click="resolveChat">resolve</v-btn> -->
          </v-card-title>
          <v-divider></v-divider>
          <v-card-text class="flex-grow-1 overflow-y-auto" id="messages">
            <template v-for="(msg, i) in chat.messages">
              <div :class="{ 'd-flex flex-row-reverse': msg.adminId==userId }" :key="i">
                <v-menu offset-y>
                  <template v-slot:activator="{ on }" class="d-flex align-center">
                    <v-avatar size="40" color="black" class="mx-2">
                      <img :src="searchPhoto(msg)" alt="alt" />
                    </v-avatar>
                    <v-hover v-slot:default="{ hover }">
                      <v-chip
                        :color="msg.adminId==userId ? 'primary' : ''"
                        dark
                        style="height:auto;white-space: normal;"
                        class="pa-4 mb-2"
                        v-on="on"
                      >
                        {{ msg.message }}
                        <sub
                          class="ml-2"
                          style="font-size: 0.5rem;"
                        >{{ msg.timestamp | moment("LT")}}</sub>
                        <v-icon v-if="hover" small>mdi-chevron-down</v-icon>
                      </v-chip>
                    </v-hover>
                  </template>
                  <v-list>
                    <v-list-item>
                      <v-list-item-title>delete</v-list-item-title>
                    </v-list-item>
                  </v-list>
                </v-menu>
              </div>
            </template>
          </v-card-text>
          <v-card-text class="flex-shrink-1">
            <v-text-field
              v-model="messageForm.message"
              label="type_a_message"
              type="text"
              no-details
              outlined
              append-outer-icon="mdi-send"
              @keyup.enter="sendMsg()"
              @click:append-outer="sendMsg()"
              hide-details
            />
          </v-card-text>
        </v-card>
      </v-responsive>
    </v-col>
  </div>
</template>
<script>
export default {
  props: {
    chat: Object
  },
  data() {
    return {
      messages: [],
      messageForm: {
        message: "",
        userId: this.userId,
        timestamp: ""
      }
    };
  },
  computed: {
    userId() {
      return this.$store.getters.userId;
    }
  },
  mounted() {
    setTimeout(() => {
      this.scrollToBottom();
    }, 200);
  },
  methods: {
    scrollToBottom() {
      let messagesDiv = this.$el.querySelector("#messages");

      messagesDiv.scrollTop = messagesDiv.scrollHeight;
    },
    async sendMsg() {
      let message = {
        userId: this.chat.userId,
        userType: this.chat.userType,
        ticketId: this.chat.ticketId,
        message: this.messageForm.message
      };
      await this.$store.dispatch("messages/messageUser", message);

      this.scrollToBottom();
      this.messageForm.message = "";
    },
    searchPhoto(msg) {
      console.log(msg);
      if (msg.adminId) {
        return this.chat.admins[msg.adminId].photo;
      } else {
        return this.chat.userInfo.photo;
      }
    },
    async resolveChat() {
      let resolve = {
        userId: this.chat.userId,
        userType: this.chat.userType
      };
      await this.$store.dispatch("messages/resolveChat", resolve);
    }
  }
};
</script>
<style lang="scss" scoped>
</style>