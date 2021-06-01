import {
  firebaseDatabase
} from '@/shared/config/firebase'

export default {
  namespaced: true,
  state() {
    return {
      list: {},
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
          if (router.currentRoute.name == "contactAdmin") {
            firebaseDatabase().ref(`${notificationReference}/${notificationKey}`).remove()
          } else {
            console.log(router.currentRoute.name)
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
      let list = context.state.list
      for (let notificationId in list) {
        let item = list[notificationId]
        if(item.notificationType && item.notificationType == "orderStatusChange" &&
            item.orderId && item.orderId == payload.orderId) {
          firebaseDatabase().ref(`${notificationReference}/${notificationId}`).remove()
        }
      }
    },
    clearMessageNotifications(context, payload) {
      let userId = context.rootGetters.userId
      let appName = context.rootGetters.appName
      let notificationReference = `/notifications/${appName}/${userId}`
      let list = context.state.list
      for (let notificationId in list) {
        let item = list[notificationId]
        if(item.notificationType && item.notificationType == "newMessage" &&
            item.orderId && item.orderId == payload.orderId) {
          firebaseDatabase().ref(`${notificationReference}/${notificationId}`).remove()
        }
      }
    },
    clearAdminNotifications(context) {
      let userId = context.rootGetters.userId
      let appName = context.rootGetters.appName
      let notificationReference = `/notifications/${appName}/${userId}`
      let list = context.state.list
      for (let notificationId in list) {
        let item = list[notificationId]
        if(item.notificationType && item.notificationType == "newAdminMessage") {
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
      if(!userId){
        return
      }
      let appName = context.rootGetters.appName;
      // console.log("Saving notification info, ", appName)
      if (appName == "customer"){
        firebaseDatabase().ref(`/users/${userId}/notificationInfo`).set(payload)
      } else if (appName == "taxi") {
        firebaseDatabase().ref(`/taxiDrivers/${userId}/notificationInfo`).set(payload)
      }
      
    },
  },
  mutations: {
    saveNotification(state, payload) {
      state.list = {
        ...state.list,
        [payload.key]: payload.notification
      }
    },
    removeNotification(state, payload) {
      delete state.list[payload.key]
      state.list = {
        ...state.list
      } 
    },
    saveNotificationCallback(state, payload) {
      state.notificationCallbacks.push(payload)
    },
    clearAll(state) {
      state.list = {}
      state.notificationCallbacks = []
    }
  },
  getters: {
    list(state) {
      return state.list;
    },
    length(state) {
      return Object.keys(state.list).length
    }
  }
};