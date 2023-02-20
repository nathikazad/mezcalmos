import 'dart:async';

import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/backgroundNotificationsController.dart';
import 'package:mezcalmos/Shared/graphql/laundry_operator/hsLaundryOperator.dart';
import 'package:mezcalmos/Shared/graphql/notifications/hsNotificationInfo.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Operators/Operator.dart';
import 'package:mezcalmos/Shared/models/Utilities/NotificationInfo.dart';

class LaundryOpAuthController extends GetxController {
  Rxn<Operator> operator = Rxn();
  final int operatorUserId = Get.find<AuthController>().hasuraUserId!;
  AuthController _authController = Get.find<AuthController>();
  // RestaurantInfoController _restaurantInfoController =
  //     Get.find<RestaurantInfoController>();
  BackgroundNotificationsController _notificationsController =
      Get.find<BackgroundNotificationsController>();
  RxnInt _laundryId = RxnInt();
  int? get laundryId => _laundryId.value;

  int? get detailsId => operator.value?.state.serviceProviderDetailsId;

  @override
  void onInit() {
    // ------------------------------------------------------------------------

    mezDbgPrint("LaundryOperator: calling handle state change first time");
    // Todo @m66are remove this restaurant id hard code

    setupLaundryOperator().then((value) {
      if (operator.value?.info.hasuraId != null) {
        saveNotificationToken();
      }
    });

    super.onInit();
  }

  Future<void> setupLaundryOperator() async {
    operator.value = await get_laundry_operator(userId: operatorUserId);
    if (operator.value != null) {
      _laundryId.value = operator.value!.state.serviceProviderId;
    }

    mezDbgPrint("👑👑 laundry Operator :: ${operator.value?.toJson()}");
  }

  Future<void> saveNotificationToken() async {
    final String? deviceNotificationToken =
        await _notificationsController.getToken();
    final NotificationInfo? notifInfo = await get_notif_info(
        userId: operator.value!.info.hasuraId, appType: "laundry");
    mezDbgPrint("inside save notif token=====>>>😍");
    mezDbgPrint("inside save notif token=====>>>${notifInfo?.token}");
    mezDbgPrint("inside save notif token=====>>>$deviceNotificationToken");
    try {
      if (notifInfo != null &&
          deviceNotificationToken != null &&
          notifInfo.token != deviceNotificationToken) {
        mezDbgPrint("🫡🫡 Updating notification info 🫡🫡");
        // ignore: unawaited_futures
        update_notif_info(
            notificationInfo: NotificationInfo(
                userId: operatorUserId,
                appType: "laundry",
                id: notifInfo.id,
                token: deviceNotificationToken));
      } else if (deviceNotificationToken != null && notifInfo == null) {
        mezDbgPrint("🫡🫡 Saving notification info for the first time 🫡🫡");
        // ignore: unawaited_futures
        insert_notif_info(
            userId: operatorUserId,
            token: deviceNotificationToken,
            appType: "laundry");
      }
    } catch (e, stk) {
      mezDbgPrint(e);
      mezDbgPrint(stk);
    }
  }

  @override
  void onClose() {
    super.onClose();
  }
}
