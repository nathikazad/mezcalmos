import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/models/Services/Business/Business.dart';

class CustBusinessCart {
  int? id;
  num customerId;
  num? businessId;
  num cost;
  List<BusinessCartItem> items;
  num? discountValue;
  String? cancellationTime;
  BusinessOrderRequestStatus? status;
  int? chatId;
  CustBusinessCart(
      {required this.customerId,
      required this.businessId,
      required this.cost,
      required this.items,
      this.id,
      this.chatId,
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
  HomeWithBusinessCard? home;
  RentalWithBusinessCard? rental;
  EventWithBusinessCard? event;
  ServiceWithBusinessCard? service;
  ProductWithBusinessCard? product;
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
      this.home,
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
