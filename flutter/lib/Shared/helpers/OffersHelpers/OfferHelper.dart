import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
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
  FirstOrderOnly,
  AlreadyApplied,
  NotApplicable,
  InvalidCouponCode,
  OrderAmountTooLow,
  NotReusable
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
  if (cart.offersApplied.firstWhereOrNull((int o) => o == coupon.id) != null) {
    return CouponError.AlreadyApplied;
  }
  if (coupon.details.minimumOrderAmount != null &&
      coupon.details.minimumOrderAmount! > cart.itemsCost()) {
    return CouponError.OrderAmountTooLow;
  }
  bool isValid = true;
  if (coupon.details.validityRangeStart != null &&
      coupon.details.validityRangeEnd != null) {
    final DateTime currentTime = DateTime.now();
    final DateTime validityRangeStart =
        DateTime.parse(coupon.details.validityRangeStart!);
    final DateTime validityRangeEnd =
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
  // if (coupon.details.couponReusable != true) {
  if (await check_offer_applied(
      customerId: customerId,
      offerId: coupon.id.toInt(),
      orderType: cModels.OrderType.Restaurant)) {
    return CouponError.NotReusable;
  }
  // }
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
  appliedOffers.forEach((int o) {
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
      final DateTime currentTime = DateTime.now();
      final DateTime validityRangeStart =
          DateTime.parse(promo.details.validityRangeStart!);
      final DateTime validityRangeEnd =
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

  if (offer.details.minimumOrderAmount != null &&
      offer.details.minimumOrderAmount! > cart.itemsCost()) {
    return 0;
  }

  switch (offer.details.discountType) {
    case cModels.DiscountType.StoreCredit:
      break;
    case cModels.DiscountType.FlatAmount:
      if (offer.details.offerForItems == null) {
        discount += offer.details.discountValue;
      } else {
        cart.cartItems.forEach((CartItem cartItem) {
          if (offer.details.offerForItems == "particularItems") {
            offer.details.items!.forEach((num c) => {
                  if (c == cartItem.item.id)
                    {
                      discount +=
                          offer.details.discountValue * cartItem.quantity
                    }
                });
          } else if (offer.details.offerForItems == "particularCategories") {
            offer.details.categories!.forEach((num c) => {
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
      cart.cartItems.forEach((CartItem cartItem) {
        if (offer.details.offerForItems == "particularItems") {
          offer.details.items!.forEach((num c) => {
                if (c == cartItem.item.id)
                  {
                    discount += cartItem.item.cost *
                        offer.details.discountValue /
                        100.0 *
                        cartItem.quantity
                  }
              });
        } else if (offer.details.offerForItems == "particularCategories") {
          offer.details.categories!.forEach((num c) => {
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
      cart.cartItems.forEach((CartItem cartItem) {
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
      cart.cartItems.forEach((CartItem cartItem) {
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
    cart.offersApplied.add(offer.id.toInt());
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
  if (cart.appliedOffers.firstWhereOrNull((int o) => o == coupon.id) != null) {
    return CouponError.AlreadyApplied;
  }
  if (coupon.details.minimumOrderAmount != null &&
      coupon.details.minimumOrderAmount! > cart.cost) {
    return CouponError.OrderAmountTooLow;
  }
  bool isValid = true;
  if (coupon.details.validityRangeStart != null &&
      coupon.details.validityRangeEnd != null) {
    final DateTime currentTime = DateTime.now();
    final DateTime validityRangeStart =
        DateTime.parse(coupon.details.validityRangeStart!);
    final DateTime validityRangeEnd =
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
  // if (coupon.details.couponReusable != true) {
  if (await check_offer_applied(
      customerId: customerId,
      offerId: coupon.id.toInt(),
      orderType: cModels.OrderType.Business)) {
    return CouponError.NotReusable;
  }
  // }
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
  appliedOffers.forEach((int o) {
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
      final DateTime currentTime = DateTime.now();
      final DateTime validityRangeStart =
          DateTime.parse(promo.details.validityRangeStart!);
      final DateTime validityRangeEnd =
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

  if (offer.details.minimumOrderAmount != null &&
      offer.details.minimumOrderAmount! > cart.cost) {
    return 0;
  }
  switch (offer.details.discountType) {
    case cModels.DiscountType.StoreCredit:
      break;
    case cModels.DiscountType.FlatAmount:
      if (offer.details.offerForItems == null) {
        discount += offer.details.discountValue;
      } else {
        cart.items.forEach((BusinessCartItem cartItem) {
          if (offer.details.offerForItems == "particularItems") {
            for (int i = 0; i < offer.details.items!.length; i++) {
              if (offer.details.items![i] == cartItem.itemId &&
                  offer.details.offeringTypes![i] == cartItem.offeringType) {
                discount += offer.details.discountValue;
                break;
              }
            }
          } else if (offer.details.offerForItems == "particularServices") {
            offer.details.offeringTypes!.forEach((cModels.OfferingType c) => {
                  if (c == cartItem.offeringType)
                    {discount += offer.details.discountValue}
                });
          }
        });
      }
      break;
    case cModels.DiscountType.Percentage:
      cart.items.forEach((BusinessCartItem cartItem) {
        if (offer.details.offerForItems == "particularItems") {
          for (int i = 0; i < offer.details.items!.length; i++) {
            if (offer.details.items![i] == cartItem.itemId &&
                offer.details.offeringTypes![i] == cartItem.offeringType) {
              discount += cartItem.cost * offer.details.discountValue / 100.0;
              break;
            }
          }
        } else if (offer.details.offerForItems == "particularServices") {
          offer.details.offeringTypes!.forEach((cModels.OfferingType c) => {
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
      cart.items.forEach((BusinessCartItem cartItem) {
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
      cart.items.forEach((BusinessCartItem cartItem) {
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
    if (cart.appliedOffers.firstWhereOrNull((int o) => o == offer.id) == null) {
      cart.appliedOffers.add(offer.id.toInt());
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
    final DateTime currentTime = DateTime.now();
    final DateTime validityRangeStart =
        DateTime.parse(coupon.details.validityRangeStart!);
    final DateTime validityRangeEnd =
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
  // if (coupon.details.couponReusable != true) {
  if (await check_offer_applied(
      customerId: customerId,
      offerId: coupon.id.toInt(),
      orderType: cModels.OrderType.Laundry)) {
    return CouponError.NotReusable;
  }
  // }
  return null;
}

extension OffersHelper on cModels.Offer {
  bool get isActive {
    if (details.validityRangeStart != null &&
        details.validityRangeEnd != null &&
        status == cModels.OfferStatus.Active) {
      final DateTime now = DateTime.now();
      final DateFormat dateFormat = DateFormat('yyyy-MM-dd');
      final DateTime startDate = dateFormat.parse(details.validityRangeStart!);
      final DateTime endDate = dateFormat.parse(details.validityRangeEnd!);

      if (now.isAfter(startDate) && now.isBefore(endDate)) {
        return true;
      }
    }
    return false;
  }

  DateTime? get startDate {
    if (details.validityRangeStart != null) {
      return DateTime.parse(details.validityRangeStart!);
    }
    return null;
  }

  DateTime? get endDate {
    if (details.validityRangeEnd != null) {
      return DateTime.parse(details.validityRangeEnd!);
    }
    return null;
  }

  IconData get icon {
    switch (offerType) {
      case cModels.OfferType.Coupon:
        return Icons.discount_rounded;
      case cModels.OfferType.Promotion:
        return Icons.price_check;
      case cModels.OfferType.MonthlySubscription:
        return Icons.workspace_premium_rounded;
    }
  }
}

enum OfferItemType {
  ParticularItems,
  ParticularCategories,
}

extension OfferItemTypeExtension on OfferItemType {
  String toFirebaseFormattedString() {
    return toString().split('.').last.toLowerCase();
  }
}

Future<String> generateOfferDescription(
    {required cModels.OfferDetails offerDetails}) async {
  String description = "";

  switch (offerDetails.discountType) {
    case cModels.DiscountType.FlatAmount:
      description += "Flat \$${offerDetails.discountValue} off ";
      break;
    case cModels.DiscountType.Percentage:
      description += "${offerDetails.discountValue}% off ";
      break;
    case cModels.DiscountType.AnotherSameFlat:
      description +=
          "Buy 1 and Get Flat \$${offerDetails.discountValue} off on another one ";
      break;
    case cModels.DiscountType.AnotherSamePercentage:
      description +=
          "Buy 1 and Get ${offerDetails.discountValue}% off on another one ";
      break;
    default:
  }

  if (offerDetails.offerForItems != null) {
    if (offerDetails.discountType == cModels.DiscountType.AnotherSameFlat ||
        offerDetails.discountType ==
            cModels.DiscountType.AnotherSamePercentage) {
      description += "from ";
    } else {
      description += "on ";
    }
    if (offerDetails.offerForItems == "particularItems") {
      description += "the following items";
    } else if (offerDetails.offerForItems == "particularCategories") {
      description += "the following categories";
    }
  }

  if (offerDetails.offerForOrder == "firstOrder") {
    description += "on your first order";
  }
  if (offerDetails.minimumOrderAmount != null) {
    description +=
        "with minimum order amount ${offerDetails.minimumOrderAmount}";
  }
  if (offerDetails.validityRangeStart != null &&
      offerDetails.validityRangeEnd != null) {
    description +=
        " from ${offerDetails.validityRangeStart} to ${offerDetails.validityRangeEnd}";
  }
  return description;
}
