import 'dart:async';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/courier_order/hsCourierOrder.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/Courier/CourierOrder.dart';
import 'package:mezcalmos/Shared/models/Orders/DeliveryOrder/utilities/DeliveryOrderStatus.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServerResponse.dart';

class CustCourierOrderViewController {
  // instances //

  HasuraDb hasuraDb = Get.find<HasuraDb>();
  // vars //
  Rxn<CourierOrder> _order = Rxn();

  // getters //
  bool get hasData => _order.value != null;
  CourierOrder get order => _order.value!;
  DeliveryOrderStatus get orderStatus {
    return _order.value!.status;
  }

  // streams //
  StreamSubscription<CourierOrder?>? orderStream;
  String? subscriptionId;

  // init
  Future<void> init({required int orderId}) async {
    try {
      _order.value = await get_courier_order_by_id(
        orderId: orderId,
      );
    } catch (e, stk) {
      mezDbgPrint(e);
      mezDbgPrint(stk);
    }
    if (_order.value == null) {
      mezDbgPrint("🚨 Can't get order $orderId 🚨 ROpOrderViewController");
    } else {
      subscriptionId = hasuraDb.createSubscription(start: () {
        orderStream = listen_on_courier_order_by_id(orderId: orderId)
            .listen((CourierOrder? event) {
          if (event != null) {
            mezDbgPrint(
                "Stream triggred from order controller ✅✅✅✅✅✅✅✅✅ =====> $event");
            _order.value = event;
          }
        });
      }, cancel: () {
        orderStream?.cancel();
        orderStream = null;
      });
    }
  }

// Order status change methods

  Future<ServerResponse> addReview({
    required int orderId,
    required int serviceId,
    required String comment,
    required OrderType orderType,
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
    // try {
    //   await CloudFunctions.del(
    //       orderId: order.value!.orderId);
    //   return true;
    // } on FirebaseFunctionsException catch (e, stk) {
    //   showErrorSnackBar(errorText: e.message.toString());
    //   mezDbgPrint(stk);
    //   mezDbgPrint(e);
    //   return false;
    // } catch (e) {
    //   mezDbgPrint(e);
    //   return false;
    // }
    return true;
  }

  void dispose() {
    if (subscriptionId != null) hasuraDb.cancelSubscription(subscriptionId!);
    _order.close();
  }
}
