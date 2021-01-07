<template>
  <div class="avatar" :style="{backgroundColor:background,width:size,height:size}"></div>
</template>
<script>
export default {
  props: {
    url: {
      type: String
    },
    size: {
      type: String,
      default: "3rem"
    }
  },
  computed: {
    background() {
      return `url("${this.url}")`;
    }
  }
};
</script>
<style lang="scss">
.avatar {
  background: url("https://scontent.ftun11-1.fna.fbcdn.net/v/t1.0-9/107473085_10220372571378093_8626273449961856030_n.jpg?_nc_cat=111&ccb=2&_nc_sid=09cbfe&_nc_ohc=jN2qfU0I-z0AX-BsJ9G&_nc_ht=scontent.ftun11-1.fna&oh=c1ee5219e203f447022a8037b899cfc4&oe=60050203")
    no-repeat;
  background-position: center center;
  background-size: cover;
  background-repeat: no-repeat;
  border-radius: 50%;
}
</style>