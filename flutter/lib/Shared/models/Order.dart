// BELONGS TO TAXI APP please move

import 'package:firebase_database/firebase_database.dart';
import 'package:location/location.dart';
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

class Order {
  dynamic id;
  dynamic customer;
  dynamic estimatedPrice;
  dynamic
      from; // this must not be late  , especcially since  we are using Order.emty
  dynamic to; // this too .
  dynamic orderTime;
  dynamic paymentType;
  dynamic routeInformation; // Map<String , Map<String, dynamic>>

  dynamic driver;
  dynamic distance;
  dynamic duration;
  dynamic acceptRideTime;
  dynamic orderType;
  dynamic rideFinishTime;
  dynamic rideStartTime;
  OrdersStatus status;
  dynamic polyline;
  double distanceToClient = 0;
  dynamic cancelledBy;

  Order(
      {required this.id,
      required this.customer,
      required this.estimatedPrice,
      required this.from,
      required this.to,
      required this.orderTime,
      required this.paymentType,
      required this.routeInformation,
      // added
      required this.driver,
      required this.distance,
      required this.duration,
      required this.acceptRideTime,
      required this.orderType,
      required this.rideFinishTime,
      required this.rideStartTime,
      required this.status,
      required this.polyline,
      dynamic cancelledBy});

  // Get props as list.
  List<Object> get props =>
      [id, from, to, orderTime, paymentType, routeInformation];

  // Empty Order Constructor!
  Order.empty({this.polyline = "", this.status = OrdersStatus.Invalid});

  factory Order.fromSnapshot(DataSnapshot snapshot) {
    return Order.fromJson(snapshot.key, snapshot.value);
  }

  Order.fromJson(dynamic key, dynamic value)
      : id = key,
        driver = value['driver'],
        distance = value['distance'],
        duration = value['duration'],
        customer = value['customer'],
        rideFinishTime = value['rideFinishTime'],
        rideStartTime = value['rideStartTime'],
        status = convertOrderStatusFromStringToEnum(value['status']),
        orderType = value['orderType'],
        acceptRideTime = value['acceptRideTime'],
        estimatedPrice = value['estimatedPrice'],
        from = Location(value['from']),
        to = Location(value['to']),
        orderTime = value['orderTime'],
        paymentType = value['paymentType'],
        routeInformation = value['routeInformation'],
        polyline = value['polyline'] ?? "";

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
}

class Location {
  late String address;
  late LocationData position;

  Location(dynamic location) {
    this.address = location["address"];
    this.position = LocationData.fromMap(<String, dynamic>{
      "latitude": location["lat"],
      "longitude": location["lng"]
    });
  }

  dynamic get latitude => position.latitude;
  dynamic get longitude => position.longitude;
}

OrdersStatus convertOrderStatusFromStringToEnum(String orderStatusString) {
  mezDbgPrint(orderStatusString);
  switch (orderStatusString) {
    case "isLooking":
      return OrdersStatus.IsLooking;
    case "onTheWay":
      return OrdersStatus.OnTheWay;
    case "inTransit":
      return OrdersStatus.InTransit;
    case "droppedOff":
      return OrdersStatus.DroppedOff;
    case "cancelled":
      return OrdersStatus.Cancelled;
    case "expired":
      return OrdersStatus.Expired;
    default:
      return OrdersStatus.Invalid;
  }
}
