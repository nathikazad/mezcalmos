<template> 
  <div>
    Customers View
  </div>
</template>

<script>
export default {
  computed: {
    
  },
  beforeCreate() {
    // this.$store.dispatch("order/loadOrder", {
    //   orderId: this.$route.params.orderId,
    // });
  },
  beforeUnmount() {
    // await this.$store.dispatch("order/unloadOrder");
  },
  methods: {
    // async acceptOrder() {
    //   await this.$store.dispatch("order/acceptOrder")
    // }
  }
};
</script>