import {
  firebaseDatabase
} from '@/shared/config/firebase'

export default {
  namespaced: true,
  state() {
    return {
      notifications: {},
      notifictionsList: {}
    };
  },
  actions: {
    saveUserSubscription(context, payload) {
      let userId = context.rootGetters.userId
      console.log(payload, userId);

    },
    loadNotifications(context, payload) {
      let router = payload.router
      let userId = context.rootGetters.userId
      firebaseDatabase().ref(`/notifications/${userId}`).on('child_added', async snapshot => {
        let notification = snapshot.val();
        if (notification.notificationType == "newMessage" &&
          router.currentRoute.name == "messages" &&
          router.currentRoute.params.orderId == notification.orderId) {
          firebaseDatabase().ref(`/notifications/${userId}/${snapshot.key}`).remove()
        } else {
          context.commit('saveNotification', {
            key: snapshot.key,
            notification: notification
          })
        }
      });

      firebaseDatabase().ref(`/notifications/${userId}`).on('child_removed', async snapshot => {
        let notification = snapshot.val();
        context.commit('removeNotification', {
          key: snapshot.key,
          notification: notification
        })
      });
    },
    clearOrderStatusNotifications(context, payload) {
      let userId = context.rootGetters.userId
      let orderId = payload.orderId
      let notificationType = "orderStatusChange"
      if (context.state.notifications[orderId] && context.state.notifications[orderId][notificationType]) {
        for (let notificationId in context.state.notifications[orderId][notificationType]) {
          firebaseDatabase().ref(`/notifications/${userId}/${notificationId}`).remove()
        }
      }
    },
    clearMessageNotifications(context, payload) {
      let userId = context.rootGetters.userId
      let orderId = payload.orderId
      let notificationType = "newMessage"
      if (context.state.notifications[orderId] && context.state.notifications[orderId][notificationType]) {
        for (let notificationId in context.state.notifications[orderId][notificationType]) {
          firebaseDatabase().ref(`/notifications/${userId}/${notificationId}`).remove()
        }
      }
    }
  },
  mutations: {
    saveNotification(state, payload) {
      state.notifictionsList = {
        ...state.notifictionsList,
        [payload.key]: payload.notification
      }
      let orderId = payload.notification.orderId
      let notificationType = payload.notification.notificationType
      state.notifications[orderId] = state.notifications[orderId] || {}
      state.notifications[orderId][notificationType] = state.notifications[orderId][notificationType] || {}
      state.notifications[orderId][notificationType][payload.key] = payload.notification
    },
    removeNotification(state, payload) {
      let notificationType = payload.notification.notificationType
      let orderId = payload.notification.orderId
      delete state.notifications[orderId][notificationType][payload.key]
      delete state.notifictionsList[payload.key]
      state.notifictionsList = {
        ...state.notifictionsList
      }
    }
  },
  getters: {
    list(state) {
      return state.notifications;
    },
    list2(state) {
      return state.notifictionsList;
    }
  }
};