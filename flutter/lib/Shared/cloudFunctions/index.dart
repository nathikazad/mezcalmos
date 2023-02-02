import 'package:cloud_functions/cloud_functions.dart';
import 'dart:convert';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServerResponse.dart';
class CloudFunctions {
  static Future<dynamic> callCloudFunction(
      {required String functionName, Map<String, dynamic>? parameters}) async {
    final Map<String, dynamic> finalParams = <String, dynamic>{
      'versionNumber': '0.0.0'
    };
    finalParams.addAll(parameters ?? <String, dynamic>{});
    final HttpsCallableResult<dynamic> response = await FirebaseFunctions.instance
        .httpsCallable(functionName)
        .call(finalParams);
    return response.data;
  }

  static Future<void> user_addHasuraClaim(
  ) async {
    return await callCloudFunction(
      functionName: "user-addHasuraClaim",
      parameters: <String, dynamic>{});
  }

  static Future<void> otp_sendOTPForLogin(
      {required String language,
      required String phoneNumber}  ) async {
    return await callCloudFunction(
      functionName: "otp-sendOTPForLogin",
      parameters: <String, dynamic>{
        "language":language,
        "phoneNumber":phoneNumber,
      });
  }

  static Future<AuthResponse> otp_getAuthUsingOTP(
      {required String phoneNumber,
      required String OTPCode}  ) async {
    return AuthResponse.fromFirebaseFormattedJson(await callCloudFunction(
      functionName: "otp-getAuthUsingOTP",
      parameters: <String, dynamic>{
        "phoneNumber":phoneNumber,
        "OTPCode":OTPCode,
      }));
  }

  static Future<PaymentIntentResponse> stripe_getPaymentIntent(
      {required num serviceProviderId,
      required OrderType orderType,
      required num paymentAmount}  ) async {
    return PaymentIntentResponse.fromFirebaseFormattedJson(await callCloudFunction(
      functionName: "stripe-getPaymentIntent",
      parameters: <String, dynamic>{
        "serviceProviderId":serviceProviderId,
        "orderType":orderType.toFirebaseFormatString(),
        "paymentAmount":paymentAmount,
      }));
  }

  static Future<AddCardResponse> stripe_addCard(
      {required String paymentMethod}  ) async {
    return AddCardResponse.fromFirebaseFormattedJson(await callCloudFunction(
      functionName: "stripe-addCard",
      parameters: <String, dynamic>{
        "paymentMethod":paymentMethod,
      }));
  }

  static Future<ChargeCardResponse> stripe_chargeCard(
      {required num serviceProviderId,
      required String cardId,
      required OrderType orderType,
      required num paymentAmount}  ) async {
    return ChargeCardResponse.fromFirebaseFormattedJson(await callCloudFunction(
      functionName: "stripe-chargeCard",
      parameters: <String, dynamic>{
        "serviceProviderId":serviceProviderId,
        "cardId":cardId,
        "orderType":orderType.toFirebaseFormatString(),
        "paymentAmount":paymentAmount,
      }));
  }

//   static Future<void> stripe_addCard({required String paymentMethod}) async {
//     return await callCloudFunction(
//         functionName: "stripe-addCard",
//         parameters: <String, dynamic>{
//           "paymentMethod": paymentMethod,
//         });
//   }

  static Future<SetupResponse> stripe_setupServiceProvider(
      {required num serviceProviderId,
      required OrderType orderType,
      Map<PaymentType,bool>? acceptedPayments}  ) async {
    return SetupResponse.fromFirebaseFormattedJson(await callCloudFunction(
      functionName: "stripe-setupServiceProvider",
      parameters: <String, dynamic>{
        "serviceProviderId":serviceProviderId,
        "orderType":orderType.toFirebaseFormatString(),
        "acceptedPayments":acceptedPayments,
      }));
  }

//   static Future<void> stripe_removeCard({required String cardId}) async {
//     return await callCloudFunction(
//         functionName: "stripe-removeCard",
//         parameters: <String, dynamic>{
//           "cardId": cardId,
//         });
//   }

