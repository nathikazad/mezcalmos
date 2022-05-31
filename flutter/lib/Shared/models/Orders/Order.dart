import 'package:mezcalmos/Shared/helpers/MapHelper.dart';
import 'package:mezcalmos/Shared/models/Drivers/DeliveryDriver.dart';
import 'package:mezcalmos/Shared/models/Location.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';
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
  DeliverableOrder(
      {required String orderId,
      String? serviceProviderId,
      required PaymentType paymentType,
      required DateTime orderTime,
      required num cost,
      ServiceInfo? serviceProvider,
      required UserInfo customer,
      required Location to,
      required OrderType orderType,
      this.dropoffDriver,
      required this.serviceProviderDropOffDriverChatId,
      required this.customerDropOffDriverChatId,
      this.estimatedPickupFromServiceProviderTime,
      this.estimatedDropoffAtCustomerTime,
      RouteInformation? routeInformation})
      : super(
            orderId: orderId,
            orderType: orderType,
            serviceProviderId: serviceProviderId,
            paymentType: paymentType,
            orderTime: orderTime,
            cost: cost,
            customer: customer,
            serviceProvider: serviceProvider,
            to: to,
            routeInformation: routeInformation);
}

abstract class TwoWayDeliverableOrder extends DeliverableOrder {
  DeliveryDriverUserInfo? pickupDriver;
  String? serviceProviderPickupDriverChatId;
  String? customerPickupDriverChatId;
  DateTime? estimatedPickupFromCustomerTime;
  DateTime? estimatedDropoffAtServiceProviderTime;
  TwoWayDeliverableOrder(
      {required String orderId,
      String? serviceProviderId,
      required PaymentType paymentType,
      required DateTime orderTime,
      required num cost,
      ServiceInfo? serviceProvider,
      required UserInfo customer,
      required Location to,
      required OrderType orderType,
      RouteInformation? routeInformation,
      DeliveryDriverUserInfo? dropoffDriver,
      required String? serviceProviderDropOffDriverChatId,
      required String? customerDropOffDriverChatId,
      this.pickupDriver,
      required this.serviceProviderPickupDriverChatId,
      required this.customerPickupDriverChatId,
      DateTime? estimatedPickupFromServiceProviderTime,
      DateTime? estimatedDropoffAtCustomerTime,
      this.estimatedPickupFromCustomerTime,
      this.estimatedDropoffAtServiceProviderTime})
      : super(
            orderId: orderId,
            orderType: orderType,
            serviceProviderId: serviceProviderId,
            paymentType: paymentType,
            orderTime: orderTime,
            cost: cost,
            customer: customer,
            serviceProvider: serviceProvider,
            to: to,
            routeInformation: routeInformation,
            dropoffDriver: dropoffDriver,
            serviceProviderDropOffDriverChatId:
                serviceProviderDropOffDriverChatId,
            customerDropOffDriverChatId: customerDropOffDriverChatId,
            estimatedPickupFromServiceProviderTime:
                estimatedPickupFromServiceProviderTime,
            estimatedDropoffAtCustomerTime: estimatedDropoffAtCustomerTime);
}
