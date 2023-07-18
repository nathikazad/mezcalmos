import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/models/BusinessCartItem.dart';
import 'package:mezcalmos/CustomerApp/models/Cart.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart' as cModels;
import 'package:mezcalmos/Shared/graphql/buisness_order/hsBusinessOrder.dart';
import 'package:mezcalmos/Shared/graphql/customer/businessCart/hsBusinessCart.dart';
import 'package:mezcalmos/Shared/graphql/customer/restaurantCart/hsRestaurantCart.dart';
import 'package:mezcalmos/Shared/graphql/laundry_order/hsLaundryOrder.dart';
import 'package:mezcalmos/Shared/graphql/offer/hsOffer.dart';
import 'package:mezcalmos/Shared/graphql/order/hsRestaurantOrder.dart';

enum CouponError {
  UnavailableOrExpired,
  Notreusable,
  FirstOrderOnly,
  AlreadyApplied,
  NotApplicable,
  InvalidCouponCode
}

Future<CouponError?> applyRestaurantCoupon(
    {required int customerId,
    required Cart cart,
    required String couponCode}) async {
  if (cart.restaurant?.restaurantId == null) return null;
  final cModels.Offer? coupon = await check_coupon(
      couponCode: couponCode,
      serviceProviderId: cart.restaurant!.restaurantId,
      serviceProviderType: cModels.ServiceProviderType.Restaurant);
  if (coupon == null) {
    return CouponError.InvalidCouponCode;
  }
  if (cart.offersApplied.firstWhereOrNull((o) => o == coupon.id) != null) {
    return CouponError.AlreadyApplied;
  }
  bool isValid = true;
  if (coupon.details.validityRangeStart != null &&
      coupon.details.validityRangeEnd != null) {
    DateTime currentTime = DateTime.now();
    DateTime validityRangeStart =
        DateTime.parse(coupon.details.validityRangeStart!);
    DateTime validityRangeEnd =
        DateTime.parse(coupon.details.validityRangeEnd!);

    if (coupon.details.weeklyRepeat) {
      if (currentTime.weekday < validityRangeStart.weekday ||
          currentTime.weekday > validityRangeEnd.weekday) {
        isValid = false;
      } else if (currentTime.weekday == validityRangeStart.weekday) {
        if (currentTime.hour < validityRangeStart.hour) isValid = false;
        if ((currentTime.hour == validityRangeStart.hour) &&
            (currentTime.minute < validityRangeStart.minute)) isValid = false;
      } else if (currentTime.weekday == validityRangeEnd.weekday) {
        if (currentTime.hour > validityRangeEnd.hour) isValid = false;
        if ((currentTime.hour == validityRangeEnd.hour) &&
            (currentTime.minute > validityRangeEnd.minute)) isValid = false;
      }
    } else if (currentTime.isBefore(validityRangeStart) ||
        currentTime.isAfter(validityRangeEnd)) {
      isValid = false;
    }
  }
  if (isValid == false) {
    return CouponError.UnavailableOrExpired;
  }

  if (coupon.details.offerForOrder == "firstOrder") {
    final int numberOfCustomerRestaurantOrders =
        await number_of_customer_restaurant_orders(
            customerId: customerId,
            restaurantId: cart.restaurant!.restaurantId);
    if (numberOfCustomerRestaurantOrders > 0) return CouponError.FirstOrderOnly;
  }
  if (coupon.details.couponReusable != true) {
    if (await check_offer_applied(
        customerId: customerId,
        offerId: coupon.id!.toInt(),
        orderType: cModels.OrderType.Restaurant)) {
      return CouponError.Notreusable;
    }
  }
  final num discount = calculateRestaurantCartDiscount(cart, coupon);
  if (discount == 0) return CouponError.NotApplicable;
  cart.discountValue += discount;

  await update_cart_discount(
      customerId: customerId,
      appliedOffers: cart.offersApplied,
      discountValue: cart.discountValue);
  return null;
}

// go through list of offers applied
// if an offer is a coupon, then check if it is valid
// if it is valid, then apply discount
// go through list of restaurant offers
// if an offer is a promotion, then check if it is valid
// if it is valid, then apply discount

