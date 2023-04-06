// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';

class DeliveryOrder extends DeliverableOrder {
  int? serviceOrderId;

  DeliveryOrderStatus status;
  ChangePriceRequest? changePriceRequest;

  bool packageReady;

  //bool driverAssigned;
  DeliveryOrder(
      {required super.orderType,
      required super.paymentType,
      required super.deliveryOrderId,
      required super.orderTime,
      super.stripePaymentInfo,
      required super.costs,
      required this.packageReady,
      required this.serviceOrderId,
      required this.status,
      this.changePriceRequest,
      required super.scheduleTime,
      required super.estimatedArrivalAtDropoff,
      required super.estimatedArrivalAtPickup,
      required super.estimatedPackageReadyTime,
      required super.serviceProvider,
      required super.deliveryProviderType,
      required super.driverInfo,
      required super.deliveryCompany,
      required super.deliveryDirection,
      required super.routeInformation,
      required super.orderId,
      required super.chatId,
      super.review,
      required super.customer,
      required super.dropOffLocation,
      required super.serviceProviderDriverChatId,
      required super.customerDriverChatId,
      required super.driverLocation,
      required super.pickupLocation});

  bool get isPickUpTimeSetted => estimatedArrivalAtPickup != null;
  bool get isDropOffTimeSetted => estimatedArrivalAtDropoff != null;

  bool get isDriverAssigned => driverInfo != null;
  bool get isDeliveryCostSetted =>
      driverInfo != null &&
      costs.deliveryCost != null &&
      costs.deliveryCost! > 0;
  bool get isCourier => orderType == OrderType.Courier;
  bool get isTimeSetted => isCourier
      ? isDropOffTimeSetted
      : (isPickUpTimeSetted && isDropOffTimeSetted);
  bool get inPickUpPhase =>
      status == DeliveryOrderStatus.OrderReceived ||
      status == DeliveryOrderStatus.OnTheWayToPickup ||
      status == DeliveryOrderStatus.AtPickup;
  bool get inDeliveryPhase =>
      status == DeliveryOrderStatus.OnTheWayToDropoff ||
      status == DeliveryOrderStatus.AtDropoff;

  @override
  bool operator ==(covariant DeliveryOrder other) {
    if (identical(this, other)) return true;

    return other.orderId == orderId;
  }

  bool inProcess() {
    return status != DeliveryOrderStatus.CancelledByCustomer &&
        status != DeliveryOrderStatus.CancelledByDeliverer &&
        status != DeliveryOrderStatus.CancelledByServiceProvider;
  }

  @override
  bool isCanceled() {
    return status == DeliveryOrderStatus.CancelledByCustomer ||
        status == DeliveryOrderStatus.CancelledByDeliverer ||
        status == DeliveryOrderStatus.CancelledByServiceProvider;
  }

  bool get isInProcess => <DeliveryOrderStatus>[
        DeliveryOrderStatus.AtPickup,
        DeliveryOrderStatus.AtDropoff,
        DeliveryOrderStatus.OnTheWayToDropoff,
        DeliveryOrderStatus.OnTheWayToDropoff
      ].contains(status);

  bool get orderWithDriver {
    return status == DeliveryOrderStatus.OnTheWayToDropoff ||
        status == DeliveryOrderStatus.OnTheWayToPickup ||
        status == DeliveryOrderStatus.AtDropoff ||
        status == DeliveryOrderStatus.AtPickup;
  }

  bool get haveAtLeastOneEstTime {
    return estimatedArrivalAtDropoff != null ||
        estimatedArrivalAtPickup != null ||
        estimatedPackageReadyTime != null;
  }

  // static void copyTo(DeliveryOrder from, DeliveryOrder to) {
  //   to.driverInfo = from.driverInfo;
  //   to.costs = from.costs;
  //   to.status = from.status;
  //   to.estimatedArrivalAtDropoff = ;
  //   to.estimatedArrivalAtDropoff = ;
  //   to.estimatedArrivalAtDropoff = ;
  // }

  @override
  String toString() => super.toString();
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
