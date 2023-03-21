class SendOtpResponse {
  bool success;
  SendOtpError? error;
  String? unhandledError;
  num? secondsLeft;
  SendOtpResponse(this.success, this.error, this.unhandledError, this.secondsLeft);
Map<String, dynamic> toFirebaseFormattedJson() {
    return <String, dynamic>{
      "success": success,
      "error": error,
      "unhandledError": unhandledError,
      "secondsLeft": secondsLeft,
    };
  }
factory SendOtpResponse.fromFirebaseFormattedJson(dynamic json) { 
   return SendOtpResponse(json["success"], json["error"].toString().toSendOtpError(), json["unhandledError"], json["secondsLeft"]);
  }
}

class AuthResponse {
  bool success;
  AuthOtpError? error;
  String? unhandledError;
  String? token;
  AuthResponse(this.success, this.error, this.unhandledError, this.token);
Map<String, dynamic> toFirebaseFormattedJson() {
    return <String, dynamic>{
      "success": success,
      "error": error,
      "unhandledError": unhandledError,
      "token": token,
    };
  }
factory AuthResponse.fromFirebaseFormattedJson(dynamic json) { 
   return AuthResponse(json["success"], json["error"].toString().toAuthOtpError(), json["unhandledError"], json["token"]);
  }
}

class PaymentIntentResponse {
  bool success;
  PaymentIntentError? error;
  String? unhandledError;
  String? paymentIntent;
  String? ephemeralKey;
  String? customer;
  String? publishableKey;
  String? stripeAccountId;
  PaymentIntentResponse(this.success, this.error, this.unhandledError, this.paymentIntent, this.ephemeralKey, this.customer, this.publishableKey, this.stripeAccountId);
Map<String, dynamic> toFirebaseFormattedJson() {
    return <String, dynamic>{
      "success": success,
      "error": error,
      "unhandledError": unhandledError,
      "paymentIntent": paymentIntent,
      "ephemeralKey": ephemeralKey,
      "customer": customer,
      "publishableKey": publishableKey,
      "stripeAccountId": stripeAccountId,
    };
  }
factory PaymentIntentResponse.fromFirebaseFormattedJson(dynamic json) { 
   return PaymentIntentResponse(json["success"], json["error"].toString().toPaymentIntentError(), json["unhandledError"], json["paymentIntent"], json["ephemeralKey"], json["customer"], json["publishableKey"], json["stripeAccountId"]);
  }
}

class AddCardResponse {
  bool success;
  AddCardError? error;
  String? unhandledError;
  String? cardId;
  AddCardResponse(this.success, this.error, this.unhandledError, this.cardId);
Map<String, dynamic> toFirebaseFormattedJson() {
    return <String, dynamic>{
      "success": success,
      "error": error,
      "unhandledError": unhandledError,
      "cardId": cardId,
    };
  }
factory AddCardResponse.fromFirebaseFormattedJson(dynamic json) { 
   return AddCardResponse(json["success"], json["error"].toString().toAddCardError(), json["unhandledError"], json["cardId"]);
  }
}

class ChargeCardResponse {
  bool success;
  AddCardError? error;
  String? unhandledError;
  String? paymentIntent;
  String? customer;
  String? publishableKey;
  String? stripeAccountId;
  ChargeCardResponse(this.success, this.error, this.unhandledError, this.paymentIntent, this.customer, this.publishableKey, this.stripeAccountId);
Map<String, dynamic> toFirebaseFormattedJson() {
    return <String, dynamic>{
      "success": success,
      "error": error,
      "unhandledError": unhandledError,
      "paymentIntent": paymentIntent,
      "customer": customer,
      "publishableKey": publishableKey,
      "stripeAccountId": stripeAccountId,
    };
  }
factory ChargeCardResponse.fromFirebaseFormattedJson(dynamic json) { 
   return ChargeCardResponse(json["success"], json["error"].toString().toAddCardError(), json["unhandledError"], json["paymentIntent"], json["customer"], json["publishableKey"], json["stripeAccountId"]);
  }
}

