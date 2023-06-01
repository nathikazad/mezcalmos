import 'package:mezcalmos/Shared/cloudFunctions/model.dart';

class BusinessCartItem {
  num? id;
  num itemId;
  OfferingType offeringType;
  BusinessItemParameters parameters;
  num cost;
  String? time;
  bool? available;
  BusinessItemDetails? item;
  num? orderRequestId;
  Rental? rental;
  Event? event;
  Service? service;
  Product? product;
  BusinessCartItem(
      {required this.itemId,
      required this.offeringType,
      required this.parameters,
      required this.cost,
      this.time,
      this.available,
      this.item,
      this.rental,
      this.event,
      this.service,
      this.product,
      this.id,
      this.orderRequestId});
  Map<String, dynamic> toFirebaseFormattedJson() {
    return <String, dynamic>{
      "itemId": itemId,
      "offeringType": offeringType,
      "parameters": parameters,
      "cost": cost,
      "time": time,
      "available": available,
      "item": item,
      "orderRequestId": orderRequestId,
    };
  }
}
