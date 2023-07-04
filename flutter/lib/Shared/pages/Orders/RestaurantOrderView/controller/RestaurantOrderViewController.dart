import 'dart:async';

import 'package:get/get.dart';
import 'package:mezcalmos/Shared/cloudFunctions/index.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart' as cModels;
import 'package:mezcalmos/Shared/controllers/MGoogleMapController.dart';
import 'package:mezcalmos/Shared/controllers/foregroundNotificationsController.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/order/hsRestaurantOrder.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/pages/Orders/RestaurantOrderView/RestaurantOrderView.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';

class RestaurantOrderViewController {
  // instances //
  final MGoogleMapController mGoogleMapController = MGoogleMapController(
    enableMezSmartPointer: true,
  );
  HasuraDb hasuraDb = Get.find<HasuraDb>();
  // vars //
  Rxn<RestaurantOrder> order = Rxn();
  cModels.RestaurantOrderStatus? _statusSnapshot;

  // getters //
  cModels.RestaurantOrderStatus get orderStatus {
    return order.value!.status;
  }

  // streams //
  StreamSubscription<RestaurantOrder?>? orderStream;
  String? subscriptionId;

  // init
  Future<void> init({required int orderId}) async {
    MezRouter.registerReturnToViewCallback(
        RestaurantOrderView.constructPath(orderId), () {
      clearNotifications(orderId);
    });
    clearNotifications(orderId);
    try {
      order.value =
          await get_restaurant_order_by_id(orderId: orderId, withCache: false);
      if (order.value!.routeInformation != null) {
        mezDbgPrint(
            "Order router informations ====🥸🥸🥸🥸===== => ${order.value!.driverInfo?.toFirebaseFormatJson()}");
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
        orderStream = listen_on_restaurant_order_by_id(orderId: orderId)
            .listen((RestaurantOrder? event) {
          mezDbgPrint(event);
          if (event != null) {
            mezDbgPrint(
                "Stream triggred from order controller ✅✅✅✅✅✅✅✅✅ =====> ${event.driverInfo?.toFirebaseFormatJson()}");
            order.value = null;
            order.value = event;
            order.value?.driverInfo = event.driverInfo;
          }
        });
      }, cancel: () {
        orderStream?.cancel();
        orderStream = null;
      });
    }
  }

// Order status change methods

  Future<cModels.ChangeRestaurantStatusResponse> setReadyForDelivery() async {
    return CloudFunctions.restaurant3_readyForOrderPickup(
        orderId: order.value!.orderId);
  }

  Future<cModels.ChangeRestaurantStatusResponse> prepareOrder() async {
    return CloudFunctions.restaurant3_prepareOrder(
        orderId: order.value!.orderId);
  }

  Future<cModels.ChangeRestaurantStatusResponse> cancelOrder() async =>
      CloudFunctions.restaurant3_cancelOrderFromAdmin(
          orderId: order.value!.orderId);

// dispose
  void dispose() {
    if (subscriptionId != null) hasuraDb.cancelSubscription(subscriptionId!);
    order.close();
  }

  void clearNotifications(int orderId) {
    Get.find<ForegroundNotificationsController>().clearAllOrderNotifications(
        orderType: cModels.OrderType.Restaurant, orderId: orderId);
  }
}
