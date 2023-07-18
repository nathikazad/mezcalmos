import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/models/Services/Business/Business.dart';

class CustBusinessCart {
  int? id;
  num customerId;
  num? businessId;
  num cost;
  List<BusinessCartItem> items;
  String? cancellationTime;
  BusinessOrderRequestStatus? status;
  int? chatId;
  num discountValue = 0;
  List<int> appliedOffers = <int>[];
  CustBusinessCart(
      {required this.customerId,
      required this.businessId,
      required this.cost,
      required this.items,
      this.id,
      this.chatId,
      this.cancellationTime,
      this.status,
      this.discountValue = 0,
      this.appliedOffers = const <int>[]});
  Map<String, dynamic> toFirebaseFormattedJson() {
    return <String, dynamic>{
      "customerId": customerId,
      "businessId": businessId,
      "cost": cost,
      "items": items,
      "discountValue": discountValue,
    };
  }

  bool get showReviewButton =>
      (status == BusinessOrderRequestStatus.Confirmed ||
          status == BusinessOrderRequestStatus.Completed) &&
      furtherItemDate.isBefore(DateTime.now().toLocal());

  bool get inProcess =>
      status != BusinessOrderRequestStatus.CancelledByBusiness &&
      status != BusinessOrderRequestStatus.CancelledByCustomer &&
      status != BusinessOrderRequestStatus.Completed;
  DateTime get furtherItemDate {
    return items.map((BusinessCartItem e) => DateTime.parse(e.time!)).reduce(
        (DateTime value, DateTime element) =>
            value.toLocal().isAfter(element.toLocal()) ? value : element);
  }

  bool get isPending => status == BusinessOrderRequestStatus.RequestReceived;
  bool get isUpcoming =>
      status != BusinessOrderRequestStatus.CancelledByBusiness &&
      status != BusinessOrderRequestStatus.CancelledByCustomer &&
      furtherItemDate.isAfter(DateTime.now().toLocal());
  bool get isPast =>
      status == BusinessOrderRequestStatus.CancelledByBusiness ||
      status == BusinessOrderRequestStatus.CancelledByCustomer ||
      (status == BusinessOrderRequestStatus.Confirmed &&
          furtherItemDate.isBefore(DateTime.now().toLocal()));
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
