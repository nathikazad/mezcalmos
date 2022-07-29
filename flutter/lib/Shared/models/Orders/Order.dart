import 'package:mezcalmos/Shared/helpers/MapHelper.dart';
import 'package:mezcalmos/Shared/models/Drivers/DeliveryDriver.dart';
import 'package:mezcalmos/Shared/models/Location.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder/TaxiOrder.dart';
import 'package:mezcalmos/Shared/models/User.dart';

abstract class Order {
  String orderId;
  OrderType orderType;
  String? serviceProviderId;
  PaymentType paymentType;
  DateTime orderTime;
  UserInfo customer;
  UserInfo? serviceProvider;
  Location to;
  num cost;
  RouteInformation? routeInformation;

  Order({
    required this.orderId,
    required this.orderType,
    this.serviceProviderId,
    required this.paymentType,
    required this.orderTime,
    required this.cost,
    required this.customer,
    this.serviceProvider,
    required this.to,
    this.routeInformation,
  });
  bool isIncoming() {
    switch (orderType) {
      case OrderType.Restaurant:
        return (this as RestaurantOrder).status ==
            RestaurantOrderStatus.OrderReceieved;
      case OrderType.Laundry:
        return (this as LaundryOrder).status ==
            LaundryOrderStatus.OrderReceieved;
      case OrderType.Taxi:
        return (this as TaxiOrder).status == TaxiOrdersStatus.LookingForTaxi ||
            (this as TaxiOrder).status ==
                TaxiOrdersStatus.LookingForTaxiScheduled;

      default:
        return false;
    }
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
enum OrderType { Taxi, Restaurant, Laundry, Water }

extension ParseOrderTypeToString on OrderType {
  String toFirebaseFormatString() {
    final String str = toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
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
    }
  }
}

extension ParseStringToOrderType on String {
  OrderType toOrderType() {
    return OrderType.values.firstWhere(
        (OrderType e) => e.toFirebaseFormatString().toLowerCase() == this);
  }
}

enum PaymentType { Cash, Card }

extension ParsePaymentTypeToString on PaymentType {
  String toFirebaseFormatString() {
    final String str = toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }

  String toNormalString() {
    final String str = toString().split('.').last;
    return str;
  }
}

extension ParseStringToPaymentType on String {
  PaymentType toPaymentType() {
    return PaymentType.values.firstWhere((PaymentType e) =>
        e.toFirebaseFormatString().toLowerCase() == toLowerCase());
  }
}

abstract class DeliverableOrder extends Order {
  DeliveryDriverUserInfo? dropoffDriver;
  String? serviceProviderDropOffDriverChatId;
  String? customerDropOffDriverChatId;
  DateTime? estimatedPickupFromServiceProviderTime;
  DateTime? estimatedDropoffAtCustomerTime;
  bool notifiedOperator;
  bool notifiedAdmin;
  DeliverableOrder({
    required super.orderId,
    super.serviceProviderId,
    required super.paymentType,
    required super.orderTime,
    required super.cost,
    super.serviceProvider,
    required super.customer,
    required super.to,
    required super.orderType,
    this.dropoffDriver,
    required this.serviceProviderDropOffDriverChatId,
    required this.customerDropOffDriverChatId,
    this.estimatedPickupFromServiceProviderTime,
    this.estimatedDropoffAtCustomerTime,
    super.routeInformation,
    this.notifiedAdmin = false,
    this.notifiedOperator = false,
  });
}

abstract class TwoWayDeliverableOrder extends DeliverableOrder {
  DeliveryDriverUserInfo? pickupDriver;
  String? serviceProviderPickupDriverChatId;
  String? customerPickupDriverChatId;
  DateTime? estimatedPickupFromCustomerTime;
  DateTime? estimatedDropoffAtServiceProviderTime;
  TwoWayDeliverableOrder(
      {required super.orderId,
      super.serviceProviderId,
      required super.paymentType,
      required super.orderTime,
      required super.cost,
      super.serviceProvider,
      required super.customer,
      required super.to,
      required super.orderType,
      super.routeInformation,
      super.dropoffDriver,
      required super.serviceProviderDropOffDriverChatId,
      required super.customerDropOffDriverChatId,
      this.pickupDriver,
      required this.serviceProviderPickupDriverChatId,
      required this.customerPickupDriverChatId,
      super.estimatedPickupFromServiceProviderTime,
      super.estimatedDropoffAtCustomerTime,
      this.estimatedPickupFromCustomerTime,
      this.estimatedDropoffAtServiceProviderTime,
      super.notifiedAdmin,
      super.notifiedOperator});
}
