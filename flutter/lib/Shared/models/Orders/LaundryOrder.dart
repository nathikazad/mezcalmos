// ignore_for_file: constant_identifier_names

import 'package:mezcalmos/Shared/helpers/MapHelper.dart';
import 'package:mezcalmos/Shared/models/Drivers/DeliveryDriver.dart';
import 'package:mezcalmos/Shared/models/Location.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
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
  ServiceInfo? laundry;
  LaundryOrderStatus status;
  num shippingCost;
  num costPerKilo;
  LaundryOrder({
    required String orderId,
    required num cost,
    required Location to,
    required DateTime orderTime,
    required PaymentType paymentType,
    required this.status,
    required UserInfo customer,
    required this.laundry,
    required this.shippingCost,
    required this.costPerKilo,
    DeliveryDriverUserInfo? dropoffDriver,
    String? dropOffDriverChatId,
    DeliveryDriverUserInfo? pickupDriver,
    String? pickupDriverChatId,
    this.weight,
    this.notes,
    RouteInformation? routeInformation,
  }) : super(
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
          pickupDriverChatId: pickupDriverChatId,
          routeInformation: routeInformation,
        );

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
        costPerKilo: data['costPerKilo'] ?? 20,
        notes: data["notes"],
        laundry: (data["laundry"] != null)
            ? ServiceInfo.fromData(data["laundry"])
            : null,
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
        "weight": weight,
        "notes": notes,
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