Future<void> applyOffersToRestaurantCart(
    {required int customerId, required Cart cart}) async {
  if (cart.restaurant?.restaurantId == null) return;
  List<cModels.Offer> offers = await get_service_provider_offers(
      serviceProviderId: cart.restaurant!.restaurantId,
      serviceProviderType: cModels.ServiceProviderType.Restaurant);

  List<int> appliedOffers = cart.offersApplied;
  cart.offersApplied = [];
  num discount = 0;

  List<cModels.Offer> activeCoupons = offers
      .where((cModels.Offer offer) =>
          offer.offerType == cModels.OfferType.Coupon &&
          offer.status == cModels.OfferStatus.Active)
      .toList();
  appliedOffers.forEach((o) {
    cModels.Offer? coupon = activeCoupons
        .firstWhereOrNull((cModels.Offer coupon) => o == coupon.id);
    if (coupon != null) {
      discount += calculateRestaurantCartDiscount(cart, coupon);
    }
  });
  List<cModels.Offer> activePromotions = offers
      .where((cModels.Offer offer) =>
          offer.offerType == cModels.OfferType.Promotion &&
          offer.status == cModels.OfferStatus.Active)
      .toList();

  int numberOfCustomerRestaurantOrders = 0;
  for (cModels.Offer promo in activePromotions) {
    if (promo.details.offerForOrder == "firstOrder") {
      numberOfCustomerRestaurantOrders =
          await number_of_customer_restaurant_orders(
              customerId: customerId,
              restaurantId: cart.restaurant!.restaurantId);
      break;
    }
  }
  for (cModels.Offer promo in activePromotions) {
    if (promo.details.validityRangeStart != null &&
        promo.details.validityRangeEnd != null) {
      DateTime currentTime = DateTime.now();
      DateTime validityRangeStart =
          DateTime.parse(promo.details.validityRangeStart!);
      DateTime validityRangeEnd =
          DateTime.parse(promo.details.validityRangeEnd!);

      if (promo.details.weeklyRepeat) {
        if (currentTime.weekday < validityRangeStart.weekday ||
            currentTime.weekday > validityRangeEnd.weekday) {
          continue;
        } else if (currentTime.weekday == validityRangeStart.weekday) {
          if (currentTime.hour < validityRangeStart.hour) continue;
          if ((currentTime.hour == validityRangeStart.hour) &&
              (currentTime.minute < validityRangeStart.minute)) continue;
        } else if (currentTime.weekday == validityRangeEnd.weekday) {
          if (currentTime.hour > validityRangeEnd.hour) continue;
          if ((currentTime.hour == validityRangeEnd.hour) &&
              (currentTime.minute > validityRangeEnd.minute)) continue;
        }
      } else if (currentTime.isBefore(validityRangeStart) ||
          currentTime.isAfter(validityRangeEnd)) {
        continue;
      }
    }

    if (promo.details.offerForOrder == "firstOrder") {
      if (numberOfCustomerRestaurantOrders > 0) continue;
    }
    discount += calculateRestaurantCartDiscount(cart, promo);
  }
  cart.discountValue = discount;
  await update_cart_discount(
      customerId: customerId,
      appliedOffers: cart.offersApplied,
      discountValue: cart.discountValue);
}

num calculateRestaurantCartDiscount(Cart cart, cModels.Offer offer) {
  num discount = 0;

  switch (offer.details.discountType) {
    case cModels.DiscountType.StoreCredit:
      break;
    case cModels.DiscountType.FlatAmount:
      if (offer.details.offerForItems == null) {
        discount += offer.details.discountValue;
      } else {
        cart.cartItems.forEach((cartItem) {
          if (offer.details.offerForItems == "particularItems") {
            offer.details.items!.forEach((c) => {
                  if (c == cartItem.item.id)
                    {
                      discount +=
                          offer.details.discountValue * cartItem.quantity
                    }
                });
          } else if (offer.details.offerForItems == "particularCategories") {
            offer.details.categories!.forEach((c) => {
                  if (c == cartItem.item.categoryId)
                    {
                      discount +=
                          offer.details.discountValue * cartItem.quantity
                    }
                });
          }
        });
      }
      break;
    case cModels.DiscountType.Percentage:
      cart.cartItems.forEach((cartItem) {
        if (offer.details.offerForItems == "particularItems") {
          offer.details.items!.forEach((c) => {
                if (c == cartItem.item.id)
                  {
                    discount += cartItem.item.cost *
                        offer.details.discountValue /
                        100.0 *
                        cartItem.quantity
                  }
              });
        } else if (offer.details.offerForItems == "particularCategories") {
          offer.details.categories!.forEach((c) => {
                if (c == cartItem.item.categoryId)
                  {
                    discount += cartItem.item.cost *
                        offer.details.discountValue /
                        100.0 *
                        cartItem.quantity
                  }
              });
        } else {
          discount += cartItem.item.cost *
              offer.details.discountValue /
              100.0 *
              cartItem.quantity;
        }
      });
      break;
    case cModels.DiscountType.AnotherSameFlat:
      int sameItems = 0;
      cart.cartItems.forEach((cartItem) {
        if (offer.details.offerForItems == "particularItems") {
          for (num c in offer.details.items!) {
            if (c == cartItem.item.id) {
              sameItems += cartItem.quantity;
              break;
            }
          }
        } else {
          for (num c in offer.details.categories!) {
            if (c == cartItem.item.categoryId) {
              sameItems += cartItem.quantity;
              break;
            }
          }
        }
      });
      discount += offer.details.discountValue * (sameItems / 2);
      break;
    case cModels.DiscountType.AnotherSamePercentage:
      int sameItems = 0;
      num oneItemCost = 0;
      cart.cartItems.forEach((cartItem) {
        if (offer.details.offerForItems == "particularItems") {
          for (num c in offer.details.items!) {
            if (c == cartItem.item.id) {
              oneItemCost = cartItem.item.cost;
              sameItems += cartItem.quantity;
              break;
            }
          }
        } else {
          for (num c in offer.details.categories!) {
            if (c == cartItem.item.categoryId) {
              oneItemCost = cartItem.item.cost;
              sameItems += cartItem.quantity;
              break;
            }
          }
        }
      });
      discount +=
          oneItemCost * offer.details.discountValue / 100.0 * (sameItems / 2);
      break;
  }
  if (discount > 0) {
    // if (cart.offersApplied.firstWhereOrNull((o) => o == offer.id) == null) {
    cart.offersApplied.add(offer.id!.toInt());
    // }
  }
  return discount;
}

