// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: constant_identifier_names, always_specify_types

import 'package:mezcalmos/Shared/helpers/thirdParty/MapHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Services/Laundry.dart';
import 'package:mezcalmos/Shared/models/User.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';

enum LaundryOrderStatus {
  OrderReceived,
  OtwPickupFromCustomer,
  PickedUpFromCustomer,
  AtLaundry,
  ReadyForDelivery,
  OtwPickupFromLaundry,
  PickedUpFromLaundry,
  Delivered,
  CancelledByAdmin,
  CancelledByCustomer
}

enum LaundryOrderPhase {
  Pickup,
  Dropoff,
  Neither,
}

extension ParseOrderStatusToString on LaundryOrderStatus {
  String toFirebaseFormatString() {
    final String str = toString().split('.').last;

    return str[0].toLowerCase() + str.substring(1).toLowerCase();
  }
}

extension ParseStringToOrderStatus on String {
  LaundryOrderStatus toLaundryOrderStatus() {
    return LaundryOrderStatus.values.firstWhere((LaundryOrderStatus e) =>
        e.toFirebaseFormatString().toLowerCase() == toLowerCase());
  }
}

class LaundryOrder extends TwoWayDeliverableOrder {
  String? notes;
  ServiceInfo? laundry;
  LaundryOrderStatus status;
  num shippingCost;
  MezLocation customerLocation;
  MezLocation laundryLocation;
  LaundryOrderCosts? costsByType;
  DateTime? estimatedLaundryReadyTime;
  RouteInformation? routeInformation;
  int fromCustomerDeliveryId;
  int? toCustomerDeliveryId;

  LaundryOrder(
      {required super.orderId,
      required super.cost,
      required this.laundryLocation,
      required this.customerLocation,
      required super.orderTime,
      required super.paymentType,
      required this.status,
      required super.customer,
      required this.laundry,
      required this.fromCustomerDeliveryId,
      required this.toCustomerDeliveryId,
      required this.shippingCost,
      this.costsByType,
      this.estimatedLaundryReadyTime,
      this.routeInformation,
      super.dropoffDriver,
      int? laundryDropOffDriverChatId,
      super.customerDropOffDriverChatId,
      super.pickupDriver,
      int? laundryPickupDriverChatId,
      super.customerPickupDriverChatId,
      super.estimatedPickupFromCustomerTime,
      super.estimatedDropoffAtServiceProviderTime,
      super.estimatedPickupFromServiceProviderTime,
      super.estimatedDropoffAtCustomerTime,
      this.notes,
      super.orderType = OrderType.Laundry,
      required super.chatId,
      super.notifiedAdmin,
      super.notifiedOperator})
      : super(
            to: customerLocation,
            totalCost: cost,
            serviceProviderDropOffDriverChatId: laundryDropOffDriverChatId,
            serviceProviderPickupDriverChatId: laundryPickupDriverChatId,
            serviceProviderId: laundry?.hasuraId,
            serviceProvider: laundry);

  // factory LaundryOrder.fromData(id, data) {
  //   final dynamic _estimatedPickupFromServiceProviderTime =
  //       data["estimatedDeliveryTimes"]?["dropoff"]?["pickup"];
  //   final dynamic _estimatedDropoffAtCustomerTime =
  //       data["estimatedDeliveryTimes"]?["dropoff"]?["dropoff"];
  //   final dynamic _estimatedPickupFromCustomerTime =
  //       data["estimatedDeliveryTimes"]?["pickup"]?["pickup"];
  //   final dynamic _estimatedDropoffAtServiceProviderTime =
  //       data["estimatedDeliveryTimes"]?["pickup"]?["dropoff"];

