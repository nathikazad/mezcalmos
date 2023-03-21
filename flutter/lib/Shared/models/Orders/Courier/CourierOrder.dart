// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:mezcalmos/Shared/models/Orders/Courier/CourierOrderItem.dart';
import 'package:mezcalmos/Shared/models/Orders/DeliveryOrder/DeliveryOrder.dart';

class CourierOrder extends DeliveryOrder {
  List<CourierOrdeItem> items = [];
  ChangePriceRequest? changePriceRequest;

  CourierOrder(
      {required super.orderType,
      required super.id,
      required super.deliveryCompany,
      required super.serviceInfo,
      required super.customerInfo,
      required super.driverLocation,
      required super.estimatedArrivalAtDropoffTime,
      required super.estimatedArrivalAtPickupTime,
      required super.estimatedPackageReadyTime,
      required super.serviceOrderId,
      required super.deliveryDirection,
      required super.routeInformation,
      required super.orderTime,
      required super.status,
      required super.serviceProviderType,
      required super.deliveryCost,
      required super.packageCost,
      required super.pickupLocation,
      required super.dropoffLocation,
      required super.chatWithCustomerId,
      required super.chatWithServiceProviderId,
      required super.paymentType,
      required super.scheduleTime,
      required super.driverInfo,
      required this.items,
      this.changePriceRequest,
      required super.stripeOrderPaymentInfo,
      required super.packageReady});
}

class ChangePriceRequest {
  final num oldPrice;
  final num newPrice;
  final String reason;
  final ChangePriceRequestStatus status;

  const ChangePriceRequest({
    required this.oldPrice,
    required this.newPrice,
    required this.reason,
    required this.status,
  });

  ChangePriceRequest copyWith({
    num? oldPrice,
    num? newPrice,
    String? reason,
  }) {
    return ChangePriceRequest(
      oldPrice: oldPrice ?? this.oldPrice,
      newPrice: newPrice ?? this.newPrice,
      reason: reason ?? this.reason,
      status: status,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'oldPrice': oldPrice,
      'newPrice': newPrice,
      'reason': reason,
    };
  }

  factory ChangePriceRequest.fromMap(Map<String, dynamic> map) {
    return ChangePriceRequest(
        oldPrice: num.parse(map['oldPrice'].toString()),
        newPrice: num.parse(map['newPrice'].toString()),
        reason: map['reason'] as String,
        status: map['status'].toString().toChangePriceRequestStatus());
  }

  String toJson() => json.encode(toMap());

  factory ChangePriceRequest.fromJson(String source) =>
      ChangePriceRequest.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'ChangePriceRequest(oldPrice: $oldPrice, newPrice: $newPrice, reason: $reason)';

  @override
  bool operator ==(covariant ChangePriceRequest other) {
    if (identical(this, other)) return true;

    return other.oldPrice == oldPrice &&
        other.newPrice == newPrice &&
        other.reason == reason;
  }

  @override
  int get hashCode => oldPrice.hashCode ^ newPrice.hashCode ^ reason.hashCode;
}

enum ChangePriceRequestStatus { Accepted, Requested, Rejected }

extension ParseChangePriceRequestStatusToString on ChangePriceRequestStatus {
  String toFirebaseFormatString() {
    final String str = toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }

  String toNormalString() {
    String str = toString().split('.').last;
    str = str[0].toUpperCase() + str.substring(1);
    str = str.replaceFirst("_", " ");
    return str;
  }
}

extension ParseStringToChangePriceRequestStatus on String {
  ChangePriceRequestStatus toChangePriceRequestStatus() {
    return ChangePriceRequestStatus.values.firstWhere(
        (ChangePriceRequestStatus e) => e.toFirebaseFormatString() == this);
  }
}
