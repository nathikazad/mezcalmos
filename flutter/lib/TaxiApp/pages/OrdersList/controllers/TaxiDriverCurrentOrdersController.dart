import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/delivery_driver/hsDeliveryDriver.dart';
import 'package:mezcalmos/Shared/graphql/taxi/order/hsTaxiOrder.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder/TaxiOrder.dart';
import 'package:mezcalmos/TaxiApp/controllers/TaxiAuthController.dart';
import 'package:mezcalmos/TaxiApp/pages/TaxiOrderView/TaxiOrderView.dart';

class TaxiCurrentOrdersController {
  //instances
  TaxiAuthController opAuthController = Get.find<TaxiAuthController>();
  HasuraDb hasuraDb = Get.find<HasuraDb>();

  // vars
  RxList<TaxiOrder> currentOrders = <TaxiOrder>[].obs;
  RxList<TaxiOrder> openOrders = <TaxiOrder>[].obs;

  RxBool initalized = RxBool(false);
  int get driverId => opAuthController.driver!.deliveryDriverId;
  RxBool _isOnline = RxBool(true);
  RxBool onlineClicked = RxBool(false);
  // paggination //
  ScrollController scrollController = ScrollController();
  final int openOrdersFetchSize = 20;
  int _openOrdersCurrentOffset = 0;
  bool _openOrdersFetchingData = false;
  bool _openOrdersReachedEndOfData = false;
// streams
  StreamSubscription<List<TaxiOrder>?>? currentOrdersListener;
  StreamSubscription<List<TaxiOrder>?>? openOrdersListener;
  String? subscriptionId;

// getters

  bool get isOnline => _isOnline.value;

  Future<void> init() async {
    _isOnline.value = opAuthController.driver!.deliveryDriverState.online;

    await Future.wait(
        <Future<void>>[_fetchCurrentOrders(), _fetchOpenOrders()]);

    _listenOnOrders();
  }

  Future<void> _fetchOpenOrders() async {
    if (_openOrdersFetchingData || _openOrdersReachedEndOfData) {
      return;
    }
    try {
      mezDbgPrint(
          "👋 _fetchopenOrderses called with ferchSize : $openOrdersFetchSize offset: $_openOrdersCurrentOffset");
      _openOrdersFetchingData = true;
      final List<TaxiOrder>? newList = await get_taxi_delivery_minimal_orders(
          status: MinimalDeliveryOrderStatus.Open,
          limit: openOrdersFetchSize,
          offset: _openOrdersCurrentOffset);
      openOrders.value += newList ?? <TaxiOrder>[];
      if (newList?.length == 0) {
        _openOrdersReachedEndOfData = true;
      }

      _openOrdersCurrentOffset += openOrdersFetchSize;
    } catch (e) {
      mezDbgPrint(e);
    } finally {
      _openOrdersFetchingData = false;
    }
  }

  Future<void> _fetchCurrentOrders() async {
    try {
      currentOrders.value = await get_taxi_delivery_minimal_orders(
              status: MinimalDeliveryOrderStatus.InProcess,
              driverId: driverId,
              limit: 30,
              offset: 0) ??
          <TaxiOrder>[];
      mezDbgPrint("Current Orders length ======>${currentOrders.length}");
    } catch (e, stk) {
      mezDbgPrint(e);
      mezDbgPrint(stk);
      // TODO
    }
  }

  void _listenOnOrders() {
    subscriptionId = hasuraDb.createSubscription(start: () {
      currentOrdersListener = listen_taxi_delivery_minimal_orders(
              status: MinimalDeliveryOrderStatus.InProcess,
              driverId: driverId,
              limit: 30,
              offset: 0)
          .listen((List<TaxiOrder>? event) {
        if (event != null) {
          currentOrders.value = event;
        }
      });
      openOrdersListener = listen_taxi_delivery_minimal_orders(
              status: MinimalDeliveryOrderStatus.Open,
              driverId: null,
              limit: openOrdersFetchSize,
              offset: 0)
          .listen((List<TaxiOrder>? event) {
        if (event != null) {
          mezDbgPrint(
              "😇  Setting open orders from listners ::::::=================>${event.length}");
          openOrders.value = event;
        }
      });
    }, cancel: () {
      currentOrdersListener?.cancel();
      currentOrdersListener = null;
      openOrdersListener?.cancel();
      openOrdersListener = null;
    });
  }

  Future<void> switchOnlineStatus(bool value) async {
    onlineClicked.value = true;
    _isOnline.value = value;
    _isOnline.refresh();
    _isOnline.value = await switch_driver_online_status_by_id(
            driverId: opAuthController.driver!.deliveryDriverId,
            online: value) ??
        _isOnline.value;

    _isOnline.refresh();
    // if (value) {
    //   unawaited(opAuthController
    //       .setupDeliveryDriver()
    //       .then((value) => opAuthController.startLocationListener()));
    // } else {
    //   opAuthController.cancelLocationListener();
    // }

    onlineClicked.value = false;
  }

  Future<void> finishAllOrders() async {
    // final List<String> numbers = currentOrders
    //     .map((DeliveryMinimalOrder element) => element.phone_number.toString())
    //     .toList();
    // try {
    //   final MarkMessagesResponse res =
    //       await CloudFunctions.whatsapp_markMessagesAsFinished(
    //           phoneNumbers: numbers);
    //   if (res.success) {
    //     showSavedSnackBar(
    //         title: "Finished", subtitle: "All messgaes are finished");
    //   }
    // } catch (e, stk) {
    //   showErrorSnackBar();
    //   mezDbgPrint(e);
    //   mezDbgPrint(stk);
    // }
  }

  void dispose() {
    if (subscriptionId != null) hasuraDb.cancelSubscription(subscriptionId!);
  }

  void handleNavigation({required int orderId}) {
    TaxiOrderView.navigate(orderId: orderId, driverId: null);
  }
}