Future<CouponError?> applyBusinessCoupon(
    {required int customerId,
    required CustBusinessCart cart,
    required String couponCode}) async {
  if (cart.businessId == null) return null;
  final cModels.Offer? coupon = await check_coupon(
      couponCode: couponCode,
      serviceProviderId: cart.businessId!.toInt(),
      serviceProviderType: cModels.ServiceProviderType.Business);
  if (coupon == null) {
    return CouponError.InvalidCouponCode;
  }
  if (cart.appliedOffers.firstWhereOrNull((o) => o == coupon.id) != null) {
    return CouponError.AlreadyApplied;
  }
  bool isValid = true;
  if (coupon.details.validityRangeStart != null &&
      coupon.details.validityRangeEnd != null) {
    DateTime currentTime = DateTime.now();
    DateTime validityRangeStart =
        DateTime.parse(coupon.details.validityRangeStart!);
    DateTime validityRangeEnd =
        DateTime.parse(coupon.details.validityRangeEnd!);

    if (coupon.details.weeklyRepeat) {
      if (currentTime.weekday < validityRangeStart.weekday ||
          currentTime.weekday > validityRangeEnd.weekday) {
        isValid = false;
      } else if (currentTime.weekday == validityRangeStart.weekday) {
        if (currentTime.hour < validityRangeStart.hour) isValid = false;
        if ((currentTime.hour == validityRangeStart.hour) &&
            (currentTime.minute < validityRangeStart.minute)) isValid = false;
      } else if (currentTime.weekday == validityRangeEnd.weekday) {
        if (currentTime.hour > validityRangeEnd.hour) isValid = false;
        if ((currentTime.hour == validityRangeEnd.hour) &&
            (currentTime.minute > validityRangeEnd.minute)) isValid = false;
      }
    } else if (currentTime.isBefore(validityRangeStart) ||
        currentTime.isAfter(validityRangeEnd)) {
      isValid = false;
    }
  }
  if (isValid == false) {
    return CouponError.UnavailableOrExpired;
  }

  if (coupon.details.offerForOrder == "firstOrder") {
    final int numberOfCustomerBusinessOrders =
        await number_of_customer_business_orders(
            customerId: customerId, businessId: cart.businessId!.toInt());
    if (numberOfCustomerBusinessOrders > 0) return CouponError.FirstOrderOnly;
  }
  if (coupon.details.couponReusable != true) {
    if (await check_offer_applied(
        customerId: customerId,
        offerId: coupon.id!.toInt(),
        orderType: cModels.OrderType.Business)) {
      return CouponError.Notreusable;
    }
  }
  final num discount = calculateBusinessCartDiscount(cart, coupon);
  if (discount == 0) return CouponError.NotApplicable;
  cart.discountValue += discount;

  await update_business_cart_discount(
      customerId: customerId,
      appliedOffers: cart.appliedOffers,
      discountValue: cart.discountValue);
  return null;
}

