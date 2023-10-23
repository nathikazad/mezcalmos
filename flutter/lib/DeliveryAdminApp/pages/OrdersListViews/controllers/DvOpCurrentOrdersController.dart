import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryAdminApp/controllers/deliveryAdminAuth.dart';
import 'package:mezcalmos/DeliveryApp/pages/DvConvoView/DvConvoView.dart';
import 'package:mezcalmos/DeliveryApp/pages/DvOrderView/DvOrderView.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/delivery_order/queries/hsDleiveryOrderQuerries.dart';
import 'package:mezcalmos/Shared/graphql/delivery_order/subscriptions/hsDeliveryOrderSubscriptions.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';

class DvOpCurrentOrdersController {
  //instances
  DeliveryOpAuthController opAuthController =
      Get.find<DeliveryOpAuthController>();
  HasuraDb hasuraDb = Get.find<HasuraDb>();

  // vars
  RxList<DeliveryMinimalOrder> currentOrders = <DeliveryMinimalOrder>[].obs;
  RxList<DeliveryMinimalOrder> openOrders = <DeliveryMinimalOrder>[].obs;

  late int companyId;
  // paggination //
  ScrollController scrollController = ScrollController();
  final int openOrdersFetchSize = 20;
  int _openOrdersCurrentOffset = 0;
  bool _openOrdersFetchingData = false;
  bool _openOrdersReachedEndOfData = false;
// streams
  StreamSubscription<List<DeliveryMinimalOrder>?>? currentOrdersListener;
  StreamSubscription<List<DeliveryMinimalOrder>?>? openOrdersListener;
  String? subscriptionId;
  // Rxn<Restaurant> restaurant = Rxn();

// streams

// getters
  bool get hasData => currentOrders.value != null;

  Future<void> init() async {
    companyId = opAuthController.companyId!;
    mezDbgPrint("INIT ORDERS 👋👋👋👋👋👋 CopmpanyId id $companyId");
    mezDbgPrint("hasData before await =======>$hasData");

    await Future.wait(
        <Future<void>>[_fetchCurrentOrders(), _fetchOpenOrders()]);

    _listenOnOrders();
    mezDbgPrint("hasData after await =======>$hasData");
    mezDbgPrint("hasData after await =======>${currentOrders.value.length}");
  }

  Future<void> _fetchOpenOrders() async {
    if (_openOrdersFetchingData || _openOrdersReachedEndOfData) {
      return;
    }
    try {
      mezDbgPrint(
          "👋 _fetchopenOrderses called with ferchSize : $openOrdersFetchSize offset: $_openOrdersCurrentOffset");
      _openOrdersFetchingData = true;
      final List<DeliveryMinimalOrder>? newList =
          await get_delivery_minimal_orders(
              status: MinimalDeliveryOrderStatus.Open,
              limit: openOrdersFetchSize,
              offset: _openOrdersCurrentOffset);
      openOrders.value += newList ?? <DeliveryMinimalOrder>[];
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
      //  openOrders.value = await get_delivery_minimal_orders(withCache: false);

      currentOrders.value = await get_delivery_minimal_orders(
              status: MinimalDeliveryOrderStatus.InProcess,
              driverId: null,
              forCompany: true,
              limit: 30,
              offset: 0) ??
          <DeliveryMinimalOrder>[];
      mezDbgPrint("Orders length ======>${openOrders.length}");
    } catch (e, stk) {
      mezDbgPrint(e);
      mezDbgPrint(stk);
      // TODO
    }
  }

  void _listenOnOrders() {
    subscriptionId = hasuraDb.createSubscription(start: () {
      currentOrdersListener = listen_delivery_minimal_orders(
              status: MinimalDeliveryOrderStatus.InProcess,
              driverId: null,
              forCompany: true,
              limit: 30,
              offset: 0)
          .listen((List<DeliveryMinimalOrder>? event) {
        if (event != null) {
          currentOrders.value = event;
        }
      });
      openOrdersListener = listen_delivery_minimal_orders(
              status: MinimalDeliveryOrderStatus.Open,
              driverId: null,
              limit: openOrdersFetchSize,
              offset: 0)
          .listen((List<DeliveryMinimalOrder>? event) {
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

  void handleNavigation({required DeliveryMinimalOrder order}) {
    mezDbgPrint("CLicked");
    if (order.delivery_order_type == MinimalDeliveryOrderType.Message) {
      DvConvoView.navigate(phoneNumber: order.phone_number!);
    } else {
      DvOrderView.navigate(orderId: order.id.toInt(), driverId: null);
    }
  }

  void dispose() {
    if (subscriptionId != null) hasuraDb.cancelSubscription(subscriptionId!);
    currentOrders.close();
  }
}
