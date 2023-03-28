import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/models/Orders/Minimal/MinimalOrderStatus.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServiceProviderType.dart';

class MinimalOrder {
  int id;
  String? toAdress;
  DateTime orderTime;
  DateTime? estReadyTime;
  DateTime? estDeliveryTime;
  int? numberOfItems;
  double? itemsWeight;
  String title;
  String? image;
  MinimalOrderStatus status;
  OrderType orderType;
  num? deliveryCost;

  double? totalCost;
  int? serviceProviderId;
  ServiceProviderType? serviceProviderType;
  MinimalOrder({
    required this.id,
    required this.toAdress,
    required this.orderTime,
    required this.title,
    this.deliveryCost,
    required this.image,
    required this.status,
    required this.totalCost,
    required this.orderType,
    this.serviceProviderId,
    this.serviceProviderType,
    this.estDeliveryTime,
    this.estReadyTime,
    this.numberOfItems,
    this.itemsWeight,
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
        orderType: orderType,
        orderTime: orderTime ?? this.orderTime,
        title: customerName ?? title,
        image: customerImage ?? image,
        status: status ?? this.status,
        totalCost: this.totalCost);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'toAdress': toAdress,
      'orderTime': orderTime.millisecondsSinceEpoch,
      'customerName': title,
      'customerImage': image,
      //  'status': status.toMap(),
      'totalCost': totalCost,
    };
  }

  @override
  String toString() {
    return 'MinimalRestaurantOrder(id: $id, toAdress: $toAdress, orderTime: $orderTime, customerName: $title, customerImage: $image, status: $status, totalCost: $totalCost)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MinimalOrder &&
        other.id == id &&
        other.toAdress == toAdress &&
        other.orderTime == orderTime &&
        other.title == title &&
        other.image == image &&
        other.status == status &&
        other.totalCost == totalCost;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        toAdress.hashCode ^
        orderTime.hashCode ^
        title.hashCode ^
        image.hashCode ^
        status.hashCode ^
        totalCost.hashCode;
  }

  bool get isPast {
    return status == RestaurantOrderStatus.Delivered ||
        status == RestaurantOrderStatus.CancelledByAdmin ||
        status == RestaurantOrderStatus.CancelledByCustomer;
  }
}