Future<void> applyOffersToBusinessCart(
    {required int customerId, required CustBusinessCart cart}) async {
  if (cart.businessId == null) return;
  List<cModels.Offer> offers = await get_service_provider_offers(
      serviceProviderId: cart.businessId!.toInt(),
      serviceProviderType: cModels.ServiceProviderType.Business);

  List<int> appliedOffers = cart.appliedOffers;
  cart.appliedOffers = [];
  num discount = 0;

  List<cModels.Offer> activeCoupons = offers
      .where((cModels.Offer offer) =>
          offer.offerType == cModels.OfferType.Coupon &&
          offer.status == cModels.OfferStatus.Active)
      .toList();
  appliedOffers.forEach((o) {
    cModels.Offer? coupon = activeCoupons
        .firstWhereOrNull((cModels.Offer coupon) => o == coupon.id);
    if (coupon != null) {
      discount += calculateBusinessCartDiscount(cart, coupon);
    }
  });
  List<cModels.Offer> activePromotions = offers
      .where((cModels.Offer offer) =>
          offer.offerType == cModels.OfferType.Promotion &&
          offer.status == cModels.OfferStatus.Active)
      .toList();

  int numberOfCustomerBusinessOrders = 0;
  for (cModels.Offer promo in activePromotions) {
    if (promo.details.offerForOrder == "firstOrder") {
      numberOfCustomerBusinessOrders = await number_of_customer_business_orders(
          customerId: customerId, businessId: cart.businessId!.toInt());
      break;
    }
  }
  for (cModels.Offer promo in activePromotions) {
    if (promo.details.validityRangeStart != null &&
        promo.details.validityRangeEnd != null) {
      DateTime currentTime = DateTime.now();
      DateTime validityRangeStart =
          DateTime.parse(promo.details.validityRangeStart!);
      DateTime validityRangeEnd =
          DateTime.parse(promo.details.validityRangeEnd!);

      if (promo.details.weeklyRepeat) {
        if (currentTime.weekday < validityRangeStart.weekday ||
            currentTime.weekday > validityRangeEnd.weekday) {
          continue;
        } else if (currentTime.weekday == validityRangeStart.weekday) {
          if (currentTime.hour < validityRangeStart.hour) continue;
          if ((currentTime.hour == validityRangeStart.hour) &&
              (currentTime.minute < validityRangeStart.minute)) continue;
        } else if (currentTime.weekday == validityRangeEnd.weekday) {
          if (currentTime.hour > validityRangeEnd.hour) continue;
          if ((currentTime.hour == validityRangeEnd.hour) &&
              (currentTime.minute > validityRangeEnd.minute)) continue;
        }
      } else if (currentTime.isBefore(validityRangeStart) ||
          currentTime.isAfter(validityRangeEnd)) {
        continue;
      }
    }

    if (promo.details.offerForOrder == "firstOrder") {
      if (numberOfCustomerBusinessOrders > 0) continue;
    }
    discount += calculateBusinessCartDiscount(cart, promo);
  }
  cart.discountValue = discount;
  await update_business_cart_discount(
      customerId: customerId,
      appliedOffers: cart.appliedOffers,
      discountValue: cart.discountValue);
}

