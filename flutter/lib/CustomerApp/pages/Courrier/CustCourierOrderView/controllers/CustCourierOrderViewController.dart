import 'dart:async';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/cloudFunctions/index.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart' as cm;
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/courier_order/hsCourierOrder.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/NumHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/Courier/CourierOrder.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServerResponse.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';

class CustCourierOrderViewController {
  // instances //

  HasuraDb hasuraDb = Get.find<HasuraDb>();
  // vars //
  late BuildContext context;
  Rxn<CourierOrder> _order = Rxn();
  Rxn<ChangePriceRequest> changePriceReq = Rxn();

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
  Future<void> init(
      {required int orderId, required BuildContext context}) async {
    this.context = context;
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
          mezDbgPrint(
              "Stream triggred from order controller ✅✅✅✅✅✅✅✅✅ =====> ${event?.driverInfo}");

          _order.value = event;
          _order.value?.driverInfo = event?.driverInfo;
          if (event?.costs != null) {
            _order.value?.costs = event!.costs;
          }
          _order.refresh();

          if (event?.changePriceRequest != null &&
              event?.costs.deliveryCost == 0 &&
              event?.driverInfo != null) {
            mezDbgPrint("Should Showwwww");
            showPriceReqDialog();
          }
        });
      }, cancel: () {
        orderStream?.cancel();
        orderStream = null;
      });
    }
  }

  void showPriceReqDialog() {
    mezDbgPrint("Show dialog called");
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            scrollable: false,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 16, horizontal: 18),
            insetPadding:
                const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
            // contentPadding:
            //     const EdgeInsets.symmetric(vertical: 12, horizontal: 22),
            content: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: secondaryLightBlueColor, shape: BoxShape.circle),
                    padding: const EdgeInsets.all(16),
                    child: Icon(
                      Icons.price_change_rounded,
                      size: 35,
                      color: primaryBlueColor,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Price change request",
                    style: context.textTheme.displayMedium,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "New price",
                        style: context.textTheme.bodyLarge,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(order.changePriceRequest?.newPrice.toPriceString() ??
                          "20"),
                      Divider(
                        height: 20,
                      ),
                      Text(
                        "Reason",
                        style: context.textTheme.bodyLarge,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(order.changePriceRequest?.reason ?? "reason"),
                      SizedBox(
                        height: 8,
                      ),
                    ],
                  ),
                  MezButton(
                    label: "Accept",
                    onClick: () async {
                      await _priceChangeResponse(accepted: true);
                      Navigator.pop(context);
                    },
                  ),
                  MezButton(
                    label: "Cancel",
                    height: 50,
                    backgroundColor: Colors.transparent,
                    textColor: Colors.grey.shade900,
                    onClick: () async {
                      await _priceChangeResponse(accepted: false);
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
            ),
          );
        });
  }

  Future<void> _priceChangeResponse({required bool accepted}) async {
    try {
      ChangePriceResResponse res =
          await CloudFunctions.delivery2_changeDeliveryPriceResponse(
              accepted: accepted,
              orderId: order.orderId,
              orderType: cm.OrderType.Courier);
      if (res.success == false) {
        mezDbgPrint(res.error);
        showErrorSnackBar(errorText: res.error.toString());
      }
    } on FirebaseFunctionsException catch (e) {
      showErrorSnackBar(errorText: e.message.toString());
      mezDbgPrint(e);
    } catch (e, stk) {
      mezDbgPrint(e);
      mezDbgPrint(stk);
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
    try {
      await CloudFunctions.delivery2_cancelCourierFromCustomer(
          orderId: order.orderId);
      return true;
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
    _order.close();
  }
}
