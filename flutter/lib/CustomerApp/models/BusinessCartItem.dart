import 'package:mezcalmos/Shared/cloudFunctions/model.dart';

class CustBusinessCart {
  int? id;
  num customerId;
  num? businessId;
  num cost;
  List<BusinessCartItem> items;
  num? discountValue;
  String? cancellationTime;
  BusinessOrderRequestStatus? status;
  CustBusinessCart(
      {required this.customerId,
      required this.businessId,
      required this.cost,
      required this.items,
      this.id,
      this.cancellationTime,
      this.status,
      this.discountValue});
  Map<String, dynamic> toFirebaseFormattedJson() {
    return <String, dynamic>{
      "customerId": customerId,
      "businessId": businessId,
      "cost": cost,
      "items": items,
      "discountValue": discountValue,
    };
  }
}

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
  int? businessId;
  BusinessCartItem(
      {required this.itemId,
      required this.offeringType,
      required this.parameters,
      required this.cost,
      this.businessId,
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
      "id": id,
      "businessId": businessId,
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
