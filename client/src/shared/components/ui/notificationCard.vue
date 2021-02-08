<template>
  <div>
    <!-- Message type -->
    <card class="bg_white elevate_1 card wrap" v-if="notif.notificationType=='newMessage'">
      <avatar size="2.4rem" :url="notif.sender.image" slot="image"></avatar>
      <div slot="text" class="card_text">
        <div slot="cardTitle" class="bold">{{ notif.sender.name }}</div>
        <div slot="description">
          <span slot="param" class="t-8">{{ notif.message }}</span>
        </div>
      </div>
      <div slot="actions" class="flex">
        <span slot="param" class="t-8">
          <fa icon="clock"></fa>
          &nbsp;
          {{ notif.time | moment("LT") }}
        </span>
      </div>
    </card>
    <!-- Message type -->
    <card class="elevate_1 card wrap" :class="{[`bg_${notif.orderType}`]:true}" v-else>
      <div slot="text" class="card_text">
        <div slot="cardTitle" class="bold">{{ notif.orderType }}</div>
        <div slot="description">
          <span slot="param" class="t-8">{{ notif.status }}</span>
        </div>
      </div>
      <div slot="actions" class="flex">
        <span slot="param" class="t-8">
          <fa icon="clock"></fa>
          &nbsp;
          {{ notif.time | moment("LT") }}
        </span>
      </div>
    </card>
  </div>
</template>
<script>
export default {
  props: {
    notif: {
      type: Object
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
}
</style>