import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/fbNotificationsController.dart';
import 'package:mezcalmos/TaxiApp/controllers/taxiAuthController.dart';
import 'package:mezcalmos/TaxiApp/router.dart';

class TaxiNotificationsMiddleware extends GetMiddleware {
  final _fbNotifCtrl = Get.find<FBNotificationsController>();

  @override
  int? get priority => super.priority;

  @override
  GetPageBuilder? onPageBuildStart(GetPageBuilder? page) {
    if (Get.find<TaxiAuthController>().taxiState?.currentOrder == null) {
      // remove them out.
      _fbNotifCtrl.clearAllNotification();
      // intercept the building of the Widget.
      Future.microtask(
          () => Get.until((route) => route.settings.name == kOrdersListPage));
    } else
      return super.onPageBuildStart(page);
  }
}
