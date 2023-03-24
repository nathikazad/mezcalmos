import 'dart:async';

import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/RestaurantApp/router/router.dart';
import 'package:mezcalmos/Shared/cloudFunctions/index.dart';
import 'package:mezcalmos/Shared/database/FirebaseDb.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServerResponse.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';

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
          uniqueId: providerId.toString(),
        );
      }
    }
  }

  /// This Do the routing magic depending on [providerType] given.
  Future<void> _handleRoutingByType({
    required String uniqueId,
  }) async {
    mezDbgPrint(
        " 🔗🔗🔗🔗 @deepLink@ ===> handling operator   =====>>> unique id : $uniqueId");

    await addOperator(uniqueId);
    // await Get.find<RestaurantOpAuthController>().setupRestaurantOperator();
    //    if (res.success) {
    // ignore: unawaited_futures
    MezRouter.toNamed(RestaurantAppRoutes.opUnauthRoute);
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

  Future<ServerResponse> addOperator(String uniqueId) async {
    try {
      await CloudFunctions.serviceProvider_addOperator(
        uniqueId: uniqueId,
      );
      // mezDbgPrint("Response : ${response.data}");
      // ignore: unawaited_futures
      MezRouter.toNamed(RestaurantAppRoutes.opUnauthRoute);
      return ServerResponse(ResponseStatus.Success);
    } catch (e, stk) {
      mezDbgPrint("Errrooooooooor =======> $e,$stk");
      return ServerResponse(ResponseStatus.Error,
          errorMessage: "Server Error", errorCode: "serverError");
    }
  }
}
