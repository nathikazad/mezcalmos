// ignore_for_file: constant_identifier_names, always_specify_types

import 'package:mezcalmos/Shared/helpers/MapHelper.dart';
import 'package:mezcalmos/Shared/models/Drivers/DeliveryDriver.dart';
import 'package:mezcalmos/Shared/models/Generic.dart';
import 'package:mezcalmos/Shared/models/Location.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Services/Laundry.dart';
import 'package:mezcalmos/Shared/models/User.dart';

enum LaundryOrderStatus {
  OrderReceieved,
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
  // TODO @montasarre remove weight as it comes from costsByType
  num? weight;
  String? notes;
  ServiceInfo? laundry;
  LaundryOrderStatus status;
  num shippingCost;
  LaundryOrderCosts? costsByType;
  DateTime? estimatedLaundryReadyTime;
  RouteInformation? routeInformation;

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
      this.estimatedLaundryReadyTime,
      this.routeInformation,
      DeliveryDriverUserInfo? dropoffDriver,
      String? laundryDropOffDriverChatId,
      String? customerDropOffDriverChatId,
      DeliveryDriverUserInfo? pickupDriver,
      String? laundryPickupDriverChatId,
      String? customerPickupDriverChatId,
      DateTime? estimatedPickupFromCustomerTime,
      DateTime? estimatedDropoffAtServiceProviderTime,
      DateTime? estimatedPickupFromServiceProviderTime,
      DateTime? estimatedDropoffAtCustomerTime,
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
            serviceProviderDropOffDriverChatId: laundryDropOffDriverChatId,
            customerDropOffDriverChatId: customerDropOffDriverChatId,
            pickupDriver: pickupDriver,
            serviceProviderPickupDriverChatId: laundryPickupDriverChatId,
            customerPickupDriverChatId: customerPickupDriverChatId,
            estimatedPickupFromServiceProviderTime:
                estimatedPickupFromServiceProviderTime,
            estimatedDropoffAtCustomerTime: estimatedDropoffAtCustomerTime,
            estimatedPickupFromCustomerTime: estimatedPickupFromCustomerTime,
            estimatedDropoffAtServiceProviderTime:
                estimatedDropoffAtServiceProviderTime);

  factory LaundryOrder.fromData(id, data) {
    final LaundryOrder laundryOrder = LaundryOrder(
      orderId: id,
      customer: UserInfo.fromData(data["customer"]),
      status: data['status'].toString().toLaundryOrderStatus(),
      cost: data['cost'],
      to: Location.fromFirebaseData(data['to']),
      orderTime: DateTime.parse(data["orderTime"]),
      paymentType: data["paymentType"].toString().toPaymentType(),
      shippingCost: data['shippingCost'] ?? 50,
      notes: data["notes"],
      costsByType: (data["costsByType"] != null)
          ? LaundryOrderCosts.fromData(data["costsByType"])
          : null,
      estimatedLaundryReadyTime: (data["estimatedLaundryReadyTime"] != null)
          ? DateTime.parse(data["estimatedLaundryReadyTime"])
          : null,
      estimatedPickupFromServiceProviderTime: (data["estimatedDeliveryTimes"]
                  ?["dropoff"]?["pickup"] !=
              null)
          ? DateTime.parse(data["estimatedDeliveryTimes"]["dropoff"]["pickup"])
          : null,
      estimatedDropoffAtCustomerTime: (data["estimatedDeliveryTimes"]
                  ?["dropoff"]?["dropoff"] !=
              null)
          ? DateTime.parse(data["estimatedDeliveryTimes"]["dropoff"]["dropoff"])
          : null,
      estimatedPickupFromCustomerTime: (data["estimatedDeliveryTimes"]
                  ?["pickup"]?["pickup"] !=
              null)
          ? DateTime.parse(data["estimatedDeliveryTimes"]["pickup"]["pickup"])
          : null,
      estimatedDropoffAtServiceProviderTime: (data["estimatedDeliveryTimes"]
                  ?["pickup"]?["dropoff"] !=
              null)
          ? DateTime.parse(data["estimatedDeliveryTimes"]["dropoff"]["pickup"])
          : null,
      laundry: (data["laundry"] != null)
          ? ServiceInfo.fromData(data["laundry"])
          : null,
      dropoffDriver: (data["dropoffDriver"] != null)
          ? DeliveryDriverUserInfo.fromData(data["dropoffDriver"])
          : null,
      laundryDropOffDriverChatId: data['secondaryChats']
          ?['serviceProviderDropOffDriver'],
      customerDropOffDriverChatId: data['secondaryChats']
          ?['customerDropOffDriver'],
      pickupDriver: (data["pickupDriver"] != null)
          ? DeliveryDriverUserInfo.fromData(data["pickupDriver"])
          : null,
      laundryPickupDriverChatId: data['secondaryChats']
          ?['serviceProviderPickupDriver'],
      customerPickupDriverChatId: data['secondaryChats']
          ?['customerPickupDriverDriver'],
    );

    if (data["routeInformation"] != null) {
      laundryOrder.routeInformation = RouteInformation(
        polyline: data["routeInformation"]["polyline"],
        distance: RideDistance.fromJson(data["routeInformation"]["distance"]),
        duration: RideDuration.fromJson(
          data["routeInformation"]["duration"],
        ),
      );
    }

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
        status == LaundryOrderStatus.OtwPickupFromCustomer ||
        status == LaundryOrderStatus.PickedUpFromCustomer ||
        status == LaundryOrderStatus.AtLaundry ||
        status == LaundryOrderStatus.ReadyForDelivery ||
        status == LaundryOrderStatus.OtwPickupFromLaundry ||
        status == LaundryOrderStatus.PickedUpFromLaundry;
  }


  bool isAtLaundry() {
    return status == LaundryOrderStatus.AtLaundry;
  }

  // TODO @montasarre remove getPrice as it comes from costsByType
  num? getPrice() {
    return null;
  }

  LaundryOrderPhase getCurrentPhase() {
    switch (status) {
      case LaundryOrderStatus.OrderReceieved:
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
