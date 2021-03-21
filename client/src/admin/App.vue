<template>
  <div>
    <v-app id="inspire">
      <v-app-bar app color="white" flat v-if="user">
        <v-container class="py-0 fill-height">
          <v-avatar class="mr-10" color="grey darken-1" size="50">
            <img :src="user.photo" :alt="user.displayName" />
          </v-avatar>

          <v-btn
            color="primary"
            v-for="(link,index) in links"
            :key="index"
            link
            text
            :to="link.path"
            class="mx-2"
          >{{ link.name }}</v-btn>

          <v-spacer></v-spacer>

          <v-responsive max-width="260">
            <v-text-field dense flat hide-details rounded solo-inverted></v-text-field>
          </v-responsive>
          <v-btn color="secondary" class="mx-2">Logout</v-btn>
        </v-container>
      </v-app-bar>

      <v-main>
        <router-view></router-view>
      </v-main>
    </v-app>
  </div>
</template>

<script>
// import TheHeader from '@/shared/components/layouts/TheHeader.vue';
export default {
  data: () => ({
    drawer: null,
    links: [
      { icon: "mdi-inbox-arrow-down", name: "Messages", path: "/messages" },
      { icon: "mdi-send", name: "Customers", path: "/customers" },
      { icon: "mdi-delete", name: "Orders", path: "/orders" },
      { icon: "mdi-alert-octagon", name: "Taxis", path: "/taxis" }
    ]
  }),
  components: {
    // TheHeader,
  },
  computed: {
    user() {
      return this.$store.getters.userInfo;
    }
  }
};
</script>

<style lang="scss">
* {
  box-sizing: border-box;
}
html {
  font-family: $regular;
}

body {
  margin: 0;
  color: map-get($colors, blackL);
}
main {
  width: 100%;
  //min-height: 100vh;
  position: relative;
}
.outlet {
  min-height: calc(100vh - 5rem);
  position: relative;
  overflow: auto;
  padding: 0 1rem;
}
.navDrawer {
  height: 100%;
  position: absolute;
  top: 0;
  left: 0;
  width: 80%;
  z-index: 10;
  padding: 0 1.25rem;
}
.dialogPanel {
  position: absolute;
  width: 100%;
  height: calc(100% - 5rem);
  background: white;
  top: 5rem;
  left: 0;
  z-index: 9;
  padding: 1rem;
  padding-top: 0;
}
</style>