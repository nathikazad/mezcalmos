<template>
  <div>
    <h1 class="regular flex space_between align_center">{{$t('shared.navDrawer.contactAdmin')}}</h1>

    <div class="messages_body fit_container">
      <div class="user_info bg_light_grey border flex align_center space_between">
        <div class="flex align_center start" v-if="sender">
          <avatar size="2.4rem" :url="sender.photo"></avatar>
          <div class="user_name">
            <h3>{{sender.displayName}}</h3>
          </div>
        </div>
      </div>
      <div class="messages" id="messages">
        <div v-for="(msg, index) in messages" :key="index">
          <div class="message flex align_baseline start other" v-if="!me(msg.userId)&&sender">
            <avatar size="2.4rem" :url="sender.photo"></avatar>
            <div class="bg_secondary msg_txt text_blackD">
              <h5>{{ msg.message }}</h5>
            </div>
          </div>

          <div class="message flex align_baseline end me" v-else>
            <div class="bg_horizontal msg_txt text_white">
              <h5>{{ msg.message }}</h5>
            </div>
            <avatar size="2.4rem" :url="recipient.photo"></avatar>
          </div>
        </div>
      </div>
    </div>
    <div class="message_footer fit_container">
      <div class="message_input bg_secondary text_blackD flex align_center space_between">
        <input type="text" v-model="newMessage" @keyup.enter="sendMessage" />
        <base-button
          :mode="{ dark: true, bg_diagonal: true }"
          class="message_btn"
          @click.native="sendMessage"
        >
          <fa icon="paper-plane"></fa>
        </base-button>
      </div>
    </div>
    <!-- <input type="text" v-model="newMessage" />
    <button v-if="newMessage != ''" @click="sendMessage">Send Message</button>-->
  </div>
</template>

<script>
export default {
  async beforeCreate() {
    await this.$store.dispatch("admin/loadAdmin");
  },
  data() {
    return {
      newMessage: ""
    };
  },
  computed: {
    chat() {
      return this.$store.getters["admin/chat"];
    },

    userId() {
      return this.$store.getters["userId"];
    },
    sender() {
      let chat = this.$store.getters["admin/chat"];
     chat=chat?Object.values(chat)[0]:null

      if (this.deepFind(chat, "admins")) {
        let senderKey = Object.keys(this.deepFind(chat, "admins"));
        return this.deepFind(chat, "admins")[senderKey];
      }
      return {
        displayName: "MezCalmos",
        photo: require("@/shared/static/img/logo.png")
      };
    },
    recipient() {
      let recipient = this.chat ? Object.values(this.chat)[0].userInfo : null;

      return recipient;
    },

    messages() {
      let msgs = null;
      if (this.chat) {
        msgs = Object.values(this.chat)[0].messages;
      }
      return msgs;
    }
  },
  mounted() {
    setTimeout(() => {
      this.scrollToBottom();
    }, 200);
  },

  methods: {
    me(id) {
      return id == this.userId;
    },
    scrollToBottom() {
      let messagesDiv = this.$el.querySelector("#messages");

      messagesDiv.scrollTop = messagesDiv.scrollHeight;
    },
    async sendMessage() {
      let response = await this.$store.dispatch("admin/createTicket");
      console.log(response);
      if (response.data.status == "Success" || this.chat) {
        await this.$store
          .dispatch("admin/messageAdmin", {
            message: this.newMessage
          })
          .then(() => {
            this.newMessage = "";
            this.scrollToBottom();
          });
      } else {
        alert("Something went wrong please try again");
      }
    }
  }
};
</script>
<style lang="scss" scoped>
::-webkit-scrollbar-track {
  -webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.18);
  border-radius: 10px;
  background-color: #f5f5f5;
}

::-webkit-scrollbar {
  width: 8px;
  background-color: #f5f5f5;
}

::-webkit-scrollbar-thumb {
  border-radius: 10px;
  -webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.18);
  background-color: rgb(143, 143, 143);
}
.messages_body {
  height: calc(100% - 10rem);

  position: absolute;
  z-index: 1;
  padding: 1rem 0;
  .messages {
    height: calc(100% - 4.75rem);
    width: 100%;
    overflow-y: auto;
    padding: 1rem 0.5rem;
    .message {
      margin: 1.5rem 0;
    }
    .msg_txt {
      max-width: 50%;
      word-break: break-word;
      border: $border;
    }
    .other {
      .msg_txt {
        padding: 0 1rem;
        margin-left: 1rem;
        border-radius: 0rem 2rem 2rem 2rem;
      }
    }
    .me {
      .msg_txt {
        padding: 0 1rem;
        margin-right: 1rem;
        border-radius: 2rem 0rem 2rem 2rem;
      }
    }
  }
  .user_info {
    height: 4.75rem;
    padding: 0.5rem 1rem;
    margin: 0 -1rem;
    .user_name {
      margin-left: 0.5rem;
      > * {
        margin: 2.5px 0;
      }
    }
  }
}

.icon_link {
  margin-right: 3px;
}
.message_footer {
  height: 4.375rem;
  position: absolute;
  bottom: 0;
  z-index: 2;
  margin: 1rem 0;
  width: 100%;
  .message_input {
    width: 100%;
    height: 100%;
    border-radius: 2rem;
    padding: 0 1rem;
    input {
      height: 90%;
      width: calc(100% - 3rem);
      background: transparent;
      border: none;
      outline: none;
    }
    .message_btn {
      width: 2.8rem;
      height: 2.8rem;
      border-radius: 50%;
      font-size: 1.2rem;
      padding: 0;
    }
  }
}
</style>
