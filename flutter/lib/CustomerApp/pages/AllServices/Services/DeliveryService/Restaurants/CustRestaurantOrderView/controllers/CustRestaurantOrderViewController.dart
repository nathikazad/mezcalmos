import 'dart:async';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/cloudFunctions/index.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart' as cModels;
import 'package:mezcalmos/Shared/controllers/MGoogleMapController.dart';
import 'package:mezcalmos/Shared/controllers/foregroundNotificationsController.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/order/hsRestaurantOrder.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServerResponse.dart';

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

  StreamSubscription<RestaurantOrder?>? orderStream;
  String? subscriptionId;

  Future<void> init({required int orderId}) async {
    mezDbgPrint(
        '======================================================================> $orderId');
    Get.find<ForegroundNotificationsController>().clearAllOrderNotifications(
        orderType: cModels.OrderType.Restaurant, orderId: orderId);
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
        orderStream = listen_on_restaurant_order_by_id(orderId: orderId)
            .listen((RestaurantOrder? event) {
          if (event != null) {
            mezDbgPrint(
                "Stream triggred from order controller ✅✅✅✅✅✅✅✅✅ =====> $event");

            order.value = null;
            order.value = event;
          }
        });
      }, cancel: () {
        orderStream?.cancel();
        orderStream = null;
      });
    }
  }

  Future<ServerResponse> addReview({
    required int orderId,
    required int serviceId,
    required String comment,
    required cModels.OrderType orderType,
    required num rate,
  }) async {
    final HttpsCallable cancelOrder =
        FirebaseFunctions.instance.httpsCallable('restaurant-addReview');
    try {
      final HttpsCallableResult<dynamic> response =
          await cancelOrder.call(<String, dynamic>{
        "orderId": orderId,
        "serviceProviderId": serviceId,
        "rating": rate,
        "comment": comment,
        "orderType": orderType.toFirebaseFormatString(),
      });
      mezDbgPrint(response.toString());
      print(response.data);
      return ServerResponse.fromJson(response.data);
    } catch (e) {
      return ServerResponse(ResponseStatus.Error,
          errorMessage: "Server Error", errorCode: "serverError");
    }
  }

  Future<bool> cancelOrder() async {
    try {
      final cModels.CancelRestaurantOrderResponse res =
          await CloudFunctions.restaurant2_cancelOrderFromCustomer(
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
}
