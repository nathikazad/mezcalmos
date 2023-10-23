import { NewRestaurantOrderNotification } from "../shared/models/Services/Restaurant/RestaurantOrder";
import {
  DeliveryType,
  OrderType,
  PaymentType,
} from "../shared/models/Generic/Order";
import {
  Location,
  Language,
  CustomerAppType,
  MezError,
} from "../shared/models/Generic/Generic";
import { getRestaurant } from "../shared/graphql/restaurant/getRestaurant";
import { createRestaurantOrder } from "../shared/graphql/restaurant/order/createRestaurantOrder";
import { checkCart } from "../shared/graphql/restaurant/cart/checkCart";
import { clearCart } from "../shared/graphql/restaurant/cart/clearCart";
import { setRestaurantOrderChatInfo } from "../shared/graphql/chat/setChatInfo";
import { getCart } from "../shared/graphql/restaurant/cart/getCart";
import { getCustomer } from "../shared/graphql/user/customer/getCustomer";
import { getMezAdmins } from "../shared/graphql/user/mezAdmin/getMezAdmin";
import { CustomerInfo, MezAdmin } from "../shared/models/Generic/User";
import {
  ForegroundNotification,
  Notification,
  NotificationAction,
  NotificationType,
} from "../shared/models/Notification";
import { Cart } from "../shared/models/Services/Restaurant/Cart";
import { orderUrl } from "../utilities/senders/appRoutes";
import { pushNotification } from "../utilities/senders/notifyUser";
import { ParticipantType } from "../shared/models/Generic/Chat";
import {
  PaymentDetails,
  updateOrderIdAndFetchPaymentInfo,
} from "../utilities/stripe/payment";
import { updateDeliveryOrderCompany } from "../shared/graphql/delivery/updateDelivery";
import { ServiceProvider } from "../shared/models/Services/Service";
import { calculateRestaurantOfferDiscount } from "../shared/helper";
import { updateOffersApplied } from "../shared/graphql/offer/updateOffer";
import { Offer, OfferApplied } from "../shared/models/Services/Offer";
import { fetchOffers } from "../shared/graphql/offer/getOffer";
// import { notifyDeliveryCompany } from '../shared/helper';
import { notifyDrivers } from "../utilities/senders/whatsapp/handleWhatsapp";
import { getHasura } from "../utilities/hasura";

export interface CheckoutRequest {
  customerAppType: CustomerAppType;
  customerLocation: Location;
  deliveryCost: number;
  paymentType: PaymentType;
  notes?: string;
  restaurantId: number;
  deliveryType?: DeliveryType;
  tripDistance: number;
  tripDuration: number;
  tripPolyline: string;
  scheduledTime?: string;
  stripePaymentId?: string;
  commission?: number;
  influenceId?: number,
  offerId?: number,
  stripeFees?: number;
  distanceFromBase?: number;
  tax?: number;
  discountValue?: number;
}
export interface CheckoutResponse {
  success: boolean;
  error?: CheckoutResponseError;
  unhandledError?: string;
  orderId?: number;
}

enum CheckoutResponseError {
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
  UpdateOrderStripeError = "updateOrderStripeError",
}

