<template>
  <div>
    <div id="app">
      <v-app id="inspire">
        <v-layout row justify-center>
          <v-app-bar dark color="blue-grey darken-1" class="hidden-sm-and-down px-2">
            <v-toolbar-title>Desktop Menu</v-toolbar-title>
            <v-spacer></v-spacer>
            <v-toolbar-items>
              <v-btn
                v-for="item in links"
                :key="item.icon"
                :to="item.path"
                :title="item.name"
                text
              >{{ item.name }}</v-btn>
            </v-toolbar-items>
          </v-app-bar>

          <v-app-bar dark color="blue-grey darken-3" class="hidden-sm-and-up px-2">
            <v-toolbar-title>Mobile Menu</v-toolbar-title>
            <v-spacer></v-spacer>

            <v-dialog
              v-model="dialog"
              fullscreen
              hide-overlay
              transition="dialog-bottom-transition"
            >
              <template v-slot:activator="{ on, attrs }">
                <v-app-bar-nav-icon dark slot="activator" v-on="on" v-bind="attrs"></v-app-bar-nav-icon>
              </template>
              <v-card>
                <v-toolbar text dark color="blue-grey darken-2">
                  <v-toolbar-title>Mobile Menu</v-toolbar-title>
                  <v-spacer></v-spacer>
                  <v-btn icon @click.native="dialog = false">
                    <v-icon>mdi-close</v-icon>
                  </v-btn>
                </v-toolbar>

                <v-list>
                  <v-list-item
                    v-for="(item, index) in links"
                    :key="index"
                    :to="item.path"
                    @click="dialog=false"
                  >
                    <v-list-item-action>
                      <v-icon v-if="item.icon">{{item.icon}}</v-icon>
                    </v-list-item-action>
                    <v-list-item-content>
                      <v-list-item-title :title="item.name">{{ item.name }}</v-list-item-title>
                    </v-list-item-content>
                  </v-list-item>
                </v-list>
              </v-card>
            </v-dialog>
          </v-app-bar>

          <v-container fluid>
            <v-slide-y-transition mode="out-in">
              <v-main>
                <router-view></router-view>
              </v-main>
            </v-slide-y-transition>
          </v-container>
        </v-layout>
      </v-app>
    </div>
  </div>
</template>

<script>
// import TheHeader from '@/shared/components/layouts/TheHeader.vue';
export default {
  data: () => ({
    dialog: false,
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
  },
  methods: {
    logout() {
      this.$store.dispatch("logout");
      this.$emit("closeNavDrawer");
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