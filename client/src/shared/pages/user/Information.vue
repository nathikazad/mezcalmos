<template>
  <div class="userInfo flex space_around ">
    <h1 class="regular txt_center">
      User
      <br />Information
    </h1>
    <div class="flex align_center center">
      <avatar
        size="10rem"
        url="https://scontent.ftun11-1.fna.fbcdn.net/v/t1.0-9/107473085_10220372571378093_8626273449961856030_n.jpg?_nc_cat=111&ccb=2&_nc_sid=09cbfe&_nc_ohc=jN2qfU0I-z0AX-BsJ9G&_nc_ht=scontent.ftun11-1.fna&oh=c1ee5219e203f447022a8037b899cfc4&oe=60050203"
      ></avatar>
    </div>
    <h1 class="txt_center">Jorge Doe</h1>
    <h3 class="txt_center">
      <fa icon="mobile"></fa>&nbsp; 406 874 5993
    </h3>
    <div class="actions fill_width flex space_between">
      <base-button class="w-45 elevate_1" :mode="{ dark: true, bg_diagonal: true }">
        <fa icon="pencil-alt"></fa>&nbsp;&nbsp;
        <span class="t-8 regular">EDIT INFORMATION</span>
      </base-button>
      <base-button class="w-45 elevate_1" :mode="{ dark: true, bg_error: true }">
        <fa icon="trash"></fa>&nbsp;&nbsp;
        <span class="t-8 regular">Delete Account</span>
      </base-button>
    </div>
  </div>
</template>
<script>
export default {};
</script>
<style lang="scss" scoped>
.userInfo {
  flex-direction: column;
}
</style>