import 'package:mezcalmos/Shared/helpers/MapHelper.dart';
import 'package:mezcalmos/Shared/models/Drivers/DeliveryDriver.dart';
import 'package:mezcalmos/Shared/models/Location.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';

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

class UserInfo {
  String id;
  String name;
  String image;

  UserInfo(this.id, this.name, this.image);

  factory UserInfo.fromData(dynamic data) {
    mezDbgPrint("User info");
    mezDbgPrint(data);
    return UserInfo(data["id"], data["name"], data["image"]);
  }
}

abstract class DeliverableOrder extends Order {
  DeliveryDriverUserInfo? dropoffDriver;
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
  DeliveryDriverUserInfo? dropoffDriver;
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
      this.pickupDriver,
      this.dropoffDriver})
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
