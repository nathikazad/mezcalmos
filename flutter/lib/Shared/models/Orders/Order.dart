// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart' as mat;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/helpers/thirdParty/MapHelper.dart';
import 'package:mezcalmos/Shared/helpers/thirdParty/StripeHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/DeliveryOrder/utilities/ChangePriceRequest.dart';
import 'package:mezcalmos/Shared/models/Orders/DeliveryOrder/utilities/DeliveryAction.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder/TaxiOrder.dart';
import 'package:mezcalmos/Shared/models/User.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';
import 'package:mezcalmos/Shared/models/Utilities/Review.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServiceProviderType.dart';

abstract class Order {
  int orderId;
  Review? review;
  OrderType orderType;
  int? serviceProviderId;
  PaymentType paymentType;
  ServiceProviderType deliveryProviderType;
  DateTime orderTime;
  UserInfo customer;
  UserInfo serviceProvider;
  MezLocation dropOffLocation;
  String? notes;

  RouteInformation? routeInformation;
  StripeOrderPaymentInfo? stripePaymentInfo;
  OrderCosts costs;
  int chatId;
  DateTime? estimatedPackageReadyTime;
  DateTime? scheduleTime;

  Order({
    required this.chatId,
    required this.orderId,
    required this.orderType,
    this.notes,
    this.review,
    this.serviceProviderId,
    required this.paymentType,
    required this.orderTime,
    required this.costs,
    required this.deliveryProviderType,
    required this.customer,
    required this.serviceProvider,
    required this.dropOffLocation,
    this.routeInformation,
    this.stripePaymentInfo,
    this.scheduleTime,
    this.estimatedPackageReadyTime,
  });
  bool isIncoming() {
    switch (orderType) {
      case OrderType.Restaurant:
        return (this as RestaurantOrder).status ==
            RestaurantOrderStatus.OrderReceived;
      case OrderType.Laundry:
        return (this as LaundryOrder).status ==
            LaundryOrderStatus.OrderReceived;
      case OrderType.Taxi:
        return (this as TaxiOrder).status == TaxiOrdersStatus.LookingForTaxi ||
            (this as TaxiOrder).status ==
                TaxiOrdersStatus.LookingForTaxiScheduled;

      default:
        return false;
    }
  }

  bool get isScheduled {
    return scheduleTime != null;
  }

  bool inProcess();

  bool isCanceled();

  String driverDatabaseAddress() {
    switch (orderType) {
      case OrderType.Laundry:
        switch ((this as LaundryOrder).getCurrentPhase()) {
          case LaundryOrderPhase.Dropoff:
            return "dropoffDriver";
          case LaundryOrderPhase.Pickup:
            return "pickupDriver";
          case LaundryOrderPhase.Neither:
            return "dropoffDriver";
        }
      case OrderType.Restaurant:
        return "dropoffDriver";
      default:
        return "driver";
    }
  }
// Order.orderFromData(dynamic orderId, dynamic orderData){
}

// ignore: constant_identifier_names
// enum OrderType { Taxi, Restaurant, Laundry, Water, Courier }

extension OrderTypeHelper on OrderType {
  mat.IconData toIcon() {
    switch (this) {
      case OrderType.Restaurant:
        return mat.Icons.flatware;
      case OrderType.Laundry:
        return mat.Icons.local_laundry_service;
      case OrderType.Taxi:
        return mat.Icons.local_taxi;
      case OrderType.Courier:
        return mat.Icons.shopping_bag;

        break;
      default:
        return mat.Icons.watch_later;
    }
  }

  ServiceProviderType toServiceProviderType() {
    switch (this) {
      case OrderType.Restaurant:
        return ServiceProviderType.Restaurant;
      case OrderType.Laundry:
        return ServiceProviderType.Laundry;
      case OrderType.Courier:
        return ServiceProviderType.DeliveryCompany;
      default:
        throw StateError("Error Can't get service provider type 🛑");
    }
  }

  String toPlural() {
    switch (this) {
      case OrderType.Taxi:
        return "taxis";
      case OrderType.Restaurant:
        return "restaurants";
      case OrderType.Laundry:
        return "laundries";
      case OrderType.Water:
        return "waters";
      case OrderType.Courier:
        return "couriers";
    }
  }
}

abstract class DeliverableOrder extends Order {
  UserInfo? driverInfo;
  UserInfo? deliveryCompany;
  MezLocation? pickupLocation;
  int? deliveryOrderId;
  final Review? customerReviewByDriver;
  final Review? serviceReviewByDriver;
  LatLng? driverLocation;
  DeliveryDirection deliveryDirection;

  int? serviceProviderDriverChatId;
  int? customerDriverChatId;
  DateTime? estimatedArrivalAtPickup;
  DateTime? estimatedArrivalAtDropoff;
  bool notifiedOperator;
  bool notifiedAdmin;
  DeliverableOrder({
    required super.orderId,
    required super.chatId,
    required this.deliveryOrderId,
    required this.driverLocation,
    required this.deliveryDirection,
    super.notes,
    super.review,
    this.customerReviewByDriver,
    this.serviceReviewByDriver,
    required this.deliveryCompany,
    super.serviceProviderId,
    required super.paymentType,
    required super.orderTime,
    required super.costs,
    required super.deliveryProviderType,
    required super.serviceProvider,
    required super.customer,
    required super.dropOffLocation,
    required super.orderType,
    this.driverInfo,
    required this.serviceProviderDriverChatId,
    required this.customerDriverChatId,
    this.estimatedArrivalAtPickup,
    this.estimatedArrivalAtDropoff,
    super.estimatedPackageReadyTime,
    super.scheduleTime,
    super.stripePaymentInfo,
    required super.routeInformation,
    required this.pickupLocation,
    this.notifiedAdmin = false,
    this.notifiedOperator = false,
  });

