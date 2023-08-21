import { deleteChatMessagesAndParticipant } from "../shared/graphql/chat/deleteChatMessages";
import { updateTaxiChatInfo } from "../shared/graphql/chat/setChatInfo";
import { getTaxiDriver } from "../shared/graphql/taxi/driver/getTaxiDriver";
import { updateTaxiDriver } from "../shared/graphql/taxi/driver/updateDriver";
import { getTaxiOrder } from "../shared/graphql/taxi/order/getTaxiOrder";
import { assignDriverErrorChecks } from "../shared/helper";
import { ParticipantType } from "../shared/models/Generic/Chat";
import { MezError } from "../shared/models/Generic/Generic";
import { AssignDriverDetails, AssignDriverResponse, AssignDriverError, CounterOfferStatus, OrderType } from "../shared/models/Generic/Order";
import { Notification, NotificationAction, NotificationType, OrderNotification } from "../shared/models/Notification";
import { TaxiDriver } from "../shared/models/Services/Taxi/Taxi";
import { TaxiOrder } from "../shared/models/Services/Taxi/TaxiOrder";
import { pushNotification } from "../utilities/senders/notifyUser";
import { taxiNewOrderMessage } from "./bgNotificationMessages";


export async function assignTaxiDriver(userId: number, assignDriverDetails: AssignDriverDetails): Promise<AssignDriverResponse> {
    try {
        let response = await Promise.all([getTaxiOrder(assignDriverDetails.orderId), getTaxiDriver(assignDriverDetails.driverId)]);
        let order: TaxiOrder = response[0];
        let driver: TaxiDriver = response[1];

        await assignDriverErrorChecks(userId, driver, order.customerId);

        if (order.driverId != null) {
            if (assignDriverDetails.changeDriver) {
                await deleteChatMessagesAndParticipant(order.driverId, order.chatId);
            } else {
                throw new MezError(AssignDriverError.DriverAlreadyAssigned);
            }
        }
        for (let driverId in order.counterOffers) {
            if(order.counterOffers[parseInt(driverId)].status == CounterOfferStatus.Requested) {
                if(parseInt(driverId) != assignDriverDetails.driverId) {
                    order.counterOffers[parseInt(driverId)].status = CounterOfferStatus.Rejected;
                } else {
                    order.counterOffers[parseInt(driverId)].status = CounterOfferStatus.Accepted;
                    order.cost = order.counterOffers[parseInt(driverId)].price;
                }
            }
        }
        await updateTaxiDriver(order, driver);

        updateTaxiChatInfo(order, driver);

        if(driver.userId != userId)
            sendNotificationToDriver(driver, order);
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
        // clearLock(assignDriverDetails.orderId);
    }
}

function sendNotificationToDriver(driver: TaxiDriver, order: TaxiOrder) {

    let notification: Notification = {
      foreground: <OrderNotification>{
        time: (new Date()).toISOString(),
        notificationType: NotificationType.NewOrder,
        orderType: OrderType.Taxi,
        notificationAction: NotificationAction.ShowPopUp,
        orderId: order.id,
        // deliveryDriverType: assignDriverDetails.deliveryDriverType
      },
      background: taxiNewOrderMessage,
      linkUrl: `/orders/${order.id}`
    };

    pushNotification(
      driver.user!.firebaseId!,
      notification,
      driver.notificationInfo,
      ParticipantType.TaxiDriver,
      driver.user!.language
    );
}
