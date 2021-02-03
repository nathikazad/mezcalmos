<template>
  <div class="relative">
    <transition name="slide-fade-reverse">
      <div class="dialog" v-if="notificationsMenu">
        <h1>Notifications</h1>
        <div class="field" v-if="todaysNotifs">
          <h3 class="bold flex space_between">
            <span>Today</span>
          </h3>

          <router-link
            :to="notifLink(notif)"
            tag="div"
            class="pointer"
            v-for="(notif, notifd) in todaysNotifs"
            :key="notifd"
          >
            <!-- Message type -->
            <card class="bg_white elevate_1 card wrap" v-if="notif.notificationType=='newMessage'">
              <avatar size="2.4rem" :url="notif.sender.image" slot="image"></avatar>
              <div slot="text" class="card_text">
                <div slot="cardTitle" class="bold">{{ notif.sender.name }}</div>
                <div slot="description">
                  <span slot="param" class="t-8">{{ notif.message }}</span>
                </div>
              </div>
              <div slot="actions" class="flex">
                <span slot="param" class="t-8">
                  <fa icon="clock"></fa>
                  &nbsp;
                  {{ notif.time | moment("LT") }}
                </span>
              </div>
            </card>
            <!-- Message type -->
            <card class="elevate_1 card wrap" :class="{[`bg_${notif.orderType}`]:true}" v-else>
              <div slot="text" class="card_text">
                <div slot="cardTitle" class="bold">{{ notif.orderType }}</div>
                <div slot="description">
                  <span slot="param" class="t-8">{{ notif.status }}</span>
                </div>
              </div>
              <div slot="actions" class="flex">
                <span slot="param" class="t-8">
                  <fa icon="clock"></fa>
                  &nbsp;
                  {{ notif.time | moment("LT") }}
                </span>
              </div>
            </card>
          </router-link>
        </div>
        <div class="field">
          <h3 class="bold flex space_between">
            <span>Yesterday</span>
          </h3>
        </div>
        <div class="field">
          <h3 class="bold flex space_between">
            <span>Older</span>
          </h3>
        </div>
      </div>
    </transition>
    <base-button
      :mode="{
            bg_diagonal: true,
            small: true,
          }"
      class="nav-btn text_primary ml-2 bg_light elevate_1"
      :link="true"
      :to="{
            path: $route.path,
            query: { redirect: $route.path ,showNotif:true},
          }"
    >
      <fa icon="bell" />
    </base-button>
    <span class="badge bg_violet" v-if="notificationsNumber">{{notificationsNumber}}</span>
  </div>
</template>
<script>
export default {
  computed: {
    notifications() {
      return this.$store.getters["notifications/list2"];
    },
    notificationsNumber() {
      console.log(this.notifications);
      console.log(Object.keys(this.notifications));

      return Object.keys(this.notifications).length;
    },
    notificationsMenu() {
      let query = this.$route.query;
      return query.showNotif;
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
.badge {
  position: absolute;
  width: 1rem;
  height: 1rem;
  line-height: 1rem;
  border-radius: 50%;
  color: map-get($map: $colors, $key: white);
  font-size: 0.8rem;
  text-align: center;
  top: -0.5rem;
  right: -0.5rem;
}
.dialog {
  position: fixed;
  width: 100%;
  height: calc(100% - 5rem);
  background: white;
  top: 5rem;
  left: 0;
  z-index: 9;
  padding: 1rem;
  padding-top: 0;
  z-index: 99999;
}
.image {
  width: 3.75rem;
  height: 3.75rem;
}
.edit {
  margin-right: 0.5rem;
}
.icon {
  width: 2rem;
  height: 2rem;
}
.card {
  border-radius: 4px;
  margin: 0.8rem 0;
  padding: 0.5rem;
  .card_text {
    margin-left: 1rem;
  }
  ::v-deep .mainSlots {
    width: 70% !important;
  }
}
</style>