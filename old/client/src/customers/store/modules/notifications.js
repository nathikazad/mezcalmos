import sharedNotificationsModule from '@/shared/store/sharedNotifications'
import {
  firebaseDatabase
} from '@/shared/config/firebase'
import router from '../../router';
sharedNotificationsModule.actions.loadNotificationsForCustomer = function(context) {
  context.commit('saveNotificationCallback', function(notification, notificationKey, notificationReference){
    if(notification.notificationType == "orderStatusChange") {
      if (notification.orderType == "taxi" 
          && router.currentRoute.name == "taxiView"
          && router.currentRoute.params.orderId == notification.orderId){
        firebaseDatabase().ref(`${notificationReference}/${notificationKey}`).remove()
      } else if (notification.orderType == "grocery" 
          && router.currentRoute.name == "groceryView"
          && router.currentRoute.params.orderId == notification.orderId) { 
        firebaseDatabase().ref(`${notificationReference}/${notificationKey}`).remove()
      } else {
        context.commit('saveNotification', {key:notificationKey, notification:notification})
      }
    }
  })

  context.dispatch("loadNotifications", {router: router});
};
export default sharedNotificationsModule