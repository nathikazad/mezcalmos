import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryApp/controllers/deliveryAuthController.dart';
import 'package:mezcalmos/Shared/cloudFunctions/index.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart' as cm;
import 'package:mezcalmos/Shared/graphql/delivery_order/mutations/hsDeliveryOrderMutations.dart';
import 'package:mezcalmos/Shared/graphql/delivery_order/queries/hsDleiveryOrderQuerries.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/DeliveryOrder/DeliveryOrder.dart';

class DvOrderViewController {
  late int orderId;
  Rxn<DeliveryOrder> _order = Rxn<DeliveryOrder>();
  DeliveryAuthController _deliveryAuthController =
      Get.find<DeliveryAuthController>();
  TextEditingController priceTxt = TextEditingController();

  // getters //
  DeliveryOrder? get order => _order.value;
  bool get hasData => _order.value != null;
  bool get showAccept =>
      _order.value != null && _order.value!.driverInfo == null;
  bool get showFinish =>
      _order.value != null && !showAccept && _order.value!.inProcess();

  void init({required int orderId}) {
    this.orderId = orderId;
    _fetchOrder();
  }

  Future<void> _fetchOrder() async {
    _order.value = null;
    _order.value =
        await get_driver_order_by_id(orderId: orderId, withCache: false);
  }

  Future<void> acceptOrder({required double deliveryCost}) async {
    try {
      final bool res = await update_dvorder_driver_and_cost(
          driverId: _deliveryAuthController.driverId!,
          cost: deliveryCost,
          orderId: orderId);
      if (res) {
        showSavedSnackBar(
            title: "Assigned", subtitle: "You are assigned to this order");
        await (_fetchOrder());
        mezDbgPrint("ORDER REFETCH =============>${order?.driverInfo}");
      } else {
        showErrorSnackBar(errorText: "Driver Already Assigned");
      }
    } catch (e) {
      mezDbgPrint(e);
      showErrorSnackBar();
    }
  }

  Future<void> openRestaurantWhatsapp() async {
    final String? phoneNumber = order?.serviceProvider.phoneNumber;
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

  Future<void> openCustomerWhatsapp() async {
    final String? phoneNumber = order?.customer.phoneNumber;
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

  Future<void> finishOrder() async {
    try {
      final cm.ChangeDeliveryStatusResponse res =
          await CloudFunctions.delivery3_changeStatus(
              deliveryId: orderId, newStatus: cm.DeliveryOrderStatus.Delivered);
      if (res.success) {
        showSavedSnackBar();
        await _fetchOrder();
      } else
        showErrorSnackBar(errorText: res.error.toString());
    } catch (e, stk) {
      mezDbgPrint(e);
      mezDbgPrint(stk);
      showErrorSnackBar();
    }
  }

  Future<void> cancelOrder() async {
    try {
      final cm.ChangeDeliveryStatusResponse res =
          await CloudFunctions.delivery3_changeStatus(
              deliveryId: orderId,
              newStatus: cm.DeliveryOrderStatus.CancelledByDeliverer);
      if (res.success) {
        showSavedSnackBar();
        await _fetchOrder();
      } else
        showErrorSnackBar(errorText: res.error.toString());
    } catch (e, stk) {
      mezDbgPrint(e);
      mezDbgPrint(stk);
      showErrorSnackBar();
    }
  }
}
