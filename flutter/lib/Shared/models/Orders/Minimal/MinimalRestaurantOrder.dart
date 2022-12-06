import 'dart:convert';

import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';

class MinimalRestaurantOrder {
  int id;
  String? toAdress;
  DateTime orderTime;
  String customerName;
  String? customerImage;
  RestaurantOrderStatus status;
  double totalCost;
  MinimalRestaurantOrder({
    required this.id,
    required this.toAdress,
    required this.orderTime,
    required this.customerName,
    required this.customerImage,
    required this.status,
    required this.totalCost,
  });

  MinimalRestaurantOrder copyWith({
    int? id,
    String? toAdress,
    DateTime? orderTime,
    String? customerName,
    String? customerImage,
    RestaurantOrderStatus? status,
    num? totalCost,
  }) {
    return MinimalRestaurantOrder(
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

  // ignore: avoid_annotating_with_dynamic
  factory MinimalRestaurantOrder.fromMap(dynamic map) {
    return MinimalRestaurantOrder(
      id: map['id']?.toInt() ?? 0,
      toAdress: map['toAdress'] ?? '',
      orderTime: DateTime.fromMillisecondsSinceEpoch(map['orderTime']),
      customerName: map['customerName'] ?? '',
      customerImage: map['customerImage'] ?? '',
      status: map["status"].toString().toRestaurantOrderStatus(),
      totalCost: map['totalCost'] ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory MinimalRestaurantOrder.fromJson(String source) =>
      MinimalRestaurantOrder.fromMap(json.decode(source));

  @override
  String toString() {
    return 'MinimalRestaurantOrder(id: $id, toAdress: $toAdress, orderTime: $orderTime, customerName: $customerName, customerImage: $customerImage, status: $status, totalCost: $totalCost)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MinimalRestaurantOrder &&
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
