<template>
  <header>
    <transition name="slide-fade">
      <alert
        v-if="alert"
        @close="redirectAlertTo($event,'close',alert)"
        @click.native="redirectAlertTo($event,'redirect',alert)"
      >
        <div slot="sender" class="flex align_center" v-if="alert.sender">
          <avatar size="2.4rem" :url="alert.sender.image" slot="image"></avatar>
          <div class="card_text">
            <div class="bold">{{ alert.sender.name }}</div>
            <div>
              <span slot="param" class="t-8">
                {{
                alert.message | formatMessage(30)
                }}
              </span>
            </div>
          </div>
        </div>
        <div slot="sender" class="flex align_center" v-else>
          <div class="card_text">
            <div class="bold">Order status changed</div>
            <div>
              <span slot="param" class="t-8">{{ alert.status }}</span>
            </div>
          </div>
        </div>
      </alert>
    </transition>
    <nav class="container flex space_between align_center fill_height">
      <div class="right_side flex align_center">
        <base-button
          @click.native="$emit('toggle')"
          :mode="{ dark: true, bg_diagonal: true }"
          class="nav-btn menu"
          v-show="showNavBtn"
        >
          <menu-bars></menu-bars>
        </base-button>
        <base-button
          :mode="{ dark: true, bg_diagonal: true }"
          class="nav-btn menu"
          @click.native="backOneStep"
          v-show="!showNavBtn"
        >
          <fa icon="chevron-left"></fa>
        </base-button>
        <router-link :to="{name:'home'}" class="flex align_center">
          <logo class="logo"></logo>
          <h2 class="regular txt_center flex">
            MEZ
            <span>CALMOS</span>
          </h2>
        </router-link>
      </div>
      <div class="left_side flex">
        <notification-btn
          v-if="notificationsNumber"
          :notificationsNumber="notificationsNumber"
          :notifications="notifications"
        ></notification-btn>

        <base-button
          :mode="{
            bg_diagonal: true,
            small: true,
          }"
          class="nav-btn text_primary ml-2 bg_light elevate_1"
          :link="true"
          :to="{
            path: `/orders`,
            query: { redirect: $route.path },
          }"
        >
          <fa icon="shopping-cart" />
        </base-button>
      </div>
    </nav>
  </header>
</template>

<script>
import menuBars from "../SVG/menuBars";
export default {
  components: {
    menuBars
  },
  props: {
    showNavBtn: {
      type: Boolean
    }
  },
  data() {
    return {
      alert: false
    };
  },
  computed: {
    notifications() {
      return this.$store.getters["notifications/list2"];
    },
    notificationsNumber() {
      return Object.keys(this.notifications).length;
    },
    isLoggedIn() {
      return this.$store.getters.loggedIn;
    }
  },
  methods: {
    logout() {
      this.$store.dispatch("logout");
      this.$router.push({ name: "services" });
    },
    redirectAlertTo(event, cmd, alert) {
      if (event == undefined) {
        this.alert = false;
      } else {
        if (alert.notificationType == "newMessage") {
          this.$router.push(`/messages/${alert.orderId}`);
        } else {
          this.$router.push(`/services/${alert.orderType}/${alert.orderId}`);
        }
      }
    },
    backOneStep() {
      let route = this.$route;

      if (route.name == "home") {
        return;
      } else {
        this.$router.go(-1);
      }
    }
  },
  watch: {
    notifications: {
      deep: true,

      handler: function(newVal, oldVal) {
        if (Object.keys(newVal).length > Object.keys(oldVal).length) {
          let lastId = Object.keys(newVal)[Object.keys(newVal).length - 1];
          this.alert = this.notifications[lastId];
          setTimeout(() => {
            this.alert = false;
          }, 3000);
        } else {
          this.alert = false;
        }
      }
    }
  }
};
</script>

<style lang="scss" scoped>
header {
  width: 100%;
  height: 5rem;
}
h2 {
  color: map-get($colors, blackD);
  span {
    color: map-get($colors, brand);
  }
}
.logo {
  margin: 0 0.8rem;
  height: 2rem;
  width: auto;
  @media (max-width: 375px) {
    margin: 0 0.5rem;
  }
}
.menu {
  margin-right: 0.8rem;
}
.nav-btn {
  height: 2rem;
  width: 2rem;
  border-radius: 10px;
}
</style>
