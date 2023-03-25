import 'package:flutter/material.dart' as mat;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/helpers/thirdParty/MapHelper.dart';
import 'package:mezcalmos/Shared/helpers/thirdParty/StripeHelper.dart';
import 'package:mezcalmos/Shared/models/Drivers/DeliveryDriver.dart';
import 'package:mezcalmos/Shared/models/Orders/DeliveryOrder/utilities/DeliveryAction.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder/TaxiOrder.dart';
import 'package:mezcalmos/Shared/models/User.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServiceProviderType.dart';

abstract class Order {
  int orderId;
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

extension ParseOrderTypeToString on OrderType {
  // String toFirebaseFormatString() {
  //   final String str = toString().split('.').last;
  //   return str[0].toLowerCase() + str.substring(1);
  // }

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
  // cloudFunctionModels.OrderType toCloudFunctionsModel() {
  //   switch (this) {
  //     case OrderType.Laundry:
  //       return cloudFunctionModels.OrderType.Laundry;
  //     case OrderType.Restaurant:
  //       return cloudFunctionModels.OrderType.Restaurant;
  //     case OrderType.Taxi:
  //       return cloudFunctionModels.OrderType.Taxi;
  //     case OrderType.Water:
  //       return cloudFunctionModels.OrderType.Water;
  //   }
  // }

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

// extension ParseStringToOrderType on String {
//   OrderType toOrderType() {
//     return OrderType.values
//         .firstWhere((OrderType e) => e.toFirebaseFormatString() == this);
//   }
// }

abstract class DeliverableOrder extends Order {
  DeliveryDriverUserInfo? driverInfo;
  UserInfo? deliveryCompany;
  MezLocation? pickupLocation;
  int? deliveryOrderId;

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
}

abstract class TwoWayDeliverableOrder extends DeliverableOrder {
  DeliveryDriverUserInfo? pickupDriver;
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
}

class OrderCosts {
  num? deliveryCost;
  num? refundAmmount;

  num? tax;
  num? orderItemsCost;
  num? totalCost;
  OrderCosts({
    required this.deliveryCost,
    required this.refundAmmount,
    required this.tax,
    required this.orderItemsCost,
    required this.totalCost,
  });
}
