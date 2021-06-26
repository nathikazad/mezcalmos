
import 'package:firebase_database/firebase_database.dart';

class Order {
  
  String id;
  String? customer;
  num? estimatedPrice;
  Map<dynamic , dynamic> from;
  Map<dynamic , dynamic> to;
  String orderTime;
  String paymentType;
  Map<dynamic , dynamic> routeInformation; // Map<String , Map<String, dynamic>> 

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
  List<Object> get props => [id, from, to, orderTime, paymentType, routeInformation];

  // Removed parse from json , Since we will be working with Snapshots
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