  static Future<CallUserResponse> agora_callChatUser(
      {required num chatId,
      required ParticipantType callerParticipantType}  ) async {
    return CallUserResponse.fromFirebaseFormattedJson(await callCloudFunction(
      functionName: "agora-callChatUser",
      parameters: <String, dynamic>{
        "chatId":chatId,
        "callerParticipantType":callerParticipantType.toFirebaseFormatString(),
      }));
  }

//   static Future<void> stripe_updateServiceProvider(
//       {required num serviceProviderId, required OrderType orderType}) async {
//     return await callCloudFunction(
//         functionName: "stripe-updateServiceProvider",
//         parameters: <String, dynamic>{
//           "serviceProviderId": serviceProviderId,
//           "orderType": orderType.toFirebaseFormatString(),
//         });
//   }

//   static Future<void> agora_callChatUser(
//       {required num chatId,
//       required ParticipantType callerParticipantType}) async {
//     return await callCloudFunction(
//         functionName: "agora-callChatUser",
//         parameters: <String, dynamic>{
//           "chatId": chatId,
//           "callerParticipantType":
//               callerParticipantType.toFirebaseFormatString(),
//         });
//   }

//   static Future<void> restaurant2_createRestaurant(
//       {required String name,
//       required String image,
//       required Location location,
//       required Map<String, dynamic> schedule,
//       String? restaurantOperatorNotificationToken,
//       String? firebaseId,
//       required bool delivery,
//       required bool customerPickup,
//       bool? selfDelivery,
//       num? deliveryPartnerId,
//       DeliveryDetails? deliveryDetails}) async {
//     return await callCloudFunction(
//         functionName: "restaurant2-createRestaurant",
//         parameters: <String, dynamic>{
//           "name": name,
//           "image": image,
//           "location": location.toFirebaseFormattedJson(),
//           "schedule": json.encode(schedule),
//           "restaurantOperatorNotificationToken":
//               restaurantOperatorNotificationToken,
//           "firebaseId": firebaseId,
//           "delivery": delivery,
//           "customerPickup": customerPickup,
//           "selfDelivery": selfDelivery,
//           "deliveryPartnerId": deliveryPartnerId,
//           "deliveryDetails": deliveryDetails?.toFirebaseFormattedJson(),
//         });
//   }

//   static Future<CheckoutResponse> restaurant2_checkoutCart(
//       {required AppType customerAppType,
//       required Location customerLocation,
//       required num deliveryCost,
//       required PaymentType paymentType,
//       String? notes,
//       required num restaurantId,
//       DeliveryType? deliveryType,
//       required num tripDistance,
//       required num tripDuration,
//       required String tripPolyline,
//       String? scheduledTime,
//       String? stripePaymentId,
//       num? stripeFees}) async {
//     return CheckoutResponse.fromFirebaseFormattedJson(await callCloudFunction(
//         functionName: "restaurant2-checkoutCart",
//         parameters: <String, dynamic>{
//           "customerAppType": customerAppType.toFirebaseFormatString(),
//           "customerLocation": customerLocation.toFirebaseFormattedJson(),
//           "deliveryCost": deliveryCost,
//           "paymentType": paymentType.toFirebaseFormatString(),
//           "notes": notes,
//           "restaurantId": restaurantId,
//           "deliveryType": deliveryType?.toFirebaseFormatString(),
//           "tripDistance": tripDistance,
//           "tripDuration": tripDuration,
//           "tripPolyline": tripPolyline,
//           "scheduledTime": scheduledTime,
//           "stripePaymentId": stripePaymentId,
//           "stripeFees": stripeFees,
//         }));
//   }

//   static Future<void> restaurant2_prepareOrder({required num orderId}) async {
//     return await callCloudFunction(
//         functionName: "restaurant2-prepareOrder",
//         parameters: <String, dynamic>{
//           "orderId": orderId,
//         });
//   }

//   static Future<void> restaurant2_readyForOrderPickup(
//       {required num orderId}) async {
//     return await callCloudFunction(
//         functionName: "restaurant2-readyForOrderPickup",
//         parameters: <String, dynamic>{
//           "orderId": orderId,
//         });
//   }

//   static Future<void> restaurant2_orderPickedUpByCustomer(
//       {required num orderId}) async {
//     return await callCloudFunction(
//         functionName: "restaurant2-orderPickedUpByCustomer",
//         parameters: <String, dynamic>{
//           "orderId": orderId,
//         });
//   }

//   static Future<void> restaurant2_cancelOrderFromAdmin(
//       {required num orderId}) async {
//     return await callCloudFunction(
//         functionName: "restaurant2-cancelOrderFromAdmin",
//         parameters: <String, dynamic>{
//           "orderId": orderId,
//         });
//   }

//   static Future<void> restaurant2_cancelOrderFromCustomer(
//       {required num orderId}) async {
//     return await callCloudFunction(
//         functionName: "restaurant2-cancelOrderFromCustomer",
//         parameters: <String, dynamic>{
//           "orderId": orderId,
//         });
//   }

//   static Future<void> restaurant2_addRestaurantOperator(
//       {required num restaurantId, NotificationInfo? notificationInfo}) async {
//     return await callCloudFunction(
//         functionName: "restaurant2-addRestaurantOperator",
//         parameters: <String, dynamic>{
//           "restaurantId": restaurantId,
//           "notificationInfo": notificationInfo?.toFirebaseFormattedJson(),
//         });
//   }

//   static Future<void> restaurant2_authorizeRestaurantOperator(
//       {required num newOperatorId, required bool approved}) async {
//     return await callCloudFunction(
//         functionName: "restaurant2-authorizeRestaurantOperator",
//         parameters: <String, dynamic>{
//           "newOperatorId": newOperatorId,
//           "approved": approved,
//         });
//   }

//   static Future<void> restaurant2_addRestaurantDriver(
//       {required num deliveryCompanyId,
//       NotificationInfo? notificationInfo}) async {
//     return await callCloudFunction(
//         functionName: "restaurant2-addRestaurantDriver",
//         parameters: <String, dynamic>{
//           "deliveryCompanyId": deliveryCompanyId,
//           "notificationInfo": notificationInfo?.toFirebaseFormattedJson(),
//         });
//   }

//   static Future<void> restaurant2_authorizeRestaurantDriver(
//       {required num deliveryDriverId, required bool approved}) async {
//     return await callCloudFunction(
//         functionName: "restaurant2-authorizeRestaurantDriver",
//         parameters: <String, dynamic>{
//           "deliveryDriverId": deliveryDriverId,
//           "approved": approved,
//         });
//   }

//   static Future<void> delivery2_assignDriver(
//       {required num deliveryOrderId,
//       required num deliveryDriverId,
//       required OrderType orderType,
//       required DeliveryDriverType deliveryDriverType,
//       bool? changeDriver,
//       required num deliveryCompanyId}) async {
//     return await callCloudFunction(
//         functionName: "delivery2-assignDriver",
//         parameters: <String, dynamic>{
//           "deliveryOrderId": deliveryOrderId,
//           "deliveryDriverId": deliveryDriverId,
//           "orderType": orderType.toFirebaseFormatString(),
//           "deliveryDriverType": deliveryDriverType.toFirebaseFormatString(),
//           "changeDriver": changeDriver,
//           "deliveryCompanyId": deliveryCompanyId,
//         });
//   }

//   static Future<void> delivery2_addDeliveryOperator(
//       {required num deliveryCompanyId,
//       NotificationInfo? notificationInfo}) async {
//     return await callCloudFunction(
//         functionName: "delivery2-addDeliveryOperator",
//         parameters: <String, dynamic>{
//           "deliveryCompanyId": deliveryCompanyId,
//           "notificationInfo": notificationInfo?.toFirebaseFormattedJson(),
//         });
//   }

//   static Future<void> delivery2_authorizeDeliveryOperator(
//       {required num newOperatorId, required bool approved}) async {
//     return await callCloudFunction(
//         functionName: "delivery2-authorizeDeliveryOperator",
//         parameters: <String, dynamic>{
//           "newOperatorId": newOperatorId,
//           "approved": approved,
//         });
//   }

//   static Future<void> delivery2_addDeliveryDriver(
//       {required num deliveryCompanyId,
//       NotificationInfo? notificationInfo}) async {
//     return await callCloudFunction(
//         functionName: "delivery2-addDeliveryDriver",
//         parameters: <String, dynamic>{
//           "deliveryCompanyId": deliveryCompanyId,
//           "notificationInfo": notificationInfo?.toFirebaseFormattedJson(),
//         });
//   }

//   static Future<void> delivery2_authorizeDeliveryDriver(
//       {required num deliveryDriverId, required bool approved}) async {
//     return await callCloudFunction(
//         functionName: "delivery2-authorizeDeliveryDriver",
//         parameters: <String, dynamic>{
//           "deliveryDriverId": deliveryDriverId,
//           "approved": approved,
//         });
//   }

//   static Future<void> delivery2_restaurantAtPickup(
//       {required num deliveryId,
//       required num deliveryDriverId,
//       required DeliveryDriverType deliveryDriverType,
//       required num restaurantOrderId}) async {
//     return await callCloudFunction(
//         functionName: "delivery2-restaurantAtPickup",
//         parameters: <String, dynamic>{
//           "deliveryId": deliveryId,
//           "deliveryDriverId": deliveryDriverId,
//           "deliveryDriverType": deliveryDriverType.toFirebaseFormatString(),
//           "restaurantOrderId": restaurantOrderId,
//         });
//   }

//   static Future<void> delivery2_restaurantAtDropoff(
//       {required num deliveryId,
//       required num deliveryDriverId,
//       required DeliveryDriverType deliveryDriverType,
//       required num restaurantOrderId}) async {
//     return await callCloudFunction(
//         functionName: "delivery2-restaurantAtDropoff",
//         parameters: <String, dynamic>{
//           "deliveryId": deliveryId,
//           "deliveryDriverId": deliveryDriverId,
//           "deliveryDriverType": deliveryDriverType.toFirebaseFormatString(),
//           "restaurantOrderId": restaurantOrderId,
//         });
//   }

//   static Future<void> delivery2_restaurantFinishDelivery(
//       {required num deliveryId,
//       required num deliveryDriverId,
//       required DeliveryDriverType deliveryDriverType,
//       required num restaurantOrderId}) async {
//     return await callCloudFunction(
//         functionName: "delivery2-restaurantFinishDelivery",
//         parameters: <String, dynamic>{
//           "deliveryId": deliveryId,
//           "deliveryDriverId": deliveryDriverId,
//           "deliveryDriverType": deliveryDriverType.toFirebaseFormatString(),
//           "restaurantOrderId": restaurantOrderId,
//         });
//   }

//   static Future<void> delivery2_restaurantStartDelivery(
//       {required num deliveryId,
//       required num deliveryDriverId,
//       required DeliveryDriverType deliveryDriverType,
//       required num restaurantOrderId}) async {
//     return await callCloudFunction(
//         functionName: "delivery2-restaurantStartDelivery",
//         parameters: <String, dynamic>{
//           "deliveryId": deliveryId,
//           "deliveryDriverId": deliveryDriverId,
//           "deliveryDriverType": deliveryDriverType.toFirebaseFormatString(),
//           "restaurantOrderId": restaurantOrderId,
//         });
//   }
// }
