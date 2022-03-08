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
    String str = this.toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1).toLowerCase();
  }
}

extension ParseStringToOrderStatus on String {
  LaundryOrderStatus toLaundryOrderStatus() {
    return LaundryOrderStatus.values.firstWhere(
        (e) => e.toFirebaseFormatString().toLowerCase() == this.toLowerCase());
  }
}

class LaundryOrder extends TwoWayDeliverableOrder {
  num? weight;
  String? notes;
  UserInfo laundry;
  LaundryOrderStatus status;
  LaundryOrder(
      {required String orderId,
      required num cost,
      required Location to,
      required DateTime orderTime,
      required PaymentType paymentType,
      required this.status,
      required UserInfo customer,
      required this.laundry,
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

  factory LaundryOrder.fromData(dynamic id, dynamic data) {
    LaundryOrder laundryOrder = LaundryOrder(
        orderId: id,
        customer: UserInfo.fromData(data["customer"]),
        status: data['status'].toString().toLaundryOrderStatus(),
        cost: data['cost'],
        to: Location.fromFirebaseData(data['to']),
        orderTime: DateTime.parse(data["orderTime"]),
        paymentType: data["paymentType"].toString().toPaymentType(),
        weight: data["weight"],
        notes: data["notes"],
        laundry: UserInfo.fromData(data["laundry"]),
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
  Map<String, dynamic> toJson() => {
        "customer": customer,
        "estimatedPrice": cost,
        "status": status,
        "to": to,
        "orderTime": orderTime,
        "paymentType": paymentType,
        "weight": weight,
        "notes": notes
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

  LaundryOrderPhase getCurrentPhase() {
    switch (this.status) {
      case LaundryOrderStatus.OrderReceieved:
      case LaundryOrderStatus.PickedUp:
      case LaundryOrderStatus.OtwPickup:
      case LaundryOrderStatus.AtLaundry:
        return LaundryOrderPhase.Pickup;
      case LaundryOrderStatus.ReadyForDelivery:
      case LaundryOrderStatus.OtwDelivery:
        return LaundryOrderPhase.Dropoff;
      case LaundryOrderStatus.Delivered:
        return LaundryOrderPhase.Dropoff;
      default:
        return LaundryOrderPhase.Neither;
    }
  }
}
