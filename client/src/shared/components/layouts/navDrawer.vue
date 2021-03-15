<template>
  <div>
    <div class="nav_header flex align_center">
      <base-button
        @click.native="$emit('toggle')"
        :mode="{ dark: true, bg_diagonal: true, small: true }"
        class="nav-btn menu"
      >
        <fa icon="chevron-left"></fa>
      </base-button>
    </div>
    <div class="visitor nav_links nav_body flex align_center center" v-if="!isLoggedIn">
      <h4 class="text_blackD fill_width t-10 pointer" @click="login">
        <fa icon="sign-in-alt"></fa>
        &nbsp;{{$t('shared.navDrawer.login')}}
      </h4>

      <h4 class="text_blackD fill_width pointer">
        <span
          v-if="localLang=='es'"
          :class="{'text_brand':localLang=='en'}"
          @click="changeLanguage('en')"
          class="flex align_center"
        >
          <img src="@/shared/static/united-states.png" alt="USA flag" class="flag" /> To English
        </span>
        <span
          v-if="localLang=='en'"
          :class="{'text_brand':localLang=='es'}"
          @click="changeLanguage('es')"
          class="flex align_center"
        >
          <img src="@/shared/static/mexico.png" alt="USA flag" class="flag" />A Español
        </span>
      </h4>
    </div>
    <div class="user nav_body" v-else>
      <div class="identity flex center wrap">
        <avatar size="6.875rem" :url="deepFind(userInfo,'photo')"></avatar>
        <h2 class="fill_width txt_center t-16 bold">{{deepFind(userInfo,'displayName')}}</h2>
      </div>
      <div class="nav_links flex align_center start wrap">
        <router-link
          :to="link.to"
          class="text_blackD fill_width"
          v-for="(link, index) in links"
          :key="index"
        >
          <h4 class>
            <fa :icon="link.icon" class="icon"></fa>
            &nbsp; {{ link.text }}
          </h4>
        </router-link>
        <span class="text_blackD" @click="logout">
          <h4>
            <fa icon="power-off" class="icon"></fa>
            &nbsp; {{$t('shared.navDrawer.logout')}}
          </h4>
        </span>

        <h4 class="text_blackD fill_width pointer">
          <span
            v-if="localLang=='es'"
            :class="{'text_brand':localLang=='en'}"
            @click="changeLanguage('en')"
            class="flex align_center"
          >
            <img src="@/shared/static/united-states.png" alt="USA flag" class="flag" /> To English
          </span>
          <span
            v-if="localLang=='en'"
            :class="{'text_brand':localLang=='es'}"
            @click="changeLanguage('es')"
            class="flex align_center"
          >
            <img src="@/shared/static/mexico.png" alt="USA flag" class="flag" />A Español
          </span>
        </h4>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  computed: {
    appName() {
      return this.$store.getters.appName;
    },
    isLoggedIn() {
      return this.$store.getters.loggedIn;
    },
    userInfo() {
      return this.$store.getters["userInfo"];
    },
    localLang() {
      return this.$store.getters["userLanguage"];
    },

    links() {
      let routerArray = [
        {
          text: this.$t("shared.navDrawer.userInfo"),
          icon: "user-circle",
          to: "/userinfo"
        },
        {
          text: this.$t("shared.navDrawer.myOrders"),
          icon: "shopping-cart",
          to: "/orders"
        }
      ];
      if (this.appName == "customer") {
        routerArray.push({
          text: this.$t("shared.navDrawer.savedLocations"),
          icon: "location-arrow",
          to: "/saved/locations",
          hideIn: "taxi"
        });
      }
      return routerArray;
    }
  },

  methods: {
    async login() {
      await this.$store.dispatch("login");
      this.$emit('closeNavDrawer')
    },
    logout() {
      this.$store.dispatch("logout");
      this.$emit('closeNavDrawer')
    },

    changeLanguage(lang) {
      this.$store.dispatch("setLanguage", lang);
    }
  }
};
</script>
<style lang="scss">
.nav_header {
  width: 100%;
  height: 5rem;
}
.nav-btn {
  height: 2rem;
  width: 2rem;
  border-radius: 10px;
}
.visitor {
  flex-direction: column;
}
.nav_body {
  height: calc(100% - 5rem);
}
.identity {
  margin: 10% 0;
}
.nav_links {
  width: 14rem;
  margin: auto;
}
.icon {
  margin-right: 15px;
}
.flag {
  height: 1.3rem;
  width: auto;
  margin-right: 1rem;
}
</style>
