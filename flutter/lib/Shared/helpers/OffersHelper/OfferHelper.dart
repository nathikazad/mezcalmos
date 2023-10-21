import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/models/Cart.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart' as cModels;
import 'package:mezcalmos/Shared/graphql/customer/restaurantCart/hsRestaurantCart.dart';
import 'package:mezcalmos/Shared/graphql/offer/hsOffer.dart';
import 'package:mezcalmos/Shared/graphql/order/hsRestaurantOrder.dart';
import 'package:mezcalmos/Shared/helpers/DateTimeHelper.dart';
import 'package:mezcalmos/Shared/helpers/NumHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';

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
  final List<cModels.Offer> offers = await get_service_provider_offers(
      serviceProviderId: cart.restaurant!.restaurantId,
      serviceProviderType: cModels.ServiceProviderType.Restaurant);

  final List<int> appliedOffers = cart.offersApplied;
  cart.offersApplied = <int>[];
  num discount = 0;

  final List<cModels.Offer> activeCoupons = offers
      .where((cModels.Offer offer) =>
          offer.offerType == cModels.OfferType.Coupon &&
          offer.status == cModels.OfferStatus.Active)
      .toList();
  appliedOffers.forEach((int o) {
    final cModels.Offer? coupon = activeCoupons
        .firstWhereOrNull((cModels.Offer coupon) => o == coupon.id);
    if (coupon != null) {
      discount += calculateRestaurantCartDiscount(cart, coupon);
    }
  });
  final List<cModels.Offer> activePromotions = offers
      .where((cModels.Offer offer) =>
          offer.offerType == cModels.OfferType.Promotion &&
          offer.status == cModels.OfferStatus.Active)
      .toList();
  final List<cModels.Offer> activeInfPromotions = offers
      .where((cModels.Offer offer) =>
          offer.offerType == cModels.OfferType.Influencer &&
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
  for (cModels.Offer promo in activeInfPromotions) {
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
  mezDbgPrint(
      " 👋👋👋👋👋👋👋👋 Okay we are here and the discount calculated is ===========>$discount");
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
      if (offer.details.offerForItems == "particularitems" &&
          offer.details.items?.isEmpty == true) {
        discount += offer.details.discountValue;
      } else {
        cart.cartItems.forEach((CartItem cartItem) {
          if (offer.details.offerForItems == "particularitems") {
            offer.details.items!.forEach((num c) => <Set<num>>{
                  if (c == cartItem.item.id)
                    <num>{
                      discount +=
                          offer.details.discountValue * cartItem.quantity
                    }
                });
          } else if (offer.details.offerForItems == "particularCategories") {
            offer.details.categories!.forEach((num c) => <Set<num>>{
                  if (c == cartItem.item.categoryId)
                    <num>{
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
          offer.details.items!.forEach((num c) => <Set<double>>{
                if (c == cartItem.item.id)
                  <double>{
                    discount += cartItem.item.cost *
                        offer.details.discountValue /
                        100.0 *
                        cartItem.quantity
                  }
              });
        } else if (offer.details.offerForItems == "particularCategories") {
          offer.details.categories!.forEach((num c) => <Set<double>>{
                if (c == cartItem.item.categoryId)
                  <double>{
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
      discount += offer.details.discountValue * (sameItems ~/ 2);
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
          oneItemCost * offer.details.discountValue / 100.0 * (sameItems ~/ 2);
      break;
  }
  if (discount > 0) {
    // if (cart.offersApplied.firstWhereOrNull((o) => o == offer.id) == null) {
    cart.offersApplied.add(offer.id.toInt());
    // }
  }
  return discount;
}

extension OffersHelper on cModels.Offer {
  bool get isActive {
    if (details.validityRangeStart != null &&
        details.validityRangeEnd != null &&
        status == cModels.OfferStatus.Active) {
      final DateTime now = DateTime.now().toLocal();
      // final DateFormat dateFormat = DateFormat('yyyy-MM-dd');
      final DateTime startDate =
          DateTime.parse(details.validityRangeStart!).toLocal();
      final DateTime endDate =
          DateTime.parse(details.validityRangeEnd!).toLocal();

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
      case cModels.OfferType.Influencer:
        return Icons.people;
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

extension InfluencerDetailsHelper on cModels.InfluencerOfferDetails {
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "rewardType": rewardType.toFirebaseFormatString(),
      "rewardValue": rewardValue,
    };
  }
}

extension OfferDetailsExtensions on cModels.OfferDetails {
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "offerForOrder": offerForOrder,
      "offerForItems": offerForItems,
      "discountType": discountType.toFirebaseFormatString(),
      "discountValue": discountValue,
      "minimumOrderAmount": minimumOrderAmount,
      "items": items,
      "categories": categories,
      "nameIds": nameIds,
      "offeringTypes": offeringTypes,
      "validityRangeStart": validityRangeStart,
      "validityRangeEnd": validityRangeEnd,
      "weeklyRepeat": weeklyRepeat,
    };
  }

  String get discountTitle {
    final StringBuffer sb = StringBuffer();

    switch (discountType) {
      case cModels.DiscountType.FlatAmount:
        sb.write(" Flat \$$discountValue off ");
        break;
      case cModels.DiscountType.Percentage:
        sb.write(" $discountValue% off ");
        break;
      case cModels.DiscountType.AnotherSameFlat:
        sb.write(" Buy 1 and Get Flat \$$discountValue off on another one ");
        break;
      case cModels.DiscountType.AnotherSamePercentage:
        sb.write(" Buy 1 and Get $discountValue% off on another one ");
        break;
      default:
        throw StateError("Unhanded ===========>$discountType");
    }
    if (offerForOrder == "firstOrder") {
      sb.write(" on your first order");
    }
    if (minimumOrderAmount != null) {
      sb.write(
          " with minimum order amount ${minimumOrderAmount?.toPriceString()}");
    }
    return sb.toString();
  }

  String get offerTimeString {
    final StringBuffer sb = StringBuffer();
    if (validityRangeStart != null && validityRangeEnd != null) {
      sb.write(
          "From ${DateTime.parse(validityRangeStart!).getOrderTime()} to ${DateTime.parse(validityRangeEnd!).getOrderTime()}");
    }
    return sb.toString();
  }

  String getDescription({bool withTime = false}) {
    final StringBuffer sb = StringBuffer();

    switch (discountType) {
      case cModels.DiscountType.FlatAmount:
        sb.write("Flat \$$discountValue off ");
        break;
      case cModels.DiscountType.Percentage:
        sb.write("$discountValue% off ");
        break;
      case cModels.DiscountType.AnotherSameFlat:
        sb.write("Buy 1 and Get Flat \$$discountValue off on another one ");
        break;
      case cModels.DiscountType.AnotherSamePercentage:
        sb.write("Buy 1 and Get $discountValue% off on another one ");
        break;
      default:
    }

    if (offerForItems != null) {
      sb.write(discountType == cModels.DiscountType.AnotherSameFlat ||
              discountType == cModels.DiscountType.AnotherSamePercentage
          ? "from "
          : "on ");

      sb.write(offerForItems == "particularitems" && items?.isNotEmpty == true
          ? "the following items"
          : "");
    }

    if (offerForOrder == "firstOrder") {
      sb.write("on your first order");
    }
    if (minimumOrderAmount != null) {
      sb.write(
          "with minimum order amount ${minimumOrderAmount?.toPriceString()}");
    }
    if (validityRangeStart != null && validityRangeEnd != null && withTime) {
      sb.write(
          " from ${DateTime.parse(validityRangeStart!).getOrderTime()} to ${DateTime.parse(validityRangeEnd!).getOrderTime()}");
    }
    return sb.toString();
  }
}
