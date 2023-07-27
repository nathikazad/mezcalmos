import { HttpsError } from "firebase-functions/v1/auth";
import { calculateDiscount } from "./applyOffer";
import { getCouponDetails, getOfferApplied } from "../shared/graphql/offer/getOffer";
import { getCustomerRestaurantOrders } from "../shared/graphql/restaurant/order/getRestaurantOrder";
import { Cart } from "../shared/models/Services/Restaurant/Cart";
import { ServiceProviderType } from "../shared/models/Services/Service";
import { getCart } from "../shared/graphql/restaurant/cart/getCart";
import { MezError } from "../shared/models/Generic/Generic";
import { Offer } from "../shared/models/Services/Offer";
import { RestaurantOrder } from "../shared/models/Services/Restaurant/RestaurantOrder";

export interface ApplyCouponDetails {
    couponCode: string,
}
export interface CouponResponse {
    success: boolean,
    error?: CouponError
    unhandledError?: string,
  }
  
  enum CouponError {
    UnhandledError = "unhandledError",
    CartNotFound = "cartNotFound",
    InvalidCouponCode = "invalidCouponCode",
    CouponUnavailableOrExpired = "couponUnavailableOrExpired",

    RestaurantClosed = "restaurantClosed",
    CartEmpty = "cartEmpty",
    RestaurantNotApproved = "restaurantNotApproved",
    NotAcceptingDeliveryOrders = "notAcceptingDeliveryOrders",
    RestaurantNotFound = "restaurantNotFound",
    CustomerNotFound = "customerNotFound",
    RestaurantIdMismatch = "restaurantIdMismatch",
    OrderCreationError = "orderCreationError",
    DeliveryCompanyOperatorsNotFound = "deliveryCompanyOperatorsNotFound",
    ServiceProviderDetailsNotFound = "serviceProviderDetailsNotFound",
    NoStripeAccountOfServiceProvider = "noStripeAccountOfServiceProvider",
    UpdateOrderStripeError = "updateOrderStripeError"
  }
  
export async function applyCoupon(customerId: number, applyCouponDetails: ApplyCouponDetails): Promise<CouponResponse> {
    try {
        let cart: Cart = await getCart(customerId);

        let couponPromise = getCouponDetails(
            cart.restaurantId!, 
            ServiceProviderType.Restaurant, 
            applyCouponDetails.couponCode
        );
        let customerRestaurantOrdersPromise = getCustomerRestaurantOrders(customerId, cart.restaurantId!)
        let response = await Promise.all([couponPromise, customerRestaurantOrdersPromise]);
        let coupon: Offer = response[0];
        let customerRestaurantOrders: RestaurantOrder[] = response[1];

        if(coupon.details.validityRangeStart && coupon.details.validityRangeEnd) {
            if(Date.now() < Date.parse(coupon.details.validityRangeStart) 
                || Date.now() > Date.parse(coupon.details.validityRangeEnd)
            ) {
                throw new MezError("couponUnavailableOrExpired");
            }
        }
        // offerApplied // reusable
        if(!(coupon.details.couponReusable)) {
            let appliedCoupon = await getOfferApplied(customerId, coupon.id);
            if(appliedCoupon) {
                throw new HttpsError(
                    "internal",
                    "Coupon cannot be reused"
                );
            }
        }

        if(coupon.details.offerForOrder == "firstOrder") {
            if(customerRestaurantOrders.length) {
                throw new HttpsError(
                    "internal",
                    "Coupon only usable on first order"
                );
            }
        }
        return {
            [coupon.id]: {
                discountType: coupon.details.discountType,
                discountAmount: calculateDiscount(cart, coupon)
            }
        }
    } catch (e: any) {
        if (e instanceof MezError) {
            if (Object.values(CouponError).includes(e.message as any)) {
                return {
                    success: false,
                    error: e.message as any
                }
            } else {
                return {
                    success: false,
                    error: CouponError.UnhandledError,
                    unhandledError: e.message as any
                }
            }
        } else {
            throw e
        }
    }
}