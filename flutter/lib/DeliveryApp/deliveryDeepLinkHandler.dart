import 'dart:async';

import 'package:get/get.dart';
import 'package:mezcalmos/Shared/cloudFunctions/index.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/controllers/backgroundNotifications/nativeBackgroundNotificationsController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezSnackbar.dart';

class DeliveryDeepLinkHandler {
  static Future<void> handleDeeplink(Uri deepLink) async {
    final List<String> frags = deepLink.path.split("/");
    if (frags.length == 4 && frags[1] == "dr") {
      await showDialogAndAddDriver(frags[2]);
    }
  }

  static Future<void> showDialogAndAddDriver(String uniqueId) async {
    showLoadingOverlay(
        text:
            "${Get.find<LanguageController>().strings["General"]["addingOp"]}");
    await _addDriver(uniqueId);
    closeAllLoadings();
  }

  static Future<void> _addDriver(String uniqueId) async {
    try {
      String? token =
          await Get.find<NativeBackgroundNotificationsController>().getToken();
      final AddDriverResponse addCardResponse =
          await CloudFunctions.serviceProvider_addDriver(
              uniqueId: uniqueId, notificationToken: token);
      if (addCardResponse.success) unawaited(MezRouter.back());
    } catch (e, stk) {
      MezSnackbar("Error", "Unable to add you as driver");
      mezDbgPrint("Errrooooooooor =======> $e,$stk");
    }
  }
}
