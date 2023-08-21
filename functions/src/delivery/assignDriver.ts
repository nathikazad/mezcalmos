import { pushNotification } from "../utilities/senders/notifyUser";
import { Notification, NotificationAction, NotificationType } from "../shared/models/Notification";
import { deliveryNewOrderMessage } from "./bgNotificationMessages";
import { getDeliveryDriver } from "../shared/graphql/delivery/driver/getDeliveryDriver";
import {  DeliveryDriver, DeliveryOrder, NewDeliveryOrderNotification } from "../shared/models/Generic/Delivery";
import { getDeliveryOrder } from "../shared/graphql/delivery/getDelivery";
import { updateDeliveryDriver } from "../shared/graphql/delivery/driver/assignDeliverer";
import { setDeliveryChatInfo } from "../shared/graphql/chat/setChatInfo";
import { deleteChatMessagesAndParticipant } from "../shared/graphql/chat/deleteChatMessages";
import { assignDriverErrorChecks } from "../shared/helper";
import {  MezError } from "../shared/models/Generic/Generic"
import { ParticipantType } from "../shared/models/Generic/Chat";
import { clearLock, setLockTime } from "../shared/graphql/delivery/updateDelivery";
import { AssignDriverDetails, AssignDriverResponse, AssignDriverError, CounterOfferStatus } from "../shared/models/Generic/Order";


export async function assignDeliveryDriver(userId: number, assignDriverDetails: AssignDriverDetails): Promise<AssignDriverResponse> {
  
  try {
    if(assignDriverDetails.changeDriver == null) {
      await setLockTime(assignDriverDetails.orderId)
    }
    let deliveryOrderPromise = getDeliveryOrder(assignDriverDetails.orderId);
    let deliveryDriverPromise = getDeliveryDriver(assignDriverDetails.driverId)
    let promiseResponse = await Promise.all([deliveryOrderPromise, deliveryDriverPromise]);
    let deliveryOrder: DeliveryOrder = promiseResponse[0];
    let deliveryDriver: DeliveryDriver = promiseResponse[1];

    await assignDriverErrorChecks(userId, deliveryDriver, deliveryOrder.customerId, deliveryOrder);

    if (deliveryOrder.driverId != null) {
      if (assignDriverDetails.changeDriver) {
        await deleteChatMessagesAndParticipant(deliveryOrder.driverId, deliveryOrder.chatWithCustomerId, deliveryOrder.chatWithServiceProviderId);
      } else {
        throw new MezError(AssignDriverError.DriverAlreadyAssigned);
      }
    }
    if(deliveryOrder.customerOffer == null) {
      throw new MezError(AssignDriverError.NoCustomerOffer);
    }
    deliveryOrder.deliveryCost = deliveryOrder.customerOffer;
    for (let driverId in deliveryOrder.counterOffers) {
      if(deliveryOrder.counterOffers[parseInt(driverId)].status == CounterOfferStatus.Requested) {
        if(parseInt(driverId) != assignDriverDetails.driverId) {
          deliveryOrder.counterOffers[parseInt(driverId)].status = CounterOfferStatus.Rejected;
        } else {
          deliveryOrder.counterOffers[parseInt(driverId)].status = CounterOfferStatus.Accepted;
          deliveryOrder.deliveryCost = deliveryOrder.counterOffers[parseInt(driverId)].price;
        }
      }
    }
    await updateDeliveryDriver(deliveryOrder, deliveryDriver);

    setDeliveryChatInfo(deliveryOrder, deliveryDriver, deliveryOrder.orderType);

    
    
    if( deliveryDriver.userId != userId)
      sendNotificationToDriver(deliveryDriver, deliveryOrder);
    return {
      success: true
    }
  } catch (e: any) {
    if (e instanceof MezError) {
      if (Object.values(AssignDriverError).includes(e.message as any)) {
        return {
          success: false,
          error: e.message as any
        }
      } else {
        return {
          success: false,
          error: AssignDriverError.UnhandledError,
          unhandledError: e.message as any
        }
      }
    } else {
      throw e
    }

  } finally {
    clearLock(assignDriverDetails.orderId);
  }
};

function sendNotificationToDriver(deliveryDriver: DeliveryDriver, deliveryOrder: DeliveryOrder) {

    let notification: Notification = {
      foreground: <NewDeliveryOrderNotification>{
        time: (new Date()).toISOString(),
        notificationType: NotificationType.NewOrder,
        orderType: deliveryOrder.orderType,
        notificationAction: NotificationAction.ShowPopUp,
        orderId: deliveryOrder.deliveryId,
        // deliveryDriverType: assignDriverDetails.deliveryDriverType
      },
      background: deliveryNewOrderMessage,
      linkUrl: `/orders/${deliveryOrder.deliveryId}`
    };

    pushNotification(
      deliveryDriver.user!.firebaseId!,
      notification,
      deliveryDriver.notificationInfo,
      ParticipantType.DeliveryDriver,
      deliveryDriver.user!.language
    );
}

// async function checkIfOperatorAuthorized(deliveryOrder: DeliveryOrder, userId: number) {
//   switch (deliveryOrder.serviceProviderType) {
//     case DeliveryServiceProviderType.DeliveryCompany:
//       let deliveryOperator: Operator = await getDeliveryOperatorByUserId(userId);
//       if (deliveryOperator.status != AuthorizationStatus.Authorized || deliveryOperator.serviceProviderId != deliveryOrder.serviceProviderId) {
//         throw new MezError(AssignDriverError.InvalidOperator);
//       }
//       break;
//     case DeliveryServiceProviderType.Restaurant:
//       let restaurantOperator: Operator = await getRestaurantOperatorByUserId(userId);
//       if (restaurantOperator.status != AuthorizationStatus.Authorized || restaurantOperator.serviceProviderId != deliveryOrder.serviceProviderId) {
//         throw new MezError(AssignDriverError.InvalidOperator);
//       }
//       break;
//       case DeliveryServiceProviderType.Laundry:
//         let laundryOperator: Operator = await getLaundryOperatorByUserId(userId);
//         if (laundryOperator.status != AuthorizationStatus.Authorized || laundryOperator.serviceProviderId != deliveryOrder.serviceProviderId) {
//           throw new MezError(AssignDriverError.InvalidOperator);
//         }
//         break;
//     default:
//       break;
//   }
// }