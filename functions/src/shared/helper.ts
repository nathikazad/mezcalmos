import { deliveryNewOrderMessage } from "../delivery/bgNotificationMessages";
import { RemoveDriverError } from "../delivery/removeDriver";
import { getHasura } from "../utilities/hasura";
import { pushNotification } from "../utilities/senders/notifyUser";
import { getDeliveryDrivers } from "./graphql/delivery/driver/getDeliveryDriver";
import { getDeliveryOperatorByUserId, getDeliveryOperators } from "./graphql/delivery/operator/getDeliveryOperator";
import { getLaundryOperatorByUserId } from "./graphql/laundry/operator/getLaundryOperator";
import { getRestaurantOperatorByUserId } from "./graphql/restaurant/operators/getRestaurantOperators";
import { getMezAdmin } from "./graphql/user/mezAdmin/getMezAdmin";
import { ParticipantType } from "./models/Generic/Chat";
import { DeliveryOrder, DeliveryDriver, DeliveryServiceProviderType } from "./models/Generic/Delivery";
import { AuthorizationStatus, MezError } from "./models/Generic/Generic";
import { OrderNotification, NotificationType, NotificationAction, Notification } from "./models/Notification";
import { BusinessCart } from "./models/Services/Business/BusinessOrder";
import { CommissionType, DiscountType, Offer } from "./models/Services/Offer";
import { Cart } from "./models/Services/Restaurant/Cart";
import { Operator } from "./models/Services/Service";

export async function isMezAdmin(userId: number): Promise<boolean> {
    try {
        await getMezAdmin(userId);
        return true;
    } catch(error) {
        return false;
    }
}

export async function notifyDeliveryCompany(deliveryOrder: DeliveryOrder) {
    let deliveryOperators: Operator[] = await getDeliveryOperators(deliveryOrder.serviceProviderId);
    let deliveryDrivers: DeliveryDriver[] = await getDeliveryDrivers(deliveryOrder.serviceProviderId);
  
    let notification: Notification = {
      foreground: <OrderNotification>{
        time: (new Date()).toISOString(),
        notificationType: NotificationType.NewOrder,
        orderType: deliveryOrder.orderType,
        notificationAction: NotificationAction.ShowPopUp,
        orderId: deliveryOrder.deliveryId
      },
      background: deliveryNewOrderMessage,
      linkUrl: `/deliveryOrders/${deliveryOrder.deliveryId}`
    }
  
    deliveryOperators.forEach((d) => {
      pushNotification(d.user?.firebaseId!, notification, d.notificationInfo, ParticipantType.DeliveryOperator, d.user?.language);
    });
    
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
    notification.linkUrl = `/orders/${deliveryOrder.deliveryId}`
    deliveryDrivers.forEach((d) => {
      pushNotification(d.user?.firebaseId!, notification, d.notificationInfo, ParticipantType.DeliveryDriver, d.user?.language);
    });
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

export async function calculateRestaurantOfferDiscount(cart: Cart, offer: Offer): Promise<{discount: number, commission: number}> {

  let chain = getHasura();
  
  let discount: number = 0;
  if(offer.details.offerForItems == null) {
    switch (offer.details.discountType) {
      case DiscountType.FlatAmount:
        discount = offer.details.discountValue;
        break;
      case DiscountType.Percentage:
        discount = cart.cost * offer.details.discountValue / 100;
      default:
        break;
    }
  } else if(offer.details.offerForItems == "particularItems") {
    switch (offer.details.discountType) {
      case DiscountType.FlatAmount:
        let numberOfItems: number = 0;
        cart.items.forEach((i) => {
          if(offer.details.items?.find((j) => j == i.itemId)) {
            numberOfItems += i.quantity;
          }
        })
        discount = offer.details.discountValue * numberOfItems;
        break;
      case DiscountType.Percentage:
        cart.items.forEach((i) => {
          if(offer.details.items?.find((j) => j == i.itemId)) {
            discount += i.costPerOne * i.quantity * offer.details.discountValue / 100;
          }
        })
      break;
    }
  } else if(offer.details.offerForItems == "particularCategories") {
    switch (offer.details.discountType) {
      case DiscountType.FlatAmount:
        let numberOfItems: number = 0;
        cart.items.forEach((i) => {
          if(offer.details.categories?.find((j) => j == i.categoryId)) {
            numberOfItems += i.quantity;
          }
        })
        discount = offer.details.discountValue * numberOfItems;
        break;
      case DiscountType.Percentage:
        cart.items.forEach((i) => {
          if(offer.details.categories?.find((j) => j == i.categoryId)) {
            discount += i.costPerOne * i.quantity * offer.details.discountValue / 100;
          }
        })
        break;
    }
  }
  let commission: number = 0;
  if( offer.details.influencerCommission) {
    switch (offer.details.influencerCommission.commissionType) {
      case CommissionType.FlatAmount:
        commission = offer.details.influencerCommission.value;
        break;
      case CommissionType.Percentage:
        commission = cart.cost * offer.details.influencerCommission.value / 100;
        break;
    }
  }
  return {
    discount,
    commission
  }
}


export async function calculateBusinessOfferDiscount(cart: BusinessCart, offer: Offer): Promise<{discount: number, commission: number}> {

  let chain = getHasura();
  
  let discount: number = 0;
  if(offer.details.offerForItems == null) {
    switch (offer.details.discountType) {
      case DiscountType.FlatAmount:
        discount = offer.details.discountValue;
        break;
      case DiscountType.Percentage:
        discount = cart.cost * offer.details.discountValue / 100;
      default:
        break;
    }
  } else if(offer.details.offerForItems == "particularItems") {
    switch (offer.details.discountType) {
      case DiscountType.FlatAmount:
        cart.items.forEach((i) => {
          if(offer.details.items?.find((j) => j == i.itemId)) {
            discount += offer.details.discountValue;
          }
        })
        break;
      case DiscountType.Percentage:
        cart.items.forEach((i) => {
          if(offer.details.items?.find((j) => j == i.itemId)) {
            discount += i.cost * offer.details.discountValue / 100;
          }
        })
      break;
    }
  } else if(offer.details.offerForItems == "particularServices") {
    switch (offer.details.discountType) {
      case DiscountType.FlatAmount:
        cart.items.forEach((i) => {
          if(offer.details.offeringTypes?.find((j) => j == i.offeringType)) {
            discount += offer.details.discountValue;
          }
        })
        break;
      case DiscountType.Percentage:
        cart.items.forEach((i) => {
          if(offer.details.offeringTypes?.find((j) => j == i.offeringType)) {
            discount += i.cost * offer.details.discountValue / 100;
          }
        })
        break;
    }
  }
  let commission: number = 0;
  if( offer.details.influencerCommission) {
    switch (offer.details.influencerCommission.commissionType) {
      case CommissionType.FlatAmount:
        commission = offer.details.influencerCommission.value;
        break;
      case CommissionType.Percentage:
        commission = cart.cost * offer.details.influencerCommission.value / 100;
        break;
    }
  }
  return {
    discount,
    commission
  }
}