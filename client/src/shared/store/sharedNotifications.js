import {
  firebaseDatabase
} from '@/shared/config/firebase'

export default {
  namespaced: true,
  state() {
    return {
      notifications: {},
      ungroupedList: {},
      notificationCallbacks: []
    };
  },
  actions: {
    
    loadNotifications(context, payload) {
      let router = payload.router
      let userId = context.rootGetters.userId
      let appName = context.rootGetters.appName
      let notificationReference = `/notifications/${appName}/${userId}`
      context.commit('saveNotificationCallback', function (notification, notificationKey, notificationReference) {
        if (notification.notificationType == "newMessage") {
          if (router.currentRoute.name == "messages" &&
            router.currentRoute.params.orderId == notification.orderId) {
            firebaseDatabase().ref(`${notificationReference}/${notificationKey}`).remove()
          } else {
            context.commit('saveNotification', {
              key: notificationKey,
              notification: notification
            })
          }
        } else if (notification.notificationType == "newAdminMessage") {
          if (router.currentRoute.name == "messageAdmin") {
          firebaseDatabase().ref(`${notificationReference}/${notificationKey}`).remove()
          } else {
            context.commit('saveNotification', {
              key: notificationKey,
              notification: notification
            })
          }
        }
      })
      firebaseDatabase().ref(notificationReference).on('child_added', async snapshot => {
        let notification = snapshot.val();
        context.state.notificationCallbacks.forEach(cb => cb(notification, snapshot.key, notificationReference))
      });

      firebaseDatabase().ref(notificationReference).on('child_removed', async snapshot => {
        let notification = snapshot.val();
        context.commit('removeNotification', {
          key: snapshot.key,
          notification: notification
        })
      });
      context.commit('saveLogoutCallback', {
        func: function (userId, context) {
          firebaseDatabase().ref(notificationReference).off()
          context.commit('clearAll')
        },
        args: [userId, context]
      }, {
        root: true
      })
    },
    clearOrderStatusNotifications(context, payload) {
      let userId = context.rootGetters.userId
      let appName = context.rootGetters.appName
      let notificationReference = `/notifications/${appName}/${userId}`
      let orderId = payload.orderId
      let notificationType = "orderStatusChange"
      if (context.state.notifications[orderId] && context.state.notifications[orderId][notificationType]) {
        for (let notificationId in context.state.notifications[orderId][notificationType]) {
          firebaseDatabase().ref(`${notificationReference}/${notificationId}`).remove()
        }
      }
    },
    clearMessageNotifications(context, payload) {
      let userId = context.rootGetters.userId
      let appName = context.rootGetters.appName
      let notificationReference = `/notifications/${appName}/${userId}`
      let orderId = payload.orderId
      let notificationType = "newMessage"
      if (context.state.notifications[orderId] && context.state.notifications[orderId][notificationType]) {
        for (let notificationId in context.state.notifications[orderId][notificationType]) {
          firebaseDatabase().ref(`${notificationReference}/${notificationId}`).remove()
        }
      }
    },
    clearAllNotifications(context) {
      let appName = context.rootGetters.appName;
      let userId = context.rootGetters.userId;
      let notificationReference = `/notifications/${appName}/${userId}`;
      firebaseDatabase().ref(`${notificationReference}`).remove()

    },
    saveUserNotificationInfo(context, payload) {
      let userId = context.rootGetters.userId
      firebaseDatabase().ref(`/users/${userId}/notificationInfo`).set(payload)
    },
  },
  mutations: {
    saveNotification(state, payload) {
      state.ungroupedList = {
        ...state.ungroupedList,
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
      if (state.notifications[orderId] &&
        state.notifications[orderId][notificationType] &&
        state.notifications[orderId][notificationType][payload.key]) {
        delete state.notifications[orderId][notificationType][payload.key]
      }
      delete state.ungroupedList[payload.key]
      state.ungroupedList = {
        ...state.ungroupedList
      }
    },
    saveNotificationCallback(state, payload) {
      state.notificationCallbacks.push(payload)
    },
    clearAll(state) {
      state.notifications = {}
      state.ungroupedList = {}
      state.notificationCallbacks = []
    }
  },
  getters: {
    list(state) {
      return state.notifications;
    },
    ungroupedList(state) {
      return state.ungroupedList;
    },
    length(state) {
      return Object.keys(state.ungroupedList).length
    }
  }
};