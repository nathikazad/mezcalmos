class SendOtpResponse {
  String? errorMessage;
  num? secondsLeft;
  ServerResponseStatus status;
  SendOtpResponse(this.errorMessage, this.secondsLeft, this.status);
Map<String, dynamic> toFirebaseFormattedJson() {
    return <String, dynamic>{
      "errorMessage": errorMessage,
      "secondsLeft": secondsLeft,
      "status": status,
    };
  }
factory SendOtpResponse.fromFirebaseFormattedJson(dynamic json) { 
   return SendOtpResponse(json["errorMessage"], json["secondsLeft"], json["status"].toString().toServerResponseStatus());
  }
}

class AuthResponse {
  String? token;
  AuthResponse(this.token);
Map<String, dynamic> toFirebaseFormattedJson() {
    return <String, dynamic>{
      "token": token,
    };
  }
factory AuthResponse.fromFirebaseFormattedJson(dynamic json) { 
   return AuthResponse(json["token"]);
  }
}

class PaymentIntentResponse {
  String? paymentIntent;
  String? ephemeralKey;
  String? customer;
  String publishableKey;
  String stripeAccountId;
  PaymentIntentResponse(this.paymentIntent, this.ephemeralKey, this.customer, this.publishableKey, this.stripeAccountId);
Map<String, dynamic> toFirebaseFormattedJson() {
    return <String, dynamic>{
      "paymentIntent": paymentIntent,
      "ephemeralKey": ephemeralKey,
      "customer": customer,
      "publishableKey": publishableKey,
      "stripeAccountId": stripeAccountId,
    };
  }
factory PaymentIntentResponse.fromFirebaseFormattedJson(dynamic json) { 
   return PaymentIntentResponse(json["paymentIntent"], json["ephemeralKey"], json["customer"], json["publishableKey"], json["stripeAccountId"]);
  }
}

class AddCardResponse {
  String cardId;
  AddCardResponse(this.cardId);
Map<String, dynamic> toFirebaseFormattedJson() {
    return <String, dynamic>{
      "cardId": cardId,
    };
  }
factory AddCardResponse.fromFirebaseFormattedJson(dynamic json) { 
   return AddCardResponse(json["cardId"]);
  }
}

class ChargeCardResponse {
  String? paymentIntent;
  String customer;
  String publishableKey;
  String stripeAccountId;
  ChargeCardResponse(this.paymentIntent, this.customer, this.publishableKey, this.stripeAccountId);
Map<String, dynamic> toFirebaseFormattedJson() {
    return <String, dynamic>{
      "paymentIntent": paymentIntent,
      "customer": customer,
      "publishableKey": publishableKey,
      "stripeAccountId": stripeAccountId,
    };
  }
factory ChargeCardResponse.fromFirebaseFormattedJson(dynamic json) { 
   return ChargeCardResponse(json["paymentIntent"], json["customer"], json["publishableKey"], json["stripeAccountId"]);
  }
}

class SetupResponse {
  String object;
  num created;
  num expires_at;
  String url;
  SetupResponse(this.object, this.created, this.expires_at, this.url);
Map<String, dynamic> toFirebaseFormattedJson() {
    return <String, dynamic>{
      "object": object,
      "created": created,
      "expires_at": expires_at,
      "url": url,
    };
  }
factory SetupResponse.fromFirebaseFormattedJson(dynamic json) { 
   return SetupResponse(json["object"], json["created"], json["expires_at"], json["url"]);
  }
}

