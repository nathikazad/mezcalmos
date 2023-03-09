import 'dart:async';

import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/CustRestaurantView/CustomerRestaurantView.dart';
import 'package:mezcalmos/Shared/database/FirebaseDb.dart';
import 'package:mezcalmos/Shared/graphql/restaurant/hsRestaurant.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Restaurant.dart';

import 'pages/Laundry/LaundryCurrentOrderView/CustLaundryOrderView.dart';

enum CustomerDeepLinkType {
  // ignore: constant_identifier_names
  Restaurant,
  // ignore: constant_identifier_names
  Laundry,
}

extension on String {
  CustomerDeepLinkType? toCustomerDeepLinkType() =>
      CustomerDeepLinkType.values.firstWhereOrNull(
        (CustomerDeepLinkType elem) => elem.name.toLowerCase() == toLowerCase(),
      );
}

class DeepLinkHandler {
  StreamSubscription<PendingDynamicLinkData?>? _inDeepLinkListener;

  /// This checks if `queryParameters.containsKey('type') && queryParameters.containsKey('id')`
  ///
  /// and Check if that type is one of `CustomerDeepLinkType.values` , then calls `_handleRoutingByType()` to handle routing.
  Future<void> _checkQueryValidityAndHandleRouting(Uri deepLink) async {
    mezDbgPrint("@deepLink@ ===> ${deepLink.host}");
    deepLink.queryParameters.forEach(
      (String key, String value) {
        mezDbgPrint("Key = $key | Value : $value");
      },
    );

    if (deepLink.queryParameters.containsKey('type') == true &&
        deepLink.queryParameters.containsKey('id') == true) {
      mezDbgPrint("@deepLink@ ===>checking query params");

      final int providerId = int.parse(deepLink.queryParameters['id']!);
      mezDbgPrint("@deepLink@ ===> query has [id]");

      final CustomerDeepLinkType? providerType =
          deepLink.queryParameters['type']!.toCustomerDeepLinkType();
      mezDbgPrint("@deepLink@ ===> query has type : $providerType");

      // accepted type - We handle it
      if (providerType != null) {
        await _handleRoutingByType(
          providerId: providerId,
          providerType: providerType,
        );
      }
    }
  }

  /// This Do the routing magic depending on [providerType] given.
  Future<void> _handleRoutingByType({
    required int providerId,
    required CustomerDeepLinkType providerType,
  }) async {
    switch (providerType) {
      case CustomerDeepLinkType.Restaurant:
        mezDbgPrint("@deepLink@ ===> handling restaurant routing ! ");
        final Restaurant? _rest = await get_restaurant_by_id(id: providerId);
        if (_rest != null) {
          Future<void>.delayed(Duration.zero,
              () => CustomerRestaurantView.navigate(restaurantId: providerId)

              // MezRouter.toNamed(
              // RestaurantRouters().getRestaurantRoute(providerId),
              // arguments: {'id': providerId, "restaurant": _rest}),
              );
        }
        break;
      case CustomerDeepLinkType.Laundry:
        mezDbgPrint("@deepLink@ ===> handling laundry routing ! ");
        Future<void>.delayed(Duration.zero,
            () => CustLaundryOrderView.navigate(orderId: providerId));

        break;
      default:
        mezDbgPrint("@deepLink@ ===> handling unknown default type");

      // nothing.
    }
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
      final PendingDynamicLinkData? data =
          await FirebaseDynamicLinks.instanceFor(
        app: Get.find<FirebaseDb>().firebaseApp,
      ).getInitialLink();
      final Uri? deepLink = data?.link;
      if (deepLink != null) {
        await _checkQueryValidityAndHandleRouting(deepLink);
      }
      _startOnLinkListener();
    } catch (e) {
      mezDbgPrint("Exception ==> ${e.toString()}");
    }
  }
}
