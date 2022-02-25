<template>
  <div class="dialog">
    <h1 class="regular">{{$t('shared.notification.title')}}</h1>
    <div class="field">
      <h3
        class="bold flex t-10 align_center"
        :class="{end:!Object.keys(todaysNotifs).length,space_between:Object.keys(todaysNotifs).length}"
      >
        <span v-if="Object.keys(todaysNotifs).length">{{$t('shared.notification.today')}}</span>
        <base-button
          @click.native="clearNotifications"
          :mode="{
            bg_diagonal: true,
            small: true,
          }"
          class="nav-btn text_primary ml-2 bg_light elevate_0"
        >
          <fa icon="broom"></fa>{{$t('shared.notification.clear')}}
        </base-button>
      </h3>

      <router-link
        :to="notifLink(notif)"
        tag="div"
        class="pointer"
        v-for="(notif, notifd) in todaysNotifs"
        :key="notifd"
      >
        <notification-card :notif="notif"></notification-card>
      </router-link>
    </div>
    <div class="field" v-if="Object.keys(yesterdayNotifs).length">
      <h3 class="bold flex space_between t-10">
        <span>{{$t('shared.notification.yesterday')}}</span>
      </h3>
      <router-link
        :to="notifLink(notif)"
        tag="div"
        class="pointer"
        v-for="(notif, notifd) in yesterdayNotifs"
        :key="notifd"
      >
        <notification-card :notif="notif"></notification-card>
      </router-link>
    </div>
    <div class="field" v-if="Object.keys(olderNotifs).length">
      <h3 class="bold flex space_between t-10">
        <span>{{$t('shared.notification.older')}}</span>
      </h3>
      <router-link
        :to="notifLink(notif)"
        tag="div"
        class="pointer"
        v-for="(notif, notifd) in olderNotifs"
        :key="notifd"
      >
        <notification-card :notif="notif"></notification-card>
      </router-link>
    </div>
  </div>
</template>
<script>
import NotificationCard from "../../components/ui/notificationCard";
export default {
  components: {
    NotificationCard
  },
  computed: {
    appName() {
      return this.$store.getters.appName;
    },
    notifications() {
      return this.$store.getters["notifications/list"];
    },
    notificationsNumber() {
      //console.log(this.notifications);
      //console.log(Object.keys(this.notifications));

      return Object.keys(this.notifications).length;
    },

    todaysNotifs() {
      let todayNotifs = {};
      let today = new Date();
      Object.keys(this.notifications)
        .reverse()
        .map(key => {
          let notifDate = new Date(this.notifications[key].time);
          if (this.datesAreOnSameDay(today, notifDate)) {
            todayNotifs[key] = this.notifications[key];
          }
        });
      return todayNotifs;
    },
    yesterdayNotifs() {
      let yesterdayNotifs = {};
      let yesterday = new Date();
      yesterday.setDate(yesterday.getDate() + 1);
      Object.keys(this.notifications)
        .reverse()
        .map(key => {
          let notifDate = new Date(this.notifications[key].time);
          if (this.datesAreOnSameDay(yesterday, notifDate)) {
            yesterdayNotifs[key] = this.notifications[key];
          }
        });
      return yesterdayNotifs;
    },
    olderNotifs() {
      let olderNotifs = {};
      let today = new Date();
      let yesterday = new Date();
      yesterday.setDate(yesterday.getDate() + 1);
      Object.keys(this.notifications)
        .reverse()
        .map(key => {
          let notifDate = new Date(this.notifications[key].time);
          if (
            !this.datesAreOnSameDay(yesterday, notifDate) &&
            !this.datesAreOnSameDay(today, notifDate)
          ) {
            olderNotifs[key] = this.notifications[key];
          }
        });
      return olderNotifs;
    }
  },
  methods: {
    clearNotifications() {
      this.$store.dispatch("notifications/clearAllNotifications");
      this.$router.go(-1);
    },
    datesAreOnSameDay(first, second) {
      return (
        first.getFullYear() === second.getFullYear() &&
        first.getMonth() === second.getMonth() &&
        first.getDate() === second.getDate()
      );
    },
    notifLink(notif) {
      if (notif.notificationType == "newMessage") {
        return `/messages/${notif.orderId}`;
      } else if (notif.notificationType == "newAdminMessage") {
        return `/contactAdmin`;
      } else if (this.appName == "customer") {
        return `/services/${notif.orderType}/${notif.orderId}`;
      } else {
        return `/orders/${notif.orderId}`;
      }
    }
  }
};
</script>
<style lang="scss" scoped>
.nav-btn {
  height: 2rem;
  width: 5rem;
  border-radius: 10px;
}
</style>