class RemoveCardResponse {
  bool success;
  RemoveCardError? error;
  String? unhandledError;
  RemoveCardResponse(this.success, this.error, this.unhandledError);
Map<String, dynamic> toFirebaseFormattedJson() {
    return <String, dynamic>{
      "success": success,
      "error": error,
      "unhandledError": unhandledError,
    };
  }
factory RemoveCardResponse.fromFirebaseFormattedJson(dynamic json) { 
   return RemoveCardResponse(json["success"], json["error"].toString().toRemoveCardError(), json["unhandledError"]);
  }
}

class SetupStripeResponse {
  bool success;
  SetupStripeError? error;
  String? unhandledError;
  String? object;
  num? created;
  num? expires_at;
  String? url;
  SetupStripeResponse(this.success, this.error, this.unhandledError, this.object, this.created, this.expires_at, this.url);
Map<String, dynamic> toFirebaseFormattedJson() {
    return <String, dynamic>{
      "success": success,
      "error": error,
      "unhandledError": unhandledError,
      "object": object,
      "created": created,
      "expires_at": expires_at,
      "url": url,
    };
  }
factory SetupStripeResponse.fromFirebaseFormattedJson(dynamic json) { 
   return SetupStripeResponse(json["success"], json["error"].toString().toSetupStripeError(), json["unhandledError"], json["object"], json["created"], json["expires_at"], json["url"]);
  }
}

