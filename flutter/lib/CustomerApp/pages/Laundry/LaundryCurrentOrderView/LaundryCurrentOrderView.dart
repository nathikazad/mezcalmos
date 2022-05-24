import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/CustomerApp/components/AppBar.dart';
import 'package:mezcalmos/CustomerApp/controllers/orderController.dart';
import 'package:mezcalmos/CustomerApp/pages/Laundry/LaundryCurrentOrderView/Components/LaundryOrderDriverCard.dart';
import 'package:mezcalmos/CustomerApp/pages/Laundry/LaundryCurrentOrderView/Components/LaundryOrderFooterCard.dart';
import 'package:mezcalmos/CustomerApp/pages/Laundry/LaundryCurrentOrderView/Components/LaundryOrderNoteComponent.dart';
import 'package:mezcalmos/CustomerApp/pages/Laundry/LaundryCurrentOrderView/Components/LaundryOrderStatusCard.dart';
import 'package:mezcalmos/CustomerApp/pages/Laundry/LaundryCurrentOrderView/Components/LaundryPricingComponent.dart';
import 'package:mezcalmos/CustomerApp/pages/Laundry/LaundryCurrentOrderView/Components/OrderLaundryCard.dart';
import 'package:mezcalmos/CustomerApp/pages/Laundry/LaundryCurrentOrderView/Components/OrderSummaryComponent.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/MGoogleMapController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Location.dart' as LocModel;
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/widgets/MGoogleMap.dart';
import 'package:mezcalmos/Shared/widgets/MezSnackbar.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['CustomerApp']
    ['pages']['Laundry']['LaundryCurrentOrderView']['LaundryCurrentOrderView'];

class LaundryCurrentOrderView extends StatefulWidget {
  const LaundryCurrentOrderView({Key? key}) : super(key: key);

  @override
  State<LaundryCurrentOrderView> createState() =>
      _LaundryCurrentOrderViewState();
}

class _LaundryCurrentOrderViewState extends State<LaundryCurrentOrderView> {
  late String orderId;
  LaundryOrderPhase? _phaseSnapshot;

  Rxn<LaundryOrder> order = Rxn<LaundryOrder>();
  StreamSubscription? _orderListener;
  final OrderController controller = Get.find<OrderController>();
  final MGoogleMapController mapController = MGoogleMapController(
    enableMezSmartPointer: false,
  );

  // LaundryController laundryController = Get.find<LaundryController>();

