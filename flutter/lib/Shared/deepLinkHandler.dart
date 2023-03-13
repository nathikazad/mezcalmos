import 'dart:async';

import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/database/FirebaseDb.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';

abstract class DeepLinkHandler {
  static StreamSubscription<PendingDynamicLinkData?>? _inDeepLinkListener;

  static Future<void> startDynamicLinkCheckRoutine(
      void Function(Uri deepLink) handler) async {
    try {
      final FirebaseDynamicLinks firebaseDynamicLinks =
          FirebaseDynamicLinks.instanceFor(
        app: Get.find<FirebaseDb>().firebaseApp,
      );
      final PendingDynamicLinkData? data =
          await firebaseDynamicLinks.getInitialLink();
      final Uri? deepLink = data?.link;
      if (deepLink != null) {
        handler(deepLink);
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
        handler(data.link);
      });
    } catch (e) {
      mezDbgPrint("Exception ==> ${e.toString()}");
    }
  }
}
