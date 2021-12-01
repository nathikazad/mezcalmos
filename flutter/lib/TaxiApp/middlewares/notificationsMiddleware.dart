import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/foregroundNotificationsController.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/TaxiApp/controllers/taxiAuthController.dart';
import 'package:mezcalmos/TaxiApp/router.dart';

class TaxiNotificationsMiddleware extends GetMiddleware {
  @override
  int? get priority => super.priority;

  @override
  GetPageBuilder? onPageBuildStart(GetPageBuilder? page) {
    mezDbgPrint(
        "TaxiNotificationsMiddleware ================================== outside.");

    if (Get.find<TaxiAuthController>().taxiState?.currentOrder == null) {
      // remove them out.

      mezDbgPrint(
          "TaxiNotificationsMiddleware ================================== inside.");
      // clearing everything because we are using that middleware for both ordersNotif and newMsgNotifs
      // but still we can go custom and if it's a newMessage Notif we call clearAllMessageNotification() isntead.
      Get.find<ForegroundNotificationsController>().clearAllNotification();
      // intercept the building of the Widget.
      Future.microtask(
          () => Get.until((route) => route.settings.name == kOrdersListPage));
    } else
      return super.onPageBuildStart(page);
  }
}