  @override
  void initState() {
    // Handle Order id from the rooting
    if (Get.parameters['orderId'] != null) {
      orderId = Get.parameters['orderId']!;
    } else {
      mezDbgPrint("Order id null from the parameters ######");
      Get.back<void>();
    }
    controller.clearOrderNotifications(orderId);
    order.value = controller.getOrder(orderId) as LaundryOrder?;

    _orderListener =
        controller.getOrderStream(orderId).listen((Order? newOrderEvent) {
      if (newOrderEvent != null) {
        order.value = newOrderEvent as LaundryOrder?;
        if (order.value!.inProcess()) {
          updateMapByPhase(order.value!.getCurrentPhase());
        }
      }
    });

    waitForOrderIfNotLoaded().then((void value) {
      if (order.value == null) {
        // ignore: inference_failure_on_function_invocation
        Future<Null>.delayed(Duration.zero, () {
          Get.back<Null>();
          MezSnackbar("Error", "Order does not exist");
        });
      } else {
        initMap();
        updateMapByPhase(order.value!.getCurrentPhase());
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
    return Scaffold(
      appBar: CustomerAppBar(
        autoBack: true,
        title: '${order.value?.laundry?.name ?? ""}',
      ),
      body: Obx(
        () {
          if (order.value != null) {
            return LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraint) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints:
                        BoxConstraints(minHeight: constraint.maxHeight),
                    child: IntrinsicHeight(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            const SizedBox(height: 20),
                            LaundryOrderStatusCard(order: order.value!),
                            LaundryOrderDriverCard(order: order.value!),
                            if (order.value!.inDeliveryPhase())
                              Column(
                                children: [
                                  const SizedBox(height: 20),
                                  Column(
                                    children: _mapWidget,
                                  )
                                ],
                              ),
                            SizedBox(
                              height: 20,
                            ),
                            if (order.value!.laundry != null)
                              OrderLaundryCard(order: order.value!),
                            SizedBox(
                              height: 20,
                            ),
                            LaundryPricingCompnent(order: order.value!),
                            SizedBox(
                              height: 10,
                            ),
                            LaundryOrderNoteComponent(order: order.value!),
                            const SizedBox(height: 10),
                            OrderSummaryComponent(
                              order: order.value!,
                            ),
                            Spacer(),
                            Flexible(
                              child: Container(
                                  alignment: Alignment.center,
                                  child: LaundryOrderFooterCard(
                                      order: order.value!)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  List<Widget> get _mapWidget => <Widget>[
        Container(
          height: 350,
          child: MGoogleMap(mGoogleMapController: mapController),
        ),
        SizedBox(
          height: 10,
        )
      ];

  void initMap() {
    mapController.periodicRerendering.value = true;
    mapController.recenterButtonEnabled.value = false;
    mapController.setAnimateMarkersPolyLinesBounds(true);
    mapController.setLocation(
      LocModel.Location(
        "",
        LocModel.Location.buildLocationData(
          order.value!.to.latitude,
          order.value!.to.longitude,
        ),
      ),
    );

    if (order.value!.laundry != null) {
      // restaurant ad customer's location are fixed (fit in bound at start)
      mapController.addOrUpdateUserMarker(
        latLng: order.value!.laundry!.location.toLatLng(),
        markerId: order.value!.laundry!.id,
        customImgHttpUrl: order.value!.laundry!.image,
        fitWithinBounds: true,
      );
    }
    // customer's
    mapController.addOrUpdatePurpleDestinationMarker(
      latLng: order.value!.to.toLatLng(),
      fitWithinBounds: true,
    );
    if (order.value!.routeInformation != null)
      mapController.decodeAndAddPolyline(
          encodedPolylineString: order.value!.routeInformation!.polyline);

    mapController.animateAndUpdateBounds(
        shouldFitPolylineInBound: order.value!.routeInformation != null);
  }

  void updateMapByPhase(LaundryOrderPhase phase) {
    switch (phase) {
      case LaundryOrderPhase.Pickup:
        if (_phaseSnapshot != phase) {
          _phaseSnapshot = phase;
          // we ignore the marker within bounds
          mapController.addOrUpdateUserMarker(
            latLng: order.value!.laundry!.location.toLatLng(),
            markerId: order.value!.laundry!.id,
            customImgHttpUrl: order.value!.laundry!.image,
            fitWithinBounds: true,
          );
          mapController.addOrUpdatePurpleDestinationMarker(
            latLng: order.value!.to.toLatLng(),
            fitWithinBounds: false,
          );
        }
        // only if pickUpDriver not null
        if (order.value!.pickupDriver != null) {
          mapController.addOrUpdateUserMarker(
            latLng: order.value!.pickupDriver!.location!,
            markerId: order.value!.pickupDriver!.id,
            customImgHttpUrl: order.value!.pickupDriver!.image,
            fitWithinBounds: true,
          );
        }

        mapController.animateAndUpdateBounds(shouldFitPolylineInBound: false);
        break;

      case LaundryOrderPhase.Dropoff:
        if (_phaseSnapshot != phase) {
          _phaseSnapshot = phase;
          // we ignore the restaurant's marker within bounds
          mapController.addOrUpdateUserMarker(
            latLng: order.value!.laundry!.location.toLatLng(),
            markerId: order.value!.laundry!.id,
            customImgHttpUrl: order.value!.laundry!.image,
            fitWithinBounds: false,
          );
          // we fit the destination into bounds
          mapController.addOrUpdatePurpleDestinationMarker(
            latLng: order.value!.to.toLatLng(),
            fitWithinBounds: true,
          );
        }

        // we keep updating the delivery's
        if (order.value!.dropoffDriver != null) {
          mapController.addOrUpdateUserMarker(
            latLng: order.value!.dropoffDriver!.location!,
            markerId: order.value!.dropoffDriver!.id,
            customImgHttpUrl: order.value!.dropoffDriver!.image,
            fitWithinBounds: true,
          );
        }
        mapController.animateAndUpdateBounds();
        break;
      default:
    }
  }

  Container _orderEstimatedDeliveryTime() {
    return Container(
      margin: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${_i18n()['estimatedDeliveryTime']}",
            style: Get.textTheme.bodyText1,
          ),
          SizedBox(
            height: 5,
          ),
          Card(
            child: Container(
              padding: EdgeInsets.all(5),
              child: Row(
                children: [
                  Icon(
                    Icons.timelapse,
                    color: keyAppColor,
                    size: 35,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "${DateFormat("dd MMMM yyyy hh:mm a").format(order.value!.estimatedLaundryReadyTime!.toLocal())}",
                    style: Get.textTheme.bodyText1,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
