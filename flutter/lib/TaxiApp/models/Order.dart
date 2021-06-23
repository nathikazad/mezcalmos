
import 'package:firebase_database/firebase_database.dart';

class Order {
  
  String id;
  Map<String , String> customer;
  double estimatedPrice;
  Map<String , dynamic> from;
  Map<String , dynamic> to;
  String orderTime;
  String paymentType;
  Map<String , Map<String, dynamic>> routeInformation;

  Order(
    this.id,
    {
      required this.customer, 
      required this.estimatedPrice, 
      required this.from, 
      required this.to, 
      required this.orderTime, 
      required this.paymentType, 
      required this.routeInformation
    }
  );

  // Get props as list.
  List<Object> get props => [id, customer, estimatedPrice, from, to, orderTime, paymentType, routeInformation];

  // Removed parse from json , Since we will be working with Snapshots
  Order.fromSnapshot(DataSnapshot snapshot) :

    id                  = snapshot.key ?? "",
    customer            = snapshot.value['customer'],
    estimatedPrice      = snapshot.value['estimatedPrice'],
    from                = snapshot.value['from'],
    to                  = snapshot.value['to'],
    orderTime           = snapshot.value['orderTime'],
    paymentType         = snapshot.value['paymentType'],
    routeInformation    = snapshot.value['routeInformation'];


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