export async function checkout(
  customerId: number,
  checkoutRequest: CheckoutRequest
): Promise<CheckoutResponse> {
  try {
    let response = await Promise.all([
      getRestaurant(checkoutRequest.restaurantId),
      getCart(customerId),
      getCustomer(customerId),
      getMezAdmins(),
    ]);
    let restaurant: ServiceProvider = response[0];
    let customerCart: Cart = response[1];
    let customer: CustomerInfo = response[2];
    let mezAdmins: MezAdmin[] = response[3];
    errorChecks(restaurant, checkoutRequest, customerId, customerCart);

    let orderResponse = await createRestaurantOrder(
      restaurant,
      checkoutRequest,
      customerCart,
      mezAdmins
    );

    setRestaurantOrderChatInfo(
      orderResponse.restaurantOrder,
      restaurant,
      orderResponse.deliveryOrder,
      customer
    );

    notifyAdmins(mezAdmins, orderResponse.restaurantOrder.orderId, restaurant);

    notifyOperators(orderResponse.restaurantOrder.orderId, restaurant);

    if (
      orderResponse.restaurantOrder.deliveryType == DeliveryType.Delivery &&
      restaurant.deliveryDetails.selfDelivery == false
    ) {
      updateDeliveryOrderCompany(orderResponse.deliveryOrder.deliveryId, 3);
      notifyDrivers(
        buildNotification(
          customer?.name,
          restaurant.name,
          orderResponse.deliveryOrder.deliveryId
        )
      );
      console.log(
        `Order total: ${customerCart.cost} restauant order id:${orderResponse.restaurantOrder.orderId} notifying drivers`
      );
      // notifyDeliveryCompany(orderResponse.deliveryOrder);
      if(checkoutRequest.influenceId != null) {
        let chain = getHasura();
        chain.mutation({
          insert_service_provider_offer_applied_one: [{
            object: {
              order_type: "restaurant",
              order_id: orderResponse.restaurantOrder.orderId,
              order_total: orderResponse.restaurantOrder.totalCost,
              influencer_id: checkoutRequest.influenceId,
              comission: checkoutRequest.commission,
              discount: checkoutRequest.discountValue,
              offer_id: checkoutRequest.offerId
            }
          }, {
            id: true
          }]
        })
      }
    } else {
      console.log(
        `Order total: ${customerCart.cost} restauant order id:${orderResponse.restaurantOrder.orderId} NOTTTTT notifying drivers`
      );
    }

    if (checkoutRequest.paymentType == PaymentType.Card) {
      let paymentDetails: PaymentDetails = {
        orderId: orderResponse.restaurantOrder.orderId,
        serviceProviderDetailsId: restaurant.serviceProviderDetailsId,
      };
      //TODO @sanchit: verify that the card has been verified using 3DS and status is not 'requires_action'
      await updateOrderIdAndFetchPaymentInfo(
        paymentDetails,
        checkoutRequest.stripePaymentId!,
        checkoutRequest.stripeFees ?? 0
      );
    }
    // clear user cart
    clearCart(customerId);

    if (customerCart.appliedOffers.length > 0) {
      const offers: Offer[] = await fetchOffers(customerCart.appliedOffers);

      // calculate discount
      let offersApplied: OfferApplied[] = [];
      for (let offer of offers) {
        const offerResponse = await calculateRestaurantOfferDiscount(
          customerCart,
          offer
        );
        offersApplied.push({
          orderId: orderResponse.restaurantOrder.orderId,
          offerId: offer.id,
          orderType: OrderType.Restaurant,
          discount: offerResponse.discount,
          commission: offerResponse.commission,
        });
      }

      updateOffersApplied(
        orderResponse.restaurantOrder.orderId,
        offersApplied,
        OrderType.Restaurant
      );
    }
    return {
      success: true,
      orderId: orderResponse.restaurantOrder.orderId,
    };
  } catch (e: any) {
    if (e instanceof MezError) {
      if (Object.values(CheckoutResponseError).includes(e.message as any)) {
        return {
          success: false,
          error: e.message as any,
        };
      } else {
        return {
          success: false,
          error: CheckoutResponseError.UnhandledError,
          unhandledError: e.message as any,
        };
      }
    } else {
      throw e;
    }
  } finally {
    // release the lock
  }

  function buildNotification(
    customerName: string | undefined,
    restaurantName: string | undefined,
    orderId: number | undefined
  ): Notification {
    return {
      foreground: <ForegroundNotification>{
        time: new Date().toISOString(),
        notificationType: NotificationType.NewMessage,
        notificationAction: NotificationAction.ShowSnackbarOnlyIfNotOnPage,
      },
      background: {
        en: {
          title: `New Order`,
          body: `Order from ${customerName} for restaurant ${restaurantName}`,
        },
        es: {
          title: `Nuevo Pedido`,
          body: `Pedido de ${customerName} para restaurante ${restaurantName}`,
        },
      },
      linkUrl: `/orders/${orderId}`,
    };
  }
}
function errorChecks(
  restaurant: ServiceProvider,
  checkoutRequest: CheckoutRequest,
  customerId: number,
  cart: Cart
) {
  checkCart(customerId, checkoutRequest.restaurantId);
  if (restaurant.approved == false) {
    throw new MezError(CheckoutResponseError.RestaurantNotApproved);
  }
  if (
    restaurant.openStatus != "open" &&
    checkoutRequest.scheduledTime == null
  ) {
    throw new MezError(CheckoutResponseError.RestaurantClosed);
  }
  if ((cart.items.length ?? 0) == 0) {
    throw new MezError(CheckoutResponseError.CartEmpty);
  }
  if (
    checkoutRequest.deliveryType == undefined ||
    checkoutRequest.deliveryType == DeliveryType.Delivery
  ) {
    if (restaurant.deliveryDetails.deliveryAvailable == false) {
      throw new MezError(CheckoutResponseError.NotAcceptingDeliveryOrders);
    }
  }
}

function notifyAdmins(
  mezAdmins: MezAdmin[],
  orderId: number,
  restaurant: ServiceProvider
) {
  let notification: Notification = {
    foreground: <NewRestaurantOrderNotification>{
      time: new Date().toISOString(),
      notificationType: NotificationType.NewOrder,
      orderType: OrderType.Restaurant,
      orderId: orderId,
      notificationAction: NotificationAction.ShowSnackBarAlways,
      restaurant: {
        name: restaurant.name,
        image: restaurant.image,
        id: restaurant.id,
      },
    },
    background: {
      [Language.ES]: {
        title: "Nueva Pedido",
        body: `Hay una nueva orden de alimento`,
      },
      [Language.EN]: {
        title: "New Order",
        body: `There is a new restaurant order`,
      },
    },
    linkUrl: orderUrl(OrderType.Restaurant, orderId),
  };
  mezAdmins.forEach((m) => {
    pushNotification(
      m.firebaseId!,
      notification,
      m.notificationInfo,
      ParticipantType.MezAdmin,
      m.language
    );
  });
}

function notifyOperators(orderId: number, restaurant: ServiceProvider) {
  let notification: Notification = {
    foreground: <NewRestaurantOrderNotification>{
      time: new Date().toISOString(),
      notificationType: NotificationType.NewOrder,
      orderType: OrderType.Restaurant,
      orderId,
      notificationAction: NotificationAction.ShowSnackBarAlways,
      restaurant: {
        name: restaurant.name,
        image: restaurant.image,
        id: restaurant.id,
      },
    },
    background: {
      [Language.ES]: {
        title: "Nueva Pedido",
        body: `Hay una nueva orden de alimento`,
      },
      [Language.EN]: {
        title: "New Order",
        body: `There is a new restaurant order`,
      },
    },
    linkUrl: orderUrl(OrderType.Restaurant, orderId),
  };
  if (restaurant.operators != undefined) {
    restaurant.operators.forEach((r) => {
      if (r.user) {
        pushNotification(
          r.user.firebaseId,
          notification,
          r.notificationInfo,
          ParticipantType.RestaurantOperator,
          r.user.language
        );
      }
    });
  }
}
