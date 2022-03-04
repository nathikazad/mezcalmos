import 'package:mezcalmos/Shared/helpers/MapHelper.dart';
import 'package:mezcalmos/Shared/models/Drivers/DeliveryDriver.dart';
import 'package:mezcalmos/Shared/models/Generic.dart';
import 'package:mezcalmos/Shared/models/Location.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
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
  Order(
      {required this.orderId,
      required this.orderType,
      this.serviceProviderId,
      required this.paymentType,
      required this.orderTime,
      required this.cost,
      required this.customer,
      this.serviceProvider,
      required this.to,
      this.routeInformation});
  bool inProcess();
  bool isCanceled();
  // Order.orderFromData(dynamic orderId, dynamic orderData){

}

enum OrderType { Taxi, Restaurant, Laundry, Water }



extension ParseOrderTypeToString on OrderType {
  String toFirebaseFormatString() {
    String str = this.toString().split('.').last;
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
    return OrderType.values
        .firstWhere((e) => e.toFirebaseFormatString().toLowerCase() == this);
  }
}

enum PaymentType { Cash, Card }

extension ParsePaymentTypeToString on PaymentType {
  String toFirebaseFormatString() {
    String str = this.toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}

extension ParseStringToPaymentType on String {
  PaymentType toPaymentType() {
    return PaymentType.values.firstWhere(
        (e) => e.toFirebaseFormatString().toLowerCase() == this.toLowerCase());
  }
}

abstract class DeliverableOrder extends Order {
  DeliveryDriverUserInfo? dropoffDriver;
  String? dropOffDriverChatId;
  DeliverableOrder(
      {required String orderId,
      String? serviceProviderId,
      required PaymentType paymentType,
      required DateTime orderTime,
      required num cost,
      UserInfo? serviceProvider,
      required UserInfo customer,
      required Location to,
      required OrderType orderType,
      this.dropoffDriver,
      required this.dropOffDriverChatId,
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
  String? pickupDriverChatId;
  TwoWayDeliverableOrder(
      {required String orderId,
      String? serviceProviderId,
      required PaymentType paymentType,
      required DateTime orderTime,
      required num cost,
      UserInfo? serviceProvider,
      required UserInfo customer,
      required Location to,
      required OrderType orderType,
      RouteInformation? routeInformation,
      DeliveryDriverUserInfo? dropoffDriver,
      required dropOffDriverChatId,
      this.pickupDriver,
      required this.pickupDriverChatId})
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
            dropOffDriverChatId: dropOffDriverChatId);
}
