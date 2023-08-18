import { deliveryNewOrderMessage } from "../delivery/bgNotificationMessages";
import { RemoveDriverError } from "../delivery/removeDriver";
import { taxiNewOrderMessage } from "../taxi/bgNotificationMessages";
import { orderUrl } from "../utilities/senders/appRoutes";
import { pushNotification } from "../utilities/senders/notifyUser";
import { getCourierOrderFromDelivery } from "./graphql/delivery/courier/getCourierOrder";
import { getDeliveryDrivers } from "./graphql/delivery/driver/getDeliveryDriver";
import { getDeliveryOperatorByUserId } from "./graphql/delivery/operator/getDeliveryOperator";
import { setNotifiedDeliveryDrivers } from "./graphql/delivery/updateDelivery";
import { getLaundryOperatorByUserId } from "./graphql/laundry/operator/getLaundryOperator";
import { getLaundryOrderFromDelivery } from "./graphql/laundry/order/getLaundryOrder";
import { checkOperator } from "./graphql/operator/updateOperatorStatus";
import { getRestaurantOperatorByUserId } from "./graphql/restaurant/operators/getRestaurantOperators";
import { getRestaurantOrderFromDelivery } from "./graphql/restaurant/order/getRestaurantOrder";
import { getTaxiDrivers } from "./graphql/taxi/driver/getTaxiDriver";
import { setNotifiedTaxiDrivers } from "./graphql/taxi/order/updateOrder";
import { getCustomer } from "./graphql/user/customer/getCustomer";
import { getMezAdmin } from "./graphql/user/mezAdmin/getMezAdmin";
import { ParticipantType } from "./models/Generic/Chat";
import { DeliveryOrder, DeliveryDriver, DeliveryServiceProviderType, DeliveryOrderStatus } from "./models/Generic/Delivery";
import { AuthorizationStatus, Language, MezError } from "./models/Generic/Generic";
import { AssignDriverError, CounterOfferError, OrderType } from "./models/Generic/Order";
import { CustomerInfo, MezAdmin } from "./models/Generic/User";
import { OrderNotification, NotificationType, NotificationAction, Notification } from "./models/Notification";
import { CourierOrder } from "./models/Services/Courier/Courier";
import { LaundryOrder } from "./models/Services/Laundry/LaundryOrder";
import { RestaurantOrder } from "./models/Services/Restaurant/RestaurantOrder";
import { Operator } from "./models/Services/Service";
import { TaxiDriver } from "./models/Services/Taxi/Taxi";
import { TaxiOrder, TaxiOrderStatus } from "./models/Services/Taxi/TaxiOrder";

export async function isMezAdmin(userId: number): Promise<boolean> {
    try {
        await getMezAdmin(userId);
        return true;
    } catch(error) {
        return false;
    }
}

export async function notifyDeliveryDrivers(deliveryOrder: DeliveryOrder) {

  let deliveryDrivers: DeliveryDriver[] = await getDeliveryDrivers(deliveryOrder.chosenCompanies!);

  let notification: Notification = {
    foreground: <OrderNotification>{
      time: (new Date()).toISOString(),
      notificationType: NotificationType.NewOrder,
      orderType: deliveryOrder.orderType,
      notificationAction: NotificationAction.ShowPopUp,
      orderId: deliveryOrder.deliveryId
    },
    background: deliveryNewOrderMessage,
    linkUrl: `/orders/${deliveryOrder.deliveryId}`
  }
  
  deliveryDrivers.filter((d) => (d.status == AuthorizationStatus.Authorized && d.online));

  if(deliveryDrivers.length > 10) {
    for(let i=0; i<10; i++) {
      for(let j=10; j<deliveryDrivers.length; j++) {
        if(!(deliveryDrivers[i].currentLocation)) {
          deliveryDrivers[i] = deliveryDrivers[j];
          continue;
        }
        if(!(deliveryDrivers[j].currentLocation))
          continue;
        
        let dist1 = distance(
          deliveryOrder.pickupLocation?.lat ?? deliveryOrder.dropoffLocation.lat, 
          deliveryOrder.pickupLocation?.lng ?? deliveryOrder.dropoffLocation.lng,
          deliveryDrivers[i].currentLocation!.lat,
          deliveryDrivers[i].currentLocation!.lng
        )
        let dist2 = distance(
          deliveryOrder.pickupLocation?.lat ?? deliveryOrder.dropoffLocation.lat, 
          deliveryOrder.pickupLocation?.lng ?? deliveryOrder.dropoffLocation.lng,
          deliveryDrivers[j].currentLocation!.lat,
          deliveryDrivers[j].currentLocation!.lng
        )
        if(dist1 > dist2) {
          let temp = deliveryDrivers[i];
          deliveryDrivers[i] = deliveryDrivers[j];
          deliveryDrivers[j] = temp;
        }
      }
    }
  }
  deliveryDrivers = deliveryDrivers.slice(0, 10);
  let notifiedDrivers: Record<number, boolean> = {};
  deliveryDrivers.forEach((d) => {
    pushNotification(d.user?.firebaseId!, notification, d.notificationInfo, ParticipantType.DeliveryDriver);
    notifiedDrivers[d.id] = false;
  });
  deliveryOrder.notifiedDrivers = notifiedDrivers;
  setNotifiedDeliveryDrivers(deliveryOrder)
}
  
