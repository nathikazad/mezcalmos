import 'package:mezcalmos/Shared/models/Orders/Order.dart';

class Review {
  String? id;
  String comment;
  num rating;
  String serviceProviderId;
  String authorName;
  OrderType? orderType;
  String orderId;
  String? authorId;
  DateTime? reviewTime;
  Review({
    required this.comment,
    required this.rating,
    required this.serviceProviderId,
    required this.orderType,
    required this.orderId,
    this.authorId,
    this.reviewTime,
    this.authorName = "",
    this.id,
  });

  Map<String, dynamic> toMap() {
    return {
      'comment': comment,
      'authorName': authorName,
      'rating': rating,
      "authorId": authorId,
      'serviceProviderId': serviceProviderId,
      'orderType': orderType?.toFirebaseFormatString(),
      'orderId': orderId,
      "reviewTime": reviewTime?.toUtc().toIso8601String(),
    };
  }

  // ignore: avoid_annotating_with_dynamic
  factory Review.fromMap(String? key, dynamic map) {
    return Review(
      id: key,
      comment: map['comment'] ?? '',
      rating: map['rating'] ?? 0,
      authorName: map["authorName"] ?? "",
      authorId: map['authorId'],
      serviceProviderId: map['serviceProviderId'] ?? '',
      orderType: map?['orderType']?.toString().toOrderType(),
      reviewTime: (map["reviewTime"] != null)
          ? DateTime.parse(map["reviewTime"])
          : null,
      orderId: map['orderId'] ?? '',
    );
  }

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
