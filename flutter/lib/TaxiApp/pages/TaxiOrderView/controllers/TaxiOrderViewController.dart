import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/cloudFunctions/index.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart' as cm;
import 'package:mezcalmos/Shared/graphql/taxi/order/hsTaxiOrder.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder/TaxiOrder.dart';

class TaxiOrderViewController {
  late int orderId;
  Rxn<TaxiOrder> _order = Rxn<TaxiOrder>();
  // TaxiAuthController _TaxiAuthController =
  //     Get.find<TaxiAuthController>();
  TextEditingController priceTxt = TextEditingController();

  // getters //
  TaxiOrder? get order => _order.value;
  bool get hasData => _order.value != null;
  bool get showAccept => isOpenOrder;
  bool get isOpenOrder => _order.value != null && _order.value!.driver == null;
  bool get showFinish =>
      _order.value != null &&
      _order.value!.driver != null &&
      _order.value!.inProcess;
  int? driverId;

  void init({required int orderId, int? driverId}) {
    this.driverId = driverId;
    this.orderId = orderId;
    _fetchOrder();
  }

  Future<void> _fetchOrder() async {
    _order.value = null;
    _order.value =
        await get_taxi_order_by_id(orderId: orderId, withCache: false);
  }

  Future<void> acceptOrder() async {
    try {
      final cm.TaxiAcceptResponse res =
          await CloudFunctions.taxi_acceptOrder(orderId: orderId);
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

  Future<void> openCustomerWhatsapp() async {
    final String? phoneNumber = order?.customer.phoneNumber;
    if (phoneNumber != null) {
      try {
        await callWhatsappNumber(phoneNumber);
      } catch (e) {
        showErrorSnackBar();
        mezDbgPrint(e);
      }
    } else
      mezDbgPrint("Phone number is null 🥲");
  }

  Future<void> finishOrder() async {
    try {
      final cm.TaxiFinishResponse res =
          await CloudFunctions.taxi_finishOrder(orderId: orderId);
      mezDbgPrint(res.toFirebaseFormattedJson());
      if (res.success) {
        showSavedSnackBar();

        // await _fetchOrder();
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
      final cm.cancelTaxiResponse res =
          await CloudFunctions.taxi_cancelOrder(orderId: orderId);
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

  // Future<void> openRestaurantMap() async {
  //   if (order?.pickupLocation != null) {
  //     final String mapUrl =
  //         getGMapsDirectionLink(null, order!.pickupLocation.toLatLng()!);
  //     try {
  //       await launchUrl(Uri.parse(mapUrl),
  //           mode: LaunchMode.externalApplication);
  //     } catch (e) {
  //       showErrorSnackBar();
  //       mezDbgPrint(e);
  //     }
  //   }
  // }

  // Future<void> openCustomerMap() async {
  //   // if (order?.dropOffLocation != null) {
  //   //   final String mapUrl =
  //   //       getGMapsDirectionLink(null, order!.dropOffLocation.toLatLng()!);
  //   //   try {
  //   //     await launchUrl(Uri.parse(mapUrl),
  //   //         mode: LaunchMode.externalApplication);
  //   //   } catch (e) {
  //   //     showErrorSnackBar();
  //   //     mezDbgPrint(e);
  //   //   }
  //   // }
  // }
}