function distance(lat1: number, lon1: number, lat2: number, lon2: number) {
    if ((lat1 == lat2) && (lon1 == lon2)) {
        return 0;
    }
    else {
        var radlat1 = Math.PI * lat1/180;
        var radlat2 = Math.PI * lat2/180;
        var theta = lon1-lon2;
        var radtheta = Math.PI * theta/180;
        var dist = Math.sin(radlat1) * Math.sin(radlat2) + Math.cos(radlat1) * Math.cos(radlat2) * Math.cos(radtheta);
        if (dist > 1) {
            dist = 1;
        }
        dist = Math.acos(dist);
        dist = dist * 180/Math.PI;
        dist = dist * 60 * 1.1515;
        //unit is miles
        return dist;
    }
}

export async function notifyTaxiDrivers(taxiOrder: TaxiOrder) {

  let taxiDrivers: TaxiDriver[] = await getTaxiDrivers(taxiOrder.chosenCompanies);

  let notification: Notification = {
    foreground: <OrderNotification>{
      time: (new Date()).toISOString(),
      notificationType: NotificationType.NewOrder,
      orderType: OrderType.Taxi,
      notificationAction: NotificationAction.ShowPopUp,
      orderId: taxiOrder.id
    },
    background: taxiNewOrderMessage,
    linkUrl: orderUrl(OrderType.Taxi, taxiOrder.id)
  }
  
  taxiDrivers.filter((d) => (d.status == AuthorizationStatus.Authorized && d.online));

  if(taxiDrivers.length > 10) {
    for(let i=0; i<10; i++) {
      for(let j=10; j<taxiDrivers.length; j++) {
        if(!(taxiDrivers[i].currentLocation)) {
          taxiDrivers[i] = taxiDrivers[j];
          continue;
        }
        if(!(taxiDrivers[j].currentLocation))
          continue;
        
        let dist1 = distance(
          taxiOrder.fromLocation.lat, // ?? taxiOrder.dropoffLocation.lat, 
          taxiOrder.fromLocation.lng, // ?? taxiOrder.dropoffLocation.lng,
          taxiDrivers[i].currentLocation!.lat,
          taxiDrivers[i].currentLocation!.lng
        )
        let dist2 = distance(
          taxiOrder.fromLocation.lat, // ?? taxiOrder.dropoffLocation.lat, 
          taxiOrder.fromLocation.lng, // ?? taxiOrder.dropoffLocation.lng,
          taxiDrivers[j].currentLocation!.lat,
          taxiDrivers[j].currentLocation!.lng
        )
        if(dist1 > dist2) {
          let temp = taxiDrivers[i];
          taxiDrivers[i] = taxiDrivers[j];
          taxiDrivers[j] = temp;
        }
      }
    }
  }
  taxiDrivers = taxiDrivers.slice(0, 10);
  let notifiedDrivers: Record<number, boolean> = {};
  taxiDrivers.forEach((d) => {
    pushNotification(d.user?.firebaseId!, notification, d.notificationInfo, ParticipantType.TaxiDriver);
    notifiedDrivers[d.id] = false;
  });
  taxiOrder.notifiedDrivers = notifiedDrivers;
  setNotifiedTaxiDrivers(taxiOrder)
}

export async function checkOperatorAuthorization(userId: number, deliveryServiceProviderType: DeliveryServiceProviderType) {
  if((await isMezAdmin(userId)) == true)
    return;
    
  switch (deliveryServiceProviderType) {
    case DeliveryServiceProviderType.Restaurant:
      let restaurantOperator: Operator = await getRestaurantOperatorByUserId(userId);
      if (!restaurantOperator.owner || restaurantOperator.status != AuthorizationStatus.Authorized) {
        throw new MezError(RemoveDriverError.UnauthorizedAccess);
      }
      break;
    case DeliveryServiceProviderType.Laundry:
      let laundryOperator: Operator = await getLaundryOperatorByUserId(userId);
      if (!laundryOperator.owner || laundryOperator.status != AuthorizationStatus.Authorized) {
        throw new MezError(RemoveDriverError.UnauthorizedAccess);
      }
      break;
    case DeliveryServiceProviderType.DeliveryCompany:
      let deliveryOperator: Operator = await getDeliveryOperatorByUserId(userId);
      if (!deliveryOperator.owner || deliveryOperator.status != AuthorizationStatus.Authorized) {
        throw new MezError(RemoveDriverError.UnauthorizedAccess);
      }
    default:
      break;
  }
}

