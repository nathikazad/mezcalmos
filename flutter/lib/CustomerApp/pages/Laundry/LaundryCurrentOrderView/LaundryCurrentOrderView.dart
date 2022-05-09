import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/components/Appbar.dart';
import 'package:mezcalmos/CustomerApp/controllers/orderController.dart';
import 'package:mezcalmos/CustomerApp/pages/Laundry/LaundryCurrentOrderView/Components/LaundryOrderFooterCard.dart';
import 'package:mezcalmos/CustomerApp/pages/Laundry/LaundryCurrentOrderView/Components/LaundryOrderNoteComponent.dart';
import 'package:mezcalmos/CustomerApp/pages/Laundry/LaundryCurrentOrderView/Components/LaundryOrderStatusCard.dart';
import 'package:mezcalmos/CustomerApp/pages/Laundry/LaundryCurrentOrderView/Components/LaundryPricingComponent.dart';
import 'package:mezcalmos/CustomerApp/pages/Laundry/LaundryCurrentOrderView/Components/OrderSummaryComponent.dart';
import 'package:mezcalmos/Shared/controllers/MGoogleMapController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/widgets/MGoogleMap.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';
import 'package:mezcalmos/Shared/models/Location.dart' as LocModel;

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
  StreamSubscription<dynamic>? _orderListener;
  final OrderController controller = Get.find<OrderController>();
  final MGoogleMapController mapController = MGoogleMapController(
    enableMezSmartPointer: false,
  );

  // LaundryController laundryController = Get.find<LaundryController>();

  @override
  void initState() {
    super.initState();
    // Handle Order id from the rooting
    if (Get.parameters['orderId'] != null) {
      orderId = Get.parameters['orderId']!;
    } else {
      mezDbgPrint("Order id null from the parameters ######");
      Get.back<void>();
    }
    controller.clearOrderNotifications(orderId);
    order.value = controller.getOrder(orderId) as LaundryOrder?;
    if (order.value == null) {
      mezDbgPrint("Order null");
      Get.back<void>();
    } else {
      initMap();

      if (order.value!.inProcess()) {
        updateMapByPhase(order.value!.getCurrentPhase());
        _orderListener =
            controller.getCurrentOrderStream(orderId).listen((Order? event) {
          if (event != null) {
            mezDbgPrint("===================" +
                (event as LaundryOrder).status.toString());
            updateMapByPhase(event.getCurrentPhase());
            order.value = event;
          } else {
            _orderListener?.cancel();
            _orderListener = null;
            controller.getPastOrderStream(orderId).listen((Order? event) {
              if (event != null) {
                order.value = event as LaundryOrder;
              }
            });
            order.value = controller.getOrder(orderId) as LaundryOrder?;
          }
        });
      }
    }

    super.initState();
  }

  @override
  void dispose() {
    _orderListener?.cancel();
    _orderListener = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomerAppBar(
        autoBack: true,
        title: '${_i18n()["orderStatus"]}',
      ),
      body: Obx(
        () => order.value != null
            ? SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(height: 20),
                      LaundryOrderStatusCard(order: order.value!),
                      const SizedBox(height: 20),
                      if (order.value!.getCurrentPhase() !=
                          LaundryOrderPhase.Neither)
                        ..._mapWidget,
                      LaundryPricingCompnent(order: order.value!),
                      const SizedBox(height: 10),
                      LaundryOrderNoteComponent(order: order.value!),
                      const SizedBox(height: 10),
                      OrderSummaryComponent(
                        order: order.value!,
                      ),
                      const SizedBox(height: 10),
                      LaundryOrderFooterCard(order: order.value!)
                    ],
                  ),
                ),
              )
            : Center(child: MezLogoAnimation()),
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

    // restaurant ad customer's location are fixed (fit in bound at start)
    mapController.addOrUpdateUserMarker(
      latLng: order.value!.laundry!.location.toLatLng(),
      markerId: order.value!.laundry!.id,
      customImgHttpUrl: order.value!.laundry!.image,
      fitWithinBounds: true,
    );
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
}
