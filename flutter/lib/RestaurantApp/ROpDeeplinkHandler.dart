import 'dart:async';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/RestaurantApp/router.dart';
import 'package:mezcalmos/Shared/MezRouter.dart';
import 'package:mezcalmos/Shared/cloudFunctions/index.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/database/FirebaseDb.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServerResponse.dart';

class ROpDeeplinkHandler {
  StreamSubscription<PendingDynamicLinkData?>? _inDeepLinkListener;
  // Uri testUri = Uri.parse(
  //     "https://mezprovs.page.link/?link=https://www.mezcalmos.com/?app=restaurantApp&type=Restaurant&id=8");

  /// This checks if `queryParameters.containsKey('type') && queryParameters.containsKey('id')`
  ///
  /// and Check if that type is one of `CustomerDeepLinkType.values` , then calls `_handleRoutingByType()` to handle routing.
  Future<void> _checkQueryValidityAndHandleRouting(Uri deepLink) async {
    mezDbgPrint(
        " 🔗🔗🔗 @deepLink@ ===> ${deepLink.queryParametersAll} 🔗🔗🔗");
    deepLink.queryParameters.forEach(
      (String key, String value) {
        mezDbgPrint("Key = $key | Value : $value");
      },
    );

    if (deepLink.queryParameters.containsKey('type') == true &&
        deepLink.queryParameters.containsKey('id') == true) {
      mezDbgPrint("@deepLink@ ===>checking query params");

      final int? providerId = int.tryParse(deepLink.queryParameters['id']!);
      mezDbgPrint("@deepLink@ ===> query has =========>$providerId [id]");

      // final CustomerDeepLinkType? providerType =
      //     deepLink.queryParameters['type']!.toCustomerDeepLinkType();

      // accepted type - We handle it

      if (providerId != null) {
        await _handleRoutingByType(
          providerId: providerId,
        );
      }
    }
  }

  /// This Do the routing magic depending on [providerType] given.
  Future<void> _handleRoutingByType({
    required int providerId,
  }) async {
    mezDbgPrint(
        " 🔗🔗🔗🔗 @deepLink@ ===> handling operator   =====>>> provider id : $providerId");

    await addOperator(providerId);
    // await Get.find<RestaurantOpAuthController>().setupRestaurantOperator();
    //    if (res.success) {
    //  }
  }

  /// This cancel itself and start once again listening if the app was opened using a deep Link.
  void _startOnLinkListener() {
    _inDeepLinkListener?.cancel();
    _inDeepLinkListener = null;
    _inDeepLinkListener = FirebaseDynamicLinks.instanceFor(
      app: Get.find<FirebaseDb>().firebaseApp,
    ).onLink.listen((PendingDynamicLinkData data) {
      mezDbgPrint(
          "@deepLink@ ===> _startOnLinkListener with value : ${data.link} ");
      data.link.queryParameters.forEach((String key, String value) {
        mezDbgPrint("Key = $key | Value : $value");
      });
      _checkQueryValidityAndHandleRouting(data.link);
    });
  }

  /// This actually do the whole thing, from Capturing Deep Links -> Validating -> Routing.
  Future<void> startDynamicLinkCheckRoutine() async {
    try {
      mezDbgPrint("🪢🪢🪢🪢🪢🪢Starting dynamic link checker");
      final PendingDynamicLinkData? data =
          await FirebaseDynamicLinks.instanceFor(
        app: Get.find<FirebaseDb>().firebaseApp,
      ).getInitialLink();
      final Uri? deepLink = data?.link;
      mezDbgPrint("🪢🪢🪢🪢🪢🪢 deeplink $data");
      if (deepLink != null) {
        await _checkQueryValidityAndHandleRouting(deepLink);
      }
      _startOnLinkListener();
    } catch (e) {
      mezDbgPrint("Exception ==> ${e.toString()}");
    }
  }

  Future<ServerResponse> addOperator(int providerId) async {
    try {
      await CloudFunctions.serviceProvider_addOperator(
          serviceProviderId: providerId,
          participantType: ParticipantType.RestaurantOperator);
      // mezDbgPrint("Response : ${response.data}");
      // ignore: unawaited_futures
      MezRouter.toNamed(kOpUnauth);
      return ServerResponse(ResponseStatus.Success);
    } catch (e, stk) {
      mezDbgPrint("Errrooooooooor =======> $e,$stk");
      return ServerResponse(ResponseStatus.Error,
          errorMessage: "Server Error", errorCode: "serverError");
    }
  }
}
