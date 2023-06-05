import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/cloudFunctions/index.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/buisness_order/hsBusinessOrder.dart';
import 'package:mezcalmos/Shared/graphql/business_rental/hsBusinessRental.dart';
import 'package:mezcalmos/Shared/helpers/BusinessHelpers/BusinessItemHelpers.dart';
import 'package:mezcalmos/Shared/helpers/BusinessHelpers/BusinessOrderHelper.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';

class BsHomeRentalOrderViewController {
  // instances //
  HasuraDb _hasuraDb = Get.find<HasuraDb>();

  //
  Rxn<BusinessOrder> _order = Rxn<BusinessOrder>();
  RxBool _isLoading = false.obs;
  bool get isLoading => _isLoading.value;
  BusinessOrder? get order => _order.value;
  UserInfo? get customer => order?.customer;
  bool get hasChanges =>
      (order?.items.any((BusinessOrderItem element) =>
              element.parameters.previousCost != null ||
              element.parameters.previoustime != null) ??
          false) &&
      order?.status == BusinessOrderRequestStatus.RequestReceived;
  // stream //
  StreamSubscription<BusinessOrder?>? orderStream;
  String? subscriptionId;
  //

  late int orderId;
  Future<void> init({required int orderId}) async {
    _isLoading.value = true;
    this.orderId = orderId;
    BusinessOrder? res =
        await get_home_rental_order_req(orderId: orderId, withCache: false);
    if (res == null) {
      showErrorSnackBar(
          errorText: "Invalid order id", duration: const Duration(seconds: 3));
      return;
    }
    _order.value = res;

    subscriptionId = _hasuraDb.createSubscription(start: () {
      orderStream = listen_home_rental_order_req(id: orderId)
          .listen((BusinessOrder? event) {
        if (event != null) {
          mezDbgPrint(
              "Stream triggred from order controller ✅✅✅✅✅✅✅✅✅ =====> $event");

          _order.value = null;
          _order.value = event;
        }
      });
    }, cancel: () {
      orderStream?.cancel();
      orderStream = null;
    });

    _isLoading.value = false;
  }

  void dispose() {
    if (subscriptionId != null) _hasuraDb.cancelSubscription(subscriptionId!);
    _order.close();
  }

  // methods for order item //
  Future<void> updateItemTime(
      {required int itemId, required DateTime newTime}) async {
    BusinessOrderItem? item = order?.items
        .firstWhereOrNull((BusinessOrderItem element) => element.id == itemId);
    if (item == null) {
      showErrorSnackBar(errorText: "there no item with id $itemId");
      return;
    }

    final res = await update_bs_order_item(
        id: itemId,
        item: item.copyWith(
            time: newTime.toUtc().toString(),
            parameters: item.parameters.copyWith(
              previoustime: item.time,
            )));
  }

  Future<void> updateItemPrice({required itemId, required num newPrice}) async {
    BusinessOrderItem? item = order?.items
        .firstWhereOrNull((BusinessOrderItem element) => element.id == itemId);
    if (item == null) {
      showErrorSnackBar(errorText: "there no item with id $itemId");
      return;
    }

    final res = await update_bs_order_item(
        id: itemId,
        item: item.copyWith(
            cost: newPrice,
            parameters: item.parameters.copyWith(
              previousCost: item.cost,
            )));
  }

  Future<void> requestChanges() async {
    try {
      final HandleRequestResponse res =
          await CloudFunctions.business_handleOrderRequestByAdmin(
              orderRequestId: orderId,
              newStatus:
                  BusinessOrderRequestStatus.ModificationRequestByBusiness);
    } on FirebaseException catch (e, stk) {
      showErrorSnackBar(errorText: e.message ?? "Error");
      mezDbgPrint(e);
      mezDbgPrint(stk);
    } catch (e, stk) {
      showErrorSnackBar();
      mezDbgPrint(e);
      mezDbgPrint(stk);
    }
  }
}
