// class ServerResponse {
//   ServerResponseStatus status;
//   String? errorMessage;
//   String? errorCode;
//   string] [key;
//   ServerResponse(this.status, this.errorMessage, this.errorCode, this.[key);
// Map<String, dynamic> toFirebaseFormattedJson() {
//     return <String, dynamic>{
//       "status": status,
//       "errorMessage": errorMessage,
//       "errorCode": errorCode,
//       "[key": [key};
//   }
// factory ServerResponse.fromFirebaseFormattedJson(dynamic json) { 
//    return ServerResponse(json["status"], json["errorMessage?"], json["errorCode?"], json["[key"], json["nullableField"]);
//   }
// }

// enum OrderType { Taxi, Restaurant, Laundry, Water }
// extension ParseOrderTypeToString on OrderType {
//   String toFirebaseFormatString() {
//     String str = this.toString().split('.').last;
//     return str[0].toLowerCase() + str.substring(1);
//   }
// }

// enum ParticipantType { Customer, Taxi, DeliveryOperator, DeliveryDriver, LaundryOperator, RestaurantOperator, MezAdmin }
// extension ParseParticipantTypeToString on ParticipantType {
//   String toFirebaseFormatString() {
//     String str = this.toString().split('.').last;
//     return str[0].toLowerCase() + str.substring(1);
//   }
// }

// class Location {
//   num lat;
//   num lng;
//   String? address;
//   Location(this.lat, this.lng, this.address);
// Map<String, dynamic> toFirebaseFormattedJson() {
//     return <String, dynamic>{
//       "lat": lat,
//       "lng": lng,
//       "address": address};
//   }

// }

// class DeliveryDetails {
//   num minimumCost;
//   num costPerKm;
//   num radius;
//   num? freeDeliveryMinimumCost;
//   num? freeDeliveryKmRange;
//   DeliveryDetails(this.minimumCost, this.costPerKm, this.radius, this.freeDeliveryMinimumCost, this.freeDeliveryKmRange);
// Map<String, dynamic> toFirebaseFormattedJson() {
//     return <String, dynamic>{
//       "minimumCost": minimumCost,
//       "costPerKm": costPerKm,
//       "radius": radius,
//       "freeDeliveryMinimumCost": freeDeliveryMinimumCost,
//       "freeDeliveryKmRange": freeDeliveryKmRange};
//   }

// }

// enum AppType { Customer, RestaurantApp, DeliveryApp, DeliveryAdmin, MezAdmin }
// extension ParseAppTypeToString on AppType {
//   String toFirebaseFormatString() {
//     String str = this.toString().split('.').last;
//     return str[0].toLowerCase() + str.substring(1);
//   }
// }

// enum PaymentType { Cash, Card, BankTransfer }
// extension ParsePaymentTypeToString on PaymentType {
//   String toFirebaseFormatString() {
//     String str = this.toString().split('.').last;
//     return str[0].toLowerCase() + str.substring(1);
//   }
// }

// enum DeliveryType { Pickup, Delivery }
// extension ParseDeliveryTypeToString on DeliveryType {
//   String toFirebaseFormatString() {
//     String str = this.toString().split('.').last;
//     return str[0].toLowerCase() + str.substring(1);
//   }
// }

// class CheckoutResponse {
//   num orderId;
//   CheckoutResponse(this.orderId);
// Map<String, dynamic> toFirebaseFormattedJson() {
//     return <String, dynamic>{
//       "orderId": orderId};
//   }
// factory CheckoutResponse.fromFirebaseFormattedJson(dynamic json) { 
//    return CheckoutResponse(json["orderId"], json["nullableField"]);
//   }
// }

// class NotificationInfo {
//   String token;
//   bool turnOffNotifications;
//   AppType appType;
//   NotificationInfo(this.token, this.turnOffNotifications, this.appType);
// Map<String, dynamic> toFirebaseFormattedJson() {
//     return <String, dynamic>{
//       "token": token,
//       "turnOffNotifications": turnOffNotifications,
//       "appType": appType};
//   }

// }

// enum DeliveryDriverType { RestaurantOperator, DeliveryDriver }
// extension ParseDeliveryDriverTypeToString on DeliveryDriverType {
//   String toFirebaseFormatString() {
//     String str = this.toString().split('.').last;
//     return str[0].toLowerCase() + str.substring(1);
//   }
// }

