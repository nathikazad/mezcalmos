import 'package:mezcalmos/Shared/models/Location.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';

enum LaundryOrdersStatus {
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

extension ParseOrderStatusToString on LaundryOrdersStatus {
  String toFirebaseFormatString() {
    return this.toString().split('.').last;
  }
}

extension ParseStringToOrderStatus on String {
  LaundryOrdersStatus toLaundryOrderStatus() {
    return LaundryOrdersStatus.values.firstWhere(
        (e) => e.toFirebaseFormatString().toLowerCase() == this.toLowerCase());
  }
}

class LaundryOrder extends Order {
  LaundryOrdersStatus status;
  num? weight;
  String? notes;

  LaundryOrder(
      {required String orderId,
      required num cost,
      required Location to,
      required DateTime orderTime,
      required PaymentType paymentType,
      required this.status,
      required UserInfo customer,
      this.weight,
      this.notes})
      : super(
            orderTime: orderTime,
            orderId: orderId,
            paymentType: paymentType,
            orderType: OrderType.Laundry,
            cost: cost,
            customer: customer,
            to: to);

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
        notes: data["notes"]);
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
    return status == LaundryOrdersStatus.CancelledByCustomer ||
        status == LaundryOrdersStatus.CancelledByAdmin;
  }

  @override
  bool inProcess() {
    return status == LaundryOrdersStatus.OrderReceieved ||
        status == LaundryOrdersStatus.OtwPickup ||
        status == LaundryOrdersStatus.PickedUp ||
        status == LaundryOrdersStatus.AtLaundry ||
        status == LaundryOrdersStatus.ReadyForDelivery ||
        status == LaundryOrdersStatus.OtwDelivery;
  }
}
