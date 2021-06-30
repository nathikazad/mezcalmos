
import 'package:firebase_database/firebase_database.dart';

class Order {
  
  dynamic id;
  dynamic customer;
  dynamic estimatedPrice;
  dynamic from;
  dynamic to;
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


  Order(
    {
      required this.id,
      required this.customer, 
      required this.estimatedPrice, 
      required this.from, 
      required this.to, 
      required this.orderTime, 
      required this.paymentType, 
      required this.routeInformation,
      // added
      required this. driver,
      required this. distance,
      required this. duration,
      required this. acceptRideTime,
      required this. orderType,
      required this. rideFinishTime,
      required this. rideStartTime,
      required this. status
    }
  );

  // Get props as list.
  List<Object> get props => [id, from, to, orderTime, paymentType, routeInformation];

  // Empty Order Constructor!
  Order.empty();

  Order.fromSnapshot(DataSnapshot snapshot) :
    id                  = snapshot.key ?? "",
    driver              = snapshot.value['driver'],
    distance            = snapshot.value['distance'],
    duration            = snapshot.value['duration'],
    customer            = snapshot.value['customer'],
    rideFinishTime      = snapshot.value['rideFinishTime'],
    rideStartTime       = snapshot.value['rideStartTime'],
    status              = snapshot.value['status'],
    orderType           = snapshot.value['orderType'],
    acceptRideTime      = snapshot.value['acceptRideTime'],
    estimatedPrice      = snapshot.value['estimatedPrice'],
    from                = snapshot.value['from'],
    to                  = snapshot.value['to'],
    orderTime           = snapshot.value['orderTime'],
    paymentType         = snapshot.value['paymentType'],
    routeInformation    = snapshot.value['routeInformation'];


  Order.fromJson(dynamic key, dynamic value) :

    id                  = key,
    customer            = value['customer'],
    estimatedPrice      = value['estimatedPrice'],
    from                = value['from'],
    to                  = value['to'],
    orderTime           = value['orderTime'],
    paymentType         = value['paymentType'],
    routeInformation    = value['routeInformation'];


  // Added for Debugging Perposes - Don't delete for now
  Map<String, dynamic> toJson() =>  {

    "customer"          : customer,
    "estimatedPrice"    : estimatedPrice,
    "from"              : from,
    "to"                : to,
    "orderTime"         : orderTime,
    "paymentType"       : paymentType,
    "routeInformation"  : routeInformation

  };
  
}