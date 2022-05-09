import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryAdminApp/controllers/taxiController.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/Orders/TaxiOrder/components/TaxiOpenOrderBottomCard.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/Orders/TaxiOrder/components/TaxiOrderBottomCard.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/Orders/TaxiOrder/components/TaxiOrderButtons.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/Orders/TaxiOrder/components/TaxiOrderMapComponent.dart';
import 'package:mezcalmos/Shared/controllers/MGoogleMapController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder/TaxiOrder.dart';
import 'package:mezcalmos/Shared/widgets/MezSnackbar.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["DeliveryAdminApp"]
    ["pages"]["Orders"]["TaxiOrder"]["TaxiOrderView"];

class TaxiOrderView extends StatefulWidget {
  const TaxiOrderView({Key? key}) : super(key: key);

  @override
  _TaxiOrderViewState createState() => _TaxiOrderViewState();
}

class _TaxiOrderViewState extends State<TaxiOrderView> {
  /// taxiOrderController
  TaxiOrderController taxiOrderController = Get.find<TaxiOrderController>();
  Rxn<TaxiOrder> order = Rxn<TaxiOrder>();
  late String orderId;
  StreamSubscription? _orderListener;
  TaxiOrdersStatus? _statusSnapshot;
  MGoogleMapController _mapController = MGoogleMapController();

  @override
  void initState() {
    orderId = Get.parameters['orderId']!;
    order.value = taxiOrderController.getOrder(orderId);
    if (order.value != null) {
      _updateMapByStatus(order.value!.status);
    }
    _orderListener = taxiOrderController
        .getOrderStream(orderId)
        .listen((TaxiOrder? newOrderEvent) {
      if (newOrderEvent != null) {
        order.value = newOrderEvent;
        _updateMapByStatus(newOrderEvent.status);
      }
    });

    waitForOrderIfNotLoaded().then((value) {
      if (order.value == null) {
        // ignore: inference_failure_on_function_invocation
        Future.delayed(Duration.zero, () {
          Get.back();
          MezSnackbar("Error", "Order does not exist");
        });
      }
    });

    super.initState();
  }

  Future<void> waitForOrderIfNotLoaded() {
    if (order.value != null) {
      return Future<void>.value(null);
    } else {
      final Completer<void> completer = Completer<void>();
      Timer(Duration(seconds: 5), () {
        completer.complete();
      });
      return completer.future;
    }
  }

  @override
  void dispose() {
    _orderListener?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: Text('${_i18n()["order"]}'),
        ),
        bottomNavigationBar: Obx(
          () {
            return TaxiOrderButtons(
              order: order.value!,
            );
          },
        ),
        body: Column(
          children: <Widget>[
            TaxiOrderMapComponent(
              order: order.value!,
              mapController: _mapController,
            ),
            Expanded(
              child: order.value!.isOpenOrder()
                  ? TaxiOpenOrderBottomCard(order: order.value!)
                  : TaxiOrderBottomCard(order: order.value!),
            )
          ],
        ),
      ),
    );
  }

  void _updateMapByStatus(TaxiOrdersStatus status) {
    if (status != _statusSnapshot) {
      // we add the marker
      _statusSnapshot = status;
      if (_statusSnapshot == TaxiOrdersStatus.InTransit ||
          _statusSnapshot == TaxiOrdersStatus.OnTheWay) {
        mezDbgPrint("taxiMarker !!");
        _mapController.addOrUpdateTaxiDriverMarker(
          "taxi",
          order.value!.driver!.location!,
        );
      }

      // else we have to remove it
      else {
        _mapController.removeMarkerById("taxi");
      }
      _mapController.animateAndUpdateBounds();
    }
    mezDbgPrint("markers ${_mapController.markers.length}");
  }
}
