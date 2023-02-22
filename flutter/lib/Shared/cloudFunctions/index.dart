import 'dart:convert';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';

class CloudFunctions {
  static Future<dynamic> callCloudFunction(
      {required String functionName, Map<String, dynamic>? parameters}) async {
    final Map<String, dynamic> finalParams = <String, dynamic>{
      'versionNumber': '0.0.0'
    };
    finalParams.addAll(parameters ?? <String, dynamic>{});
    final HttpsCallableResult<dynamic> response = await FirebaseFunctions
        .instance
        .httpsCallable(functionName)
        .call(finalParams);
    return response.data;
  }

  static Future<void> user_addHasuraClaim() async {
    return await callCloudFunction(
        functionName: "user-addHasuraClaim", parameters: <String, dynamic>{});
  }

  static Future<void> otp_sendOTPForLogin(
      {required String language, required String phoneNumber}) async {
    return await callCloudFunction(
        functionName: "otp-sendOTPForLogin",
        parameters: <String, dynamic>{
          "language": language,
          "phoneNumber": phoneNumber,
        });
  }

  static Future<AuthResponse> otp_getAuthUsingOTP(
      {required String phoneNumber, required String OTPCode}) async {
    return AuthResponse.fromFirebaseFormattedJson(await callCloudFunction(
        functionName: "otp-getAuthUsingOTP",
        parameters: <String, dynamic>{
          "phoneNumber": phoneNumber,
          "OTPCode": OTPCode,
        }));
  }

  static Future<PaymentIntentResponse> stripe_getPaymentIntent(
      {required num serviceProviderDetailsId,
      required num paymentAmount}) async {
    return PaymentIntentResponse.fromFirebaseFormattedJson(
        await callCloudFunction(
            functionName: "stripe-getPaymentIntent",
            parameters: <String, dynamic>{
          "serviceProviderDetailsId": serviceProviderDetailsId,
          "paymentAmount": paymentAmount,
        }));
  }

  static Future<AddCardResponse> stripe_addCard(
      {required String paymentMethod}) async {
    return AddCardResponse.fromFirebaseFormattedJson(await callCloudFunction(
        functionName: "stripe-addCard",
        parameters: <String, dynamic>{
          "paymentMethod": paymentMethod,
        }));
  }

  static Future<ChargeCardResponse> stripe_chargeCard(
      {required num serviceProviderDetailsId,
      required String cardId,
      required num paymentAmount}) async {
    return ChargeCardResponse.fromFirebaseFormattedJson(await callCloudFunction(
        functionName: "stripe-chargeCard",
        parameters: <String, dynamic>{
          "serviceProviderDetailsId": serviceProviderDetailsId,
          "cardId": cardId,
          "paymentAmount": paymentAmount,
        }));
  }

  static Future<void> stripe_removeCard({required String cardId}) async {
    return await callCloudFunction(
        functionName: "stripe-removeCard",
        parameters: <String, dynamic>{
          "cardId": cardId,
        });
  }

  static Future<SetupResponse> stripe_setupServiceProvider(
      {required num serviceProviderDetailsId}) async {
    return SetupResponse.fromFirebaseFormattedJson(await callCloudFunction(
        functionName: "stripe-setupServiceProvider",
        parameters: <String, dynamic>{
          "serviceProviderDetailsId": serviceProviderDetailsId,
        }));
  }

  static Future<void> stripe_updateServiceProvider(
      {required num serviceProviderDetailsId}) async {
    return await callCloudFunction(
        functionName: "stripe-updateServiceProvider",
        parameters: <String, dynamic>{
          "serviceProviderDetailsId": serviceProviderDetailsId,
        });
  }

  static Future<CallUserResponse> agora_callChatUser(
      {required num chatId,
      required ParticipantType callerParticipantType}) async {
    return CallUserResponse.fromFirebaseFormattedJson(await callCloudFunction(
        functionName: "agora-callChatUser",
        parameters: <String, dynamic>{
          "chatId": chatId,
          "callerParticipantType":
              callerParticipantType.toFirebaseFormatString(),
        }));
  }

  static Future<void> serviceProvider_addOperator(
      {required num serviceProviderId,
      required ParticipantType participantType,
      NotificationInfo? notificationInfo,
      String? appVersion}) async {
    return await callCloudFunction(
        functionName: "serviceProvider-addOperator",
        parameters: <String, dynamic>{
          "serviceProviderId": serviceProviderId,
          "participantType": participantType.toFirebaseFormatString(),
          "notificationInfo": notificationInfo?.toFirebaseFormattedJson(),
          "appVersion": appVersion,
        });
  }

  static Future<void> serviceProvider_authorizeOperator(
      {required num newOperatorId,
      required bool approved,
      required ParticipantType participantType}) async {
    return await callCloudFunction(
        functionName: "serviceProvider-authorizeOperator",
        parameters: <String, dynamic>{
          "newOperatorId": newOperatorId,
          "approved": approved,
          "participantType": participantType.toFirebaseFormatString(),
        });
  }

