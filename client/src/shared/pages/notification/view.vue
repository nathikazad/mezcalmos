<template>
  <div class="dialog">
    <h1 class="regular">Notifications</h1>
    <div class="field" v-if="Object.keys(todaysNotifs).length">
      <h3 class="bold flex space_between t-10">
        <span>Today</span>
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
      <h3 class="bold flex space_between">
        <span>Yesterday</span>
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
      <h3 class="bold flex space_between">
        <span>Older</span>
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
    notifications() {
      return this.$store.getters["notifications/ungroupedList"];
    },
    notificationsNumber() {
      console.log(this.notifications);
      console.log(Object.keys(this.notifications));

      return Object.keys(this.notifications).length;
    },

    todaysNotifs() {
      let todayNotifs = {};
      let today = new Date();
      Object.keys(this.notifications).map(key => {
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
      Object.keys(this.notifications).map(key => {
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
      Object.keys(this.notifications).map(key => {
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
      } else {
        return `/services/${notif.orderType}/${notif.orderId}`;
      }
    }
  }
};
</script>
<style lang="scss" scoped>
</style>