class UpdateStripeResponse {
  bool success;
  UpdateStripeError? error;
  String? unhandledError;
  UpdateStripeResponse(this.success, this.error, this.unhandledError);
Map<String, dynamic> toFirebaseFormattedJson() {
    return <String, dynamic>{
      "success": success,
      "error": error,
      "unhandledError": unhandledError,
    };
  }
factory UpdateStripeResponse.fromFirebaseFormattedJson(dynamic json) { 
   return UpdateStripeResponse(json["success"], json["error"].toString().toUpdateStripeError(), json["unhandledError"]);
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
  bool success;
  CallUserError? error;
  String? unhandledError;
  num? id;
  String? token;
  String? name;
  String? image;
  String? expirationTime;
  ParticipantType? participantType;
  CallUserResponse(this.success, this.error, this.unhandledError, this.id, this.token, this.name, this.image, this.expirationTime, this.participantType);
Map<String, dynamic> toFirebaseFormattedJson() {
    return <String, dynamic>{
      "success": success,
      "error": error,
      "unhandledError": unhandledError,
      "id": id,
      "token": token,
      "name": name,
      "image": image,
      "expirationTime": expirationTime,
      "participantType": participantType,
    };
  }
factory CallUserResponse.fromFirebaseFormattedJson(dynamic json) { 
   return CallUserResponse(json["success"], json["error"].toString().toCallUserError(), json["unhandledError"], json["id"], json["token"], json["name"], json["image"], json["expirationTime"], json["participantType"].toString().toParticipantType());
  }
}

class AddOperatorResponse {
  bool success;
  AddOperatorError? error;
  String? unhandledError;
  AddOperatorResponse(this.success, this.error, this.unhandledError);
Map<String, dynamic> toFirebaseFormattedJson() {
    return <String, dynamic>{
      "success": success,
      "error": error,
      "unhandledError": unhandledError,
    };
  }
factory AddOperatorResponse.fromFirebaseFormattedJson(dynamic json) { 
   return AddOperatorResponse(json["success"], json["error"].toString().toAddOperatorError(), json["unhandledError"]);
  }
}

class AuthOperatorResponse {
  bool success;
  AuthOperatorError? error;
  String? unhandledError;
  AuthOperatorResponse(this.success, this.error, this.unhandledError);
Map<String, dynamic> toFirebaseFormattedJson() {
    return <String, dynamic>{
      "success": success,
      "error": error,
      "unhandledError": unhandledError,
    };
  }
factory AuthOperatorResponse.fromFirebaseFormattedJson(dynamic json) { 
   return AuthOperatorResponse(json["success"], json["error"].toString().toAuthOperatorError(), json["unhandledError"]);
  }
}

class AddDriverResponse {
  bool success;
  AddDriverError? error;
  String? unhandledError;
  AddDriverResponse(this.success, this.error, this.unhandledError);
Map<String, dynamic> toFirebaseFormattedJson() {
    return <String, dynamic>{
      "success": success,
      "error": error,
      "unhandledError": unhandledError,
    };
  }
factory AddDriverResponse.fromFirebaseFormattedJson(dynamic json) { 
   return AddDriverResponse(json["success"], json["error"].toString().toAddDriverError(), json["unhandledError"]);
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


class AuthorizeDriverResponse {
  bool success;
  AuthorizeDriverError? error;
  String? unhandledError;
  AuthorizeDriverResponse(this.success, this.error, this.unhandledError);
Map<String, dynamic> toFirebaseFormattedJson() {
    return <String, dynamic>{
      "success": success,
      "error": error,
      "unhandledError": unhandledError,
    };
  }
factory AuthorizeDriverResponse.fromFirebaseFormattedJson(dynamic json) { 
   return AuthorizeDriverResponse(json["success"], json["error"].toString().toAuthorizeDriverError(), json["unhandledError"]);
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

class RestaurantResponse {
  bool success;
  RestaurantError? error;
  String? unhandledError;
  RestaurantResponse(this.success, this.error, this.unhandledError);
Map<String, dynamic> toFirebaseFormattedJson() {
    return <String, dynamic>{
      "success": success,
      "error": error,
      "unhandledError": unhandledError,
    };
  }
factory RestaurantResponse.fromFirebaseFormattedJson(dynamic json) { 
   return RestaurantResponse(json["success"], json["error"].toString().toRestaurantError(), json["unhandledError"]);
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
  bool success;
  CheckoutResponseError? error;
  String? unhandledError;
  num? orderId;
  CheckoutResponse(this.success, this.error, this.unhandledError, this.orderId);
Map<String, dynamic> toFirebaseFormattedJson() {
    return <String, dynamic>{
      "success": success,
      "error": error,
      "unhandledError": unhandledError,
      "orderId": orderId,
    };
  }
factory CheckoutResponse.fromFirebaseFormattedJson(dynamic json) { 
   return CheckoutResponse(json["success"], json["error"].toString().toCheckoutResponseError(), json["unhandledError"], json["orderId"]);
  }
}

class ChangeRestaurantStatusResponse {
  bool success;
  ChangeRestaurantStatusError? error;
  String? unhandledError;
  ChangeRestaurantStatusResponse(this.success, this.error, this.unhandledError);
Map<String, dynamic> toFirebaseFormattedJson() {
    return <String, dynamic>{
      "success": success,
      "error": error,
      "unhandledError": unhandledError,
    };
  }
factory ChangeRestaurantStatusResponse.fromFirebaseFormattedJson(dynamic json) { 
   return ChangeRestaurantStatusResponse(json["success"], json["error"].toString().toChangeRestaurantStatusError(), json["unhandledError"]);
  }
}

class CancelRestaurantOrderResponse {
  bool success;
  CancelOrderError? error;
  String? unhandledError;
  CancelRestaurantOrderResponse(this.success, this.error, this.unhandledError);
Map<String, dynamic> toFirebaseFormattedJson() {
    return <String, dynamic>{
      "success": success,
      "error": error,
      "unhandledError": unhandledError,
    };
  }
factory CancelRestaurantOrderResponse.fromFirebaseFormattedJson(dynamic json) { 
   return CancelRestaurantOrderResponse(json["success"], json["error"].toString().toCancelOrderError(), json["unhandledError"]);
  }
}

class LaundryResponse {
  bool success;
  LaundryError? error;
  String? unhandledError;
  LaundryResponse(this.success, this.error, this.unhandledError);
Map<String, dynamic> toFirebaseFormattedJson() {
    return <String, dynamic>{
      "success": success,
      "error": error,
      "unhandledError": unhandledError,
    };
  }
factory LaundryResponse.fromFirebaseFormattedJson(dynamic json) { 
   return LaundryResponse(json["success"], json["error"].toString().toLaundryError(), json["unhandledError"]);
  }
}

class ReqLaundryResponse {
  bool success;
  ReqLaundryError? error;
  String? unhandledError;
  num? orderId;
  ReqLaundryResponse(this.success, this.error, this.unhandledError, this.orderId);
Map<String, dynamic> toFirebaseFormattedJson() {
    return <String, dynamic>{
      "success": success,
      "error": error,
      "unhandledError": unhandledError,
      "orderId": orderId,
    };
  }
factory ReqLaundryResponse.fromFirebaseFormattedJson(dynamic json) { 
   return ReqLaundryResponse(json["success"], json["error"].toString().toReqLaundryError(), json["unhandledError"], json["orderId"]);
  }
}

class ChangeLaundryStatusResponse {
  bool success;
  ChangeLaundryStatusError? error;
  String? unhandledError;
  ChangeLaundryStatusResponse(this.success, this.error, this.unhandledError);
Map<String, dynamic> toFirebaseFormattedJson() {
    return <String, dynamic>{
      "success": success,
      "error": error,
      "unhandledError": unhandledError,
    };
  }
factory ChangeLaundryStatusResponse.fromFirebaseFormattedJson(dynamic json) { 
   return ChangeLaundryStatusResponse(json["success"], json["error"].toString().toChangeLaundryStatusError(), json["unhandledError"]);
  }
}

class CancelLaundryResponse {
  bool success;
  CancelLaundryError? error;
  String? unhandledError;
  CancelLaundryResponse(this.success, this.error, this.unhandledError);
Map<String, dynamic> toFirebaseFormattedJson() {
    return <String, dynamic>{
      "success": success,
      "error": error,
      "unhandledError": unhandledError,
    };
  }
factory CancelLaundryResponse.fromFirebaseFormattedJson(dynamic json) { 
   return CancelLaundryResponse(json["success"], json["error"].toString().toCancelLaundryError(), json["unhandledError"]);
  }
}

class AssignDriverResponse {
  bool success;
  AssignDriverError? error;
  String? unhandledError;
  AssignDriverResponse(this.success, this.error, this.unhandledError);
Map<String, dynamic> toFirebaseFormattedJson() {
    return <String, dynamic>{
      "success": success,
      "error": error,
      "unhandledError": unhandledError,
    };
  }
factory AssignDriverResponse.fromFirebaseFormattedJson(dynamic json) { 
   return AssignDriverResponse(json["success"], json["error"].toString().toAssignDriverError(), json["unhandledError"]);
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


class ChangeDeliveryStatusResponse {
  bool success;
  ChangeDeliveryStatusError? error;
  String? unhandledError;
  ChangeDeliveryStatusResponse(this.success, this.error, this.unhandledError);
Map<String, dynamic> toFirebaseFormattedJson() {
    return <String, dynamic>{
      "success": success,
      "error": error,
      "unhandledError": unhandledError,
    };
  }
factory ChangeDeliveryStatusResponse.fromFirebaseFormattedJson(dynamic json) { 
   return ChangeDeliveryStatusResponse(json["success"], json["error"].toString().toChangeDeliveryStatusError(), json["unhandledError"]);
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
    return str;
  }
}
extension ParseStringToServerResponseStatus on String {
  ServerResponseStatus toServerResponseStatus() {
    return ServerResponseStatus.values.firstWhere(
        (ServerResponseStatus serverResponseStatus) =>
            serverResponseStatus.toFirebaseFormatString() == this);
  }
}


enum SendOtpError { UserNotFound, OTPAskedTooSoon, SMSSendError }
extension ParseSendOtpErrorToString on SendOtpError {
  String toFirebaseFormatString() {
    String str = this.toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}
extension ParseStringToSendOtpError on String {
  SendOtpError toSendOtpError() {
    return SendOtpError.values.firstWhere(
        (SendOtpError sendOtpError) =>
            sendOtpError.toFirebaseFormatString() == this);
  }
}


enum AuthOtpError { InvalidOTPCode, ExceededNumberOfTries }
extension ParseAuthOtpErrorToString on AuthOtpError {
  String toFirebaseFormatString() {
    String str = this.toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}
extension ParseStringToAuthOtpError on String {
  AuthOtpError toAuthOtpError() {
    return AuthOtpError.values.firstWhere(
        (AuthOtpError authOtpError) =>
            authOtpError.toFirebaseFormatString() == this);
  }
}


enum PaymentIntentError { ServiceProviderDetailsNotFound, CardNotAccepted, StripeNotWorking, CustomerNotFound, NoCustomerStripeInfo, CustomerUpdateError }
extension ParsePaymentIntentErrorToString on PaymentIntentError {
  String toFirebaseFormatString() {
    String str = this.toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}
extension ParseStringToPaymentIntentError on String {
  PaymentIntentError toPaymentIntentError() {
    return PaymentIntentError.values.firstWhere(
        (PaymentIntentError paymentIntentError) =>
            paymentIntentError.toFirebaseFormatString() == this);
  }
}


enum AddCardError { CustomerNotFound, NoCustomerStripeInfo, CustomerUpdateError }
extension ParseAddCardErrorToString on AddCardError {
  String toFirebaseFormatString() {
    String str = this.toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}
extension ParseStringToAddCardError on String {
  AddCardError toAddCardError() {
    return AddCardError.values.firstWhere(
        (AddCardError addCardError) =>
            addCardError.toFirebaseFormatString() == this);
  }
}


enum RemoveCardError { OrdersInProcess, CustomerNotFound, NoCustomerStripeInfo, CardNotFound, ServiceProviderDetailsNotFound, CustomerUpdateError }
extension ParseRemoveCardErrorToString on RemoveCardError {
  String toFirebaseFormatString() {
    String str = this.toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}
extension ParseStringToRemoveCardError on String {
  RemoveCardError toRemoveCardError() {
    return RemoveCardError.values.firstWhere(
        (RemoveCardError removeCardError) =>
            removeCardError.toFirebaseFormatString() == this);
  }
}


enum SetupStripeError { ServiceProviderDetailsNotFound, UnauthorizedAccess, OperatorNotAuthorized, StripeUpdateError }
extension ParseSetupStripeErrorToString on SetupStripeError {
  String toFirebaseFormatString() {
    String str = this.toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}
extension ParseStringToSetupStripeError on String {
  SetupStripeError toSetupStripeError() {
    return SetupStripeError.values.firstWhere(
        (SetupStripeError setupStripeError) =>
            setupStripeError.toFirebaseFormatString() == this);
  }
}


enum UpdateStripeError { ServiceProviderDetailsNotFound, UnauthorizedAccess, OperatorNotAuthorized, NoStripeAccount }
extension ParseUpdateStripeErrorToString on UpdateStripeError {
  String toFirebaseFormatString() {
    String str = this.toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}
extension ParseStringToUpdateStripeError on String {
  UpdateStripeError toUpdateStripeError() {
    return UpdateStripeError.values.firstWhere(
        (UpdateStripeError updateStripeError) =>
            updateStripeError.toFirebaseFormatString() == this);
  }
}


enum CallUserError { ChatNotFound, RecipientNotAvailable, CallerNotInParticipants }
extension ParseCallUserErrorToString on CallUserError {
  String toFirebaseFormatString() {
    String str = this.toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}
extension ParseStringToCallUserError on String {
  CallUserError toCallUserError() {
    return CallUserError.values.firstWhere(
        (CallUserError callUserError) =>
            callUserError.toFirebaseFormatString() == this);
  }
}


enum AddOperatorError { UserNotFound, ServiceProviderDetailsNotFound, UserAlreadyAnOperator, OperatorCreationError, RestaurantNotfound, DeliveryCompanyOperatorsNotFound, LaundryStoreNotfound }
extension ParseAddOperatorErrorToString on AddOperatorError {
  String toFirebaseFormatString() {
    String str = this.toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}
extension ParseStringToAddOperatorError on String {
  AddOperatorError toAddOperatorError() {
    return AddOperatorError.values.firstWhere(
        (AddOperatorError addOperatorError) =>
            addOperatorError.toFirebaseFormatString() == this);
  }
}


enum AuthOperatorError { OperatorNotFound, UnauthorizedAccess, IncorrectOperatorId, OperatorDetailsNotFound }
extension ParseAuthOperatorErrorToString on AuthOperatorError {
  String toFirebaseFormatString() {
    String str = this.toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}
extension ParseStringToAuthOperatorError on String {
  AuthOperatorError toAuthOperatorError() {
    return AuthOperatorError.values.firstWhere(
        (AuthOperatorError authOperatorError) =>
            authOperatorError.toFirebaseFormatString() == this);
  }
}


enum AddDriverError { DriverAlreadyExists, DriverCreationError, InvalidServiceProviderType }
extension ParseAddDriverErrorToString on AddDriverError {
  String toFirebaseFormatString() {
    String str = this.toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}
extension ParseStringToAddDriverError on String {
  AddDriverError toAddDriverError() {
    return AddDriverError.values.firstWhere(
        (AddDriverError addDriverError) =>
            addDriverError.toFirebaseFormatString() == this);
  }
}


enum AuthorizeDriverError { DriverNotFound, OperatorNotFound, UnauthorizedAccess }
extension ParseAuthorizeDriverErrorToString on AuthorizeDriverError {
  String toFirebaseFormatString() {
    String str = this.toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}
extension ParseStringToAuthorizeDriverError on String {
  AuthorizeDriverError toAuthorizeDriverError() {
    return AuthorizeDriverError.values.firstWhere(
        (AuthorizeDriverError authorizeDriverError) =>
            authorizeDriverError.toFirebaseFormatString() == this);
  }
}


enum RestaurantError { DeliveryDetailsNotSet, NoDeliveryPartner, UserNotFound, DeepLinkError, QRGenerationError, RestaurantCreationError }
extension ParseRestaurantErrorToString on RestaurantError {
  String toFirebaseFormatString() {
    String str = this.toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}
extension ParseStringToRestaurantError on String {
  RestaurantError toRestaurantError() {
    return RestaurantError.values.firstWhere(
        (RestaurantError restaurantError) =>
            restaurantError.toFirebaseFormatString() == this);
  }
}


enum CheckoutResponseError { RestaurantClosed, CartEmpty, RestaurantNotApproved, NoDeliveryPartner, NotAcceptingDeliveryOrders, RestaurantNotFound, CartNotFound, CustomerNotFound, RestaurantIdMismatch, OrderCreationError, DeliveryCompanyOperatorsNotFound, ServiceProviderDetailsNotFound, NoStripeAccountOfServiceProvider, UpdateOrderStripeError }
extension ParseCheckoutResponseErrorToString on CheckoutResponseError {
  String toFirebaseFormatString() {
    String str = this.toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}
extension ParseStringToCheckoutResponseError on String {
  CheckoutResponseError toCheckoutResponseError() {
    return CheckoutResponseError.values.firstWhere(
        (CheckoutResponseError checkoutResponseError) =>
            checkoutResponseError.toFirebaseFormatString() == this);
  }
}


enum ChangeRestaurantStatusError { OrderNotFound, UnauthorizedAccess, IncorrectOrderId, CustomerNotFound, OrderNotInProcess, InvalidStatus, ServiceProviderDetailsNotFound, OrderStripeInfoNotDefined, ServiceProviderStripeAccountDoesNotExist, UpdateOrderStripeError }
extension ParseChangeRestaurantStatusErrorToString on ChangeRestaurantStatusError {
  String toFirebaseFormatString() {
    String str = this.toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}
extension ParseStringToChangeRestaurantStatusError on String {
  ChangeRestaurantStatusError toChangeRestaurantStatusError() {
    return ChangeRestaurantStatusError.values.firstWhere(
        (ChangeRestaurantStatusError changeRestaurantStatusError) =>
            changeRestaurantStatusError.toFirebaseFormatString() == this);
  }
}


enum CancelOrderError { OrderNotFound, RestaurantNotfound, IncorrectOrderId, OrderNotInProcess, ServiceProviderDetailsNotFound, OrderStripeInfoNotDefined, ServiceProviderStripeAccountDoesNotExist, UpdateOrderStripeError }
extension ParseCancelOrderErrorToString on CancelOrderError {
  String toFirebaseFormatString() {
    String str = this.toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}
extension ParseStringToCancelOrderError on String {
  CancelOrderError toCancelOrderError() {
    return CancelOrderError.values.firstWhere(
        (CancelOrderError cancelOrderError) =>
            cancelOrderError.toFirebaseFormatString() == this);
  }
}


enum LaundryError { DeliveryDetailsNotSet, NoDeliveryPartner, UserNotFound, DeepLinkError, QRGenerationError, LaundryCreationError }
extension ParseLaundryErrorToString on LaundryError {
  String toFirebaseFormatString() {
    String str = this.toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}
extension ParseStringToLaundryError on String {
  LaundryError toLaundryError() {
    return LaundryError.values.firstWhere(
        (LaundryError laundryError) =>
            laundryError.toFirebaseFormatString() == this);
  }
}


enum ReqLaundryError { LaundryStoreNotfound, CustomerNotFound, LaundryStoreNotApproved, StoreClosed, NoDeliveryPartner, DeliveryNotAvailable, OrderCreationError, NoChatId, DeliveryCompanyOperatorsNotFound, ServiceProviderDetailsNotFound, InvalidOrderType, NoStripeAccountOfServiceProvider, UpdateOrderStripeError }
extension ParseReqLaundryErrorToString on ReqLaundryError {
  String toFirebaseFormatString() {
    String str = this.toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}
extension ParseStringToReqLaundryError on String {
  ReqLaundryError toReqLaundryError() {
    return ReqLaundryError.values.firstWhere(
        (ReqLaundryError reqLaundryError) =>
            reqLaundryError.toFirebaseFormatString() == this);
  }
}


enum ChangeLaundryStatusError { OrderNotFound, UnauthorizedAccess, IncorrectOrderId, CustomerNotFound, OrderNotInProcess, InvalidStatus, ServiceProviderDetailsNotFound, OrderStripeInfoNotDefined, ServiceProviderStripeAccountDoesNotExist, UpdateOrderStripeError }
extension ParseChangeLaundryStatusErrorToString on ChangeLaundryStatusError {
  String toFirebaseFormatString() {
    String str = this.toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}
extension ParseStringToChangeLaundryStatusError on String {
  ChangeLaundryStatusError toChangeLaundryStatusError() {
    return ChangeLaundryStatusError.values.firstWhere(
        (ChangeLaundryStatusError changeLaundryStatusError) =>
            changeLaundryStatusError.toFirebaseFormatString() == this);
  }
}


enum CancelLaundryError { OrderNotFound, LaundryStoreNotfound, IncorrectOrderId, OrderNotInProcess, ServiceProviderDetailsNotFound, OrderStripeInfoNotDefined, ServiceProviderStripeAccountDoesNotExist, UpdateOrderStripeError, DeliveryCompanyOperatorsNotFound }
extension ParseCancelLaundryErrorToString on CancelLaundryError {
  String toFirebaseFormatString() {
    String str = this.toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}
extension ParseStringToCancelLaundryError on String {
  CancelLaundryError toCancelLaundryError() {
    return CancelLaundryError.values.firstWhere(
        (CancelLaundryError cancelLaundryError) =>
            cancelLaundryError.toFirebaseFormatString() == this);
  }
}


enum AssignDriverError { OrderNotFound, DriverNotFound, OperatorNotFound, InvalidOperator, UnauthorizedDriver, ServiceProviderDeliveryChatNotFound, DriverAlreadyAssigned, DeliveryOrderNotFound }
extension ParseAssignDriverErrorToString on AssignDriverError {
  String toFirebaseFormatString() {
    String str = this.toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}
extension ParseStringToAssignDriverError on String {
  AssignDriverError toAssignDriverError() {
    return AssignDriverError.values.firstWhere(
        (AssignDriverError assignDriverError) =>
            assignDriverError.toFirebaseFormatString() == this);
  }
}


enum ChangeDeliveryStatusError { OrderNotFound, DriverNotAssigned, OrderNotInProcess, OrderDriverMismatch, CustomerNotFound, InvalidStatus, RestaurantNotfound, ServiceProviderDetailsNotFound, OrderStripeInfoNotDefined, ServiceProviderStripeAccountDoesNotExist, UpdateOrderStripeError, LaundryStoreNotfound, OrderCreationError, NoDeliveryChatWithStoreId, DeliveryCompanyOperatorsNotFound }
extension ParseChangeDeliveryStatusErrorToString on ChangeDeliveryStatusError {
  String toFirebaseFormatString() {
    String str = this.toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}
extension ParseStringToChangeDeliveryStatusError on String {
  ChangeDeliveryStatusError toChangeDeliveryStatusError() {
    return ChangeDeliveryStatusError.values.firstWhere(
        (ChangeDeliveryStatusError changeDeliveryStatusError) =>
            changeDeliveryStatusError.toFirebaseFormatString() == this);
  }
}


