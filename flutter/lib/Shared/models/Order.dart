// BELONGS TO TAXI APP please move

import 'dart:typed_data';

import 'package:firebase_database/firebase_database.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

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
  dynamic pictureBytes;
  dynamic driver;
  dynamic distance;
  dynamic duration;
  dynamic acceptRideTime;
  dynamic orderType;
  dynamic rideFinishTime;
  dynamic rideStartTime;
  dynamic status;
  dynamic polyline;
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
      required this.polyline,
      required this.pictureBytes});

  // Get props as list.
  List<Object> get props =>
      [id, from, to, orderTime, paymentType, routeInformation];

  // Empty Order Constructor!
  Order.empty({this.polyline = ""});

  Order.fromSnapshot(DataSnapshot snapshot, {BitmapDescriptor? pictureBytes})
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
        polyline = snapshot.value['polyline'] ?? "",
        this.pictureBytes = pictureBytes;

  Order.fromJson(dynamic key, dynamic value, {BitmapDescriptor? pictureBytes})
      : id = key,
        driver = value['driver'],
        distance = value['distance'],
        duration = value['duration'],
        customer = value['customer'],
        rideFinishTime = value['rideFinishTime'],
        rideStartTime = value['rideStartTime'],
        status = value['status'],
        orderType = value['orderType'],
        acceptRideTime = value['acceptRideTime'],
        estimatedPrice = value['estimatedPrice'],
        from = Location(value['from']),
        to = Location(value['to']),
        orderTime = value['orderTime'],
        paymentType = value['paymentType'],
        routeInformation = value['routeInformation'],
        polyline = value['polyline'] ?? "",
        this.pictureBytes = pictureBytes;

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