  //   final LaundryOrder laundryOrder = LaundryOrder(
  //       chatId: 1,
  //       orderId: id,
  //       // TODO:544D-HASURA
  //       customer: UserInfo(
  //           firebaseId: "",
  //           hasuraId: 2,
  //           name: null,
  //           image: null,
  //           language: null),
  //       // customer: UserInfo.fromData(data["customer"]),
  //       status: data['status'].toString().toLaundryOrderStatus(),
  //       cost: data['cost'],
  //       to: Location.fromFirebaseData(data['to']),
  //       orderTime: DateTime.parse(data["orderTime"]),
  //       paymentType: data["paymentType"].toString().toPaymentType(),
  //       shippingCost: data["shippingCost"] ?? 50,
  //       notes: data["notes"],
  //       costsByType: (data["costsByType"] != null)
  //           ? LaundryOrderCosts.fromData(data["costsByType"])
  //           : null,
  //       estimatedLaundryReadyTime: (data["estimatedLaundryReadyTime"] != null)
  //           ? DateTime.parse(data["estimatedLaundryReadyTime"])
  //           : null,
  //       estimatedPickupFromServiceProviderTime:
  //           (_estimatedPickupFromServiceProviderTime != null &&
  //                   _estimatedPickupFromServiceProviderTime != "")
  //               ? DateTime.parse(_estimatedPickupFromServiceProviderTime)
  //               : null,
  //       estimatedDropoffAtCustomerTime:
  //           (_estimatedDropoffAtCustomerTime != null &&
  //                   _estimatedDropoffAtCustomerTime != "")
  //               ? DateTime.parse(_estimatedDropoffAtCustomerTime)
  //               : null,
  //       estimatedPickupFromCustomerTime:
  //           (_estimatedPickupFromCustomerTime != null &&
  //                   _estimatedPickupFromCustomerTime != "")
  //               ? DateTime.parse(_estimatedPickupFromCustomerTime)
  //               : null,
  //       estimatedDropoffAtServiceProviderTime:
  //           (_estimatedDropoffAtServiceProviderTime != null &&
  //                   _estimatedDropoffAtServiceProviderTime != "")
  //               ? DateTime.parse(_estimatedDropoffAtServiceProviderTime)
  //               : null,
  //       laundry: (data["laundry"] != null) ? ServiceInfo.fromData(data["laundry"]) : null,
  //       dropoffDriver: (data["dropoffDriver"] != null) ? DeliveryDriverUserInfo.fromData(data["dropoffDriver"]) : null,
  //       laundryDropOffDriverChatId: data['secondaryChats']?['serviceProviderDropOffDriver'],
  //       customerDropOffDriverChatId: data['secondaryChats']?['customerDropOffDriver'],
  //       pickupDriver: (data["pickupDriver"] != null) ? DeliveryDriverUserInfo.fromData(data["pickupDriver"]) : null,
  //       laundryPickupDriverChatId: data['secondaryChats']?['serviceProviderPickupDriver'],
  //       customerPickupDriverChatId: data['secondaryChats']?['customerPickupDriver'],
  //       notifiedAdmin: data['notified']?['admin'] ?? false,
  //       notifiedOperator: data['notified']?['operator'] ?? false);

  //   if (data["routeInformation"] != null) {
  //     laundryOrder.routeInformation = RouteInformation(
  //       polyline: data["routeInformation"]["polyline"],
  //       distance: RideDistance.fromJson(data["routeInformation"]["distance"]),
  //       duration: RideDuration.fromJson(
  //         data["routeInformation"]["duration"],
  //       ),
  //     );
  //   }

  //   if (data["stripePaymentInfo"] != null) {
  //     laundryOrder.stripePaymentInfo =
  //         StripeOrderPaymentInfo.fromJson(data["stripePaymentInfo"]);
  //   }

  //   return laundryOrder;
  // }

  // Added for Debugging Perposes - Don't delete for now
  Map<String, dynamic> toJson() => <String, dynamic>{
        "customer": customer,
        "estimatedPrice": cost,
        "status": status,
        "to": to,
        "orderTime": orderTime,
        "paymentType": paymentType,
        "notes": notes,
        "costsByType": costsByType?.toFirebasFormat() ?? null
      };

  @override
  bool isCanceled() {
    // all of them are in /past node
    return status == LaundryOrderStatus.CancelledByCustomer ||
        status == LaundryOrderStatus.CancelledByAdmin;
  }

  bool afterAtLaundry() {
    return status == LaundryOrderStatus.AtLaundry ||
        status == LaundryOrderStatus.Delivered ||
        status == LaundryOrderStatus.OtwPickupFromLaundry ||
        status == LaundryOrderStatus.PickedUpFromLaundry ||
        status == LaundryOrderStatus.ReadyForDelivery;
  }

  int? getCustomerDriverChatId() {
    if (getCurrentPhase() == LaundryOrderPhase.Pickup &&
        customerPickupDriverChatId != null) {
      return customerPickupDriverChatId;
    } else if (customerDropOffDriverChatId != null) {
      return customerDropOffDriverChatId;
    }
    return null;
  }

  int get deliveryOrderId {
    return getCurrentPhase() == LaundryOrderPhase.Pickup
        ? fromCustomerDeliveryId
        : toCustomerDeliveryId!;
  }

  int? getServiceDriverChatId() {
    if (getCurrentPhase() == LaundryOrderPhase.Pickup &&
        serviceProviderPickupDriverChatId != null) {
      return serviceProviderPickupDriverChatId;
    } else if (serviceProviderDropOffDriverChatId != null) {
      return serviceProviderDropOffDriverChatId;
    }
    return null;
  }

  @override
  bool inProcess() {
    return status == LaundryOrderStatus.OrderReceived ||
        status == LaundryOrderStatus.OtwPickupFromCustomer ||
        status == LaundryOrderStatus.PickedUpFromCustomer ||
        status == LaundryOrderStatus.AtLaundry ||
        status == LaundryOrderStatus.ReadyForDelivery ||
        status == LaundryOrderStatus.OtwPickupFromLaundry ||
        status == LaundryOrderStatus.PickedUpFromLaundry;
  }

