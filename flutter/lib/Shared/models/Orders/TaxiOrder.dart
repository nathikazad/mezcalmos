import 'package:mezcalmos/Shared/models/Location.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';

enum OrdersStatus {
  DroppedOff,
  Cancelled,
  Expired,
  OnTheWay,
  InTransit,
  IsLooking,
  Invalid
}

extension ParseToString on OrdersStatus {
  String toShortString() {
    return this.toString().split('.').last;
  }
}

OrdersStatus convertStringToOrderStatus(String str) {
  mezDbgPrint(str);
  return OrdersStatus.values
      .firstWhere((e) => e.toShortString().toLowerCase() == str.toLowerCase());
}

class TaxiOrder extends Order {
  dynamic customer;
  dynamic estimatedPrice;
  dynamic
      from; // this must not be late  , especcially since  we are using Order.emty
  dynamic to; // this too .
  dynamic routeInformation; // Map<String , Map<String, dynamic>>
  dynamic driver;
  dynamic distance;
  dynamic duration;
  dynamic acceptRideTime;
  dynamic rideFinishTime;
  dynamic rideStartTime;
  OrdersStatus status;
  dynamic polyline;
  double distanceToClient = 0;
  dynamic cancelledBy;

  TaxiOrder(
      {required String orderId,
      required this.customer,
      required this.estimatedPrice,
      required this.from,
      required this.to,
      required DateTime orderTime,
      required PaymentType paymentType,
      required this.routeInformation,
      required this.driver,
      required this.distance,
      required this.duration,
      required this.acceptRideTime,
      required OrderType orderType,
      required this.rideFinishTime,
      required this.rideStartTime,
      required this.status,
      required this.polyline,
      dynamic cancelledBy})
      : super(
            orderTime: orderTime,
            orderId: orderId,
            paymentType: paymentType,
            orderType: OrderType.Taxi,
            cost: 0);

  // Get props as list.
  List<Object> get props =>
      [orderId, from, to, orderTime, paymentType, routeInformation];

  factory TaxiOrder.fromData(dynamic id, dynamic data) {
    TaxiOrder taxiOrder = TaxiOrder(
        orderId: id,
        driver: data['driver'],
        distance: data['distance'],
        duration: data['duration'],
        customer: data['customer'],
        rideFinishTime: data['rideFinishTime'],
        rideStartTime: data['rideStartTime'],
        status: convertStringToOrderStatus(data['status']),
        orderType: data['orderType'],
        acceptRideTime: data['acceptRideTime'],
        estimatedPrice: data['estimatedPrice'],
        from: Location(data['from']),
        to: Location(data['to']),
        orderTime: data['orderTime'],
        paymentType: data['paymentType'],
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
    return status == OrdersStatus.InTransit ||
        status == OrdersStatus.IsLooking ||
        status == OrdersStatus.OnTheWay;
  }
}
