<template>
  <div>
    <!-- Message type -->
    <card2 class="bg_white border card wrap" v-if="notif.notificationType=='newMessage'">
      <avatar size="2.4rem" :url="notif.sender.image" slot="image"></avatar>

      <div slot="title" class="bold">{{ notif.sender.name }}</div>
      <div slot="desc">
        <span slot="param" class="t-8">{{ notif.message }}</span>
      </div>
      <span slot="aside" class="regular">
        <fa icon="clock"></fa>
        &nbsp;{{ notif.time | moment("LT") }}
      </span>
    </card2>
    <!-- Order type -->
    <card2 class="border card wrap" v-else-if="notif.notificationType=='orderStatusChange'">
      <div
        class="statusCircle flex align_center center"
        slot="image"
        :class="{[`bg_${statusFormatting(notif).bg}`]:true,[`text_${statusFormatting(notif).color}`]:true}"
      >
        <fa :icon="statusFormatting(notif).icon"></fa>
      </div>
      <div slot="title" class="bold">{{ statusFormatting(notif).text }}</div>
      <div slot="desc">
        <span slot="param" class="t-8">{{ statusFormatting(notif).desc }}</span>
      </div>
      <span slot="aside" class="regular">
        <fa icon="clock"></fa>
        &nbsp;{{ notif.time | moment("LT") }}
      </span>
    </card2>
  </div>
</template>
<script>
export default {
  props: {
    notif: {
      type: Object
    }
  },
  methods: {
    statusFormatting(notif) {
      var returnvalue;
      switch (notif.status) {
        case "droppedOff":
          returnvalue = {
            bg: "light_green",
            color: "green",
            icon: "map-marker-check",
            text: this.$t("taxi.taxiView.droppedOf"),
            desc: "Your ride has ended"
          };
          break;
        case "onTheWay":
          returnvalue = {
            bg: "light_violet",
            color: "violet",
            icon: "car-building",
            text: this.$t("taxi.orders.onTheWay"),
            desc: `${notif.driver.name} on the way now to pick you up`
          };
          break;
        case "inTransit":
          returnvalue = {
            bg: "light_blue",
            color: "primary",
            icon: "route",
            text: this.$t("taxi.orders.inTransit"),
            desc: "Your ride has ended"
          };
          break;
      }
      return returnvalue;
    }
  }
};
</script>
<style lang="scss" scoped>
.image {
  width: 3.75rem;
  height: 3.75rem;
}
.edit {
  margin-right: 0.5rem;
}
.icon {
  width: 2rem;
  height: 2rem;
}
.card {
  border-radius: 4px;
  margin: 0.8rem 0;
  padding: 0.5rem;
  .card_text {
    margin-left: 1rem;
  }
  ::v-deep .mainSlots {
    width: 70% !important;
  }
  .statusCircle {
    border-radius: 50%;
    height: 2.4rem;
    width: 2.4rem;
    padding: 0.5rem;
  }
}
</style>