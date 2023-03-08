import { NewRestaurantOrderNotification  } from '../shared/models/Services/Restaurant/RestaurantOrder';
import { DeliveryType, OrderType, PaymentType } from "../shared/models/Generic/Order";
import { Location, Language, CustomerAppType } from "../shared/models/Generic/Generic";
import { HttpsError } from "firebase-functions/v1/auth";
import { getRestaurant } from "../shared/graphql/restaurant/getRestaurant";
import { createRestaurantOrder } from "../shared/graphql/restaurant/order/createRestaurantOrder";
import { checkCart } from "../shared/graphql/restaurant/cart/checkCart";
import { clearCart } from "../shared/graphql/restaurant/cart/clearCart";
import { setRestaurantOrderChatInfo } from "../shared/graphql/chat/setChatInfo";
import { getCart } from "../shared/graphql/restaurant/cart/getCart";
import { getCustomer } from "../shared/graphql/user/customer/getCustomer";
import { getMezAdmins } from "../shared/graphql/user/mezAdmin/getMezAdmin";
import { CustomerInfo, MezAdmin } from "../shared/models/Generic/User";
import { Notification, NotificationAction, NotificationType } from "../shared/models/Notification";
import { Cart } from "../shared/models/Services/Restaurant/Cart";
import { orderUrl } from "../utilities/senders/appRoutes";
import { pushNotification } from "../utilities/senders/notifyUser";
import { ParticipantType } from "../shared/models/Generic/Chat";
import { PaymentDetails, updateOrderIdAndFetchPaymentInfo } from "../utilities/stripe/payment";
import { updateDeliveryOrderCompany } from '../shared/graphql/delivery/updateDelivery';
import { ServiceProvider } from '../shared/models/Services/Service';
import { notifyDeliveryCompany } from '../shared/helper';

export interface CheckoutRequest {
  customerAppType: CustomerAppType,
  customerLocation: Location,
  deliveryCost: number,
  paymentType: PaymentType,
  notes?: string,
  restaurantId: number,
  deliveryType?: DeliveryType,
  tripDistance: number,
  tripDuration: number,
  tripPolyline: string,
  scheduledTime?: string,
  stripePaymentId?: string,
  stripeFees?: number,
  distanceFromBase?: number
  tax?: number,
  discountValue?: number
}
export interface CheckoutResponse {
  orderId: number,
}

