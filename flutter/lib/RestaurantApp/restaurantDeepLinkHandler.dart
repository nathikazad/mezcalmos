import 'dart:async';
import 'package:get/get.dart';
import 'package:mezcalmos/RestaurantApp/router.dart';
import 'package:mezcalmos/Shared/MezRouter.dart';
import 'package:mezcalmos/Shared/cloudFunctions/index.dart';
import 'package:mezcalmos/Shared/controllers/backgroundNotificationsController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';

class RestaurantDeepLinkHandler {
  static Future<void> handleDeeplink(Uri deepLink) async {
    final List<String> frags = deepLink.path.split("/");
    if (frags.length == 4 && frags[1] == "op") _addOperator(frags[2]);
  }

  static Future<void> _addOperator(String uniqueId) async {
    try {
      String? token =
          await Get.find<BackgroundNotificationsController>().getToken();
      await CloudFunctions.serviceProvider_addOperator(
          uniqueId: uniqueId, notificationToken: token);
      // ignore: unawaited_futures
      MezRouter.toNamed(kOpUnauth);
    } catch (e, stk) {
      mezDbgPrint("Errrooooooooor =======> $e,$stk");
    }
  }
}
