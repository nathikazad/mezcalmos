import 'package:mezcalmos/CustomerApp/models/TaxiRequest.dart';
import 'package:mezcalmos/Shared/helpers/MapHelper.dart';
import 'package:mezcalmos/Shared/models/Location.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';

enum TaxiOrdersStatus {
  DroppedOff,
  CancelledByCustomer,
  CancelledByTaxi,
  Expired,
  OnTheWay,
  InTransit,
  LookingForTaxi
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

class RouteInformation {
  String polyline;
  RideDistance distance;
  RideDuration duration;
  RouteInformation(this.polyline, this.distance, this.duration);
}

class TaxiOrder extends Order {
  num cost;
  Location from;
  RouteInformation routeInformation;
  String? acceptRideTime;
  String? rideFinishTime;
  String? rideStartTime;
  TaxiOrdersStatus status;
  double distanceToClient = 0;
  UserInfo? get driver => this.serviceProvider;
  TaxiOrder(
      {required String orderId,
      required this.cost,
      required this.from,
      required Location to,
      required DateTime orderTime,
      required PaymentType paymentType,
      required this.routeInformation,
      UserInfo? driver,
      required this.acceptRideTime,
      required this.rideFinishTime,
      required this.rideStartTime,
      required this.status,
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

  /// Convert [TaxiOrder] object to [TaxiRequest] object.
  TaxiRequest toTaxiRequest() {
    return TaxiRequest(
        from: from,
        to: to,
        routeInformation: this.routeInformation,
        estimatedPrice: cost as int,
        paymentType: paymentType);
  }

  /// Update this model from [TaxiRequest] object
  void updateFromTaxiRequest(TaxiRequest taxiRequest) {
    this.from = taxiRequest.from!;
    this.to = taxiRequest.to!;
    this.routeInformation = RouteInformation(
        taxiRequest.routeInformation!.polyline,
        taxiRequest.routeInformation!.distance,
        taxiRequest.routeInformation!.duration);
    this.cost = taxiRequest.estimatedPrice;
    this.paymentType = taxiRequest.paymentType;
  }

  factory TaxiOrder.fromData(dynamic id, dynamic data) {
    TaxiOrder taxiOrder = TaxiOrder(
        orderId: id,
        driver:
            (data["driver"] != null) ? UserInfo.fromData(data["driver"]) : null,
        customer: UserInfo.fromData(data["customer"]),
        rideFinishTime: data['rideFinishTime'],
        rideStartTime: data['rideStartTime'],
        status: data['status'].toString().toTaxiOrderStatus(),
        acceptRideTime: data['acceptRideTime'],
        cost: data['cost'],
        from: Location.fromFirebaseData(data['from']),
        to: Location.fromFirebaseData(data['to']),
        orderTime: DateTime.parse(data["orderTime"]),
        paymentType: data["paymentType"].toString().toPaymentType(),
        routeInformation: RouteInformation(
            data['routeInformation']['polyline'],
            RideDistance.fromJson(data['routeInformation']['distance']),
            RideDuration.fromJson(data['routeInformation']['duration'])));
    return taxiOrder;
  }

  // Added for Debugging Perposes - Don't delete for now
  Map<String, dynamic> toJson() => {
        "customer": customer,
        "estimatedPrice": cost,
        "from": from,
        "status": status,
        "to": to,
        "orderTime": orderTime,
        "paymentType": paymentType,
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
