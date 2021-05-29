<template>
  <div>
    <div>
      <div class="flex align_center">
        <avatar v-if="avatar" size="2.4rem" :url="avatar"></avatar>
        <div class="user_name pl-2">
          <h4 class="text_blackL my-0" v-if="name">{{ name }}</h4>
          <h5
            class="regular text_grey my-0"
            v-if="extra"
          >{{extra }}</h5>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  props: {
    avatar: { type: String },
    name: { type: String },
    extra: { type: [String, Number] }
  }
};
</script>
<style lang="scss" scoped>
</style>