  @override
  bool operator ==(covariant DeliverableOrder other) {
    if (identical(this, other)) return true;

    return other.driverInfo == driverInfo &&
        other.deliveryCompany == deliveryCompany &&
        other.pickupLocation == pickupLocation &&
        other.deliveryOrderId == deliveryOrderId &&
        other.driverLocation == driverLocation &&
        other.deliveryDirection == deliveryDirection &&
        other.serviceProviderDriverChatId == serviceProviderDriverChatId &&
        other.customerDriverChatId == customerDriverChatId &&
        other.estimatedArrivalAtPickup == estimatedArrivalAtPickup &&
        other.estimatedArrivalAtDropoff == estimatedArrivalAtDropoff &&
        other.notifiedOperator == notifiedOperator &&
        other.notifiedAdmin == notifiedAdmin;
  }

  @override
  int get hashCode {
    return driverInfo.hashCode ^
        deliveryCompany.hashCode ^
        pickupLocation.hashCode ^
        deliveryOrderId.hashCode ^
        driverLocation.hashCode ^
        deliveryDirection.hashCode ^
        serviceProviderDriverChatId.hashCode ^
        customerDriverChatId.hashCode ^
        estimatedArrivalAtPickup.hashCode ^
        estimatedArrivalAtDropoff.hashCode ^
        notifiedOperator.hashCode ^
        notifiedAdmin.hashCode;
  }

  @override
  String toString() {
    return 'DeliverableOrder(driverInfo: $driverInfo, deliveryCompany: $deliveryCompany, pickupLocation: $pickupLocation, deliveryOrderId: $deliveryOrderId, driverLocation: $driverLocation, deliveryDirection: $deliveryDirection, serviceProviderDriverChatId: $serviceProviderDriverChatId, customerDriverChatId: $customerDriverChatId, estimatedArrivalAtPickup: $estimatedArrivalAtPickup, estimatedArrivalAtDropoff: $estimatedArrivalAtDropoff, notifiedOperator: $notifiedOperator, notifiedAdmin: $notifiedAdmin)';
  }
}

abstract class TwoWayDeliverableOrder extends DeliverableOrder {
  UserInfo? pickupDriver;
  int? serviceProviderPickupDriverChatId;
  int? customerPickupDriverChatId;
  DateTime? estimatedPickupFromCustomerTime;
  DateTime? estimatedDropoffAtServiceProviderTime;

  TwoWayDeliverableOrder(
      {required super.orderId,
      required super.chatId,
      super.serviceProviderId,
      required super.paymentType,
      required super.orderTime,
      required super.deliveryProviderType,
      required this.customerPickupDriverChatId,
      required super.costs,
      required super.deliveryDirection,
      required super.deliveryOrderId,
      super.notes,
      super.review,
      required super.driverLocation,
      required super.serviceProvider,
      required super.customer,
      required super.deliveryCompany,
      super.stripePaymentInfo,
      required super.orderType,
      super.routeInformation,
      super.estimatedPackageReadyTime,
      super.scheduleTime,
      super.driverInfo,
      required super.serviceProviderDriverChatId,
      required super.customerDriverChatId,
      this.pickupDriver,
      required this.serviceProviderPickupDriverChatId,
      super.estimatedArrivalAtPickup,
      super.estimatedArrivalAtDropoff,
      this.estimatedPickupFromCustomerTime,
      this.estimatedDropoffAtServiceProviderTime,
      super.notifiedAdmin,
      super.notifiedOperator,
      required super.dropOffLocation,
      required super.pickupLocation});

  @override
  bool operator ==(covariant TwoWayDeliverableOrder other) {
    if (identical(this, other)) return true;

    return other.pickupDriver == pickupDriver &&
        other.serviceProviderPickupDriverChatId ==
            serviceProviderPickupDriverChatId &&
        other.customerPickupDriverChatId == customerPickupDriverChatId &&
        other.estimatedPickupFromCustomerTime ==
            estimatedPickupFromCustomerTime &&
        other.estimatedDropoffAtServiceProviderTime ==
            estimatedDropoffAtServiceProviderTime;
  }

  @override
  int get hashCode {
    return pickupDriver.hashCode ^
        serviceProviderPickupDriverChatId.hashCode ^
        customerPickupDriverChatId.hashCode ^
        estimatedPickupFromCustomerTime.hashCode ^
        estimatedDropoffAtServiceProviderTime.hashCode;
  }
}

class OrderCosts {
  num? deliveryCost;
  num? refundAmmount;
  ChangePriceRequest? changePriceRequest;
  num? tax;
  num? orderItemsCost;
  num? totalCost;
  OrderCosts({
    required this.deliveryCost,
    this.changePriceRequest,
    required this.refundAmmount,
    required this.tax,
    required this.orderItemsCost,
    required this.totalCost,
  });
  bool get requested =>
      changePriceRequest?.status == ChangePriceRequestStatus.Requested;
  num get itemCostsWithTax => (tax ?? 0) + orderItemsCost!;
}
