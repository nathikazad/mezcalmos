<template>
  <div class="popUp">
    <div class="overlay" @click="$emit('close')"></div>
    <div class="popUp_body bg_white">
      <div class="popUp_head">
        <div class="icon t-22 txt_center">
          <fa :icon="icon"></fa>
        </div>
        <h4 class="text_blackL txt_center regular">{{title}}</h4>
      </div>
      <div class="popUp_core field">
        <base-button
          class="fill_width bg_grey border text_blackL elevate_0 border btnP"
          :mode="{ light: true }"
          v-for="(choice, index) in choiceList"
          :key="index"
          @click.native="$emit('picked',choice)"
        >
          <span class="t-8">{{choice}}</span>
        </base-button>
      </div>
      <!-- <div class="popUp_actions field">
        <base-button class="fill_width btnP" :mode="{ dark: true, bg_diagonal: true }">
          <span class="t-8 regular">Pick A Location From Map</span>
        </base-button>
      </div>-->
    </div>
  </div>
</template>
<script>
export default {
  props: {
    choiceList: {
      type: Array
    },
    title: {
      type: String
    },
    icon: {
      type: String
    }
  },
  data() {
    return {
      choosen: null
    };
  }
};
</script>
<style lang="scss" scoped>
.popUp {
  position: relative;
  z-index: 999;
  .overlay {
    height: 100vh;
    width: 100%;
    position: fixed;
    background: rgba(0, 15, 28, 0.9);
    left: 0;
  }
  .popUp_body {
    width: 14rem;
    height: auto;
    margin: auto;
    top: calc(50vh - 13.25rem);
    border-radius: 1rem;
    position: relative;
    padding: 1rem;
  }
  .btnP {
    height: 2.2rem;
    margin-top: 0.5rem;
  }
  .popUp_actions {
    position: absolute;
    bottom: 1rem;
    width: calc(100% - 2rem);
  }
}
</style>