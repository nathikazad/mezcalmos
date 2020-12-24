<template>
  <button v-if="!link" :class="mode" class="btn">
    <span>
      <slot></slot>
    </span>
  </button>
  <router-link v-else :to="to" :class="mode" class="btn" tag="button">
    <span>
      <slot></slot>
    </span>
  </router-link>
</template>

<script>
export default {
  props: {
    mode: {
      type: Object,
      required: false
    },
    color: {
      type: String,
      required: false,
      default: "dark"
    },
    link: {
      type: Boolean,
      required: false,
      default: false
    },
    to: {
      type: String,
      required: false,
      default: "/"
    }
  }
};
</script>

<style lang="scss" scoped>
.dark {
  color: map-get($colors, white);
}
.light {
  color: map-get($colors, blackD);
  position: relative;
  &::before {
    content: "";
    position: absolute;
    width: 100%;
    height: 100%;
    top: 0;
    left: 0;
    z-index: 0;
    border-radius: inherit;
    opacity: 0.9;
    background: white;
  }
}
.small {
  height: 2rem;
}
</style>
