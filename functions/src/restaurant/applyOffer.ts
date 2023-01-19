import { HttpsError } from "firebase-functions/v1/auth";
import { getCouponDetails, getOfferApplied, getServiceProviderOffers } from "../shared/graphql/offer/getOffer";
import { getCart } from "../shared/graphql/restaurant/cart/getCart";
import { updateCartDiscount } from "../shared/graphql/restaurant/cart/updateCart";
import { getCustomerRestaurantOrders } from "../shared/graphql/restaurant/order/getRestaurantOrder";
import { Cart } from "../shared/models/Services/Restaurant/Cart";
import { Discount, DiscountType, Offer, ServiceProviderType } from "../shared/models/Services/Service";

export async function applyDiscount(customerId: number, couponCode?: string): Promise< Record<number, Discount> > {
    let cart = await getCart(customerId);
    if(!(cart.restaurantId)) {
        throw new HttpsError(
            "internal",
            "Restaurant id not provided"
        );
    }
    let appliedOffers = await applyPromotions(customerId, cart);
    if(couponCode) {
        let coupon = await applyCoupon(customerId, { couponCode: couponCode }, cart);
        appliedOffers = {
            ...appliedOffers,
            ...coupon
        }
    }
    cart.discountValue = 0;
    for(let offerId in appliedOffers) {
        if(appliedOffers[offerId].discountType != DiscountType.StoreCredit) {
            cart.discountValue += appliedOffers[offerId].discountAmount;
        }
    }
    await updateCartDiscount(cart);   
    return appliedOffers;
}

export async function applyPromotions(customerId: number, cart: Cart): Promise< Record<number, Discount> > {
    
    let offersPromise = getServiceProviderOffers(cart.restaurantId!, ServiceProviderType.Restaurant);
    let customerRestaurantOrdersPromise = getCustomerRestaurantOrders(customerId, cart.restaurantId!)
    let response = await Promise.all([offersPromise, customerRestaurantOrdersPromise]);
    let offers = response[0];
    let customerRestaurantOrders = response[1];
    
    let appliedPromotions: Record<number, Discount> = {};
    offers.forEach(async (o) => {
        if(o.details.validityRangeStart && o.details.validityRangeEnd) {
            if(o.details.weeklyRepeat) {
                let currentTime = new Date();
                let validityRangeStart = new Date(o.details.validityRangeStart);
                let validityRangeEnd = new Date(o.details.validityRangeEnd);

                if(currentTime.getDay() < validityRangeStart.getDay() || 
                    currentTime.getDay() > validityRangeEnd.getDay()
                ) return;
                else if(currentTime.getDay() == validityRangeStart.getDay()) {
                    if(currentTime.getHours() < validityRangeStart.getHours()) return;
                    if((currentTime.getHours() == validityRangeStart.getHours()) 
                        && (currentTime.getMinutes() < validityRangeStart.getMinutes())
                    ) return;
                    if(currentTime.getHours() > validityRangeEnd.getHours()) return;
                    if((currentTime.getHours() == validityRangeEnd.getHours()) 
                        && (currentTime.getMinutes() > validityRangeEnd.getMinutes())
                    ) return;
                }
            } else if(Date.now() < Date.parse(o.details.validityRangeStart) 
                || Date.now() > Date.parse(o.details.validityRangeEnd)
            ) return;
        }
        if(o.details.offerForOrder == "first_order") {
            if(customerRestaurantOrders.length) return;
        }
        appliedPromotions[o.id] = {
            discountType: o.details.discountType,
            discountAmount: calculateDiscount(cart, o)
        }
    });

    return appliedPromotions;
}

