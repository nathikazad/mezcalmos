class SendOtpResponse {
  bool success;
  SendOtpError? error;
  String? unhandledError;
  num? secondsLeft;
  SendOtpResponse(
      this.success, this.error, this.unhandledError, this.secondsLeft);
  Map<String, dynamic> toFirebaseFormattedJson() {
    return <String, dynamic>{
      "success": success,
      "error": error,
      "unhandledError": unhandledError,
      "secondsLeft": secondsLeft,
    };
  }

  factory SendOtpResponse.fromFirebaseFormattedJson(json) {
    return SendOtpResponse(
        json["success"],
        json["error"]?.toString().toSendOtpError(),
        json["unhandledError"],
        json["secondsLeft"]);
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

  factory AuthResponse.fromFirebaseFormattedJson(json) {
    return AuthResponse(
        json["success"],
        json["error"]?.toString().toAuthOtpError(),
        json["unhandledError"],
        json["token"]);
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
  PaymentIntentResponse(
      this.success,
      this.error,
      this.unhandledError,
      this.paymentIntent,
      this.ephemeralKey,
      this.customer,
      this.publishableKey,
      this.stripeAccountId);
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

  factory PaymentIntentResponse.fromFirebaseFormattedJson(json) {
    return PaymentIntentResponse(
        json["success"],
        json["error"]?.toString().toPaymentIntentError(),
        json["unhandledError"],
        json["paymentIntent"],
        json["ephemeralKey"],
        json["customer"],
        json["publishableKey"],
        json["stripeAccountId"]);
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

  factory AddCardResponse.fromFirebaseFormattedJson(json) {
    return AddCardResponse(
        json["success"],
        json["error"]?.toString().toAddCardError(),
        json["unhandledError"],
        json["cardId"]);
  }
}

class ChargeCardResponse {
  bool success;
  ChargeCardError? error;
  String? unhandledError;
  String? paymentIntent;
  String? customer;
  String? publishableKey;
  String? stripeAccountId;
  ChargeCardResponse(
      this.success,
      this.error,
      this.unhandledError,
      this.paymentIntent,
      this.customer,
      this.publishableKey,
      this.stripeAccountId);
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

  factory ChargeCardResponse.fromFirebaseFormattedJson(json) {
    return ChargeCardResponse(
        json["success"],
        json["error"]?.toString().toChargeCardError(),
        json["unhandledError"],
        json["paymentIntent"],
        json["customer"],
        json["publishableKey"],
        json["stripeAccountId"]);
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

  factory RemoveCardResponse.fromFirebaseFormattedJson(json) {
    return RemoveCardResponse(json["success"],
        json["error"]?.toString().toRemoveCardError(), json["unhandledError"]);
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
  SetupStripeResponse(this.success, this.error, this.unhandledError,
      this.object, this.created, this.expires_at, this.url);
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

  factory SetupStripeResponse.fromFirebaseFormattedJson(json) {
    return SetupStripeResponse(
        json["success"],
        json["error"]?.toString().toSetupStripeError(),
        json["unhandledError"],
        json["object"],
        json["created"],
        json["expires_at"],
        json["url"]);
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

  factory UpdateStripeResponse.fromFirebaseFormattedJson(json) {
    return UpdateStripeResponse(
        json["success"],
        json["error"]?.toString().toUpdateStripeError(),
        json["unhandledError"]);
  }
}

enum ParticipantType {
  Customer,
  Taxi,
  DeliveryOperator,
  DeliveryDriver,
  LaundryOperator,
  RestaurantOperator,
  MezAdmin,
  BusinessOperator
}

extension ParseParticipantTypeToString on ParticipantType {
  String toFirebaseFormatString() {
    String str = toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}

extension ParseStringToParticipantType on String {
  ParticipantType toParticipantType() {
    return ParticipantType.values.firstWhere(
        (ParticipantType participantType) =>
            participantType.toFirebaseFormatString().toLowerCase() ==
            toLowerCase());
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
  CallUserResponse(
      this.success,
      this.error,
      this.unhandledError,
      this.id,
      this.token,
      this.name,
      this.image,
      this.expirationTime,
      this.participantType);
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

  factory CallUserResponse.fromFirebaseFormattedJson(json) {
    return CallUserResponse(
        json["success"],
        json["error"]?.toString().toCallUserError(),
        json["unhandledError"],
        json["id"],
        json["token"],
        json["name"],
        json["image"],
        json["expirationTime"],
        json["participantType"]?.toString().toParticipantType());
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

  factory AddOperatorResponse.fromFirebaseFormattedJson(json) {
    return AddOperatorResponse(json["success"],
        json["error"]?.toString().toAddOperatorError(), json["unhandledError"]);
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

  factory AuthOperatorResponse.fromFirebaseFormattedJson(json) {
    return AuthOperatorResponse(
        json["success"],
        json["error"]?.toString().toAuthOperatorError(),
        json["unhandledError"]);
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

  factory AddDriverResponse.fromFirebaseFormattedJson(json) {
    return AddDriverResponse(json["success"],
        json["error"]?.toString().toAddDriverError(), json["unhandledError"]);
  }
}

enum DeliveryServiceProviderType { Restaurant, DeliveryCompany, Laundry }

extension ParseDeliveryServiceProviderTypeToString
    on DeliveryServiceProviderType {
  String toFirebaseFormatString() {
    String str = toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}

extension ParseStringToDeliveryServiceProviderType on String {
  DeliveryServiceProviderType toDeliveryServiceProviderType() {
    return DeliveryServiceProviderType.values.firstWhere(
        (DeliveryServiceProviderType deliveryServiceProviderType) =>
            deliveryServiceProviderType
                .toFirebaseFormatString()
                .toLowerCase() ==
            toLowerCase());
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

  factory AuthorizeDriverResponse.fromFirebaseFormattedJson(json) {
    return AuthorizeDriverResponse(
        json["success"],
        json["error"]?.toString().toAuthorizeDriverError(),
        json["unhandledError"]);
  }
}

class Location {
  num lat;
  num lng;
  String? address;
  Location({required this.lat, required this.lng, this.address});
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
  DeliveryDetails(
      {this.minimumCost,
      this.costPerKm,
      this.radius,
      this.freeDeliveryMinimumCost,
      this.freeDeliveryKmRange,
      required this.deliveryAvailable,
      required this.customerPickup,
      required this.selfDelivery});
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

  factory RestaurantResponse.fromFirebaseFormattedJson(json) {
    return RestaurantResponse(json["success"],
        json["error"]?.toString().toRestaurantError(), json["unhandledError"]);
  }
}

enum CustomerAppType { Native, Web }

extension ParseCustomerAppTypeToString on CustomerAppType {
  String toFirebaseFormatString() {
    String str = toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}

extension ParseStringToCustomerAppType on String {
  CustomerAppType toCustomerAppType() {
    return CustomerAppType.values.firstWhere(
        (CustomerAppType customerAppType) =>
            customerAppType.toFirebaseFormatString().toLowerCase() ==
            toLowerCase());
  }
}

enum PaymentType { Cash, Card, BankTransfer }

extension ParsePaymentTypeToString on PaymentType {
  String toFirebaseFormatString() {
    String str = toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}

extension ParseStringToPaymentType on String {
  PaymentType toPaymentType() {
    return PaymentType.values.firstWhere((PaymentType paymentType) =>
        paymentType.toFirebaseFormatString().toLowerCase() == toLowerCase());
  }
}

enum DeliveryType { Pickup, Delivery }

extension ParseDeliveryTypeToString on DeliveryType {
  String toFirebaseFormatString() {
    String str = toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}

extension ParseStringToDeliveryType on String {
  DeliveryType toDeliveryType() {
    return DeliveryType.values.firstWhere((DeliveryType deliveryType) =>
        deliveryType.toFirebaseFormatString().toLowerCase() == toLowerCase());
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

  factory CheckoutResponse.fromFirebaseFormattedJson(json) {
    return CheckoutResponse(
        json["success"],
        json["error"]?.toString().toCheckoutResponseError(),
        json["unhandledError"],
        json["orderId"]);
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

  factory ChangeRestaurantStatusResponse.fromFirebaseFormattedJson(json) {
    return ChangeRestaurantStatusResponse(
        json["success"],
        json["error"]?.toString().toChangeRestaurantStatusError(),
        json["unhandledError"]);
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

  factory CancelRestaurantOrderResponse.fromFirebaseFormattedJson(json) {
    return CancelRestaurantOrderResponse(json["success"],
        json["error"]?.toString().toCancelOrderError(), json["unhandledError"]);
  }
}

enum BusinessProfile {
  SurfShop,
  VehicleRental,
  HomeRental,
  WellnessClass,
  Party,
  Volunteer,
  TourAgency,
  DanceClass,
  Therapy
}

extension ParseBusinessProfileToString on BusinessProfile {
  String toFirebaseFormatString() {
    String str = toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}

extension ParseStringToBusinessProfile on String {
  BusinessProfile toBusinessProfile() {
    return BusinessProfile.values.firstWhere(
        (BusinessProfile businessProfile) =>
            businessProfile.toFirebaseFormatString().toLowerCase() ==
            toLowerCase());
  }
}

class BusinessResponse {
  bool success;
  BusinessError? error;
  String? unhandledError;
  BusinessResponse(this.success, this.error, this.unhandledError);
  Map<String, dynamic> toFirebaseFormattedJson() {
    return <String, dynamic>{
      "success": success,
      "error": error,
      "unhandledError": unhandledError,
    };
  }

  factory BusinessResponse.fromFirebaseFormattedJson(json) {
    return BusinessResponse(json["success"],
        json["error"]?.toString().toBusinessError(), json["unhandledError"]);
  }
}

class OrderReqResponse {
  bool success;
  OrderReqError? error;
  String? unhandledError;
  num? orderId;
  OrderReqResponse(this.success, this.error, this.unhandledError, this.orderId);
  Map<String, dynamic> toFirebaseFormattedJson() {
    return <String, dynamic>{
      "success": success,
      "error": error,
      "unhandledError": unhandledError,
      "orderId": orderId,
    };
  }

  factory OrderReqResponse.fromFirebaseFormattedJson(json) {
    return OrderReqResponse(
        json["success"],
        json["error"]?.toString().toOrderReqError(),
        json["unhandledError"],
        json["orderId"]);
  }
}

class HandleRequestResponse {
  bool success;
  HandleRequestError? error;
  String? unhandledError;
  num? orderId;
  HandleRequestResponse(
      this.success, this.error, this.unhandledError, this.orderId);
  Map<String, dynamic> toFirebaseFormattedJson() {
    return <String, dynamic>{
      "success": success,
      "error": error,
      "unhandledError": unhandledError,
      "orderId": orderId,
    };
  }

  factory HandleRequestResponse.fromFirebaseFormattedJson(json) {
    return HandleRequestResponse(
        json["success"],
        json["error"]?.toString().toHandleRequestError(),
        json["unhandledError"],
        json["orderId"]);
  }
}

class CustomerHandleRequestResponse {
  bool success;
  CustomerHandleRequestError? error;
  String? unhandledError;
  CustomerHandleRequestResponse(this.success, this.error, this.unhandledError);
  Map<String, dynamic> toFirebaseFormattedJson() {
    return <String, dynamic>{
      "success": success,
      "error": error,
      "unhandledError": unhandledError,
    };
  }

  factory CustomerHandleRequestResponse.fromFirebaseFormattedJson(json) {
    return CustomerHandleRequestResponse(
        json["success"],
        json["error"]?.toString().toCustomerHandleRequestError(),
        json["unhandledError"]);
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

  factory LaundryResponse.fromFirebaseFormattedJson(json) {
    return LaundryResponse(json["success"],
        json["error"]?.toString().toLaundryError(), json["unhandledError"]);
  }
}

class ReqLaundryResponse {
  bool success;
  ReqLaundryError? error;
  String? unhandledError;
  num? orderId;
  ReqLaundryResponse(
      this.success, this.error, this.unhandledError, this.orderId);
  Map<String, dynamic> toFirebaseFormattedJson() {
    return <String, dynamic>{
      "success": success,
      "error": error,
      "unhandledError": unhandledError,
      "orderId": orderId,
    };
  }

  factory ReqLaundryResponse.fromFirebaseFormattedJson(json) {
    return ReqLaundryResponse(
        json["success"],
        json["error"]?.toString().toReqLaundryError(),
        json["unhandledError"],
        json["orderId"]);
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

  factory ChangeLaundryStatusResponse.fromFirebaseFormattedJson(json) {
    return ChangeLaundryStatusResponse(
        json["success"],
        json["error"]?.toString().toChangeLaundryStatusError(),
        json["unhandledError"]);
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

  factory CancelLaundryResponse.fromFirebaseFormattedJson(json) {
    return CancelLaundryResponse(
        json["success"],
        json["error"]?.toString().toCancelLaundryError(),
        json["unhandledError"]);
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

  factory AssignDriverResponse.fromFirebaseFormattedJson(json) {
    return AssignDriverResponse(
        json["success"],
        json["error"]?.toString().toAssignDriverError(),
        json["unhandledError"]);
  }
}

enum DeliveryOrderStatus {
  OrderReceived,
  OnTheWayToPickup,
  AtPickup,
  OnTheWayToDropoff,
  AtDropoff,
  Delivered,
  CancelledByCustomer,
  CancelledByDeliverer,
  CancelledByServiceProvider,
  CancelledByAdmin
}

extension ParseDeliveryOrderStatusToString on DeliveryOrderStatus {
  String toFirebaseFormatString() {
    String str = toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}

extension ParseStringToDeliveryOrderStatus on String {
  DeliveryOrderStatus toDeliveryOrderStatus() {
    return DeliveryOrderStatus.values.firstWhere(
        (DeliveryOrderStatus deliveryOrderStatus) =>
            deliveryOrderStatus.toFirebaseFormatString().toLowerCase() ==
            toLowerCase());
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

  factory ChangeDeliveryStatusResponse.fromFirebaseFormattedJson(json) {
    return ChangeDeliveryStatusResponse(
        json["success"],
        json["error"]?.toString().toChangeDeliveryStatusError(),
        json["unhandledError"]);
  }
}

class CourierItem {
  num? id;
  String name;
  String? image;
  num? estimatedCost;
  String? notes;
  bool? unavailable;
  num? orderId;
  num? actualCost;
  CourierItem(
      {this.id,
      required this.name,
      this.image,
      this.estimatedCost,
      this.notes,
      this.unavailable,
      this.orderId,
      this.actualCost});
  Map<String, dynamic> toFirebaseFormattedJson() {
    return <String, dynamic>{
      "id": id,
      "name": name,
      "image": image,
      "estimatedCost": estimatedCost,
      "notes": notes,
      "unavailable": unavailable,
      "orderId": orderId,
      "actualCost": actualCost,
    };
  }
}

class CreateCourierResponse {
  bool success;
  CreateCourierError? error;
  String? unhandledError;
  num? orderId;
  CreateCourierResponse(
      this.success, this.error, this.unhandledError, this.orderId);
  Map<String, dynamic> toFirebaseFormattedJson() {
    return <String, dynamic>{
      "success": success,
      "error": error,
      "unhandledError": unhandledError,
      "orderId": orderId,
    };
  }

  factory CreateCourierResponse.fromFirebaseFormattedJson(json) {
    return CreateCourierResponse(
        json["success"],
        json["error"]?.toString().toCreateCourierError(),
        json["unhandledError"],
        json["orderId"]);
  }
}

class ChangePriceReqResponse {
  bool success;
  ChangePriceError? error;
  String? unhandledError;
  ChangePriceReqResponse(this.success, this.error, this.unhandledError);
  Map<String, dynamic> toFirebaseFormattedJson() {
    return <String, dynamic>{
      "success": success,
      "error": error,
      "unhandledError": unhandledError,
    };
  }

  factory ChangePriceReqResponse.fromFirebaseFormattedJson(json) {
    return ChangePriceReqResponse(json["success"],
        json["error"]?.toString().toChangePriceError(), json["unhandledError"]);
  }
}

enum OrderType { Taxi, Restaurant, Laundry, Courier, Business }

extension ParseOrderTypeToString on OrderType {
  String toFirebaseFormatString() {
    String str = toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}

extension ParseStringToOrderType on String {
  OrderType toOrderType() {
    return OrderType.values.firstWhere((OrderType orderType) =>
        orderType.toFirebaseFormatString().toLowerCase() == toLowerCase());
  }
}

class ChangePriceResResponse {
  bool success;
  ChangePriceError? error;
  String? unhandledError;
  ChangePriceResResponse(this.success, this.error, this.unhandledError);
  Map<String, dynamic> toFirebaseFormattedJson() {
    return <String, dynamic>{
      "success": success,
      "error": error,
      "unhandledError": unhandledError,
    };
  }

  factory ChangePriceResResponse.fromFirebaseFormattedJson(json) {
    return ChangePriceResResponse(json["success"],
        json["error"]?.toString().toChangePriceError(), json["unhandledError"]);
  }
}

class CancelCourierResponse {
  bool success;
  CancelCourierError? error;
  String? unhandledError;
  CancelCourierResponse(this.success, this.error, this.unhandledError);
  Map<String, dynamic> toFirebaseFormattedJson() {
    return <String, dynamic>{
      "success": success,
      "error": error,
      "unhandledError": unhandledError,
    };
  }

  factory CancelCourierResponse.fromFirebaseFormattedJson(json) {
    return CancelCourierResponse(
        json["success"],
        json["error"]?.toString().toCancelCourierError(),
        json["unhandledError"]);
  }
}

class NotificationInfo {
  String token;
  bool turnOffNotifications;
  AppType? appType;
  num? id;
  num? userId;
  NotificationInfo(
      {required this.token,
      required this.turnOffNotifications,
      this.appType,
      this.id,
      this.userId});
  Map<String, dynamic> toFirebaseFormattedJson() {
    return <String, dynamic>{
      "token": token,
      "turnOffNotifications": turnOffNotifications,
      "appType": appType,
      "id": id,
      "userId": userId,
    };
  }
}

enum Language { EN, ES }

extension ParseLanguageToString on Language {
  String toFirebaseFormatString() {
    String str = toString().split('.').last;
    return str.toLowerCase();
  }
}

extension ParseStringToLanguage on String {
  Language toLanguage() {
    return Language.values.firstWhere((Language language) =>
        language.toFirebaseFormatString().toLowerCase() == toLowerCase());
  }
}

class CustomerStripe {
  String id;
  Map<num, String> idsWithServiceProvider;
  Map<String, CustomerCard> cards;
  CustomerStripe(
      {required this.id,
      required this.idsWithServiceProvider,
      required this.cards});
  Map<String, dynamic> toFirebaseFormattedJson() {
    return <String, dynamic>{
      "id": id,
      "idsWithServiceProvider": idsWithServiceProvider,
      "cards": cards,
    };
  }
}

class CustomerCard {
  String cardId;
  String? last4;
  String? brand;
  num? expMonth;
  num? expYear;
  Map<num, String> idsWithServiceProvider;
  CustomerCard(
      {required this.cardId,
      this.last4,
      this.brand,
      this.expMonth,
      this.expYear,
      required this.idsWithServiceProvider});
  Map<String, dynamic> toFirebaseFormattedJson() {
    return <String, dynamic>{
      "cardId": cardId,
      "last4": last4,
      "brand": brand,
      "expMonth": expMonth,
      "expYear": expYear,
      "idsWithServiceProvider": idsWithServiceProvider,
    };
  }
}

enum StripePaymentStatus { Authorized, Captured, Cancelled }

extension ParseStripePaymentStatusToString on StripePaymentStatus {
  String toFirebaseFormatString() {
    String str = toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}

extension ParseStringToStripePaymentStatus on String {
  StripePaymentStatus toStripePaymentStatus() {
    return StripePaymentStatus.values.firstWhere(
        (StripePaymentStatus stripePaymentStatus) =>
            stripePaymentStatus.toFirebaseFormatString().toLowerCase() ==
            toLowerCase());
  }
}

class OrderStripeInfo {
  String id;
  num stripeFees;
  num amountCharged;
  num amountRefunded;
  bool? chargeFeesOnCustomer;
  String? brand;
  num? expMonth;
  num? expYear;
  String? last4;
  StripePaymentStatus status;
  String serviceProviderAccount;
  OrderStripeInfo(
      {required this.id,
      required this.stripeFees,
      required this.amountCharged,
      required this.amountRefunded,
      required this.chargeFeesOnCustomer,
      this.brand,
      this.expMonth,
      this.expYear,
      this.last4,
      required this.status,
      required this.serviceProviderAccount});
  Map<String, dynamic> toFirebaseFormattedJson() {
    return <String, dynamic>{
      "id": id,
      "stripeFees": stripeFees,
      "amountCharged": amountCharged,
      "amountRefunded": amountRefunded,
      "chargeFeesOnCustomer": chargeFeesOnCustomer,
      "brand": brand,
      "expMonth": expMonth,
      "expYear": expYear,
      "last4": last4,
      "status": status,
      "serviceProviderAccount": serviceProviderAccount,
    };
  }
}

enum StripeStatus { InProcess, IsWorking, Inactive }

extension ParseStripeStatusToString on StripeStatus {
  String toFirebaseFormatString() {
    String str = toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}

extension ParseStringToStripeStatus on String {
  StripeStatus toStripeStatus() {
    return StripeStatus.values.firstWhere((StripeStatus stripeStatus) =>
        stripeStatus.toFirebaseFormatString().toLowerCase() == toLowerCase());
  }
}

class ServiceProviderStripeInfo {
  String id;
  String status;
  bool? chargeFeesOnCustomer;
  bool chargesEnabled;
  bool payoutsEnabled;
  bool detailsSubmitted;
  List<String>? requirements;
  String? email;
  ServiceProviderStripeInfo(
      {required this.id,
      required this.status,
      required this.chargeFeesOnCustomer,
      required this.chargesEnabled,
      required this.payoutsEnabled,
      required this.detailsSubmitted,
      this.requirements,
      required this.email});
  Map<String, dynamic> toFirebaseFormattedJson() {
    return <String, dynamic>{
      "id": id,
      "status": status,
      "chargeFeesOnCustomer": chargeFeesOnCustomer,
      "chargesEnabled": chargesEnabled,
      "payoutsEnabled": payoutsEnabled,
      "detailsSubmitted": detailsSubmitted,
      "requirements": requirements,
      "email": email,
    };
  }
}

class DeliveryOrder {
  num deliveryId;
  Location? pickupLocation;
  String? pickupLocationText;
  Location dropoffLocation;
  num? deliveryDriverId;
  num? chatWithServiceProviderId;
  bool packageReady;
  num chatWithCustomerId;
  PaymentType paymentType;
  num? stripePaymentId;
  String? estimatedPackageReadyTime;
  String? actualPackageReadyTime;
  String? estimatedArrivalAtPickupTime;
  String? actualArrivalAtPickupTime;
  String? estimatedArrivalAtDropoffTime;
  String? actualArrivalAtDropoffTime;
  String? actualDeliveredTime;
  DeliveryOrderStatus status;
  num? driverReviewByServiceProviderId;
  num? driverReviewByCustomerId;
  num? serviceProviderReviewBydriverId;
  num? customerReviewByDriverId;
  num customerId;
  num serviceProviderId;
  DeliveryServiceProviderType serviceProviderType;
  String? tripPolyline;
  num deliveryCost;
  num? packageCost;
  Location? currentGps;
  num? tripDistance;
  num? tripDuration;
  String orderTime;
  String? cancellationTime;
  DeliveryDriver? deliveryDriver;
  OrderType orderType;
  DeliveryDirection direction;
  num? distanceFromBase;
  DeliveryChangePriceRequest? changePriceRequest;
  DeliveryOrder(
      {required this.deliveryId,
      this.pickupLocation,
      this.pickupLocationText,
      required this.dropoffLocation,
      this.deliveryDriverId,
      this.chatWithServiceProviderId,
      required this.packageReady,
      required this.chatWithCustomerId,
      required this.paymentType,
      this.stripePaymentId,
      this.estimatedPackageReadyTime,
      this.actualPackageReadyTime,
      this.estimatedArrivalAtPickupTime,
      this.actualArrivalAtPickupTime,
      this.estimatedArrivalAtDropoffTime,
      this.actualArrivalAtDropoffTime,
      this.actualDeliveredTime,
      required this.status,
      this.driverReviewByServiceProviderId,
      this.driverReviewByCustomerId,
      this.serviceProviderReviewBydriverId,
      this.customerReviewByDriverId,
      required this.customerId,
      required this.serviceProviderId,
      required this.serviceProviderType,
      this.tripPolyline,
      required this.deliveryCost,
      this.packageCost,
      this.currentGps,
      this.tripDistance,
      this.tripDuration,
      required this.orderTime,
      this.cancellationTime,
      this.deliveryDriver,
      required this.orderType,
      required this.direction,
      this.distanceFromBase,
      this.changePriceRequest});
  Map<String, dynamic> toFirebaseFormattedJson() {
    return <String, dynamic>{
      "deliveryId": deliveryId,
      "pickupLocation": pickupLocation,
      "pickupLocationText": pickupLocationText,
      "dropoffLocation": dropoffLocation,
      "deliveryDriverId": deliveryDriverId,
      "chatWithServiceProviderId": chatWithServiceProviderId,
      "packageReady": packageReady,
      "chatWithCustomerId": chatWithCustomerId,
      "paymentType": paymentType,
      "stripePaymentId": stripePaymentId,
      "estimatedPackageReadyTime": estimatedPackageReadyTime,
      "actualPackageReadyTime": actualPackageReadyTime,
      "estimatedArrivalAtPickupTime": estimatedArrivalAtPickupTime,
      "actualArrivalAtPickupTime": actualArrivalAtPickupTime,
      "estimatedArrivalAtDropoffTime": estimatedArrivalAtDropoffTime,
      "actualArrivalAtDropoffTime": actualArrivalAtDropoffTime,
      "actualDeliveredTime": actualDeliveredTime,
      "status": status,
      "driverReviewByServiceProviderId": driverReviewByServiceProviderId,
      "driverReviewByCustomerId": driverReviewByCustomerId,
      "serviceProviderReviewBydriverId": serviceProviderReviewBydriverId,
      "customerReviewByDriverId": customerReviewByDriverId,
      "customerId": customerId,
      "serviceProviderId": serviceProviderId,
      "serviceProviderType": serviceProviderType,
      "tripPolyline": tripPolyline,
      "deliveryCost": deliveryCost,
      "packageCost": packageCost,
      "currentGps": currentGps,
      "tripDistance": tripDistance,
      "tripDuration": tripDuration,
      "orderTime": orderTime,
      "cancellationTime": cancellationTime,
      "deliveryDriver": deliveryDriver,
      "orderType": orderType,
      "direction": direction,
      "distanceFromBase": distanceFromBase,
      "changePriceRequest": changePriceRequest,
    };
  }
}

enum DeliveryDirection { FromCustomer, ToCustomer }

extension ParseDeliveryDirectionToString on DeliveryDirection {
  String toFirebaseFormatString() {
    String str = toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}

extension ParseStringToDeliveryDirection on String {
  DeliveryDirection toDeliveryDirection() {
    return DeliveryDirection.values.firstWhere(
        (DeliveryDirection deliveryDirection) =>
            deliveryDirection.toFirebaseFormatString().toLowerCase() ==
            toLowerCase());
  }
}

class DeliveryDriver {
  num id;
  num userId;
  DeliveryServiceProviderType? deliveryCompanyType;
  num? deliveryCompanyId;
  AuthorizationStatus status;
  String? appVersion;
  Location? currentLocation;
  UserInfo? user;
  bool? online;
  NotificationInfo? notificationInfo;
  DeliveryDriver(
      {required this.id,
      required this.userId,
      this.deliveryCompanyType,
      this.deliveryCompanyId,
      required this.status,
      this.appVersion,
      this.currentLocation,
      this.user,
      this.online,
      this.notificationInfo});
  Map<String, dynamic> toFirebaseFormattedJson() {
    return <String, dynamic>{
      "id": id,
      "userId": userId,
      "deliveryCompanyType": deliveryCompanyType,
      "deliveryCompanyId": deliveryCompanyId,
      "status": status,
      "appVersion": appVersion,
      "currentLocation": currentLocation,
      "user": user,
      "online": online,
      "notificationInfo": notificationInfo,
    };
  }
}

class DeliveryChangePriceRequest {
  ChangePriceStatus status;
  num newPrice;
  num oldPrice;
  String reason;
  DeliveryChangePriceRequest(
      {required this.status,
      required this.newPrice,
      required this.oldPrice,
      required this.reason});
  Map<String, dynamic> toFirebaseFormattedJson() {
    return <String, dynamic>{
      "status": status,
      "newPrice": newPrice,
      "oldPrice": oldPrice,
      "reason": reason,
    };
  }
}

enum ChangePriceStatus { Requested, Accepted, Rejected }

extension ParseChangePriceStatusToString on ChangePriceStatus {
  String toFirebaseFormatString() {
    String str = toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}

extension ParseStringToChangePriceStatus on String {
  ChangePriceStatus toChangePriceStatus() {
    return ChangePriceStatus.values.firstWhere(
        (ChangePriceStatus changePriceStatus) =>
            changePriceStatus.toFirebaseFormatString().toLowerCase() ==
            toLowerCase());
  }
}

class DeliveryAdmin {
  bool authorized;
  String versionNumber;
  NotificationInfo notificationInfo;
  DeliveryAdmin(
      {required this.authorized,
      required this.versionNumber,
      required this.notificationInfo});
  Map<String, dynamic> toFirebaseFormattedJson() {
    return <String, dynamic>{
      "authorized": authorized,
      "versionNumber": versionNumber,
      "notificationInfo": notificationInfo,
    };
  }
}

class Review {
  num rating;
  num fromEntityId;
  String fromEntityType;
  num toEntityId;
  String toEntityType;
  Review(
      {required this.rating,
      required this.fromEntityId,
      required this.fromEntityType,
      required this.toEntityId,
      required this.toEntityType});
  Map<String, dynamic> toFirebaseFormattedJson() {
    return <String, dynamic>{
      "rating": rating,
      "fromEntityId": fromEntityId,
      "fromEntityType": fromEntityType,
      "toEntityId": toEntityId,
      "toEntityType": toEntityType,
    };
  }
}

enum AppType {
  Customer,
  Restaurant,
  Delivery,
  DeliveryAdmin,
  MezAdmin,
  Business,
  Laundry
}

extension ParseAppTypeToString on AppType {
  String toFirebaseFormatString() {
    String str = toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}

extension ParseStringToAppType on String {
  AppType toAppType() {
    return AppType.values.firstWhere((AppType appType) =>
        appType.toFirebaseFormatString().toLowerCase() == toLowerCase());
  }
}

enum TokenType { DeviceNotificationToken }

extension ParseTokenTypeToString on TokenType {
  String toFirebaseFormatString() {
    String str = toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}

extension ParseStringToTokenType on String {
  TokenType toTokenType() {
    return TokenType.values.firstWhere((TokenType tokenType) =>
        tokenType.toFirebaseFormatString().toLowerCase() == toLowerCase());
  }
}

enum AuthorizationStatus {
  InReview,
  Authorized,
  Unauthorized,
  AwaitingApproval
}

extension ParseAuthorizationStatusToString on AuthorizationStatus {
  String toFirebaseFormatString() {
    String str = toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}

extension ParseStringToAuthorizationStatus on String {
  AuthorizationStatus toAuthorizationStatus() {
    return AuthorizationStatus.values.firstWhere(
        (AuthorizationStatus authorizationStatus) =>
            authorizationStatus.toFirebaseFormatString().toLowerCase() ==
            toLowerCase());
  }
}

class Order {
  num orderId;
  num spDetailsId;
  num customerId;
  PaymentType paymentType;
  num? refundAmount;
  num? reviewId;
  DeliveryType deliveryType;
  String? orderTime;
  String? firebaseId;
  CustomerAppType customerAppType;
  String? notes;
  num? tax;
  num deliveryCost;
  num? chatId;
  String? scheduledTime;
  OrderStripeInfo? stripeInfo;
  num? stripeFees;
  String? cancellationTime;
  num? discountValue;
  num? totalCost;
  num? itemsCost;
  Order(
      {required this.orderId,
      required this.spDetailsId,
      required this.customerId,
      required this.paymentType,
      this.refundAmount,
      this.reviewId,
      required this.deliveryType,
      this.orderTime,
      this.firebaseId,
      required this.customerAppType,
      this.notes,
      this.tax,
      required this.deliveryCost,
      this.chatId,
      this.scheduledTime,
      this.stripeInfo,
      this.stripeFees,
      this.cancellationTime,
      this.discountValue,
      this.totalCost,
      this.itemsCost});
  Map<String, dynamic> toFirebaseFormattedJson() {
    return <String, dynamic>{
      "orderId": orderId,
      "spDetailsId": spDetailsId,
      "customerId": customerId,
      "paymentType": paymentType,
      "refundAmount": refundAmount,
      "reviewId": reviewId,
      "deliveryType": deliveryType,
      "orderTime": orderTime,
      "firebaseId": firebaseId,
      "customerAppType": customerAppType,
      "notes": notes,
      "tax": tax,
      "deliveryCost": deliveryCost,
      "chatId": chatId,
      "scheduledTime": scheduledTime,
      "stripeInfo": stripeInfo,
      "stripeFees": stripeFees,
      "cancellationTime": cancellationTime,
      "discountValue": discountValue,
      "totalCost": totalCost,
      "itemsCost": itemsCost,
    };
  }
}

class UserInfo {
  num id;
  String? image;
  String firebaseId;
  String? name;
  Language language;
  String? email;
  String? phoneNumber;
  bool? deleted;
  UserInfo(
      {required this.id,
      this.image,
      required this.firebaseId,
      this.name,
      required this.language,
      this.email,
      this.phoneNumber,
      this.deleted});
  Map<String, dynamic> toFirebaseFormattedJson() {
    return <String, dynamic>{
      "id": id,
      "image": image,
      "firebaseId": firebaseId,
      "name": name,
      "language": language,
      "email": email,
      "phoneNumber": phoneNumber,
      "deleted": deleted,
    };
  }
}

class ServiceProvider {
  num id;
  num serviceProviderDetailsId;
  String name;
  String image;
  String? phoneNumber;
  String? firebaseId;
  Location location;
  Map<Language, String>? description;
  OpenStatus? openStatus;
  ServiceProviderStripeInfo? stripeInfo;
  Map<PaymentType, bool>? acceptedPayments;
  bool? approved;
  ServiceLink? links;
  String? creationTime;
  Map<Language, bool> language;
  dynamic? schedule;
  num? deliveryPartnerId;
  DeliveryDetails deliveryDetails;
  List<Operator>? operators;
  ServiceProviderType serviceProviderType;
  String? uniqueId;
  ServiceProvider(
      {required this.id,
      required this.serviceProviderDetailsId,
      required this.name,
      required this.image,
      this.phoneNumber,
      this.firebaseId,
      required this.location,
      this.description,
      this.openStatus,
      this.stripeInfo,
      this.acceptedPayments,
      this.approved,
      this.links,
      this.creationTime,
      required this.language,
      this.schedule,
      this.deliveryPartnerId,
      required this.deliveryDetails,
      this.operators,
      required this.serviceProviderType,
      this.uniqueId});
  Map<String, dynamic> toFirebaseFormattedJson() {
    return <String, dynamic>{
      "id": id,
      "serviceProviderDetailsId": serviceProviderDetailsId,
      "name": name,
      "image": image,
      "phoneNumber": phoneNumber,
      "firebaseId": firebaseId,
      "location": location,
      "description": description,
      "openStatus": openStatus,
      "stripeInfo": stripeInfo,
      "acceptedPayments": acceptedPayments,
      "approved": approved,
      "links": links,
      "creationTime": creationTime,
      "language": language,
      "schedule": schedule,
      "deliveryPartnerId": deliveryPartnerId,
      "deliveryDetails": deliveryDetails,
      "operators": operators,
      "serviceProviderType": serviceProviderType,
      "uniqueId": uniqueId,
    };
  }
}

class Operator {
  num id;
  num detailsId;
  num serviceProviderId;
  num userId;
  AuthorizationStatus status;
  bool online;
  bool? owner;
  String? appVersion;
  Location? currentGps;
  NotificationInfo? notificationInfo;
  UserInfo? user;
  Operator(
      {required this.id,
      required this.detailsId,
      required this.serviceProviderId,
      required this.userId,
      required this.status,
      required this.online,
      this.owner,
      this.appVersion,
      this.currentGps,
      this.notificationInfo,
      this.user});
  Map<String, dynamic> toFirebaseFormattedJson() {
    return <String, dynamic>{
      "id": id,
      "detailsId": detailsId,
      "serviceProviderId": serviceProviderId,
      "userId": userId,
      "status": status,
      "online": online,
      "owner": owner,
      "appVersion": appVersion,
      "currentGps": currentGps,
      "notificationInfo": notificationInfo,
      "user": user,
    };
  }
}

enum OpenStatus { Open, ClosedTemporarily, ClosedIndefinitely }

extension ParseOpenStatusToString on OpenStatus {
  String toFirebaseFormatString() {
    String str = toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}

extension ParseStringToOpenStatus on String {
  OpenStatus toOpenStatus() {
    return OpenStatus.values.firstWhere((OpenStatus openStatus) =>
        openStatus.toFirebaseFormatString().toLowerCase() == toLowerCase());
  }
}

class ServiceLink {
  num? id;
  num serviceProviderId;
  ServiceProviderType serviceProviderType;
  String? operatorDeepLink;
  String? operatorQrImageLink;
  String? driverDeepLink;
  String? driverQrImageLink;
  ServiceLink(
      {this.id,
      required this.serviceProviderId,
      required this.serviceProviderType,
      this.operatorDeepLink,
      this.operatorQrImageLink,
      this.driverDeepLink,
      this.driverQrImageLink});
  Map<String, dynamic> toFirebaseFormattedJson() {
    return <String, dynamic>{
      "id": id,
      "serviceProviderId": serviceProviderId,
      "serviceProviderType": serviceProviderType,
      "operatorDeepLink": operatorDeepLink,
      "operatorQrImageLink": operatorQrImageLink,
      "driverDeepLink": driverDeepLink,
      "driverQrImageLink": driverQrImageLink,
    };
  }
}

enum ServiceProviderType {
  Restaurant,
  Laundry,
  Business,
  DeliveryCompany,
  Customer,
  DeliveryDriver
}

extension ParseServiceProviderTypeToString on ServiceProviderType {
  String toFirebaseFormatString() {
    String str = toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}

extension ParseStringToServiceProviderType on String {
  ServiceProviderType toServiceProviderType() {
    return ServiceProviderType.values.firstWhere(
        (ServiceProviderType serviceProviderType) =>
            serviceProviderType.toFirebaseFormatString().toLowerCase() ==
            toLowerCase());
  }
}

class Business {
  BusinessProfile profile;
  ServiceProvider details;
  List<Rental>? rentals;
  List<Event>? events;
  List<Service>? services;
  List<Product>? products;
  Business(
      {required this.profile,
      required this.details,
      this.rentals,
      this.events,
      this.services,
      this.products});
  Map<String, dynamic> toFirebaseFormattedJson() {
    return <String, dynamic>{
      "profile": profile,
      "details": details,
      "rentals": rentals,
      "events": events,
      "services": services,
      "products": products,
    };
  }
}

class BusinessItemDetails {
  num id;
  Map<Language, String> name;
  Map<Language, String>? description;
  num? position;
  num businessId;
  bool available;
  List<String>? image;
  Map<TimeUnit, num> cost;
  Map<String, dynamic>? additionalParameters;
  List<String>? tags;
  BusinessItemDetails(
      {required this.id,
      required this.name,
      this.description,
      this.position,
      required this.businessId,
      required this.available,
      this.image,
      required this.cost,
      this.additionalParameters,
      this.tags});
  Map<String, dynamic> toFirebaseFormattedJson() {
    return <String, dynamic>{
      "id": id,
      "name": name,
      "description": description,
      "position": position,
      "businessId": businessId,
      "available": available,
      "image": image,
      "cost": cost,
      "additionalParameters": additionalParameters,
      "tags": tags,
    };
  }

  String? get firstImage => (image?.isNotEmpty == true) ? image!.first : null;
}

enum TimeUnit { PerHour, PerDay, PerWeek, PerMonth, PerPerson, Total }

extension ParseTimeUnitToString on TimeUnit {
  String toFirebaseFormatString() {
    String str = toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}

extension ParseStringToTimeUnit on String {
  TimeUnit toTimeUnit() {
    return TimeUnit.values.firstWhere((TimeUnit timeUnit) =>
        timeUnit.toFirebaseFormatString().toLowerCase() == toLowerCase());
  }
}

class Rental {
  RentalCategory1 category1;
  RentalCategory2? category2;
  String? category3;
  BusinessItemDetails details;
  num? bedrooms;
  num? bathrooms;
  Location? gpsLocation;
  String? homeType;
  Rental(
      {required this.category1,
      this.category2,
      this.category3,
      required this.details,
      this.bedrooms,
      this.bathrooms,
      this.gpsLocation,
      this.homeType});
  Map<String, dynamic> toFirebaseFormattedJson() {
    return <String, dynamic>{
      "category1": category1,
      "category2": category2,
      "category3": category3,
      "details": details,
      "bedrooms": bedrooms,
      "bathrooms": bathrooms,
      "gpsLocation": gpsLocation,
      "homeType": homeType,
    };
  }
}

class Event {
  EventCategory1 category1;
  ScheduleType scheduleType;
  dynamic? schedule;
  BusinessItemDetails details;
  Location? gpsLocation;
  String? time;
  Event(
      {required this.category1,
      required this.scheduleType,
      this.schedule,
      required this.details,
      this.gpsLocation,
      this.time});
  Map<String, dynamic> toFirebaseFormattedJson() {
    return <String, dynamic>{
      "category1": category1,
      "scheduleType": scheduleType,
      "schedule": schedule,
      "details": details,
      "gpsLocation": gpsLocation,
      "time": time,
    };
  }
}

class Service {
  String category1;
  BusinessItemDetails details;
  Service({required this.category1, required this.details});
  Map<String, dynamic> toFirebaseFormattedJson() {
    return <String, dynamic>{
      "category1": category1,
      "details": details,
    };
  }
}

class Product {
  String category1;
  BusinessItemDetails details;
  Product({required this.category1, required this.details});
  Map<String, dynamic> toFirebaseFormattedJson() {
    return <String, dynamic>{
      "category1": category1,
      "details": details,
    };
  }
}

enum RentalCategory1 { Surf, Vehicle, Home, Uncategorized }

extension ParseRentalCategory1ToString on RentalCategory1 {
  String toFirebaseFormatString() {
    String str = toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}

extension ParseStringToRentalCategory1 on String {
  RentalCategory1 toRentalCategory1() {
    return RentalCategory1.values.firstWhere(
        (RentalCategory1 rentalCategory1) =>
            rentalCategory1.toFirebaseFormatString().toLowerCase() ==
            toLowerCase());
  }
}

enum EventCategory1 {
  Yoga,
  Surf,
  MartialArt,
  Party,
  Dance,
  GetTogether,
  Therapy,
  Fitness,
  Social
}

extension ParseEventCategory1ToString on EventCategory1 {
  String toFirebaseFormatString() {
    String str = toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}

extension ParseStringToEventCategory1 on String {
  EventCategory1 toEventCategory1() {
    return EventCategory1.values.firstWhere((EventCategory1 eventCategory1) =>
        eventCategory1.toFirebaseFormatString().toLowerCase() == toLowerCase());
  }
}

enum ServiceType { Rental, Class, Event }

extension ParseServiceTypeToString on ServiceType {
  String toFirebaseFormatString() {
    String str = toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}

extension ParseStringToServiceType on String {
  ServiceType toServiceType() {
    return ServiceType.values.firstWhere((ServiceType serviceType) =>
        serviceType.toFirebaseFormatString().toLowerCase() == toLowerCase());
  }
}

enum ScheduleType { Scheduled, OnDemand, OneTime }

extension ParseScheduleTypeToString on ScheduleType {
  String toFirebaseFormatString() {
    String str = toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}

extension ParseStringToScheduleType on String {
  ScheduleType toScheduleType() {
    return ScheduleType.values.firstWhere((ScheduleType scheduleType) =>
        scheduleType.toFirebaseFormatString().toLowerCase() == toLowerCase());
  }
}

enum RentalCategory2 { Motorcycle, Car, Uncategorized }

extension ParseRentalCategory2ToString on RentalCategory2 {
  String toFirebaseFormatString() {
    String str = toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}

extension ParseStringToRentalCategory2 on String {
  RentalCategory2 toRentalCategory2() {
    return RentalCategory2.values.firstWhere(
        (RentalCategory2 rentalCategory2) =>
            rentalCategory2.toFirebaseFormatString().toLowerCase() ==
            toLowerCase());
  }
}

class BusinessOrder {
  num businessId;
  BusinessOrderRequestStatus status;
  Business? business;
  List<BusinessOrderRequestItem> items;
  num estimatedCost;
  num? finalCost;
  String? commenceTime;
  Order orderDetails;
  BusinessOrder(
      {required this.businessId,
      required this.status,
      this.business,
      required this.items,
      required this.estimatedCost,
      this.finalCost,
      this.commenceTime,
      required this.orderDetails});
  Map<String, dynamic> toFirebaseFormattedJson() {
    return <String, dynamic>{
      "businessId": businessId,
      "status": status,
      "business": business,
      "items": items,
      "estimatedCost": estimatedCost,
      "finalCost": finalCost,
      "commenceTime": commenceTime,
      "orderDetails": orderDetails,
    };
  }
}

class BusinessOrderRequestItem {
  num serviceId;
  ServiceType serviceType;
  num id;
  bool? available;
  BusinessItemDetails? service;
  BusinessItemCost cost;
  BusinessOrderRequestItem(
      {required this.serviceId,
      required this.serviceType,
      required this.id,
      this.available,
      this.service,
      required this.cost});
  Map<String, dynamic> toFirebaseFormattedJson() {
    return <String, dynamic>{
      "serviceId": serviceId,
      "serviceType": serviceType,
      "id": id,
      "available": available,
      "service": service,
      "cost": cost,
    };
  }
}

class BusinessItemCost {
  num estimatedCostPerOne;
  num? finalCostPerOne;
  TimeUnit? timeUnit;
  String fromTime;
  String toTime;
  num quantity;
  BusinessItemCost(
      {required this.estimatedCostPerOne,
      this.finalCostPerOne,
      this.timeUnit,
      required this.fromTime,
      required this.toTime,
      required this.quantity});
  Map<String, dynamic> toFirebaseFormattedJson() {
    return <String, dynamic>{
      "estimatedCostPerOne": estimatedCostPerOne,
      "finalCostPerOne": finalCostPerOne,
      "timeUnit": timeUnit,
      "fromTime": fromTime,
      "toTime": toTime,
      "quantity": quantity,
    };
  }
}

enum BusinessOrderRequestStatus {
  RequestReceived,
  ApprovedByBusiness,
  CancelledByBusiness,
  ConfirmedByCustomer,
  CancelledByCustomer,
  InProgress,
  Completed
}

extension ParseBusinessOrderRequestStatusToString
    on BusinessOrderRequestStatus {
  String toFirebaseFormatString() {
    String str = toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}

extension ParseStringToBusinessOrderRequestStatus on String {
  BusinessOrderRequestStatus toBusinessOrderRequestStatus() {
    return BusinessOrderRequestStatus.values.firstWhere(
        (BusinessOrderRequestStatus businessOrderRequestStatus) =>
            businessOrderRequestStatus.toFirebaseFormatString().toLowerCase() ==
            toLowerCase());
  }
}

class BusinessCart {
  num customerId;
  num businessId;
  num cost;
  List<BusinessCartItem> items;
  num? discountValue;
  BusinessCart(
      {required this.customerId,
      required this.businessId,
      required this.cost,
      required this.items,
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
  num cartItemId;
  num serviceId;
  ServiceType serviceType;
  num customerId;
  BusinessItemCost cost;
  Map<Language, String>? name;
  String? image;
  BusinessCartItem(
      {required this.cartItemId,
      required this.serviceId,
      required this.serviceType,
      required this.customerId,
      required this.cost,
      this.name,
      this.image});
  Map<String, dynamic> toFirebaseFormattedJson() {
    return <String, dynamic>{
      "cartItemId": cartItemId,
      "serviceId": serviceId,
      "serviceType": serviceType,
      "customerId": customerId,
      "cost": cost,
      "name": name,
      "image": image,
    };
  }
}

class CourierOrder {
  num id;
  Location? fromLocationGps;
  String? fromLocationText;
  Location toLocation;
  DeliveryOrder deliveryOrder;
  List<CourierItem> items;
  num customerId;
  String orderTime;
  OrderStripeInfo? stripeInfo;
  PaymentType paymentType;
  num? tax;
  num? stripeFees;
  num? discountValue;
  CourierOrder(
      {required this.id,
      this.fromLocationGps,
      this.fromLocationText,
      required this.toLocation,
      required this.deliveryOrder,
      required this.items,
      required this.customerId,
      required this.orderTime,
      this.stripeInfo,
      required this.paymentType,
      this.tax,
      this.stripeFees,
      this.discountValue});
  Map<String, dynamic> toFirebaseFormattedJson() {
    return <String, dynamic>{
      "id": id,
      "fromLocationGps": fromLocationGps,
      "fromLocationText": fromLocationText,
      "toLocation": toLocation,
      "deliveryOrder": deliveryOrder,
      "items": items,
      "customerId": customerId,
      "orderTime": orderTime,
      "stripeInfo": stripeInfo,
      "paymentType": paymentType,
      "tax": tax,
      "stripeFees": stripeFees,
      "discountValue": discountValue,
    };
  }
}

class LaundryCategory {
  num categoryid;
  Map<Language, String>? name;
  num storeId;
  num costByKilo;
  num position;
  LaundryCategory(
      {required this.categoryid,
      this.name,
      required this.storeId,
      required this.costByKilo,
      required this.position});
  Map<String, dynamic> toFirebaseFormattedJson() {
    return <String, dynamic>{
      "categoryid": categoryid,
      "name": name,
      "storeId": storeId,
      "costByKilo": costByKilo,
      "position": position,
    };
  }
}

class LaundryOrder {
  num storeId;
  Location customerLocation;
  String? estimatedReadyTime;
  String? actualReadyTime;
  num? fromCustomerDeliveryId;
  num? toCustomerDeliveryId;
  LaundryOrderStatus status;
  List<OrderCategory>? categories;
  ServiceProvider? laundryStore;
  num orderId;
  num spDetailsId;
  num customerId;
  PaymentType paymentType;
  num? refundAmount;
  num? reviewId;
  DeliveryType deliveryType;
  String? orderTime;
  String? firebaseId;
  CustomerAppType customerAppType;
  String? notes;
  num? tax;
  num deliveryCost;
  num? chatId;
  String? scheduledTime;
  OrderStripeInfo? stripeInfo;
  num? stripeFees;
  String? cancellationTime;
  num? discountValue;
  num? totalCost;
  num? itemsCost;
  LaundryOrder(
      {required this.storeId,
      required this.customerLocation,
      this.estimatedReadyTime,
      this.actualReadyTime,
      this.fromCustomerDeliveryId,
      this.toCustomerDeliveryId,
      required this.status,
      this.categories,
      this.laundryStore,
      required this.orderId,
      required this.spDetailsId,
      required this.customerId,
      required this.paymentType,
      this.refundAmount,
      this.reviewId,
      required this.deliveryType,
      this.orderTime,
      this.firebaseId,
      required this.customerAppType,
      this.notes,
      this.tax,
      required this.deliveryCost,
      this.chatId,
      this.scheduledTime,
      this.stripeInfo,
      this.stripeFees,
      this.cancellationTime,
      this.discountValue,
      this.totalCost,
      this.itemsCost});
  Map<String, dynamic> toFirebaseFormattedJson() {
    return <String, dynamic>{
      "storeId": storeId,
      "customerLocation": customerLocation,
      "estimatedReadyTime": estimatedReadyTime,
      "actualReadyTime": actualReadyTime,
      "fromCustomerDeliveryId": fromCustomerDeliveryId,
      "toCustomerDeliveryId": toCustomerDeliveryId,
      "status": status,
      "categories": categories,
      "laundryStore": laundryStore,
      "orderId": orderId,
      "spDetailsId": spDetailsId,
      "customerId": customerId,
      "paymentType": paymentType,
      "refundAmount": refundAmount,
      "reviewId": reviewId,
      "deliveryType": deliveryType,
      "orderTime": orderTime,
      "firebaseId": firebaseId,
      "customerAppType": customerAppType,
      "notes": notes,
      "tax": tax,
      "deliveryCost": deliveryCost,
      "chatId": chatId,
      "scheduledTime": scheduledTime,
      "stripeInfo": stripeInfo,
      "stripeFees": stripeFees,
      "cancellationTime": cancellationTime,
      "discountValue": discountValue,
      "totalCost": totalCost,
      "itemsCost": itemsCost,
    };
  }
}

class OrderCategory {
  num? orderCategoryId;
  num categoryId;
  num? orderId;
  num? weightInKilo;
  num? costByKilo;
  OrderCategory(
      {this.orderCategoryId,
      required this.categoryId,
      this.orderId,
      this.weightInKilo,
      this.costByKilo});
  Map<String, dynamic> toFirebaseFormattedJson() {
    return <String, dynamic>{
      "orderCategoryId": orderCategoryId,
      "categoryId": categoryId,
      "orderId": orderId,
      "weightInKilo": weightInKilo,
      "costByKilo": costByKilo,
    };
  }
}

class CostsByType {
  dynamic byType;
  num weighedCost;
  CostsByType({required this.byType, required this.weighedCost});
  Map<String, dynamic> toFirebaseFormattedJson() {
    return <String, dynamic>{
      "byType": byType,
      "weighedCost": weighedCost,
    };
  }
}

enum LaundryOrderStatus {
  OrderReceived,
  OtwPickupFromCustomer,
  PickedUpFromCustomer,
  AtLaundry,
  ReadyForDelivery,
  OtwPickupFromLaundry,
  PickedUpFromLaundry,
  Delivered,
  CancelledByAdmin,
  CancelledByCustomer
}

extension ParseLaundryOrderStatusToString on LaundryOrderStatus {
  String toFirebaseFormatString() {
    String str = toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}

extension ParseStringToLaundryOrderStatus on String {
  LaundryOrderStatus toLaundryOrderStatus() {
    return LaundryOrderStatus.values.firstWhere(
        (LaundryOrderStatus laundryOrderStatus) =>
            laundryOrderStatus.toFirebaseFormatString().toLowerCase() ==
            toLowerCase());
  }
}

class Cart {
  num customerId;
  num? restaurantId;
  num cost;
  List<CartItem> items;
  Cart(
      {required this.customerId,
      this.restaurantId,
      required this.cost,
      required this.items});
  Map<String, dynamic> toFirebaseFormattedJson() {
    return <String, dynamic>{
      "customerId": customerId,
      "restaurantId": restaurantId,
      "cost": cost,
      "items": items,
    };
  }
}

class CartItem {
  num? cartItemId;
  num itemId;
  num customerId;
  List<SelectedOption>? selectedOptions;
  num quantity;
  num costPerOne;
  String? notes;
  Map<Language, String> name;
  String? image;
  CartItem(
      {this.cartItemId,
      required this.itemId,
      required this.customerId,
      this.selectedOptions,
      required this.quantity,
      required this.costPerOne,
      this.notes,
      required this.name,
      this.image});
  Map<String, dynamic> toFirebaseFormattedJson() {
    return <String, dynamic>{
      "cartItemId": cartItemId,
      "itemId": itemId,
      "customerId": customerId,
      "selectedOptions": selectedOptions,
      "quantity": quantity,
      "costPerOne": costPerOne,
      "notes": notes,
      "name": name,
      "image": image,
    };
  }
}

enum ItemType { Daily, Special }

extension ParseItemTypeToString on ItemType {
  String toFirebaseFormatString() {
    String str = toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}

extension ParseStringToItemType on String {
  ItemType toItemType() {
    return ItemType.values.firstWhere((ItemType itemType) =>
        itemType.toFirebaseFormatString().toLowerCase() == toLowerCase());
  }
}

class Item {
  num itemId;
  Map<Language, String> name;
  Map<Language, String>? description;
  num position;
  num? categoryId;
  bool available;
  ItemType itemType;
  num restaurantId;
  String? specialPeriodStart;
  String? specialPeriodEnd;
  bool archived;
  num cost;
  List<Option>? options;
  Item(
      {required this.itemId,
      required this.name,
      this.description,
      required this.position,
      this.categoryId,
      required this.available,
      required this.itemType,
      required this.restaurantId,
      this.specialPeriodStart,
      this.specialPeriodEnd,
      required this.archived,
      required this.cost,
      this.options});
  Map<String, dynamic> toFirebaseFormattedJson() {
    return <String, dynamic>{
      "itemId": itemId,
      "name": name,
      "description": description,
      "position": position,
      "categoryId": categoryId,
      "available": available,
      "itemType": itemType,
      "restaurantId": restaurantId,
      "specialPeriodStart": specialPeriodStart,
      "specialPeriodEnd": specialPeriodEnd,
      "archived": archived,
      "cost": cost,
      "options": options,
    };
  }
}

class Option {
  num optionId;
  Map<Language, String> optionNames;
  List<Choice> choices;
  num position;
  String optionType;
  num minimumChoice;
  num maximumChoice;
  num freeChoice;
  num costPerExtra;
  Option(
      {required this.optionId,
      required this.optionNames,
      required this.choices,
      required this.position,
      required this.optionType,
      required this.minimumChoice,
      required this.maximumChoice,
      required this.freeChoice,
      required this.costPerExtra});
  Map<String, dynamic> toFirebaseFormattedJson() {
    return <String, dynamic>{
      "optionId": optionId,
      "optionNames": optionNames,
      "choices": choices,
      "position": position,
      "optionType": optionType,
      "minimumChoice": minimumChoice,
      "maximumChoice": maximumChoice,
      "freeChoice": freeChoice,
      "costPerExtra": costPerExtra,
    };
  }
}

class Choice {
  num choiceId;
  Map<Language, String> name;
  bool available;
  num cost;
  Choice(
      {required this.choiceId,
      required this.name,
      required this.available,
      required this.cost});
  Map<String, dynamic> toFirebaseFormattedJson() {
    return <String, dynamic>{
      "choiceId": choiceId,
      "name": name,
      "available": available,
      "cost": cost,
    };
  }
}

class RestaurantOrder {
  num restaurantId;
  Location toLocation;
  String? estimatedFoodReadyTime;
  String? actualFoodReadyTime;
  RestaurantOrderStatus status;
  List<OrderItem> items;
  ServiceProvider? restaurant;
  num? deliveryId;
  num orderId;
  num spDetailsId;
  num customerId;
  PaymentType paymentType;
  num? refundAmount;
  num? reviewId;
  DeliveryType deliveryType;
  String? orderTime;
  String? firebaseId;
  CustomerAppType customerAppType;
  String? notes;
  num? tax;
  num deliveryCost;
  num? chatId;
  String? scheduledTime;
  OrderStripeInfo? stripeInfo;
  num? stripeFees;
  String? cancellationTime;
  num? discountValue;
  num? totalCost;
  num? itemsCost;
  RestaurantOrder(
      {required this.restaurantId,
      required this.toLocation,
      this.estimatedFoodReadyTime,
      this.actualFoodReadyTime,
      required this.status,
      required this.items,
      this.restaurant,
      this.deliveryId,
      required this.orderId,
      required this.spDetailsId,
      required this.customerId,
      required this.paymentType,
      this.refundAmount,
      this.reviewId,
      required this.deliveryType,
      this.orderTime,
      this.firebaseId,
      required this.customerAppType,
      this.notes,
      this.tax,
      required this.deliveryCost,
      this.chatId,
      this.scheduledTime,
      this.stripeInfo,
      this.stripeFees,
      this.cancellationTime,
      this.discountValue,
      this.totalCost,
      this.itemsCost});
  Map<String, dynamic> toFirebaseFormattedJson() {
    return <String, dynamic>{
      "restaurantId": restaurantId,
      "toLocation": toLocation,
      "estimatedFoodReadyTime": estimatedFoodReadyTime,
      "actualFoodReadyTime": actualFoodReadyTime,
      "status": status,
      "items": items,
      "restaurant": restaurant,
      "deliveryId": deliveryId,
      "orderId": orderId,
      "spDetailsId": spDetailsId,
      "customerId": customerId,
      "paymentType": paymentType,
      "refundAmount": refundAmount,
      "reviewId": reviewId,
      "deliveryType": deliveryType,
      "orderTime": orderTime,
      "firebaseId": firebaseId,
      "customerAppType": customerAppType,
      "notes": notes,
      "tax": tax,
      "deliveryCost": deliveryCost,
      "chatId": chatId,
      "scheduledTime": scheduledTime,
      "stripeInfo": stripeInfo,
      "stripeFees": stripeFees,
      "cancellationTime": cancellationTime,
      "discountValue": discountValue,
      "totalCost": totalCost,
      "itemsCost": itemsCost,
    };
  }
}

class OrderItem {
  num? orderItemId;
  num itemId;
  dynamic name;
  String? image;
  List<SelectedOption>? selectedOptions;
  num? reviewId;
  String? notes;
  bool? unavailable;
  num quantity;
  num? orderId;
  num costPerOne;
  OrderItem(
      {this.orderItemId,
      required this.itemId,
      required this.name,
      this.image,
      this.selectedOptions,
      this.reviewId,
      this.notes,
      this.unavailable,
      required this.quantity,
      this.orderId,
      required this.costPerOne});
  Map<String, dynamic> toFirebaseFormattedJson() {
    return <String, dynamic>{
      "orderItemId": orderItemId,
      "itemId": itemId,
      "name": name,
      "image": image,
      "selectedOptions": selectedOptions,
      "reviewId": reviewId,
      "notes": notes,
      "unavailable": unavailable,
      "quantity": quantity,
      "orderId": orderId,
      "costPerOne": costPerOne,
    };
  }
}

class SelectedOption {
  num optionId;
  Map<Language, String> optionNames;
  Map<Language, List<String>> selectedChoices;
  SelectedOption(
      {required this.optionId,
      required this.optionNames,
      required this.selectedChoices});
  Map<String, dynamic> toFirebaseFormattedJson() {
    return <String, dynamic>{
      "optionId": optionId,
      "optionNames": optionNames,
      "selectedChoices": selectedChoices,
    };
  }
}

enum RestaurantOrderStatus {
  OrderReceived,
  PreparingOrder,
  ReadyForPickup,
  OnTheWay,
  Delivered,
  CancelledByAdmin,
  CancelledByCustomer
}

extension ParseRestaurantOrderStatusToString on RestaurantOrderStatus {
  String toFirebaseFormatString() {
    String str = toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}

extension ParseStringToRestaurantOrderStatus on String {
  RestaurantOrderStatus toRestaurantOrderStatus() {
    return RestaurantOrderStatus.values.firstWhere(
        (RestaurantOrderStatus restaurantOrderStatus) =>
            restaurantOrderStatus.toFirebaseFormatString().toLowerCase() ==
            toLowerCase());
  }
}

enum SendOtpError {
  UnhandledError,
  UserNotFound,
  OTPAskedTooSoon,
  SMSSendError
}

extension ParseSendOtpErrorToString on SendOtpError {
  String toFirebaseFormatString() {
    String str = toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}

extension ParseStringToSendOtpError on String {
  SendOtpError toSendOtpError() {
    return SendOtpError.values.firstWhere((SendOtpError sendOtpError) =>
        sendOtpError.toFirebaseFormatString().toLowerCase() == toLowerCase());
  }
}

enum AuthOtpError { UnhandledError, InvalidOTPCode, ExceededNumberOfTries }

extension ParseAuthOtpErrorToString on AuthOtpError {
  String toFirebaseFormatString() {
    String str = toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}

extension ParseStringToAuthOtpError on String {
  AuthOtpError toAuthOtpError() {
    return AuthOtpError.values.firstWhere((AuthOtpError authOtpError) =>
        authOtpError.toFirebaseFormatString().toLowerCase() == toLowerCase());
  }
}

enum PaymentIntentError {
  UnhandledError,
  ServiceProviderDetailsNotFound,
  CardNotAccepted,
  StripeNotWorking,
  CustomerNotFound,
  NoCustomerStripeInfo,
  CustomerUpdateError
}

extension ParsePaymentIntentErrorToString on PaymentIntentError {
  String toFirebaseFormatString() {
    String str = toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}

extension ParseStringToPaymentIntentError on String {
  PaymentIntentError toPaymentIntentError() {
    return PaymentIntentError.values.firstWhere(
        (PaymentIntentError paymentIntentError) =>
            paymentIntentError.toFirebaseFormatString().toLowerCase() ==
            toLowerCase());
  }
}

enum AddCardError {
  UnhandledError,
  CustomerNotFound,
  NoCustomerStripeInfo,
  CustomerUpdateError
}

extension ParseAddCardErrorToString on AddCardError {
  String toFirebaseFormatString() {
    String str = toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}

extension ParseStringToAddCardError on String {
  AddCardError toAddCardError() {
    return AddCardError.values.firstWhere((AddCardError addCardError) =>
        addCardError.toFirebaseFormatString().toLowerCase() == toLowerCase());
  }
}

enum ChargeCardError {
  UnhandledError,
  ServiceProviderDetailsNotFound,
  CardNotAccepted,
  StripeNotWorking,
  CustomerNotFound,
  NoCustomerStripeInfo,
  CustomerUpdateError,
  CardNotFound
}

extension ParseChargeCardErrorToString on ChargeCardError {
  String toFirebaseFormatString() {
    String str = toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}

extension ParseStringToChargeCardError on String {
  ChargeCardError toChargeCardError() {
    return ChargeCardError.values.firstWhere(
        (ChargeCardError chargeCardError) =>
            chargeCardError.toFirebaseFormatString().toLowerCase() ==
            toLowerCase());
  }
}

enum RemoveCardError {
  UnhandledError,
  OrdersInProcess,
  CustomerNotFound,
  NoCustomerStripeInfo,
  CardNotFound,
  ServiceProviderDetailsNotFound,
  CustomerUpdateError
}

extension ParseRemoveCardErrorToString on RemoveCardError {
  String toFirebaseFormatString() {
    String str = toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}

extension ParseStringToRemoveCardError on String {
  RemoveCardError toRemoveCardError() {
    return RemoveCardError.values.firstWhere(
        (RemoveCardError removeCardError) =>
            removeCardError.toFirebaseFormatString().toLowerCase() ==
            toLowerCase());
  }
}

enum SetupStripeError {
  UnhandledError,
  ServiceProviderDetailsNotFound,
  UnauthorizedAccess,
  OperatorNotAuthorized,
  StripeUpdateError
}

extension ParseSetupStripeErrorToString on SetupStripeError {
  String toFirebaseFormatString() {
    String str = toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}

extension ParseStringToSetupStripeError on String {
  SetupStripeError toSetupStripeError() {
    return SetupStripeError.values.firstWhere(
        (SetupStripeError setupStripeError) =>
            setupStripeError.toFirebaseFormatString().toLowerCase() ==
            toLowerCase());
  }
}

enum UpdateStripeError {
  UnhandledError,
  ServiceProviderDetailsNotFound,
  UnauthorizedAccess,
  OperatorNotAuthorized,
  NoStripeAccount
}

extension ParseUpdateStripeErrorToString on UpdateStripeError {
  String toFirebaseFormatString() {
    String str = toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}

extension ParseStringToUpdateStripeError on String {
  UpdateStripeError toUpdateStripeError() {
    return UpdateStripeError.values.firstWhere(
        (UpdateStripeError updateStripeError) =>
            updateStripeError.toFirebaseFormatString().toLowerCase() ==
            toLowerCase());
  }
}

enum CallUserError {
  UnhandledError,
  ChatNotFound,
  RecipientNotAvailable,
  CallerNotInParticipants
}

extension ParseCallUserErrorToString on CallUserError {
  String toFirebaseFormatString() {
    String str = toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}

extension ParseStringToCallUserError on String {
  CallUserError toCallUserError() {
    return CallUserError.values.firstWhere((CallUserError callUserError) =>
        callUserError.toFirebaseFormatString().toLowerCase() == toLowerCase());
  }
}

enum AddOperatorError {
  UnhandledError,
  UserNotFound,
  ServiceProviderDetailsNotFound,
  UserAlreadyAnOperator,
  OperatorCreationError,
  RestaurantNotfound,
  DeliveryCompanyOperatorsNotFound,
  LaundryStoreNotfound
}

extension ParseAddOperatorErrorToString on AddOperatorError {
  String toFirebaseFormatString() {
    String str = toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}

extension ParseStringToAddOperatorError on String {
  AddOperatorError toAddOperatorError() {
    return AddOperatorError.values.firstWhere(
        (AddOperatorError addOperatorError) =>
            addOperatorError.toFirebaseFormatString().toLowerCase() ==
            toLowerCase());
  }
}

enum AuthOperatorError {
  UnhandledError,
  OperatorNotFound,
  UnauthorizedAccess,
  IncorrectOperatorId,
  OperatorDetailsNotFound
}

extension ParseAuthOperatorErrorToString on AuthOperatorError {
  String toFirebaseFormatString() {
    String str = toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}

extension ParseStringToAuthOperatorError on String {
  AuthOperatorError toAuthOperatorError() {
    return AuthOperatorError.values.firstWhere(
        (AuthOperatorError authOperatorError) =>
            authOperatorError.toFirebaseFormatString().toLowerCase() ==
            toLowerCase());
  }
}

enum AddDriverError {
  UnhandledError,
  DriverAlreadyExists,
  DriverCreationError,
  InvalidServiceProviderType
}

extension ParseAddDriverErrorToString on AddDriverError {
  String toFirebaseFormatString() {
    String str = toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}

extension ParseStringToAddDriverError on String {
  AddDriverError toAddDriverError() {
    return AddDriverError.values.firstWhere((AddDriverError addDriverError) =>
        addDriverError.toFirebaseFormatString().toLowerCase() == toLowerCase());
  }
}

enum AuthorizeDriverError {
  UnhandledError,
  DriverNotFound,
  OperatorNotFound,
  UnauthorizedAccess
}

extension ParseAuthorizeDriverErrorToString on AuthorizeDriverError {
  String toFirebaseFormatString() {
    String str = toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}

extension ParseStringToAuthorizeDriverError on String {
  AuthorizeDriverError toAuthorizeDriverError() {
    return AuthorizeDriverError.values.firstWhere(
        (AuthorizeDriverError authorizeDriverError) =>
            authorizeDriverError.toFirebaseFormatString().toLowerCase() ==
            toLowerCase());
  }
}

enum RestaurantError {
  UnhandledError,
  DeliveryDetailsNotSet,
  NoDeliveryPartner,
  UserNotFound,
  DeepLinkError,
  QRGenerationError,
  RestaurantCreationError
}

extension ParseRestaurantErrorToString on RestaurantError {
  String toFirebaseFormatString() {
    String str = toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}

extension ParseStringToRestaurantError on String {
  RestaurantError toRestaurantError() {
    return RestaurantError.values.firstWhere(
        (RestaurantError restaurantError) =>
            restaurantError.toFirebaseFormatString().toLowerCase() ==
            toLowerCase());
  }
}

enum CheckoutResponseError {
  UnhandledError,
  RestaurantClosed,
  CartEmpty,
  RestaurantNotApproved,
  NoDeliveryPartner,
  NotAcceptingDeliveryOrders,
  RestaurantNotFound,
  CartNotFound,
  CustomerNotFound,
  RestaurantIdMismatch,
  OrderCreationError,
  DeliveryCompanyOperatorsNotFound,
  ServiceProviderDetailsNotFound,
  NoStripeAccountOfServiceProvider,
  UpdateOrderStripeError
}

extension ParseCheckoutResponseErrorToString on CheckoutResponseError {
  String toFirebaseFormatString() {
    String str = toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}

extension ParseStringToCheckoutResponseError on String {
  CheckoutResponseError toCheckoutResponseError() {
    return CheckoutResponseError.values.firstWhere(
        (CheckoutResponseError checkoutResponseError) =>
            checkoutResponseError.toFirebaseFormatString().toLowerCase() ==
            toLowerCase());
  }
}

enum ChangeRestaurantStatusError {
  UnhandledError,
  OrderNotFound,
  UnauthorizedAccess,
  IncorrectOrderId,
  CustomerNotFound,
  OrderNotInProcess,
  InvalidStatus,
  ServiceProviderDetailsNotFound,
  OrderStripeInfoNotDefined,
  ServiceProviderStripeAccountDoesNotExist,
  UpdateOrderStripeError
}

extension ParseChangeRestaurantStatusErrorToString
    on ChangeRestaurantStatusError {
  String toFirebaseFormatString() {
    String str = toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}

extension ParseStringToChangeRestaurantStatusError on String {
  ChangeRestaurantStatusError toChangeRestaurantStatusError() {
    return ChangeRestaurantStatusError.values.firstWhere(
        (ChangeRestaurantStatusError changeRestaurantStatusError) =>
            changeRestaurantStatusError
                .toFirebaseFormatString()
                .toLowerCase() ==
            toLowerCase());
  }
}

enum CancelOrderError {
  UnhandledError,
  OrderNotFound,
  RestaurantNotfound,
  IncorrectOrderId,
  OrderNotInProcess,
  ServiceProviderDetailsNotFound,
  OrderStripeInfoNotDefined,
  ServiceProviderStripeAccountDoesNotExist,
  UpdateOrderStripeError
}

extension ParseCancelOrderErrorToString on CancelOrderError {
  String toFirebaseFormatString() {
    String str = toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}

extension ParseStringToCancelOrderError on String {
  CancelOrderError toCancelOrderError() {
    return CancelOrderError.values.firstWhere(
        (CancelOrderError cancelOrderError) =>
            cancelOrderError.toFirebaseFormatString().toLowerCase() ==
            toLowerCase());
  }
}

enum BusinessError { UnhandledError, UserNotFound, BusinessCreationError }

extension ParseBusinessErrorToString on BusinessError {
  String toFirebaseFormatString() {
    String str = toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}

extension ParseStringToBusinessError on String {
  BusinessError toBusinessError() {
    return BusinessError.values.firstWhere((BusinessError businessError) =>
        businessError.toFirebaseFormatString().toLowerCase() == toLowerCase());
  }
}

enum OrderReqError {
  UnhandledError,
  BusinessNotFound,
  CustomerNotFound,
  CartNotFound,
  BusinessNotApproved,
  BusinessClosed,
  EmptyCart,
  OrderCreationError
}

extension ParseOrderReqErrorToString on OrderReqError {
  String toFirebaseFormatString() {
    String str = toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}

extension ParseStringToOrderReqError on String {
  OrderReqError toOrderReqError() {
    return OrderReqError.values.firstWhere((OrderReqError orderReqError) =>
        orderReqError.toFirebaseFormatString().toLowerCase() == toLowerCase());
  }
}

enum HandleRequestError {
  UnhandledError,
  OrderRequestNotFound,
  CustomerNotFound,
  BusinessOperatorNotFound,
  IncorrectOrderRequestId,
  RequestAlreadyConfirmedOrCancelled,
  UpdateStatusError,
  FinalCostsNotSet
}

extension ParseHandleRequestErrorToString on HandleRequestError {
  String toFirebaseFormatString() {
    String str = toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}

extension ParseStringToHandleRequestError on String {
  HandleRequestError toHandleRequestError() {
    return HandleRequestError.values.firstWhere(
        (HandleRequestError handleRequestError) =>
            handleRequestError.toFirebaseFormatString().toLowerCase() ==
            toLowerCase());
  }
}

enum CustomerHandleRequestError {
  UnhandledError,
  OrderRequestNotFound,
  BusinessNotFound,
  IncorrectOrderRequestId,
  RequestAlreadyConfirmedOrCancelled,
  UpdateStatusError
}

extension ParseCustomerHandleRequestErrorToString
    on CustomerHandleRequestError {
  String toFirebaseFormatString() {
    String str = toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}

extension ParseStringToCustomerHandleRequestError on String {
  CustomerHandleRequestError toCustomerHandleRequestError() {
    return CustomerHandleRequestError.values.firstWhere(
        (CustomerHandleRequestError customerHandleRequestError) =>
            customerHandleRequestError.toFirebaseFormatString().toLowerCase() ==
            toLowerCase());
  }
}

enum LaundryError {
  UnhandledError,
  DeliveryDetailsNotSet,
  NoDeliveryPartner,
  UserNotFound,
  DeepLinkError,
  QRGenerationError,
  LaundryCreationError
}

extension ParseLaundryErrorToString on LaundryError {
  String toFirebaseFormatString() {
    String str = toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}

extension ParseStringToLaundryError on String {
  LaundryError toLaundryError() {
    return LaundryError.values.firstWhere((LaundryError laundryError) =>
        laundryError.toFirebaseFormatString().toLowerCase() == toLowerCase());
  }
}

enum ReqLaundryError {
  UnhandledError,
  LaundryStoreNotfound,
  CustomerNotFound,
  LaundryStoreNotApproved,
  StoreClosed,
  NoDeliveryPartner,
  DeliveryNotAvailable,
  OrderCreationError,
  NoChatId,
  DeliveryCompanyOperatorsNotFound,
  ServiceProviderDetailsNotFound,
  InvalidOrderType,
  NoStripeAccountOfServiceProvider,
  UpdateOrderStripeError
}

extension ParseReqLaundryErrorToString on ReqLaundryError {
  String toFirebaseFormatString() {
    String str = toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}

extension ParseStringToReqLaundryError on String {
  ReqLaundryError toReqLaundryError() {
    return ReqLaundryError.values.firstWhere(
        (ReqLaundryError reqLaundryError) =>
            reqLaundryError.toFirebaseFormatString().toLowerCase() ==
            toLowerCase());
  }
}

enum ChangeLaundryStatusError {
  UnhandledError,
  OrderNotFound,
  UnauthorizedAccess,
  IncorrectOrderId,
  CustomerNotFound,
  OrderNotInProcess,
  InvalidStatus,
  ServiceProviderDetailsNotFound,
  OrderStripeInfoNotDefined,
  ServiceProviderStripeAccountDoesNotExist,
  UpdateOrderStripeError
}

extension ParseChangeLaundryStatusErrorToString on ChangeLaundryStatusError {
  String toFirebaseFormatString() {
    String str = toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}

extension ParseStringToChangeLaundryStatusError on String {
  ChangeLaundryStatusError toChangeLaundryStatusError() {
    return ChangeLaundryStatusError.values.firstWhere(
        (ChangeLaundryStatusError changeLaundryStatusError) =>
            changeLaundryStatusError.toFirebaseFormatString().toLowerCase() ==
            toLowerCase());
  }
}

enum CancelLaundryError {
  UnhandledError,
  OrderNotFound,
  LaundryStoreNotfound,
  IncorrectOrderId,
  OrderNotInProcess,
  ServiceProviderDetailsNotFound,
  OrderStripeInfoNotDefined,
  ServiceProviderStripeAccountDoesNotExist,
  UpdateOrderStripeError,
  DeliveryCompanyOperatorsNotFound
}

extension ParseCancelLaundryErrorToString on CancelLaundryError {
  String toFirebaseFormatString() {
    String str = toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}

extension ParseStringToCancelLaundryError on String {
  CancelLaundryError toCancelLaundryError() {
    return CancelLaundryError.values.firstWhere(
        (CancelLaundryError cancelLaundryError) =>
            cancelLaundryError.toFirebaseFormatString().toLowerCase() ==
            toLowerCase());
  }
}

enum AssignDriverError {
  UnhandledError,
  OrderNotFound,
  DriverNotFound,
  OperatorNotFound,
  InvalidOperator,
  UnauthorizedDriver,
  ServiceProviderDeliveryChatNotFound,
  DriverAlreadyAssigned,
  DeliveryOrderNotFound
}

extension ParseAssignDriverErrorToString on AssignDriverError {
  String toFirebaseFormatString() {
    String str = toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}

extension ParseStringToAssignDriverError on String {
  AssignDriverError toAssignDriverError() {
    return AssignDriverError.values.firstWhere(
        (AssignDriverError assignDriverError) =>
            assignDriverError.toFirebaseFormatString().toLowerCase() ==
            toLowerCase());
  }
}

enum ChangeDeliveryStatusError {
  UnhandledError,
  OrderNotFound,
  DriverNotAssigned,
  OrderNotInProcess,
  UnauthorizedAccess,
  OrderDriverMismatch,
  CustomerNotFound,
  InvalidStatus,
  RestaurantNotfound,
  ServiceProviderDetailsNotFound,
  OrderStripeInfoNotDefined,
  ServiceProviderStripeAccountDoesNotExist,
  UpdateOrderStripeError,
  LaundryStoreNotfound,
  OrderCreationError,
  NoDeliveryChatWithStoreId,
  DeliveryCompanyOperatorsNotFound,
  CannotCancelByDriver
}

extension ParseChangeDeliveryStatusErrorToString on ChangeDeliveryStatusError {
  String toFirebaseFormatString() {
    String str = toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}

extension ParseStringToChangeDeliveryStatusError on String {
  ChangeDeliveryStatusError toChangeDeliveryStatusError() {
    return ChangeDeliveryStatusError.values.firstWhere(
        (ChangeDeliveryStatusError changeDeliveryStatusError) =>
            changeDeliveryStatusError.toFirebaseFormatString().toLowerCase() ==
            toLowerCase());
  }
}

enum CreateCourierError {
  UnhandledError,
  CustomerNotFound,
  OrderCreationError,
  DeliveryCompanyNotFound,
  DeliveryCompanyHasNoDrivers
}

extension ParseCreateCourierErrorToString on CreateCourierError {
  String toFirebaseFormatString() {
    String str = toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}

extension ParseStringToCreateCourierError on String {
  CreateCourierError toCreateCourierError() {
    return CreateCourierError.values.firstWhere(
        (CreateCourierError createCourierError) =>
            createCourierError.toFirebaseFormatString().toLowerCase() ==
            toLowerCase());
  }
}

enum ChangePriceError {
  UnhandledError,
  OrderNotFound,
  DriverIDOrderIDMismatch,
  StatusNotOrderReceived,
  PriceChangeAlreadyRequested,
  ChangePriceRequestNotSet,
  CustomerNotFound,
  RestaurantNotfound,
  LaundryStoreNotfound,
  IncorrectOrderId,
  DriverNotFound,
  UpdateOrderError
}

extension ParseChangePriceErrorToString on ChangePriceError {
  String toFirebaseFormatString() {
    String str = toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}

extension ParseStringToChangePriceError on String {
  ChangePriceError toChangePriceError() {
    return ChangePriceError.values.firstWhere(
        (ChangePriceError changePriceError) =>
            changePriceError.toFirebaseFormatString().toLowerCase() ==
            toLowerCase());
  }
}

enum CancelCourierError {
  UnhandledError,
  OrderNotFound,
  IncorrectOrderId,
  OrderNotInProcess
}

extension ParseCancelCourierErrorToString on CancelCourierError {
  String toFirebaseFormatString() {
    String str = toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}

extension ParseStringToCancelCourierError on String {
  CancelCourierError toCancelCourierError() {
    return CancelCourierError.values.firstWhere(
        (CancelCourierError cancelCourierError) =>
            cancelCourierError.toFirebaseFormatString().toLowerCase() ==
            toLowerCase());
  }
}
