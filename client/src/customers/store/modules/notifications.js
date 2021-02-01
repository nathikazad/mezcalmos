import sharedNotificationsModule from '@/shared/store/sharedNotifications'
import {
  firebaseDatabase
} from '@/shared/config/firebase'
import router from '../../router';
sharedNotificationsModule.actions.loadNotificationsForCustomer = function(context) {
  context.dispatch("loadNotifications", {router: router});
  let userId = context.rootGetters.userId
  firebaseDatabase().ref(`/notifications/${userId}`).on('child_added', async snapshot => {
    let notification = snapshot.val();
    if(notification.notificationType == "orderStatusChange") {
      if (notification.orderType == "taxi" 
          && router.currentRoute.name == "taxiView"
          && router.currentRoute.params.orderId == notification.orderId){
        firebaseDatabase().ref(`/notifications/${userId}/${snapshot.key}`).remove()
      } else if (notification.orderType == "grocery" 
          && router.currentRoute.name == "groceryView"
          && router.currentRoute.params.orderId == notification.orderId) { 
        firebaseDatabase().ref(`/notifications/${userId}/${snapshot.key}`).remove()
      } else {
        context.commit('saveNotification', {key:snapshot.key, notification:notification})
      }
    }
  });
};
export default sharedNotificationsModule