enum OrderType { Taxi, Restaurant, Laundry, Water }
extension ParseOrderTypeToString on OrderType {
  String toFirebaseFormatString() {
    String str = this.toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}

class Location {
  num lat;
  num lng;
  String? address;
  Location(this.lat, this.lng, this.address);
Map<String, dynamic> toFirebaseFormattedJson() {
    return <String, dynamic>{
      "lat": lat,
      "lng": lng,
      "address": address};
  }
}

class DeliveryDetails {
  num minimumCost;
  num costPerKm;
  num radius;
  num? freeDeliveryMinimumCost;
  num? freeDeliveryKmRange;
  DeliveryDetails(this.minimumCost, this.costPerKm, this.radius, this.freeDeliveryMinimumCost, this.freeDeliveryKmRange);
Map<String, dynamic> toFirebaseFormattedJson() {
    return <String, dynamic>{
      "minimumCost": minimumCost,
      "costPerKm": costPerKm,
      "radius": radius,
      "freeDeliveryMinimumCost": freeDeliveryMinimumCost,
      "freeDeliveryKmRange": freeDeliveryKmRange};
  }
}

enum AppType { Customer, RestaurantApp, DeliveryApp, DeliveryAdmin, MezAdmin }
extension ParseAppTypeToString on AppType {
  String toFirebaseFormatString() {
    String str = this.toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}

enum PaymentType { Cash, Card, BankTransfer }
extension ParsePaymentTypeToString on PaymentType {
  String toFirebaseFormatString() {
    String str = this.toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}

enum DeliveryType { Pickup, Delivery }
extension ParseDeliveryTypeToString on DeliveryType {
  String toFirebaseFormatString() {
    String str = this.toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}

class NotificationInfo {
  String token;
  AppType AppTypeId;
  NotificationInfo(this.token, this.AppTypeId);
Map<String, dynamic> toFirebaseFormattedJson() {
    return <String, dynamic>{
      "token": token,
      "AppTypeId": AppTypeId};
  }
}

enum DeliveryDriverType { RestaurantOperator, DeliveryDriver }
extension ParseDeliveryDriverTypeToString on DeliveryDriverType {
  String toFirebaseFormatString() {
    String str = this.toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}

