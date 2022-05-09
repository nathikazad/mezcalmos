// ignore_for_file: constant_identifier_names, always_specify_types

import 'package:mezcalmos/Shared/models/Drivers/DeliveryDriver.dart';
import 'package:mezcalmos/Shared/models/Generic.dart';
import 'package:mezcalmos/Shared/models/Location.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Services/Laundry.dart';
import 'package:mezcalmos/Shared/models/User.dart';

enum LaundryOrderStatus {
  OrderReceieved,
  OtwPickup,
  PickedUp,
  AtLaundry,
  ReadyForDelivery,
  OtwDelivery,
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
  num? weight;
  String? notes;
  ServiceInfo laundry;
  LaundryOrderStatus status;
  num shippingCost;
  LaundryOrderCosts? costsByType;
  DateTime? estimatedDeliveryTime;
  LaundryOrder(
      {required String orderId,
      required num cost,
      required Location to,
      required DateTime orderTime,
      required PaymentType paymentType,
      required this.status,
      required UserInfo customer,
      required this.laundry,
      required this.shippingCost,
      this.costsByType,
      this.estimatedDeliveryTime,
      DeliveryDriverUserInfo? dropoffDriver,
      String? dropOffDriverChatId,
      DeliveryDriverUserInfo? pickupDriver,
      String? pickupDriverChatId,
      this.weight,
      this.notes})
      : super(
            orderTime: orderTime,
            orderId: orderId,
            paymentType: paymentType,
            orderType: OrderType.Laundry,
            cost: cost,
            customer: customer,
            to: to,
            dropoffDriver: dropoffDriver,
            dropOffDriverChatId: dropOffDriverChatId,
            pickupDriver: pickupDriver,
            pickupDriverChatId: pickupDriverChatId);

  factory LaundryOrder.fromData(id, data) {
    final LaundryOrder laundryOrder = LaundryOrder(
        orderId: id,
        customer: UserInfo.fromData(data["customer"]),
        status: data['status'].toString().toLaundryOrderStatus(),
        cost: data['cost'],
        to: Location.fromFirebaseData(data['to']),
        orderTime: DateTime.parse(data["orderTime"]),
        paymentType: data["paymentType"].toString().toPaymentType(),
        weight: data["weight"],
        shippingCost: data['shippingCost'] ?? 50,
        notes: data["notes"],
        costsByType: (data["costsByType"] != null)
            ? LaundryOrderCosts.fromData(data["costsByType"])
            : null,
        estimatedDeliveryTime: (data["estimatedDeliveryTime"] != null)
            ? DateTime.parse(data["estimatedDeliveryTime"])
            : null,
        laundry: ServiceInfo.fromData(data["laundry"]),
        dropoffDriver: (data["dropoffDriver"] != null)
            ? DeliveryDriverUserInfo.fromData(data["dropoffDriver"])
            : null,
        dropOffDriverChatId: data['secondaryChats']
            ?['deliveryAdminDropOffDriver'],
        pickupDriver: (data["pickupDriver"] != null)
            ? DeliveryDriverUserInfo.fromData(data["pickupDriver"])
            : null,
        pickupDriverChatId: data['secondaryChats']
            ?['deliveryAdminPickupDriver']);
    return laundryOrder;
  }

  // Added for Debugging Perposes - Don't delete for now
  Map<String, dynamic> toJson() => <String, dynamic>{
        "customer": customer,
        "estimatedPrice": cost,
        "status": status,
        "to": to,
        "orderTime": orderTime,
        "paymentType": paymentType,
        "weight": weight,
        "notes": notes,
        "costsByType": costsByType?.toFirebasFormat() ?? null
      };

  @override
  bool isCanceled() {
    // all of them are in /past node
    return status == LaundryOrderStatus.CancelledByCustomer ||
        status == LaundryOrderStatus.CancelledByAdmin;
  }

  @override
  bool inProcess() {
    return status == LaundryOrderStatus.OrderReceieved ||
        status == LaundryOrderStatus.OtwPickup ||
        status == LaundryOrderStatus.PickedUp ||
        status == LaundryOrderStatus.AtLaundry ||
        status == LaundryOrderStatus.ReadyForDelivery ||
        status == LaundryOrderStatus.OtwDelivery;
  }

  bool isAtLaundry() {
    return status == LaundryOrderStatus.AtLaundry;
  }

  bool inDeliverPhase() {
    return status == LaundryOrderStatus.OtwPickup ||
        status == LaundryOrderStatus.OrderReceieved ||
        status == LaundryOrderStatus.PickedUp ||
        status == LaundryOrderStatus.ReadyForDelivery ||
        status == LaundryOrderStatus.OtwDelivery;
  }

  num? getPrice() {
    if (weight != null) {
      return weight! * 20;
    }
    return null;
  }

  LaundryOrderPhase getCurrentPhase() {
    switch (status) {
      case LaundryOrderStatus.OrderReceieved:
      case LaundryOrderStatus.PickedUp:
      case LaundryOrderStatus.OtwPickup:
        return LaundryOrderPhase.Pickup;
      case LaundryOrderStatus.ReadyForDelivery:
      case LaundryOrderStatus.OtwDelivery:
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
    required Map<LanguageType, String> name,
    required num cost,
  }) : super(cost: cost, name: name);

  factory LaundryOrderCostLineItem.fromData(laundryCostLineItemData) {
    final LaundryOrderCostLineItem newLo = LaundryOrderCostLineItem(
        weight: laundryCostLineItemData["weight"],
        name: LaundryCostLineItem.fromData(laundryCostLineItemData).name,
        cost: LaundryCostLineItem.fromData(laundryCostLineItemData).cost);

    // final LaundryOrderCostLineItem li =
    //     LaundryCostLineItem.fromData(laundryCostLineItemData)
    //         as LaundryOrderCostLineItem;
    // li.weight = laundryCostLineItemData["weight"];
    return newLo;
  }
  @override
  Map<String, dynamic> toFirebaseFormat() {
    return {
      ...super.toFirebaseFormat(),
      "weight": weight,
      "weighedCost": weighedCost
    };
  }
}

class LaundryOrderCosts {
  List<LaundryOrderCostLineItem> lineItems = <LaundryOrderCostLineItem>[];
  num minimumCost = 0;
  num get weighedCost {
    final num totalCost =
        lineItems.fold<num>(0, (sum, lineItem) => sum + lineItem.weighedCost);
    return (totalCost > minimumCost) ? totalCost : minimumCost;
  }

  LaundryOrderCosts();

  factory LaundryOrderCosts.fromData(laundryCostsData) {
    // ignore: prefer_final_locals
    LaundryOrderCosts laundryCosts = LaundryOrderCosts();
    laundryCosts.minimumCost = laundryCostsData['minimumCost'];
    // ignore: avoid_annotating_with_dynamic
    laundryCostsData["byType"]?.forEach((item) {
      laundryCosts.lineItems.add(LaundryOrderCostLineItem.fromData(item));
    });

    return laundryCosts;
  }

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
