<template>
  <div>
    <router-link :to="orderLink">Back to Order</router-link>
    <h2>Messages</h2>
    {{ messages }}
    <input type="text" v-model="newMessage" />
    <button v-if="newMessage != ''" @click="sendMessage">Send Message</button>
  </div>
</template>

<script>
export default {
  data() {
    return { newMessage: "" };
  },
  computed: {
    orderLink() {
      return this.$store.getters["messages/orderLink"]
    },
    isLoaded() {
      return Object.keys(this.$store.getters["messages/value"]).length > 0;
    },
    messages() {
      return this.$store.getters["messages/value"];
    },
  },
  async beforeCreate() {
    await this.$store.dispatch("messages/loadMessages", {
      orderId: this.$route.params.orderId,
    });
  },
  methods: {
    async sendMessage() {
      this.$store.dispatch("messages/sendMessage", {
        message: this.newMessage
      })
    }
  }
}
</script>