import 'package:mezcalmos/Shared/models/User.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServiceProviderType.dart';

class Review {
  int? id;
  String? comment;
  num rating;
  int toEntityId;
  ServiceProviderType toEntityType;
  int fromEntityId;
  ServiceProviderType fromEntityType;
  int? orderId;
  UserInfo? customer;

  DateTime reviewTime;
  Review({
    this.id,
    required this.comment,
    required this.rating,
    required this.toEntityId,
    required this.toEntityType,
    required this.fromEntityId,
    required this.fromEntityType,
    this.orderId,
    this.customer,
    required this.reviewTime,
  });

  Review copyWith({
    int? id,
    String? comment,
    num? rating,
    int? toEntityId,
    ServiceProviderType? toEntityType,
    int? fromEntityId,
    ServiceProviderType? fromEntityType,
    int? orderId,
    DateTime? reviewTime,
  }) {
    return Review(
      id: id ?? this.id,
      comment: comment ?? this.comment,
      rating: rating ?? this.rating,
      toEntityId: toEntityId ?? this.toEntityId,
      toEntityType: toEntityType ?? this.toEntityType,
      fromEntityId: fromEntityId ?? this.fromEntityId,
      fromEntityType: fromEntityType ?? this.fromEntityType,
      orderId: orderId ?? this.orderId,
      reviewTime: reviewTime ?? this.reviewTime,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'comment': comment,
      'rating': rating,
      'toEntityId': toEntityId,
      'toEntityType': toEntityType.toFirebaseFormatString(),
      'fromEntityId': fromEntityId,
      'fromEntityType': fromEntityType.toFirebaseFormatString(),
      'orderId': orderId,
      'reviewTime': reviewTime.millisecondsSinceEpoch,
    };
  }

  // factory Review.fromMap(Map<String, dynamic> map) {
  //   return Review(
  //     id: map['id']?.toInt() ?? 0,
  //     comment: map['comment'],
  //     rating: map['rating'] ?? 0,
  //     toEntityId: map['toEntityId']?.toInt() ?? 0,
  //     toEntityType: ServiceProviderType.fromMap(map['toEntityType']),
  //     fromEntityId: map['fromEntityId']?.toInt() ?? 0,
  //     fromEntityType: ServiceProviderType.fromMap(map['fromEntityType']),
  //     orderId: map['orderId']?.toInt(),
  //     reviewTime: map['reviewTime'] != null
  //         ? DateTime.fromMillisecondsSinceEpoch(map['reviewTime'])
  //         : null,
  //   );
  // }

  // String toJson() => json.encode(toMap());

  // factory Review.fromJson(String source) => Review.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Review(id: $id, comment: $comment, rating: $rating, toEntityId: $toEntityId, toEntityType: $toEntityType, fromEntityId: $fromEntityId, fromEntityType: $fromEntityType, orderId: $orderId, reviewTime: $reviewTime)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Review &&
        other.id == id &&
        other.comment == comment &&
        other.rating == rating &&
        other.toEntityId == toEntityId &&
        other.toEntityType == toEntityType &&
        other.fromEntityId == fromEntityId &&
        other.fromEntityType == fromEntityType &&
        other.orderId == orderId &&
        other.reviewTime == reviewTime;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        comment.hashCode ^
        rating.hashCode ^
        toEntityId.hashCode ^
        toEntityType.hashCode ^
        fromEntityId.hashCode ^
        fromEntityType.hashCode ^
        orderId.hashCode ^
        reviewTime.hashCode;
  }
}
