import 'dart:async';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/DeliveryServices/Courrier/CustCourierOrderView/CustCourierOrderView.dart';
import 'package:mezcalmos/Shared/cloudFunctions/index.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart' as cModels;
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/foregroundNotificationsController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/courier_order/hsCourierOrder.dart';
import 'package:mezcalmos/Shared/graphql/delivery_order/mutations/hsDeliveryOrderMutations.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/NumHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/services/DeliveryOfferHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/Courier/CourierOrder.dart';
import 'package:mezcalmos/Shared/models/Orders/DeliveryOrder/utilities/ChangePriceRequest.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:sizer/sizer.dart';

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

  bool get showDeliveryOffers =>
      !order.inStorePickup && order.inProcess() && order.driverInfo == null;

  Map<int, cModels.CounterOffer> get counterOffers {
    return order.counterOffers!.entries
        .where((MapEntry<int, cModels.CounterOffer> element) =>
            element.value.isExpired == false &&
            element.value.isRequested == true)
        .fold({}, (Map<int, cModels.CounterOffer> map,
            MapEntry<int, cModels.CounterOffer> entry) {
      map[entry.key] = entry.value;
      return map;
    });
  }

  // streams //
  StreamSubscription<CourierOrder?>? orderStream;
  String? subscriptionId;

  Null get sawNotifDrivers => null;

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
                EdgeInsets.symmetric(horizontal: 12.5.w, vertical: 15),
            // contentPadding:
            //     const EdgeInsets.symmetric(vertical: 12, horizontal: 22),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.center,
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
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text("${_i18n()['newPrice']}",
                    style:
                        context.textTheme.displaySmall?.copyWith(fontSize: 20)),
                SizedBox(
                  height: 5,
                ),
                Text(order.costs.changePriceRequest?.newPrice.toPriceString() ??
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
          );
        });
  }

  Future<void> _priceChangeResponse({required bool accepted}) async {
    try {
      // cModels.ChangePriceResResponse res =
      //     await CloudFunctions.delivery3_changeDeliveryPriceResponse(
      //         accepted: accepted,
      //         orderId: order.orderId,
      //         orderType: cModels.OrderType.Courier);
      // if (res.success == false) {
      //   mezDbgPrint(res.error);
      //   showErrorSnackBar(errorText: res.error.toString());
      // }
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
      await CloudFunctions.delivery3_cancelCourierFromCustomer(
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

  Future<void> acceptOffer({required int id}) async {
    mezDbgPrint("Assigning to order : ${order.deliveryOrderId!}");
    MapEntry<int, cModels.CounterOffer>? offer = order.counterOffers?.entries
        .firstWhere(
            (MapEntry<int, cModels.CounterOffer> element) => element.key == id);
    if (offer == null) {
      return;
    }
    if (offer.value.isExpired) {
      showErrorSnackBar(errorText: "This offer have been expired");
      return;
    }
    try {
      final cModels.AssignDriverResponse res =
          await CloudFunctions.delivery3_assignDriver(
              deliveryOrderId: order.deliveryOrderId!, deliveryDriverId: id);
      mezDbgPrint("response ===>${res.toFirebaseFormattedJson()}");
      if (res.success) {
        showSavedSnackBar(
            title: "Picked", subtitle: "Driver picked successfully");
      } else {
        mezDbgPrint("🔴 Error =>${res.error} ");
        mezDbgPrint("🔴 Error =>${res.unhandledError} ");
      }
    } on FirebaseFunctionsException catch (e) {
      mezDbgPrint(e);
      showErrorSnackBar(errorText: e.message.toString());
    } catch (e, stk) {
      mezDbgPrint(e);
      mezDbgPrint(stk);
    }
  }

  Future<void> rejectOffer({required int id}) async {
    Map<int, cModels.CounterOffer>? offers = _order.value!.counterOffers;
    if (offers != null) {
      offers[id]?.status = cModels.CounterOfferStatus.Rejected;
      final bool res = await update_delivery_order_offers(
          offers: offers, orderId: order.deliveryOrderId!);
      if (res == true) {
        showSavedSnackBar(
            title: "Rejected", subtitle: "Offer rejected successfully");
      }
    }
  }
}
