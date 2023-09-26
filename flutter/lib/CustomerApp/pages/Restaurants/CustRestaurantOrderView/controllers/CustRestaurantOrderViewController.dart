import 'dart:async';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/CustRestaurantOrderView/CustRestaurantOrderView.dart';
import 'package:mezcalmos/Shared/cloudFunctions/index.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart' as cModels;
import 'package:mezcalmos/Shared/controllers/MGoogleMapController.dart';
import 'package:mezcalmos/Shared/controllers/foregroundNotificationsController.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/order/hsRestaurantOrder.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/models/User.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';

class CustRestaurantOrderViewController {
  final MGoogleMapController mGoogleMapController = MGoogleMapController(
    enableMezSmartPointer: true,
  );
  HasuraDb hasuraDb = Get.find<HasuraDb>();

  Rxn<RestaurantOrder> order = Rxn();
  cModels.RestaurantOrderStatus? _statusSnapshot;

  cModels.RestaurantOrderStatus get orderStatus {
    return order.value!.status;
  }

  StreamSubscription<UserInfo?>? orderStream;
  String? subscriptionId;
  // getters
  bool get showReviewBtn {
    return order.value != null &&
        order.value!.status == cModels.RestaurantOrderStatus.Delivered &&
        order.value!.review == null;
  }

  Future<void> init({required int orderId}) async {
    mezDbgPrint(
        '======================================================================> $orderId');
    MezRouter.registerReturnToViewCallback(
        CustRestaurantOrderView.constructPath(orderId), () {
      clearNotifications(orderId);
    });
    clearNotifications(orderId);
    try {
      order.value =
          await get_restaurant_order_by_id(orderId: orderId, withCache: false);
      if (order.value!.routeInformation != null) {
        mGoogleMapController.decodeAndAddPolyline(
            encodedPolylineString: order.value!.routeInformation!.polyline);
      }
    } catch (e, stk) {
      mezDbgPrint(e);
      mezDbgPrint(stk);
    }
    if (order.value == null) {
      mezDbgPrint("🚨 Can't get order $orderId 🚨 ROpOrderViewController");
    } else {
      subscriptionId = hasuraDb.createSubscription(start: () {
        orderStream = listen_on_restaurant_order_driver(orderId: orderId)
            .listen((UserInfo? event) {
          mezDbgPrint(event);
          if (event != null) {
            mezDbgPrint(
                "Stream triggred from order controller ✅✅✅✅✅✅✅✅✅ =====> ${event.toFirebaseFormatJson()}");

            order.value?.driverInfo = event;
          }
        });
      }, cancel: () {
        orderStream?.cancel();
        orderStream = null;
      });
    }
  }

  void clearNotifications(int orderId) {
    Get.find<ForegroundNotificationsController>().clearAllOrderNotifications(
        orderType: cModels.OrderType.Restaurant, orderId: orderId);
  }

  Future<bool> cancelOrder() async {
    try {
      final cModels.CancelRestaurantOrderResponse res =
          await CloudFunctions.restaurant3_cancelOrderFromCustomer(
              orderId: order.value!.orderId);
      if (res.success == false) {
        mezDbgPrint(res.error);
        showErrorSnackBar(errorText: res.error.toString());
      }
      return res.success;
    } on FirebaseFunctionsException catch (e, stk) {
      showErrorSnackBar(errorText: e.message.toString());
      mezDbgPrint(stk);
      mezDbgPrint(e);
      return false;
    } catch (e) {
      mezDbgPrint(e);
      return false;
    }
  }

  void dispose() {
    if (subscriptionId != null) hasuraDb.cancelSubscription(subscriptionId!);
    order.close();
  }

  Future<void> openDriverWhatsapp() async {
    final String? phoneNumber = order.value?.driverInfo?.phoneNumber;
    if (phoneNumber != null) {
      try {
        final bool res = await callWhatsappNumber(phoneNumber);
      } catch (e) {
        showErrorSnackBar();
        mezDbgPrint(e);
      }
    } else
      mezDbgPrint("Phone number is null 🥲");
  }

  Future<void> openRestaurantWhatsapp() async {
    final String? phoneNumber = order.value?.restaurant.phoneNumber;
    if (phoneNumber != null) {
      try {
        final bool res = await callWhatsappNumber(phoneNumber);
      } catch (e) {
        showErrorSnackBar();
        mezDbgPrint(e);
      }
    } else
      mezDbgPrint("Phone number is null 🥲");
  }

  Future<void> contactAdmin() async {
    final String phoneNumber = "+12098628445";
    try {
      final bool res = await callWhatsappNumber(phoneNumber);
    } catch (e) {
      showErrorSnackBar();
      mezDbgPrint(e);
    }
  }
}
