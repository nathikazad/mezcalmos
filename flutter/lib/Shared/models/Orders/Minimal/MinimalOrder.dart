import 'package:mezcalmos/Shared/models/Orders/Minimal/MinimalOrderStatus.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';

class MinimalOrder {
  int id;
  String? toAdress;
  DateTime orderTime;
  String customerName;
  String? customerImage;
  MinimalOrderStatus status;
  double totalCost;
  MinimalOrder({
    required this.id,
    required this.toAdress,
    required this.orderTime,
    required this.customerName,
    required this.customerImage,
    required this.status,
    required this.totalCost,
  });

  MinimalOrder copyWith({
    int? id,
    String? toAdress,
    DateTime? orderTime,
    String? customerName,
    String? customerImage,
    MinimalOrderStatus? status,
    num? totalCost,
  }) {
    return MinimalOrder(
        id: id ?? this.id,
        toAdress: toAdress ?? this.toAdress,
        orderTime: orderTime ?? this.orderTime,
        customerName: customerName ?? this.customerName,
        customerImage: customerImage ?? this.customerImage,
        status: status ?? this.status,
        totalCost: this.totalCost);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'toAdress': toAdress,
      'orderTime': orderTime.millisecondsSinceEpoch,
      'customerName': customerName,
      'customerImage': customerImage,
      //  'status': status.toMap(),
      'totalCost': totalCost,
    };
  }

  @override
  String toString() {
    return 'MinimalRestaurantOrder(id: $id, toAdress: $toAdress, orderTime: $orderTime, customerName: $customerName, customerImage: $customerImage, status: $status, totalCost: $totalCost)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MinimalOrder &&
        other.id == id &&
        other.toAdress == toAdress &&
        other.orderTime == orderTime &&
        other.customerName == customerName &&
        other.customerImage == customerImage &&
        other.status == status &&
        other.totalCost == totalCost;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        toAdress.hashCode ^
        orderTime.hashCode ^
        customerName.hashCode ^
        customerImage.hashCode ^
        status.hashCode ^
        totalCost.hashCode;
  }

  bool get isPast {
    return status == RestaurantOrderStatus.Delivered ||
        status == RestaurantOrderStatus.CancelledByAdmin ||
        status == RestaurantOrderStatus.CancelledByCustomer;
  }
}
