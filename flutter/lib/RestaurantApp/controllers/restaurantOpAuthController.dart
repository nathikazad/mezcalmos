import 'dart:async';

import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/backgroundNotificationsController.dart';
import 'package:mezcalmos/Shared/graphql/notifications/hsNotificationInfo.dart';
import 'package:mezcalmos/Shared/graphql/restaurant/hsRestaurant.dart';
import 'package:mezcalmos/Shared/graphql/restaurant_operator/hsRestaurantOperator.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Operators/Operator.dart';
import 'package:mezcalmos/Shared/models/Utilities/NotificationInfo.dart';

class RestaurantOpAuthController extends GetxController {
  Rxn<Operator> operator = Rxn();
  final int operatorUserId = Get.find<AuthController>().hasuraUserId!;
  AuthController _authController = Get.find<AuthController>();

  BackgroundNotificationsController _notificationsController =
      Get.find<BackgroundNotificationsController>();
  RxnInt _restaurantId = RxnInt();
  RxnInt _restaurantdetailsId = RxnInt();

  int? get restaurantId => _restaurantId.value;
  int? get detailsId => _restaurantdetailsId.value;

  @override
  void onInit() {
    // ------------------------------------------------------------------------
    mezDbgPrint("RestaurantAuthController: init $hashCode");
    mezDbgPrint(
        "RestaurantAuthController: calling handle state change first time");
    // Todo @m66are remove this restaurant id hard code

    setupRestaurantOperator().then((value) {
      if (restaurantId != null) {
        get_restaurant_details_id(restaurantId: restaurantId!)
            .then((int value) => _restaurantdetailsId.value = value);
      }
      if (operator.value?.info.hasuraId != null) {
        unawaited(_authController.saveNotificationToken());
      }
    });

    super.onInit();
  }

  Future<void> setupRestaurantOperator() async {
    operator.value = await get_restaurant_operator(userId: operatorUserId);
    if (operator.value != null) {
      _restaurantId.value = operator.value!.state.serviceProviderId;
    }

    mezDbgPrint("👑👑 Restaurant Operator :: ${operator.value?.toJson()}");
  }

  @override
  void onClose() {
    super.onClose();
  }
}