export function notifyAdminsNewOrder(mezAdmins: MezAdmin[], orderId: number, orderType: OrderType) {

  let notification: Notification = {
      foreground: <OrderNotification>{
          time: (new Date()).toISOString(),
          notificationType: NotificationType.NewOrder,
          orderType: orderType,
          orderId: orderId,
          notificationAction: NotificationAction.ShowSnackBarAlways,
      },
      background: {
          [Language.ES]: {
              title: "Nueva Pedido",
              body: `Hay un nuevo pedido de ${orderType}`
          },
          [Language.EN]: {
              title: "New Order",
              body: `There is a new ${orderType} order`
          }
      },
      linkUrl: orderUrl(orderType, orderId)
  }
  mezAdmins.forEach((m) => {
      pushNotification(m.firebaseId!, notification, m.notificationInfo, ParticipantType.MezAdmin, m.language);
  });
}

export function counterOfferErrorCheck(order: DeliveryOrder | TaxiOrder, driver: DeliveryDriver | TaxiDriver, userId: number) {
  if(order.driverId) {
      throw new MezError(CounterOfferError.DriverAlreadyAssigned);
  }
  if(driver.userId != userId) {
      throw new MezError(CounterOfferError.InvalidDriverId);
  }
  if (order.status != DeliveryOrderStatus.OrderReceived && order.status != TaxiOrderStatus.OrderReceived) {
      throw new MezError(CounterOfferError.StatusNotOrderReceived);
  }
  if(driver.status != AuthorizationStatus.Authorized) {
      throw new MezError(CounterOfferError.DriverUnAuthorized);
  }
  if(order.chosenCompanies?.find(id => id == driver.companyId) == undefined) {
      throw new MezError(CounterOfferError.DriverCompanyNotChosen);
  }
}

export async function notifyCounterOffer(orderType: OrderType, customerId: number, taxiOrderId: number, deliveryOrder?: DeliveryOrder) {
  
  let customer: CustomerInfo = await getCustomer(customerId);
  let orderId: number = taxiOrderId;
  let linkUrlForCustomer: string = `/taxiOrders/${orderId}`;

  if(orderType != OrderType.Taxi && !deliveryOrder)
    return;

  switch (orderType) {
      case OrderType.Restaurant:
          let restaurantOrder: RestaurantOrder = await getRestaurantOrderFromDelivery(deliveryOrder!.deliveryId);
          orderId = restaurantOrder.orderId;
          linkUrlForCustomer = `/restaurantOrders/${orderId}`;
          break;
      case OrderType.Laundry:
          let laundryOrder: LaundryOrder = await getLaundryOrderFromDelivery(deliveryOrder!);
          orderId = laundryOrder.orderId;
          linkUrlForCustomer = `/laundryOrders/${orderId}`;
          break;
      case OrderType.Courier:
          let courierOrder: CourierOrder = await getCourierOrderFromDelivery(deliveryOrder!);
          orderId = courierOrder.id;
          linkUrlForCustomer = `/courierOrders/${orderId}`;
          break;
      // default:
  }

  let notification: Notification = {
      foreground: <OrderNotification>{
          time: (new Date()).toISOString(),
          notificationType: NotificationType.NewCounterOffer,
          orderType: orderType,
          notificationAction: NotificationAction.NavigteToLinkUrl,
          orderId
      },
      background: {
          en: {
              title: `Counter Offer`,
              body: `Driver is requesting counter offer in price`
          },
          es: {
              title: `Contraoferta`,
              body: `El conductor solicita una contraoferta en el precio`
          }
      },
      linkUrl: linkUrlForCustomer
  };
  pushNotification(
      customer.firebaseId,
      notification,
      customer.notificationInfo,
      ParticipantType.Customer,
      customer.language
  );
}

export async function assignDriverErrorChecks(userId: number, driver: DeliveryDriver | TaxiDriver, customerId: number, deliveryOrder?: DeliveryOrder) {
  if ((await isMezAdmin(userId)) == false && driver.userId != userId && customerId != userId) {

    if (deliveryOrder && deliveryOrder.serviceProviderType != DeliveryServiceProviderType.DeliveryCompany)
      checkOperator(userId, deliveryOrder.serviceProviderId!, deliveryOrder.serviceProviderType);
    else
      throw new MezError(AssignDriverError.IncorrectOrderId);
  }
  if (driver.status != AuthorizationStatus.Authorized) {
    throw new MezError(AssignDriverError.UnauthorizedDriver);
  }
}