num calculateBusinessCartDiscount(CustBusinessCart cart, cModels.Offer offer) {
  num discount = 0;

  switch (offer.details.discountType) {
    case cModels.DiscountType.StoreCredit:
      break;
    case cModels.DiscountType.FlatAmount:
      if (offer.details.offerForItems == null) {
        discount += offer.details.discountValue;
      } else {
        cart.items.forEach((cartItem) {
          if (offer.details.offerForItems == "particularItems") {
            for (int i = 0; i < offer.details.items!.length; i++) {
              if (offer.details.items![i] == cartItem.itemId &&
                  offer.details.offeringTypes![i] == cartItem.offeringType) {
                discount += offer.details.discountValue;
                break;
              }
            }
          } else if (offer.details.offerForItems == "particularServices") {
            offer.details.offeringTypes!.forEach((c) => {
                  if (c == cartItem.offeringType)
                    {discount += offer.details.discountValue}
                });
          }
        });
      }
      break;
    case cModels.DiscountType.Percentage:
      cart.items.forEach((cartItem) {
        if (offer.details.offerForItems == "particularItems") {
          for (int i = 0; i < offer.details.items!.length; i++) {
            if (offer.details.items![i] == cartItem.itemId &&
                offer.details.offeringTypes![i] == cartItem.offeringType) {
              discount += cartItem.cost * offer.details.discountValue / 100.0;
              break;
            }
          }
        } else if (offer.details.offerForItems == "particularServices") {
          offer.details.offeringTypes!.forEach((c) => {
                if (c == cartItem.offeringType)
                  {
                    discount +=
                        cartItem.cost * offer.details.discountValue / 100.0
                  }
              });
        } else {
          discount += cartItem.cost * offer.details.discountValue / 100.0;
        }
      });
      break;
    case cModels.DiscountType.AnotherSameFlat:
      int sameItems = 0;
      cart.items.forEach((cartItem) {
        if (offer.details.offerForItems == "particularItems") {
          for (int i = 0; i < offer.details.items!.length; i++) {
            if (offer.details.items![i] == cartItem.itemId &&
                offer.details.offeringTypes![i] == cartItem.offeringType) {
              sameItems++;
              break;
            }
          }
        } else {
          for (cModels.OfferingType c in offer.details.offeringTypes!) {
            if (c == cartItem.offeringType) {
              sameItems++;
              break;
            }
          }
        }
      });
      discount += offer.details.discountValue * (sameItems / 2);
      break;
    case cModels.DiscountType.AnotherSamePercentage:
      int sameItems = 0;
      num oneItemCost = 0;
      cart.items.forEach((cartItem) {
        if (offer.details.offerForItems == "particularItems") {
          for (int i = 0; i < offer.details.items!.length; i++) {
            if (offer.details.items![i] == cartItem.itemId &&
                offer.details.offeringTypes![i] == cartItem.offeringType) {
              sameItems++;
              break;
            }
          }
        } else {
          for (cModels.OfferingType c in offer.details.offeringTypes!) {
            if (c == cartItem.offeringType) {
              oneItemCost = cartItem.cost;
              sameItems++;
              break;
            }
          }
        }
      });
      discount +=
          oneItemCost * offer.details.discountValue / 100.0 * (sameItems / 2);
      break;
  }
  if (discount > 0) {
    if (cart.appliedOffers.firstWhereOrNull((o) => o == offer.id) == null) {
      cart.appliedOffers.add(offer.id!.toInt());
    }
  }
  return discount;
}

Future<CouponError?> checkLaundryCoupon(
    {required int customerId,
    required int laundryStoreId,
    required String couponCode}) async {
  final cModels.Offer? coupon = await check_coupon(
      couponCode: couponCode,
      serviceProviderId: laundryStoreId,
      serviceProviderType: cModels.ServiceProviderType.Laundry);
  if (coupon == null) {
    return CouponError.InvalidCouponCode;
  }
  bool isValid = true;
  if (coupon.details.validityRangeStart != null &&
      coupon.details.validityRangeEnd != null) {
    DateTime currentTime = DateTime.now();
    DateTime validityRangeStart =
        DateTime.parse(coupon.details.validityRangeStart!);
    DateTime validityRangeEnd =
        DateTime.parse(coupon.details.validityRangeEnd!);

    if (coupon.details.weeklyRepeat) {
      if (currentTime.weekday < validityRangeStart.weekday ||
          currentTime.weekday > validityRangeEnd.weekday) {
        isValid = false;
      } else if (currentTime.weekday == validityRangeStart.weekday) {
        if (currentTime.hour < validityRangeStart.hour) isValid = false;
        if ((currentTime.hour == validityRangeStart.hour) &&
            (currentTime.minute < validityRangeStart.minute)) isValid = false;
      } else if (currentTime.weekday == validityRangeEnd.weekday) {
        if (currentTime.hour > validityRangeEnd.hour) isValid = false;
        if ((currentTime.hour == validityRangeEnd.hour) &&
            (currentTime.minute > validityRangeEnd.minute)) isValid = false;
      }
    } else if (currentTime.isBefore(validityRangeStart) ||
        currentTime.isAfter(validityRangeEnd)) {
      isValid = false;
    }
  }
  if (isValid == false) {
    return CouponError.UnavailableOrExpired;
  }

  if (coupon.details.offerForOrder == "firstOrder") {
    final int numberOfCustomerLaundryOrders =
        await number_of_customer_laundry_orders(
            customerId: customerId, storeId: laundryStoreId);
    if (numberOfCustomerLaundryOrders > 0) return CouponError.FirstOrderOnly;
  }
  if (coupon.details.couponReusable != true) {
    if (await check_offer_applied(
        customerId: customerId,
        offerId: coupon.id!.toInt(),
        orderType: cModels.OrderType.Laundry)) {
      return CouponError.Notreusable;
    }
  }
  return null;
}
