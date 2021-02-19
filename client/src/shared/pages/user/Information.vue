<template>
  <div class="userInfo flex space_around">
    <h1 class="regular txt_center" v-html="$t('shared.userInfo.title')"></h1>
    <div class="information">
      <div class="flex align_center center">
        <avatar class="border" size="10rem" :url="deepFind(userInfo,'photo')"></avatar>
      </div>
      <h1 class="txt_center t-20">{{ deepFind(userInfo,'displayName') }}</h1>
      <h3 class="txt_center" v-if="deepFind(userInfo,'phone')">
        <fa icon="mobile"></fa>
        &nbsp; {{ userInfo.phone }}
      </h3>
    </div>
    <div class="actions fill_width flex space_between">
      <base-button class="w-45 elevate_1" :mode="{ dark: true, bg_diagonal: true }">
        <fa icon="pencil-alt"></fa>&nbsp;&nbsp;
        <span class="t-8 regular">{{$t('shared.userInfo.editBtn')}}</span>
      </base-button>
      <base-button class="w-45 elevate_1" :mode="{ dark: true, bg_error: true }">
        <fa icon="trash"></fa>&nbsp;&nbsp;
        <span class="t-8 regular">{{$t('shared.userInfo.deleteBtn')}}</span>
      </base-button>
    </div>
  </div>
</template>
<script>
export default {
  computed: {
    userInfo() {
      return this.$store.getters["userInfo"];
    }
  }
};
</script>
<style lang="scss" scoped>
.userInfo {
  flex-direction: column;
  .information {
    flex: 0.5;
    h1 {
      margin-top: 3rem;
    }
  }
}
</style>