  bool inDeliveryPhase() {
    return status == LaundryOrderStatus.OtwPickupFromCustomer ||
        status == LaundryOrderStatus.OtwPickupFromLaundry ||
        status == LaundryOrderStatus.PickedUpFromCustomer ||
        status == LaundryOrderStatus.PickedUpFromLaundry;
  }

  bool isAtLaundry() {
    return status == LaundryOrderStatus.AtLaundry;
  }

  bool get inPickup {
    return status == LaundryOrderStatus.OtwPickupFromCustomer ||
        status == LaundryOrderStatus.OrderReceived ||
        status == LaundryOrderStatus.PickedUpFromCustomer;
  }

  LaundryOrderPhase getCurrentPhase() {
    switch (status) {
      case LaundryOrderStatus.OrderReceived:
      case LaundryOrderStatus.OtwPickupFromCustomer:
      case LaundryOrderStatus.PickedUpFromCustomer:
        return LaundryOrderPhase.Pickup;
      case LaundryOrderStatus.ReadyForDelivery:
      case LaundryOrderStatus.OtwPickupFromLaundry:
      case LaundryOrderStatus.PickedUpFromLaundry:
      case LaundryOrderStatus.Delivered:
        return LaundryOrderPhase.Dropoff;
      case LaundryOrderStatus.AtLaundry:
        return LaundryOrderPhase.Neither;
      default:
        return LaundryOrderPhase.Neither;
    }
  }
}

class LaundryOrderCostLineItem extends LaundryCostLineItem {
  num weight;

  num get weighedCost => weight * cost;
  LaundryOrderCostLineItem({
    required this.weight,
    required int id,
    required Map<LanguageType, String> name,
    required num cost,
  }) : super(cost: cost, name: name, id: id);

  // factory LaundryOrderCostLineItem.fromData(laundryCostLineItemData) {
  //   final LaundryOrderCostLineItem newLo = LaundryOrderCostLineItem(
  //     weight: laundryCostLineItemData["weight"],
  //     id: LaundryCostLineItem.fromData(laundryCostLineItemData).id,
  //     name: LaundryCostLineItem.fromData(laundryCostLineItemData).name,
  //     cost: LaundryCostLineItem.fromData(laundryCostLineItemData).cost,
  //   );

  //   // final LaundryOrderCostLineItem li =
  //   //     LaundryCostLineItem.fromData(laundryCostLineItemData)
  //   //         as LaundryOrderCostLineItem;

  //   // li.weight = laundryCostLineItemData["weight"];
  //   return newLo;
  // }

  @override
  Map<String, dynamic> toFirebaseFormat() {
    return {
      ...super.toFirebaseFormat(),
      "weight": weight,
      "weighedCost": weighedCost
    };
  }

  @override
  bool operator ==(covariant LaundryOrderCostLineItem other) {
    if (identical(this, other)) return true;

    return other.weight == weight;
  }

  @override
  int get hashCode => weight.hashCode;
}

class LaundryOrderCosts {
  List<LaundryOrderCostLineItem> lineItems = <LaundryOrderCostLineItem>[];
  num minimumCost = 0;
  LaundryOrderCosts({
    required this.lineItems,
    this.minimumCost = 0,
  });
  num get weighedCost {
    final num totalCost =
        lineItems.fold<num>(0, (sum, lineItem) => sum + lineItem.weighedCost);
    return (totalCost > minimumCost) ? totalCost : minimumCost;
  }

  num get totalWeigh {
    num totalWeigh = 0;
    lineItems.forEach((element) {
      totalWeigh += element.weight;
    });
    return totalWeigh;
  }

  num? get totalPrice {
    num totalPrice = 0;
    lineItems.forEach((element) {
      totalPrice += element.weighedCost;
    });
    if (totalPrice > 0) {
      return totalPrice;
    } else {
      return null;
    }
  }

  // factory LaundryOrderCosts.fromData(laundryCostsData) {
  //   // ignore: prefer_final_locals
  //   LaundryOrderCosts laundryCosts = LaundryOrderCosts();
  //   laundryCosts.minimumCost = laundryCostsData['minimumCost'];
  //   // ignore: avoid_annotating_with_dynamic
  //   laundryCostsData["byType"]?.forEach((item) {
  //     laundryCosts.lineItems.add(LaundryOrderCostLineItem.fromData(item));
  //   });

  //   return laundryCosts;
  // }

  Map<String, dynamic> toFirebasFormat() {
    return {
      'minimumCost': minimumCost,
      'byType': lineItems
          .map((LaundryCostLineItem item) => item.toFirebaseFormat())
          .toList(),
      'weighedCost': weighedCost,
    };
  }
}
