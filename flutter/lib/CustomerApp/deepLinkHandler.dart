import 'dart:async';

import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/MezRouter.dart';
import 'package:mezcalmos/Shared/database/FirebaseDb.dart';
import 'package:mezcalmos/Shared/graphql/service_provider/hsServiceProvider.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';

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

  Future<void> _checkValidityAndRoute(Uri deepLink) async {
    final String serviceProviderUniqueId = deepLink.path.replaceAll("/", "");

    String? linkUrl = await get_service_link(uniqueId: serviceProviderUniqueId);
    if (linkUrl != null) MezRouter.toNamed(linkUrl);
  }

  Future<void> startDynamicLinkCheckRoutine() async {
    try {
      final FirebaseDynamicLinks firebaseDynamicLinks =
          FirebaseDynamicLinks.instanceFor(
        app: Get.find<FirebaseDb>().firebaseApp,
      );
      final PendingDynamicLinkData? data =
          await firebaseDynamicLinks.getInitialLink();
      final Uri? deepLink = data?.link;
      if (deepLink != null) {
        await _checkValidityAndRoute(deepLink);
      }
      // ignore: unawaited_futures
      _inDeepLinkListener?.cancel();
      _inDeepLinkListener =
          firebaseDynamicLinks.onLink.listen((PendingDynamicLinkData data) {
        mezDbgPrint(
            "@deepLink@ ===> _startOnLinkListener with value : ${data.link} ");
        data.link.queryParameters.forEach((String key, String value) {
          mezDbgPrint("Key = $key | Value : $value");
        });
        _checkValidityAndRoute(data.link);
      });
    } catch (e) {
      mezDbgPrint("Exception ==> ${e.toString()}");
    }
  }
}