  static Future<void> serviceProvider_addDriver(
      {required num deliveryCompanyId,
      NotificationInfo? notificationInfo,
      required DeliveryServiceProviderType deliveryServiceProviderType}) async {
    return await callCloudFunction(
        functionName: "serviceProvider-addDriver",
        parameters: <String, dynamic>{
          "deliveryCompanyId": deliveryCompanyId,
          "notificationInfo": notificationInfo?.toFirebaseFormattedJson(),
          "deliveryServiceProviderType":
              deliveryServiceProviderType.toFirebaseFormatString(),
        });
  }

  static Future<void> serviceProvider_authorizeDriver(
      {required num deliveryDriverId,
      required bool approved,
      required DeliveryServiceProviderType deliveryServiceProviderType}) async {
    return await callCloudFunction(
        functionName: "serviceProvider-authorizeDriver",
        parameters: <String, dynamic>{
          "deliveryDriverId": deliveryDriverId,
          "approved": approved,
          "deliveryServiceProviderType":
              deliveryServiceProviderType.toFirebaseFormatString(),
        });
  }

  static Future<void> restaurant2_createRestaurant(
      {required String name,
      required String image,
      required Location location,
      required Map<String, dynamic> schedule,
      String? restaurantOperatorNotificationToken,
      String? firebaseId,
      num? deliveryPartnerId,
      required DeliveryDetails deliveryDetails,
      required Map<Language, bool> language}) async {
    return await callCloudFunction(
        functionName: "restaurant2-createRestaurant",
        parameters: <String, dynamic>{
          "name": name,
          "image": image,
          "location": location.toFirebaseFormattedJson(),
          "schedule": json.encode(schedule),
          "restaurantOperatorNotificationToken":
              restaurantOperatorNotificationToken,
          "firebaseId": firebaseId,
          "deliveryPartnerId": deliveryPartnerId,
          "deliveryDetails": deliveryDetails.toFirebaseFormattedJson(),
          "language": language,
        });
  }

  static Future<CheckoutResponse> restaurant2_checkoutCart(
      {required CustomerAppType customerAppType,
      required Location customerLocation,
      required num deliveryCost,
      required PaymentType paymentType,
      String? notes,
      required num restaurantId,
      DeliveryType? deliveryType,
      required num tripDistance,
      required num tripDuration,
      required String tripPolyline,
      String? scheduledTime,
      String? stripePaymentId,
      num? stripeFees,
      num? distanceFromBase}) async {
    return CheckoutResponse.fromFirebaseFormattedJson(await callCloudFunction(
        functionName: "restaurant2-checkoutCart",
        parameters: <String, dynamic>{
          "customerAppType": customerAppType.toFirebaseFormatString(),
          "customerLocation": customerLocation.toFirebaseFormattedJson(),
          "deliveryCost": deliveryCost,
          "paymentType": paymentType.toFirebaseFormatString(),
          "notes": notes,
          "restaurantId": restaurantId,
          "deliveryType": deliveryType?.toFirebaseFormatString(),
          "tripDistance": tripDistance,
          "tripDuration": tripDuration,
          "tripPolyline": tripPolyline,
          "scheduledTime": scheduledTime,
          "stripePaymentId": stripePaymentId,
          "stripeFees": stripeFees,
          "distanceFromBase": distanceFromBase,
        }));
  }

  static Future<void> restaurant2_prepareOrder({required num orderId}) async {
    return await callCloudFunction(
        functionName: "restaurant2-prepareOrder",
        parameters: <String, dynamic>{
          "orderId": orderId,
        });
  }

  static Future<void> restaurant2_readyForOrderPickup(
      {required num orderId}) async {
    return await callCloudFunction(
        functionName: "restaurant2-readyForOrderPickup",
        parameters: <String, dynamic>{
          "orderId": orderId,
        });
  }

  static Future<void> restaurant2_orderPickedUpByCustomer(
      {required num orderId}) async {
    return await callCloudFunction(
        functionName: "restaurant2-orderPickedUpByCustomer",
        parameters: <String, dynamic>{
          "orderId": orderId,
        });
  }

  static Future<void> restaurant2_cancelOrderFromAdmin(
      {required num orderId}) async {
    return await callCloudFunction(
        functionName: "restaurant2-cancelOrderFromAdmin",
        parameters: <String, dynamic>{
          "orderId": orderId,
        });
  }

  static Future<void> restaurant2_cancelOrderFromCustomer(
      {required num orderId}) async {
    return await callCloudFunction(
        functionName: "restaurant2-cancelOrderFromCustomer",
        parameters: <String, dynamic>{
          "orderId": orderId,
        });
  }

