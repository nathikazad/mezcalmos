import { NewRestaurantOrderNotification, RestaurantOrder  } from '../shared/models/Services/Restaurant/RestaurantOrder';
import { DeliveryType, OrderType, PaymentType } from "../shared/models/Generic/Order";
import { Location, Language, CustomerAppType, MezError } from "../shared/models/Generic/Generic";
import { getRestaurant } from "../shared/graphql/restaurant/getRestaurant";
import { createRestaurantOrder2 } from "../shared/graphql/restaurant/order/createRestaurantOrder";
import { checkCart } from "../shared/graphql/restaurant/cart/checkCart";
import { clearCart } from "../shared/graphql/restaurant/cart/clearCart";
import { getCart } from "../shared/graphql/restaurant/cart/getCart";
import { Notification, NotificationAction, NotificationType } from "../shared/models/Notification";
import { Cart } from "../shared/models/Services/Restaurant/Cart";
import { orderUrl } from "../utilities/senders/appRoutes";
import { pushNotification } from "../utilities/senders/notifyUser";
import { ParticipantType } from "../shared/models/Generic/Chat";
import { ServiceProvider } from '../shared/models/Services/Service';

export interface NewCheckoutRequest {
  customerAppType: CustomerAppType,
  customerLocation: Location,
  paymentType: PaymentType,
  notes?: string,
  restaurantId: number,
  deliveryType?: DeliveryType,
  scheduledTime?: string,
  stripePaymentId?: string,
  stripeFees?: number,
  tax?: number,
  discountValue?: number
}
export interface NewCheckoutResponse {
  success: boolean,
  error?: NewCheckoutResponseError
  unhandledError?: string,
  orderId?: number,
}

enum NewCheckoutResponseError {
  UnhandledError = "unhandledError",
  RestaurantClosed = "restaurantClosed",
  CartEmpty = "cartEmpty",
  RestaurantNotApproved = "restaurantNotApproved",
  NotAcceptingDeliveryOrders = "notAcceptingDeliveryOrders",
  RestaurantNotFound = "restaurantNotFound",
  CartNotFound = "cartNotFound",
  CustomerNotFound = "customerNotFound",
  RestaurantIdMismatch = "restaurantIdMismatch",
  OrderCreationError = "orderCreationError",
  DeliveryCompanyOperatorsNotFound = "deliveryCompanyOperatorsNotFound",
  ServiceProviderDetailsNotFound = "serviceProviderDetailsNotFound",
  NoStripeAccountOfServiceProvider = "noStripeAccountOfServiceProvider",
  UpdateOrderStripeError = "updateOrderStripeError"
}

export async function newCheckout(customerId: number, checkoutRequest: NewCheckoutRequest): Promise<NewCheckoutResponse> {
  try {
    let response = await Promise.all([getRestaurant(checkoutRequest.restaurantId), getCart(customerId)]);
    let restaurant: ServiceProvider = response[0];
    let customerCart: Cart = response[1];
    errorChecks(restaurant, checkoutRequest, customerId, customerCart);

    let restaurantOrder: RestaurantOrder = await createRestaurantOrder2(restaurant, checkoutRequest, customerCart);

    // setRestaurantOrderChatInfo(orderResponse.restaurantOrder, restaurant, orderResponse.deliveryOrder, customer);

    // notifyAdmins(mezAdmins, restaurantOrder.orderId, restaurant);

    notifyOperators(restaurantOrder.orderId, restaurant);
    
    // clear user cart 
    clearCart(customerId);

    return {
      success: true,
      orderId: restaurantOrder.orderId
    }
  } catch (e: any) {
    if (e instanceof MezError) {
      if (Object.values(NewCheckoutResponseError).includes(e.message as any)) {
        return {
          success: false,
          error: e.message as any
        }
      } else {
        return {
          success: false,
          error: NewCheckoutResponseError.UnhandledError,
          unhandledError: e.message as any
        }
      }
    } else {
      throw e
    }

  } finally {
    // release the lock
  }
}
function errorChecks(restaurant: ServiceProvider, checkoutRequest: NewCheckoutRequest, customerId: number, cart: Cart) {

  checkCart(customerId, checkoutRequest.restaurantId);
  if(restaurant.approved == false) {
    throw new MezError(NewCheckoutResponseError.RestaurantNotApproved);
  }
  if(restaurant.openStatus != "open" && checkoutRequest.scheduledTime == null) {
    throw new MezError(NewCheckoutResponseError.RestaurantClosed);
  }
  if((cart.items.length ?? 0) == 0) {
    throw new MezError(NewCheckoutResponseError.CartEmpty);

  }
  if(checkoutRequest.deliveryType == undefined || checkoutRequest.deliveryType == DeliveryType.Delivery) {
    if(restaurant.deliveryDetails.deliveryAvailable == false) {
      throw new MezError(NewCheckoutResponseError.NotAcceptingDeliveryOrders);
    }
  }
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
        pushNotification(r.user.firebaseId, notification, r.notificationInfo, ParticipantType.RestaurantOperator, r.user.language);
      }
    });
  }
}
