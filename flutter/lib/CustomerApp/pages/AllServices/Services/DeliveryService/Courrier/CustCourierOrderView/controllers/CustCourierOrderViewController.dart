import 'dart:async';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/DeliveryService/Courrier/CustCourierOrderView/CustCourierOrderView.dart';
import 'package:mezcalmos/Shared/cloudFunctions/index.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart' as cModels;
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/foregroundNotificationsController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/courier_order/hsCourierOrder.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/NumHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/Courier/CourierOrder.dart';
import 'package:mezcalmos/Shared/models/Orders/DeliveryOrder/utilities/ChangePriceRequest.dart';
import 'package:mezcalmos/Shared/models/Orders/DeliveryOrder/DeliveryOrder.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
    ["pages"]["courrier"]["CustCourierOrderView"];

class CustCourierOrderViewController {
  // instances //

  HasuraDb hasuraDb = Get.find<HasuraDb>();
  // vars //
  bool isChangePricePopUp = false;
  late BuildContext context;
  Rxn<CourierOrder> _order = Rxn();
  Rxn<ChangePriceRequest> changePriceReq = Rxn();

  // getters //
  bool get hasData => _order.value != null;
  CourierOrder get order => _order.value!;
  cModels.DeliveryOrderStatus get orderStatus {
    return _order.value!.status;
  }

  // streams //
  StreamSubscription<CourierOrder?>? orderStream;
  String? subscriptionId;

  // init
  Future<void> init(
      {required int orderId, required BuildContext context}) async {
    this.context = context;
    MezRouter.registerReturnToViewCallback(
        CustCourierOrderView.constructPath(orderId), () {
      clearNotifications(orderId);
    });
    clearNotifications(orderId);
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
            _order.value = null;
            _order.value = event;

            _order.refresh();
            if (event.costs.changePriceRequest != null &&
                event.costs.changePriceRequest?.status ==
                    ChangePriceRequestStatus.Requested &&
                !isChangePricePopUp) {
              mezDbgPrint("Should Showwwww");
              showPriceReqDialog();
            }
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
        orderType: cModels.OrderType.Courier, orderId: orderId);
  }

  void showPriceReqDialog() {
    mezDbgPrint("Show dialog called");
    isChangePricePopUp = true;
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            scrollable: false,
            contentPadding:
                const EdgeInsets.only(bottom: 0, top: 16, left: 16, right: 16),
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
                        color: Color(0xFFECEEFF), shape: BoxShape.circle),
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
                    "${_i18n()['priceChangeTitle']}",
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text("${_i18n()['newPrice']}",
                          style: context.textTheme.displaySmall
                              ?.copyWith(fontSize: 20)),
                      SizedBox(
                        height: 5,
                      ),
                      Text(order.costs.changePriceRequest?.newPrice
                              .toPriceString() ??
                          "-"),
                      if (order.costs.changePriceRequest?.reason != null &&
                          order.costs.changePriceRequest!.reason.isNotEmpty)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Divider(
                              height: 20,
                            ),
                            Text(
                              "${_i18n()['reason']}",
                              style: context.textTheme.bodyLarge,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(order.costs.changePriceRequest?.reason ?? ""),
                          ],
                        ),
                      SizedBox(
                        height: 8,
                      ),
                    ],
                  ),
                  MezButton(
                    label: "${_i18n()['accept']}",
                    onClick: () async {
                      await _priceChangeResponse(accepted: true);
                      isChangePricePopUp = false;
                      Navigator.pop(context);
                    },
                  ),
                  MezButton(
                    label: "${_i18n()['cancelOrder']}",
                    height: 50,
                    backgroundColor: Colors.transparent,
                    textColor: Colors.grey.shade900,
                    onClick: () async {
                      await _priceChangeResponse(accepted: false);
                      isChangePricePopUp = false;
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
      cModels.ChangePriceResResponse res =
          await CloudFunctions.delivery2_changeDeliveryPriceResponse(
              accepted: accepted,
              orderId: order.orderId,
              orderType: cModels.OrderType.Courier);
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

  Future<void> addReview({
    required String comment,
    required num rate,
  }) async {
    //CloudFunctions.res
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

  bool equalEstActCost(int index) =>
      order.items[index].actualCost == order.items[index].estCost;
  bool isEstCostNull(int index) => order.items[index].estCost == null;
  bool isActCostNull(int index) => order.items[index].actualCost == null;

  void dispose() {
    if (subscriptionId != null) hasuraDb.cancelSubscription(subscriptionId!);
    _order.close();
  }
}
