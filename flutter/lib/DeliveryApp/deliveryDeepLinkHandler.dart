import 'dart:async';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:mezcalmos/Shared/cloudFunctions/index.dart';
import 'package:mezcalmos/Shared/controllers/backgroundNotificationsController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/widgets/MezSnackbar.dart';

class DeliveryDeepLinkHandler {
  static Future<void> handleDeeplink(Uri deepLink) async {
    mezDbgPrint("here");
    final List<String> frags = deepLink.path.split("/");
    if (frags.length == 4 && frags[1] == "dr") _addDriver(frags[2]);
  }

  static Future<void> _addDriver(String uniqueId) async {
    try {
      String? token =
          await Get.find<BackgroundNotificationsController>().getToken();
      await CloudFunctions.serviceProvider_addDriver(
          uniqueId: uniqueId, notificationToken: token);
    } catch (e, stk) {
      MezSnackbar("Error", "Unable to add you as driver");
      mezDbgPrint("Errrooooooooor =======> $e,$stk");
    }
  }
}
