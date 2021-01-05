<template>
  <div>
    <h1 class="regular">Messages</h1>

    <div class="messages_body fit_container">
      <div class="user_info flex align_center start bg_secondary border">
        <avatar
          size="2.4rem"
          url="https://scontent.ftun11-1.fna.fbcdn.net/v/t1.0-9/107473085_10220372571378093_8626273449961856030_n.jpg?_nc_cat=111&ccb=2&_nc_sid=09cbfe&_nc_ohc=jN2qfU0I-z0AX-BsJ9G&_nc_ht=scontent.ftun11-1.fna&oh=c1ee5219e203f447022a8037b899cfc4&oe=60050203"
        ></avatar>
        <div class="user_name">
          <h3>Bouassida Yassine</h3>
          <h5 class="text_info regular">Avilable</h5>
        </div>
      </div>
      <div class="messages">
        <div v-for="(msg, index) in messagesTest" :key="index">
          <div class="message flex align_baseline start other" v-if="!msg.me">
            <avatar size="2.4rem" :url="msg.avatar"></avatar>
            <div class="bg_secondary msg_txt text_blackD">
              <h5>{{ msg.text }}</h5>
            </div>
          </div>

          <div class="message flex align_baseline end me" v-else>
            <div class="bg_horizontal msg_txt text_white">
              <h5>{{ msg.text }}</h5>
            </div>
            <avatar size="2.4rem" :url="msg.avatar"></avatar>
          </div>
        </div>
      </div>
    </div>
    <div class="message_footer fit_container">
      <div class="message_input bg_secondary text_blackD flex align_center space_between">
        <input type="text" v-model="newMessage" @keyup.enter="sendMessageTest" />
        <base-button
          :mode="{ dark: true, bg_diagonal: true }"
          class="message_btn"
          @click.native="sendMessageTest"
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
  data() {
    return {
      newMessage: "",
      messagesTest: [
        {
          me: true,
          text: "Hello",
          seen: "18:06",
          avatar:
            "https://scontent.ftun11-1.fna.fbcdn.net/v/t1.0-9/107473085_10220372571378093_8626273449961856030_n.jpg?_nc_cat=111&ccb=2&_nc_sid=09cbfe&_nc_ohc=jN2qfU0I-z0AX-BsJ9G&_nc_ht=scontent.ftun11-1.fna&oh=c1ee5219e203f447022a8037b899cfc4&oe=60050203"
        },
        {
          me: false,
          text: "Hi",
          seen: "18:06",
          avatar:
            "https://scontent.ftun11-1.fna.fbcdn.net/v/t1.0-9/107473085_10220372571378093_8626273449961856030_n.jpg?_nc_cat=111&ccb=2&_nc_sid=09cbfe&_nc_ohc=jN2qfU0I-z0AX-BsJ9G&_nc_ht=scontent.ftun11-1.fna&oh=c1ee5219e203f447022a8037b899cfc4&oe=60050203"
        },
        {
          me: false,
          text: "I am outside but i cant find your house",
          seen: "18:06",
          avatar:
            "https://scontent.ftun11-1.fna.fbcdn.net/v/t1.0-9/107473085_10220372571378093_8626273449961856030_n.jpg?_nc_cat=111&ccb=2&_nc_sid=09cbfe&_nc_ohc=jN2qfU0I-z0AX-BsJ9G&_nc_ht=scontent.ftun11-1.fna&oh=c1ee5219e203f447022a8037b899cfc4&oe=60050203"
        },
        {
          me: true,
          text: "I am coming...",
          seen: "18:06",
          avatar:
            "https://scontent.ftun11-1.fna.fbcdn.net/v/t1.0-9/107473085_10220372571378093_8626273449961856030_n.jpg?_nc_cat=111&ccb=2&_nc_sid=09cbfe&_nc_ohc=jN2qfU0I-z0AX-BsJ9G&_nc_ht=scontent.ftun11-1.fna&oh=c1ee5219e203f447022a8037b899cfc4&oe=60050203"
        }
      ]
    };
  },
  computed: {
    orderLink() {
      return this.$store.getters["messages/orderLink"];
    },
    isLoaded() {
      return Object.keys(this.$store.getters["messages/value"]).length > 0;
    },
    messages() {
      return this.$store.getters["messages/value"];
    }
  },
  async beforeCreate() {
    await this.$store.dispatch("messages/loadMessages", {
      orderId: this.$route.params.orderId
    });
  },
  async beforeUnmount() {
    console.log("before unmount");
    await this.$store.dispatch("messages/unloadMessages");
  },
  methods: {
    sendMessageTest() {
      this.messagesTest.push({
        me: true,
        text: this.newMessage,
        seen: "18:06",
        avatar:
          "https://scontent.ftun11-1.fna.fbcdn.net/v/t1.0-9/107473085_10220372571378093_8626273449961856030_n.jpg?_nc_cat=111&ccb=2&_nc_sid=09cbfe&_nc_ohc=jN2qfU0I-z0AX-BsJ9G&_nc_ht=scontent.ftun11-1.fna&oh=c1ee5219e203f447022a8037b899cfc4&oe=60050203"
      });
      this.newMessage = "";
    },
    async sendMessage() {
      let response = (
        await this.$store.dispatch("messages/sendMessage", {
          message: this.newMessage
        })
      ).data;
      if (response.status == "Success") {
        this.newMessage = "";
      } else {
        this.errorMessage = response.errorMessage;
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
        margin-left: 1rem;
        border-radius: 2rem 0rem 2rem 2rem;
      }
    }
  }
  .user_info {
    height: 4.75rem;
    padding: 0.5rem;
    margin: 0 -1rem;
    .user_name {
      margin-left: 1rem;
      > * {
        margin: 2.5px 0;
      }
    }
  }
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
    }
  }
}
</style>
