import 'package:mezcalmos/Shared/models/Location.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';

enum TaxiOrdersStatus {
  DroppedOff,
  Cancelled,
  Expired,
  OnTheWay,
  InTransit,
  LookingForTaxi,
  Invalid
}

extension ParseOrderStatusToString on TaxiOrdersStatus {
  String toFirebaseFormatString() {
    return this.toString().split('.').last;
  }
}

extension ParseStringToOrderStatus on String {
  TaxiOrdersStatus toTaxiOrderStatus() {
    return TaxiOrdersStatus.values.firstWhere(
        (e) => e.toFirebaseFormatString().toLowerCase() == this.toLowerCase());
  }
}

class TaxiOrder extends Order {
  dynamic estimatedPrice;
  Location from;
  dynamic routeInformation; 
  dynamic distance;
  dynamic duration;
  dynamic acceptRideTime;
  dynamic rideFinishTime;
  dynamic rideStartTime;
  TaxiOrdersStatus status;
  dynamic polyline;
  double distanceToClient = 0;
  dynamic cancelledBy;
  UserInfo? get driver => this.serviceProvider;
  TaxiOrder(
      {required String orderId,
      required this.estimatedPrice,
      required this.from,
      required Location to,
      required DateTime orderTime,
      required PaymentType paymentType,
      required this.routeInformation,
      UserInfo? driver,
      required this.distance,
      required this.duration,
      required this.acceptRideTime,
      required this.rideFinishTime,
      required this.rideStartTime,
      required this.status,
      required this.polyline,
      required UserInfo customer,
      dynamic cancelledBy})
      : super(
            orderTime: orderTime,
            orderId: orderId,
            paymentType: paymentType,
            orderType: OrderType.Taxi,
            cost: 0,
            customer: customer,
            serviceProvider: driver,
            to: to);
  // Get props as list.
  List<Object> get props =>
      [orderId, from, to, orderTime, paymentType, routeInformation];

  factory TaxiOrder.fromData(dynamic id, dynamic data) {
    TaxiOrder taxiOrder = TaxiOrder(
        orderId: id,
        driver:
            (data["driver"] != null) ? UserInfo.fromData(data["driver"]) : null,
        distance: data['distance'],
        duration: data['duration'],
        customer: UserInfo.fromData(data["customer"]),
        rideFinishTime: data['rideFinishTime'],
        rideStartTime: data['rideStartTime'],
        status: data['status'].toString().toTaxiOrderStatus(),
        acceptRideTime: data['acceptRideTime'],
        estimatedPrice: data['estimatedPrice'],
        from: Location.fromData(data['from']),
        to: Location.fromData(data['to']),
        orderTime: DateTime.parse(data["orderTime"]),
        paymentType: data["paymentType"].toString().toPaymentType(),
        routeInformation: data['routeInformation'],
        polyline: data['polyline'] ?? "");
    return taxiOrder;
  }

  // Added for Debugging Perposes - Don't delete for now
  Map<String, dynamic> toJson() => {
        "customer": customer,
        "estimatedPrice": estimatedPrice,
        "from": from,
        "status": status,
        "to": to,
        "orderTime": orderTime,
        "paymentType": paymentType,
        "polyline": polyline,
        "routeInformation": routeInformation,
        "distanceToClient": distanceToClient
      };

  @override
  bool inProcess() {
    return status == TaxiOrdersStatus.InTransit ||
        status == TaxiOrdersStatus.LookingForTaxi ||
        status == TaxiOrdersStatus.OnTheWay;
  }
}
