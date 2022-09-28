import 'dart:convert';

import 'package:mezcalmos/Shared/models/Orders/Order.dart';

class Review {
  String comment;
  num rating;
  String serviceProviderId;
  OrderType orderType;
  String orderId;
  Review({
    required this.comment,
    required this.rating,
    required this.serviceProviderId,
    required this.orderType,
    required this.orderId,
  });

  Review copyWith({
    String? comment,
    num? rating,
    String? serviceProviderId,
    OrderType? orderType,
    String? orderId,
  }) {
    return Review(
      comment: comment ?? this.comment,
      rating: rating ?? this.rating,
      serviceProviderId: serviceProviderId ?? this.serviceProviderId,
      orderType: orderType ?? this.orderType,
      orderId: orderId ?? this.orderId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'comment': comment,
      'rating': rating,
      'serviceProviderId': serviceProviderId,
      'orderType': orderType.toFirebaseFormatString(),
      'orderId': orderId,
    };
  }

  factory Review.fromMap(Map<String, dynamic> map) {
    return Review(
      comment: map['comment'] ?? '',
      rating: map['rating'] ?? 0,
      serviceProviderId: map['serviceProviderId'] ?? '',
      orderType: map['orderType'].toString().toOrderType(),
      orderId: map['orderId'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Review.fromJson(String source) => Review.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Review(comment: $comment, rating: $rating, serviceProviderId: $serviceProviderId, orderType: $orderType, orderId: $orderId)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Review &&
        other.comment == comment &&
        other.rating == rating &&
        other.serviceProviderId == serviceProviderId &&
        other.orderType == orderType &&
        other.orderId == orderId;
  }

  @override
  int get hashCode {
    return comment.hashCode ^
        rating.hashCode ^
        serviceProviderId.hashCode ^
        orderType.hashCode ^
        orderId.hashCode;
  }
}
