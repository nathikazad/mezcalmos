import 'package:firebase_database/firebase_database.dart';
import 'package:geolocator/geolocator.dart';

class Location {
  late String address;
  late Position position;

  Location(dynamic location) {
    this.address = location["address"];
    this.position = Position.fromMap(<dynamic, dynamic>{"latitude": location["lat"], "longitude": location["lng"]});
  }

  dynamic get latitude => position.latitude;
  dynamic get longitude => position.longitude;
}

class Order {
  dynamic id;
  dynamic customer;
  dynamic estimatedPrice;
  late Location from;
  late Location to;
  dynamic orderTime;
  dynamic paymentType;
  dynamic routeInformation; // Map<String , Map<String, dynamic>>

  // orders/taxi are something else..
  dynamic driver;
  dynamic distance;
  dynamic duration;
  dynamic acceptRideTime;
  dynamic orderType;
  dynamic rideFinishTime;
  dynamic rideStartTime;
  dynamic status;
  String polyline;
  double distanceToClient = 0;

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
      required this.polyline});

  // Get props as list.
  List<Object> get props => [id, from, to, orderTime, paymentType, routeInformation];

  // Empty Order Constructor!
  Order.empty({this.polyline = ""});

  Order.fromSnapshot(DataSnapshot snapshot)
      : id = snapshot.key ?? "",
        driver = snapshot.value['driver'],
        distance = snapshot.value['distance'],
        duration = snapshot.value['duration'],
        customer = snapshot.value['customer'],
        rideFinishTime = snapshot.value['rideFinishTime'],
        rideStartTime = snapshot.value['rideStartTime'],
        status = snapshot.value['status'],
        orderType = snapshot.value['orderType'],
        acceptRideTime = snapshot.value['acceptRideTime'],
        estimatedPrice = snapshot.value['estimatedPrice'],
        from = Location(snapshot.value['from']),
        to = Location(snapshot.value['to']),
        orderTime = snapshot.value['orderTime'],
        paymentType = snapshot.value['paymentType'],
        routeInformation = snapshot.value['routeInformation'],
        polyline = snapshot.value['polyline'] ?? "";

  Order.fromJson(dynamic key, dynamic value)
      : id = key,
        customer = value['customer'],
        estimatedPrice = value['estimatedPrice'],
        from = value['from'],
        to = value['to'],
        orderTime = value['orderTime'],
        paymentType = value['paymentType'],
        routeInformation = value['routeInformation'],
        polyline = value['polyline'] ?? "";

  // Added for Debugging Perposes - Don't delete for now
  Map<String, dynamic> toJson() => {
        "customer": customer,
        "estimatedPrice": estimatedPrice,
        "from": from,
        "to": to,
        "orderTime": orderTime,
        "paymentType": paymentType,
        "polyline": polyline,
        "routeInformation": routeInformation,
        "distanceToClient": distanceToClient
      };
}