  static Future<void> laundry_createLaundry(
      {required String name,
      required String image,
      required Location location,
      required Map<String, dynamic> schedule,
      String? laundryOperatorNotificationToken,
      String? firebaseId,
      num? deliveryPartnerId,
      required DeliveryDetails deliveryDetails,
      required Map<Language, bool> language}) async {
    return await callCloudFunction(
        functionName: "laundry-createLaundry",
        parameters: <String, dynamic>{
          "name": name,
          "image": image,
          "location": location.toFirebaseFormattedJson(),
          "schedule": json.encode(schedule),
          "laundryOperatorNotificationToken": laundryOperatorNotificationToken,
          "firebaseId": firebaseId,
          "deliveryPartnerId": deliveryPartnerId,
          "deliveryDetails": deliveryDetails.toFirebaseFormattedJson(),
          "language": language,
        });
  }

  static Future<ReqLaundryResponse> laundry_requestLaundry(
      {required num storeId,
      required PaymentType paymentType,
      required DeliveryType deliveryType,
      required Location customerLocation,
      required num deliveryCost,
      required CustomerAppType customerAppType,
      String? notes,
      num? tax,
      String? scheduledTime,
      num? stripeFees,
      String? stripePaymentId,
      num? discountValue,
      required num tripDistance,
      required num tripDuration,
      required String tripPolyline,
      num? distanceFromBase}) async {
    return ReqLaundryResponse.fromFirebaseFormattedJson(await callCloudFunction(
        functionName: "laundry-requestLaundry",
        parameters: <String, dynamic>{
          "storeId": storeId,
          "paymentType": paymentType.toFirebaseFormatString(),
          "deliveryType": deliveryType.toFirebaseFormatString(),
          "customerLocation": customerLocation.toFirebaseFormattedJson(),
          "deliveryCost": deliveryCost,
          "customerAppType": customerAppType.toFirebaseFormatString(),
          "notes": notes,
          "tax": tax,
          "scheduledTime": scheduledTime,
          "stripeFees": stripeFees,
          "stripePaymentId": stripePaymentId,
          "discountValue": discountValue,
          "tripDistance": tripDistance,
          "tripDuration": tripDuration,
          "tripPolyline": tripPolyline,
          "distanceFromBase": distanceFromBase,
        }));
  }

  static Future<void> laundry_readyForDeliveryOrder(
      {required num orderId}) async {
    return await callCloudFunction(
        functionName: "laundry-readyForDeliveryOrder",
        parameters: <String, dynamic>{
          "orderId": orderId,
        });
  }

  static Future<void> laundry_cancelFromCustomer({required num orderId}) async {
    return await callCloudFunction(
        functionName: "laundry-cancelFromCustomer",
        parameters: <String, dynamic>{
          "orderId": orderId,
        });
  }

  static Future<void> laundry_cancelFromAdmin({required num orderId}) async {
    return await callCloudFunction(
        functionName: "laundry-cancelFromAdmin",
        parameters: <String, dynamic>{
          "orderId": orderId,
        });
  }

  static Future<void> delivery2_assignDriver(
      {required num deliveryOrderId,
      required num deliveryDriverId,
      bool? changeDriver}) async {
    return await callCloudFunction(
        functionName: "delivery2-assignDriver",
        parameters: <String, dynamic>{
          "deliveryOrderId": deliveryOrderId,
          "deliveryDriverId": deliveryDriverId,
          "changeDriver": changeDriver,
        });
  }

  static Future<void> delivery2_changeStatus(
      {required num deliveryOrderId,
      required DeliveryOrderStatus newStatus}) async {
    return await callCloudFunction(
        functionName: "delivery2-changeStatus",
        parameters: <String, dynamic>{
          "deliveryOrderId": deliveryOrderId,
          "newStatus": newStatus.toFirebaseFormatString(),
        });
  }

  static Future<CreateCourierResponse> delivery2_createCourierOrder(
      {required Location toLocation,
      Location? fromLocationGps,
      String? fromLocationText,
      required List<CourierItem> items,
      required num deliveryCompanyId,
      required num deliveryCost,
      required CustomerAppType customerAppType,
      num? tax,
      String? scheduledTime,
      num? stripeFees,
      num? discountValue,
      required num tripDistance,
      required num tripDuration,
      required String tripPolyline,
      num? distanceFromBase,
      num? refundAmount}) async {
    return CreateCourierResponse.fromFirebaseFormattedJson(
        await callCloudFunction(
            functionName: "delivery2-createCourierOrder",
            parameters: <String, dynamic>{
          "toLocation": toLocation.toFirebaseFormattedJson(),
          "fromLocationGps": fromLocationGps?.toFirebaseFormattedJson(),
          "fromLocationText": fromLocationText,
          "items": items.fold<List<dynamic>>([],
              (List<dynamic> value, CourierItem element) {
            value.add(element.toFirebaseFormattedJson());
            return value;
          }),
          "deliveryCompanyId": deliveryCompanyId,
          "deliveryCost": deliveryCost,
          "customerAppType": customerAppType.toFirebaseFormatString(),
          "tax": tax,
          "scheduledTime": scheduledTime,
          "stripeFees": stripeFees,
          "discountValue": discountValue,
          "tripDistance": tripDistance,
          "tripDuration": tripDuration,
          "tripPolyline": tripPolyline,
          "distanceFromBase": distanceFromBase,
          "refundAmount": refundAmount,
        }));
  }
}
