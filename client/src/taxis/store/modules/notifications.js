import sharedNotificationsModule from '@/shared/store/sharedNotifications'
import router from '../../router';
sharedNotificationsModule.actions.loadNotificationsForTaxi = function(context) {
  context.dispatch("loadNotifications", {router: router});
};
export default sharedNotificationsModule