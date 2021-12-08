import 'package:mezcalmos/Shared/models/Location.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';

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
  Order(
      {required this.orderId,
      required this.orderType,
      this.serviceProviderId,
      required this.paymentType,
      required this.orderTime,
      required this.cost,
      required this.customer,
      this.serviceProvider,
      required this.to});
  bool inProcess();
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
  Location? location;

  UserInfo(this.id, this.name, this.image, {this.location});

  factory UserInfo.fromData(dynamic data) {
    return UserInfo(data["id"], data["name"], data["image"]);
  }
}

class TaxiUserInfo extends UserInfo {
  String taxiNumber;
  String sitio;
  Location? location;

  TaxiUserInfo(
      {required String id,
      required String name,
      required String image,
      required this.taxiNumber,
      required this.sitio,
      required this.location})
      : super(id, name, image);

  factory TaxiUserInfo.fromData(dynamic data) {
    mezDbgPrint(" TaxiUserInfo.fromData ====> $data");
    // TODO : Make Sure this is the structure in the database (staging - prod).
    return TaxiUserInfo(
        id: data["id"],
        name: data["name"],
        image: data["image"],
        taxiNumber: data["taxiNumber"],
        sitio: data["sitio"],
        location: Location.fromFirebaseData(data["location"]['position']));
  }
}
