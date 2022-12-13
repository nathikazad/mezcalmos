import * as functions from "firebase-functions";
import { NewRestaurantOrderNotification, RestaurantOrder, RestaurantOrderStatus, RestaurantOrderType } from '../shared/models/Services/Restaurant/RestaurantOrder';
import { OrderType, PaymentType } from "../shared/models/Generic/Order";
import { Location, AppType, ServerResponse, ServerResponseStatus, Language } from "../shared/models/Generic/Generic";
import { HttpsError } from "firebase-functions/v1/auth";
import { getRestaurant } from "../shared/graphql/restaurant/getRestaurant";
import { createRestaurantOrder } from "../shared/graphql/restaurant/order/createRestaurantOrder";
import { Restaurant } from "../shared/models/Services/Restaurant/Restaurant";
import { checkCart } from "../shared/graphql/restaurant/cart/checkCart";
import { clearCart } from "../shared/graphql/restaurant/cart/clearCart";
import { setOrderChatInfo } from "../shared/graphql/chat/setChatInfo";
import { getCart } from "../shared/graphql/restaurant/cart/getCart";
import { getCustomer } from "../shared/graphql/restaurant/customer/getCustomer";
import { getMezAdmins } from "../shared/graphql/restaurant/mezAdmin/getMezAdmins";
import { CustomerInfo, MezAdmin } from "../shared/models/Generic/User";
import { Notification, NotificationAction, NotificationType } from "../shared/models/Notification";
import { Cart } from "../shared/models/Services/Restaurant/Cart";
import { orderUrl } from "../utilities/senders/appRoutes";
import { pushNotification } from "../utilities/senders/notifyUser";
import { ParticipantType } from "../shared/models/Generic/Chat";
import { AssignCompanyDetails, assignDeliveryCompany } from "./assignDeliveryCompany";

export interface CheckoutRequest {
  customerAppType: AppType,
  customerLocation: Location,
  deliveryCost: number,
  paymentType: PaymentType,
  notes: string,
  restaurantId: number,
  restaurantOrderType: RestaurantOrderType,
  tripDistance: number,
  tripDuration: number,
  tripPolyline: string,
  selfDelivery: boolean
}

export async function checkout(customerId: number, checkoutRequest: CheckoutRequest): Promise<ServerResponse> {

  console.log("\n\n[+] CustomerId ==> \n\n", customerId);
  console.log("\n\n[+] checkoutRequest ==> \n\n", checkoutRequest);
  console.log("\n\n[+] restaurantId ==> \n\n", checkoutRequest.restaurantId);
  let restaurantPromise = getRestaurant(checkoutRequest.restaurantId);
  let customerCartPromise = getCart(customerId);
  let customerPromise = getCustomer(customerId);
  let mezAdminsPromise = getMezAdmins();

  let response = await Promise.all([restaurantPromise, customerCartPromise, customerPromise, mezAdminsPromise])
  let restaurant: Restaurant = response[0];
  let customerCart: Cart = response[1];
  let customer: CustomerInfo = response[2];
  let mezAdmins: MezAdmin[] = response[3];
  errorChecks(restaurant, checkoutRequest, customerId, customerCart);

  let restaurantOrder: RestaurantOrder = {
    customerId,
    restaurantId: checkoutRequest.restaurantId,
    paymentType: checkoutRequest.paymentType,
    toLocation: checkoutRequest.customerLocation,
    status: RestaurantOrderStatus.OrderReceived,
    orderType: checkoutRequest.restaurantOrderType,
    customerAppType: checkoutRequest.customerAppType,
    items: customerCart.items,
    deliveryCost: checkoutRequest.deliveryCost,
  }

  // let chain = getHasura();
  // let response = await getCheckoutDetails()

  if (!cart.to) {
    return {
      status: ServerResponseStatus.Error,
      errorMessage: "Shipping address can't be null!"
    }
  }

  try {
    // if (data.stripePaymentId) {
    //   order = (await updateOrderIdAndFetchPaymentInfo(orderId, order, data.stripePaymentId, data.stripeFees)) as RestaurantOrder
    // }

    let orderResponse = await createRestaurantOrder(restaurantOrder, restaurant);
    
    // clear user cart 
    clearCart(customerId);
    console.log(customer);
    setOrderChatInfo(restaurantOrder, restaurant, orderResponse.deliveryOrder, customer);

    notifyAdmins(mezAdmins, orderResponse.restaurantOrder.orderId!, restaurant);

    notifyOperators(orderResponse.restaurantOrder.orderId!, restaurant);

    if(!(checkoutRequest.selfDelivery)) {
      let assignDetails: AssignCompanyDetails = {
        deliveryCompanyId: 1,
        restaurantOrderId: orderResponse.restaurantOrder.orderId!
      }
      await assignDeliveryCompany(0, assignDetails)
    }

    return <ServerResponse> {
      status: ServerResponseStatus.Success,
      orderId: orderResponse.restaurantOrder.orderId
    }
  } catch (e) {
    functions.logger.error(e);
    functions.logger.error(`Order request error ${customerId}`);
    throw new HttpsError(
      "internal",
       (<Error>e).message
    )
  }
}
function errorChecks(restaurant: Restaurant, checkoutRequest: CheckoutRequest, customerId: number, cart: Cart) {

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
}

function notifyAdmins(mezAdmins: MezAdmin[], orderId: number, restaurant: Restaurant) {

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
        id: restaurant.restaurantId
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
      pushNotification(m.user?.firebaseId!, notification, m.notificationInfo, ParticipantType.MezAdmin);
  });
}

function notifyOperators(orderId: number, restaurant: Restaurant) {
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
        id: restaurant.restaurantId
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
  if(restaurant.restaurantOperators != undefined) {
    restaurant.restaurantOperators.forEach((r) => {
      if(r.user) {
        pushNotification(r.user.firebaseId, notification, r.notificationInfo, ParticipantType.RestaurantOperator);
      }
    });
  }
}