export async function checkout(customerId: number, checkoutRequest: CheckoutRequest): Promise<CheckoutResponse> {

  console.log("\n\n[+] CustomerId ==> \n\n", customerId);
  console.log("\n\n[+] CustomerId ==> \n\n", checkoutRequest.scheduledTime);
  console.log("\n\n[+] checkoutRequest ==> \n\n", checkoutRequest);
  console.log("\n\n[+] restaurantId ==> \n\n", checkoutRequest.restaurantId);
  let restaurantPromise = getRestaurant(checkoutRequest.restaurantId);
  let customerCartPromise = getCart(customerId);
  let customerPromise = getCustomer(customerId);
  let mezAdminsPromise = getMezAdmins();

  let response = await Promise.all([restaurantPromise, customerCartPromise, customerPromise, mezAdminsPromise])
  let restaurant: ServiceProvider = response[0];
  let customerCart: Cart = response[1];
  let customer: CustomerInfo = response[2];
  let mezAdmins: MezAdmin[] = response[3];
  console.log(mezAdmins)
  errorChecks(restaurant, checkoutRequest, customerId, customerCart);

  console.log("+ Items[0].SelectedOptions ==> " ,customerCart.items[0].selectedOptions);
  console.log("+ Items ==> " , customerCart.items);

  let orderResponse = await createRestaurantOrder(restaurant, checkoutRequest, customerCart, mezAdmins);
  console.log("🤑🤑🤑🤑🤑🤑🤑🤑")
  setRestaurantOrderChatInfo(orderResponse.restaurantOrder, restaurant, orderResponse.deliveryOrder, customer);

  notifyAdmins(mezAdmins, orderResponse.restaurantOrder.orderId, restaurant);

  notifyOperators(orderResponse.restaurantOrder.orderId, restaurant);

  if(orderResponse.restaurantOrder.deliveryType == DeliveryType.Delivery && restaurant.deliveryDetails.selfDelivery == false) {

    updateDeliveryOrderCompany(orderResponse.deliveryOrder.deliveryId, restaurant.deliveryPartnerId!);
    notifyDeliveryCompany(orderResponse.deliveryOrder, restaurant.deliveryPartnerId!, OrderType.Restaurant);
  }
  
 
  if(checkoutRequest.paymentType == PaymentType.Card) {
    let paymentDetails: PaymentDetails = {
      orderId: orderResponse.restaurantOrder.orderId,
      serviceProviderDetailsId: restaurant.serviceProviderDetailsId
    }
    await updateOrderIdAndFetchPaymentInfo(paymentDetails, checkoutRequest.stripePaymentId!, checkoutRequest.stripeFees ?? 0)
  }
  
  // clear user cart 
  clearCart(customerId);
  // return <CheckoutResponse> {
  //   orderId: restaurantOrder.orderId
  // }
  return {
    orderId: orderResponse.restaurantOrder.orderId
  }
}
function errorChecks(restaurant: ServiceProvider, checkoutRequest: CheckoutRequest, customerId: number, cart: Cart) {

  checkCart(customerId, checkoutRequest.restaurantId);
  if(restaurant.approved == false) {
    throw new HttpsError(
      "internal",
      "Restaurant is not approved and taking orders right now"
    );
  }
  if(restaurant.openStatus != "open") {
    throw new HttpsError(
      "internal",
      "Restaurant is closed"
    );
  }
  if((cart.items.length ?? 0) == 0) {
    throw new HttpsError(
      "internal",
      "Empty cart"
    );
  }
  if(checkoutRequest.deliveryType == undefined || checkoutRequest.deliveryType == DeliveryType.Delivery) {
    if(restaurant.deliveryDetails.deliveryAvailable) {
      if(restaurant.deliveryDetails.selfDelivery == false) {
        if(restaurant.deliveryPartnerId == null) {
          throw new HttpsError(
            "internal",
            "No delivery partner"
          );
        }
      }
    } else {
      throw new HttpsError(
        "internal",
        "Restaurant not accepting delivery orders"
      );
    }
  }
}

function notifyAdmins(mezAdmins: MezAdmin[], orderId: number, restaurant: ServiceProvider) {

  let notification: Notification = {
    foreground: <NewRestaurantOrderNotification>{
      time: (new Date()).toISOString(),
      notificationType: NotificationType.NewOrder,
      orderType: OrderType.Restaurant,
      orderId: orderId,
      notificationAction: NotificationAction.ShowSnackBarAlways,
      restaurant: {
        name: restaurant.name,
        image: restaurant.image,
        id: restaurant.id
      }
    },
    background: {
      [Language.ES]: {
        title: "Nueva Pedido",
        body: `Hay una nueva orden de alimento`
      },
      [Language.EN]: {
        title: "New Order",
        body: `There is a new restaurant order`
      }
    },
    linkUrl: orderUrl(OrderType.Restaurant, orderId)
  }
  mezAdmins.forEach((m) => {
      pushNotification(m.firebaseId!, notification, m.notificationInfo, ParticipantType.MezAdmin);
  });
}

function notifyOperators(orderId: number, restaurant: ServiceProvider) {
  let notification: Notification = {
    foreground: <NewRestaurantOrderNotification>{
      time: (new Date()).toISOString(),
      notificationType: NotificationType.NewOrder,
      orderType: OrderType.Restaurant,
      orderId,
      notificationAction: NotificationAction.ShowSnackBarAlways,
      restaurant: {
        name: restaurant.name,
        image: restaurant.image,
        id: restaurant.id
      }
    },
    background: {
      [Language.ES]: {
        title: "Nueva Pedido",
        body: `Hay una nueva orden de alimento`
      },
      [Language.EN]: {
        title: "New Order",
        body: `There is a new restaurant order`
      }
    },
    linkUrl: orderUrl(OrderType.Restaurant, orderId)
  }
  if(restaurant.operators != undefined) {
    restaurant.operators.forEach((r) => {
      if(r.user) {
        pushNotification(r.user.firebaseId, notification, r.notificationInfo, ParticipantType.RestaurantOperator);
      }
    });
  }
}