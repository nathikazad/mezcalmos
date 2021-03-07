<template>
  <div class="relative">
    <transition name="slide-fade-reverse"></transition>
    <base-button
      :mode="{
            bg_diagonal: true,
            small: true,
          }"
      class="nav-btn text_primary ml-2 bg_light elevate_0"
      :link="true"
      :to="{
            path: '/notifications',
            
          }"
    >
      <fa icon="bell" />
    </base-button>
    <span class="badge bg_error" v-if="notificationsNumber"></span>
  </div>
</template>
<script>
export default {
  props: {
    notifications: { type: Object },
    notificationsNumber: { type: Number }
  }
};
</script>
<style lang="scss" scoped>
.badge {
  position: absolute;
  width: 10px;
  height: 10px;
  border: 2px solid #f6efff;
  line-height: 1rem;
  border-radius: 50%;
  color: map-get($map: $colors, $key: white);
  font-size: 0.8rem;
  text-align: center;
  top: 0.45rem;
  right: 0.4rem;
}
.dialog {
  position: fixed;
  width: 100%;
  height: calc(100% - 5rem);
  background: white;
  top: 5rem;
  left: 0;
  z-index: 9;
  padding: 1rem;
  padding-top: 0;
  z-index: 99999;
}
.nav-btn {
  border-radius: 10px;
}
</style>