export interface ApplyCouponDetails {
    couponCode: string
}
export async function applyCoupon(customerId: number, applyCouponDetails: ApplyCouponDetails, cart: Cart): Promise<Record<number, Discount>> {
    
    let couponPromise = getCouponDetails(
        cart.restaurantId!, 
        ServiceProviderType.Restaurant, 
        applyCouponDetails.couponCode
    );
    let customerRestaurantOrdersPromise = getCustomerRestaurantOrders(customerId, cart.restaurantId!)
    let response = await Promise.all([couponPromise, customerRestaurantOrdersPromise]);
    let coupon = response[0];
    let customerRestaurantOrders = response[1];

    if(coupon.details.validityRangeStart && coupon.details.validityRangeEnd) {
        if(Date.now() < Date.parse(coupon.details.validityRangeStart) 
            || Date.now() > Date.parse(coupon.details.validityRangeEnd)
        ) {
            throw new HttpsError(
                "internal",
                "Coupon unavailable or expired 2"
            );
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

    if(coupon.details.offerForOrder == "first_order") {
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
}

function calculateDiscount(cart: Cart, offer: Offer/*, applyStoreCredit: boolean*/): number {
    let discountValue = 0;
    if(offer.details.discountType == DiscountType.StoreCredit/* && applyStoreCredit*/) {
    //         updateStoreCredit(
    //             cart.restaurantId!, 
    //             ServiceProviderType.Restaurant, 
    //             cart.customerId, 
    //             offer.details.discountValue
    //         );
        discountValue = offer.details.discountValue;
    } else 
    if(offer.details.discountType == DiscountType.FlatAmount) {
        if(offer.details.offerForItems) {
            if(offer.details.offerForItems == "particular_items") {
                cart.items.forEach((i) => {
                    offer.details.items?.forEach((c) => {
                        if(c == i.itemId) {
                            discountValue += offer.details.discountValue * i.quantity;
                        }
                    })
                })
            } else if(offer.details.offerForItems == "particular_categories") {
                cart.items.forEach((i) => {
                    offer.details.categories?.forEach((c) => {
                        if(c == i.categoryId) {
                            discountValue += offer.details.discountValue * i.quantity;
                        }
                    })
                })
            }
        } else {
            discountValue = offer.details.discountValue;
        }
    } else if(offer.details.discountType == DiscountType.Percentage) {
        if(offer.details.offerForItems) {
            if(offer.details.offerForItems == "particular_items") {
                cart.items.forEach((i) => {
                    offer.details.items?.forEach((c) => {
                        if(c == i.itemId) {
                            discountValue += (i.costPerOne * i.quantity) * offer.details.discountValue / 100;
                        }
                    })
                })
            } else {
                cart.items.forEach((i) => {
                    offer.details.categories?.forEach((c) => {
                        if(c == i.categoryId) {
                            discountValue += (i.costPerOne * i.quantity) * offer.details.discountValue / 100;
                        }
                    })
                })
            }
        } else {
            discountValue = (cart.cost) * offer.details.discountValue / 100;
        }
    } else if(offer.details.discountType == DiscountType.AnotherSameFlat) {
        let sameItems: number = 0;
        if(offer.details.offerForItems == "particular_items") {
            for(let cartItem of cart.items) {
                for(let itemId of offer.details.items!) {
                    if(cartItem.itemId == itemId) {
                        sameItems += cartItem.quantity;
                    }
                }
            }
        } else {
            for(let cartItem of cart.items) {
                for(let categoryId of offer.details.categories!) {
                    if(cartItem.categoryId == categoryId) {
                        sameItems += cartItem.quantity;
                    }
                }
            }
        }
        discountValue = Math.trunc(sameItems / 2) * offer.details.discountValue;
    } else if(offer.details.discountType == DiscountType.AnotherSamePercentage) {
        let sameItems: number = 0;
        let leastCost = 1000000000;
        if(offer.details.offerForItems == "particular_items") {
            for(let cartItem of cart.items) {
                for(let itemId of offer.details.items!) {
                    if(cartItem.itemId == itemId) {
                        sameItems += cartItem.quantity;
                        leastCost = Math.min(leastCost, cartItem.costPerOne);
                    }
                }
            }
        } else {
            for(let cartItem of cart.items) {
                for(let categoryId of offer.details.categories!) {
                    if(cartItem.categoryId == categoryId) {
                        sameItems += cartItem.quantity;
                        leastCost = Math.min(leastCost, cartItem.costPerOne);
                    }
                }
            }
        }
        discountValue = Math.trunc(sameItems / 2) * leastCost * offer.details.discountValue / 100.0;
    }
    return discountValue;
}