enum ParticipantType { Customer, Taxi, DeliveryOperator, DeliveryDriver, LaundryOperator, RestaurantOperator, MezAdmin }
extension ParseParticipantTypeToString on ParticipantType {
  String toFirebaseFormatString() {
    String str = this.toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}
extension ParseStringToParticipantType on String {
  ParticipantType toParticipantType() {
    return ParticipantType.values.firstWhere(
        (ParticipantType participantType) =>
            participantType.toFirebaseFormatString() == this);
  }
}


class CallUserResponse {
  num id;
  String token;
  String? name;
  String? image;
  String expirationTime;
  ParticipantType participantType;
  CallUserResponse(this.id, this.token, this.name, this.image, this.expirationTime, this.participantType);
Map<String, dynamic> toFirebaseFormattedJson() {
    return <String, dynamic>{
      "id": id,
      "token": token,
      "name": name,
      "image": image,
      "expirationTime": expirationTime,
      "participantType": participantType,
    };
  }
factory CallUserResponse.fromFirebaseFormattedJson(dynamic json) { 
   return CallUserResponse(json["id"], json["token"], json["name"], json["image"], json["expirationTime"], json["participantType"].toString().toParticipantType());
  }
}

enum DeliveryServiceProviderType { Restaurant, DeliveryCompany, Laundry }
extension ParseDeliveryServiceProviderTypeToString on DeliveryServiceProviderType {
  String toFirebaseFormatString() {
    String str = this.toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}
extension ParseStringToDeliveryServiceProviderType on String {
  DeliveryServiceProviderType toDeliveryServiceProviderType() {
    return DeliveryServiceProviderType.values.firstWhere(
        (DeliveryServiceProviderType deliveryServiceProviderType) =>
            deliveryServiceProviderType.toFirebaseFormatString() == this);
  }
}


class Location {
  num lat;
  num lng;
  String? address;
  Location({
    required this.lat, required this.lng, this.address});
Map<String, dynamic> toFirebaseFormattedJson() {
    return <String, dynamic>{
      "lat": lat,
      "lng": lng,
      "address": address,
    };
  }

}

class DeliveryDetails {
  num? minimumCost;
  num? costPerKm;
  num? radius;
  num? freeDeliveryMinimumCost;
  num? freeDeliveryKmRange;
  bool deliveryAvailable;
  bool customerPickup;
  bool selfDelivery;
  DeliveryDetails({
    this.minimumCost, this.costPerKm, this.radius, this.freeDeliveryMinimumCost, this.freeDeliveryKmRange, required this.deliveryAvailable, required this.customerPickup, required this.selfDelivery});
Map<String, dynamic> toFirebaseFormattedJson() {
    return <String, dynamic>{
      "minimumCost": minimumCost,
      "costPerKm": costPerKm,
      "radius": radius,
      "freeDeliveryMinimumCost": freeDeliveryMinimumCost,
      "freeDeliveryKmRange": freeDeliveryKmRange,
      "deliveryAvailable": deliveryAvailable,
      "customerPickup": customerPickup,
      "selfDelivery": selfDelivery,
    };
  }

}

enum CustomerAppType { Native, Web }
extension ParseCustomerAppTypeToString on CustomerAppType {
  String toFirebaseFormatString() {
    String str = this.toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}
extension ParseStringToCustomerAppType on String {
  CustomerAppType toCustomerAppType() {
    return CustomerAppType.values.firstWhere(
        (CustomerAppType customerAppType) =>
            customerAppType.toFirebaseFormatString() == this);
  }
}


enum PaymentType { Cash, Card, BankTransfer }
extension ParsePaymentTypeToString on PaymentType {
  String toFirebaseFormatString() {
    String str = this.toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}
extension ParseStringToPaymentType on String {
  PaymentType toPaymentType() {
    return PaymentType.values.firstWhere(
        (PaymentType paymentType) =>
            paymentType.toFirebaseFormatString() == this);
  }
}


enum DeliveryType { Pickup, Delivery }
extension ParseDeliveryTypeToString on DeliveryType {
  String toFirebaseFormatString() {
    String str = this.toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}
extension ParseStringToDeliveryType on String {
  DeliveryType toDeliveryType() {
    return DeliveryType.values.firstWhere(
        (DeliveryType deliveryType) =>
            deliveryType.toFirebaseFormatString() == this);
  }
}


class CheckoutResponse {
  num orderId;
  CheckoutResponse(this.orderId);
Map<String, dynamic> toFirebaseFormattedJson() {
    return <String, dynamic>{
      "orderId": orderId,
    };
  }
factory CheckoutResponse.fromFirebaseFormattedJson(dynamic json) { 
   return CheckoutResponse(json["orderId"]);
  }
}

class ReqLaundryResponse {
  num orderId;
  ReqLaundryResponse(this.orderId);
Map<String, dynamic> toFirebaseFormattedJson() {
    return <String, dynamic>{
      "orderId": orderId,
    };
  }
factory ReqLaundryResponse.fromFirebaseFormattedJson(dynamic json) { 
   return ReqLaundryResponse(json["orderId"]);
  }
}

enum DeliveryOrderStatus { OrderReceived, OnTheWayToPickup, AtPickup, OnTheWayToDropoff, AtDropoff, Delivered, CancelledByCustomer, CancelledByDeliverer, CancelledByServiceProvider }
extension ParseDeliveryOrderStatusToString on DeliveryOrderStatus {
  String toFirebaseFormatString() {
    String str = this.toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}
extension ParseStringToDeliveryOrderStatus on String {
  DeliveryOrderStatus toDeliveryOrderStatus() {
    return DeliveryOrderStatus.values.firstWhere(
        (DeliveryOrderStatus deliveryOrderStatus) =>
            deliveryOrderStatus.toFirebaseFormatString() == this);
  }
}


enum AppType { Customer, RestaurantApp, DeliveryApp, DeliveryAdmin, MezAdmin, LaundryApp }
extension ParseAppTypeToString on AppType {
  String toFirebaseFormatString() {
    String str = this.toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}
extension ParseStringToAppType on String {
  AppType toAppType() {
    return AppType.values.firstWhere(
        (AppType appType) =>
            appType.toFirebaseFormatString() == this);
  }
}


enum Language { EN, ES }
extension ParseLanguageToString on Language {
  String toFirebaseFormatString() {
    String str = this.toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}
extension ParseStringToLanguage on String {
  Language toLanguage() {
    return Language.values.firstWhere(
        (Language language) =>
            language.toFirebaseFormatString() == this);
  }
}


enum ServerResponseStatus { Success, Error }
extension ParseServerResponseStatusToString on ServerResponseStatus {
  String toFirebaseFormatString() {
    String str = this.toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}
extension ParseStringToServerResponseStatus on String {
  ServerResponseStatus toServerResponseStatus() {
    return ServerResponseStatus.values.firstWhere(
        (ServerResponseStatus serverResponseStatus) =>
            serverResponseStatus.toFirebaseFormatString() == this);
  }
}


