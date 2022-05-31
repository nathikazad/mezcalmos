import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:mezcalmos/DeliveryApp/components/deliveryAppBar.dart';
import 'package:mezcalmos/DeliveryApp/controllers/deliveryAuthController.dart';
import 'package:mezcalmos/DeliveryApp/controllers/orderController.dart';
import 'package:mezcalmos/DeliveryApp/pages/CurrentOrders/CurrentOrderViewScreen/Laundry/Components/DriverLaundryOrderButtons.dart';
import 'package:mezcalmos/DeliveryApp/pages/CurrentOrders/CurrentOrderViewScreen/Laundry/Components/laundryOrderFromToComponent.dart';
import 'package:mezcalmos/DeliveryApp/pages/CurrentOrders/CurrentOrderViewScreen/mapInitHelper.dart';
import 'package:mezcalmos/Shared/controllers/MGoogleMapController.dart';
import 'package:mezcalmos/Shared/models/Location.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MGoogleMap.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';
import 'package:mezcalmos/Shared/widgets/MezSnackbar.dart';

class LaundryOrderView extends StatefulWidget {
  const LaundryOrderView({Key? key}) : super(key: key);

  @override
  _LaundryOrderViewState createState() => _LaundryOrderViewState();
}

class _LaundryOrderViewState extends State<LaundryOrderView> {
  Rxn<LaundryOrder> order = Rxn<LaundryOrder>();
  MGoogleMapController mapController = MGoogleMapController();
  final OrderController controller = Get.find<OrderController>();
  final DeliveryAuthController deliveryAuthAuthController =
      Get.find<DeliveryAuthController>();
  StreamSubscription<Order?>? _orderListener;
  LaundryOrderStatus? _orderStatusSnapshot;

  @override
  void initState() {
    super.initState();

    final String orderId = Get.parameters['orderId']!;
    controller.clearOrderNotifications(orderId);
    order.value = controller.getOrder(orderId) as LaundryOrder;

    _orderListener =
        controller.getOrderStream(orderId).listen((Order? newOrderEvent) {
      if (newOrderEvent != null) {
        order.value = newOrderEvent as LaundryOrder;
        handleLaundryOrder(newOrderEvent);
        order.refresh();
      }
    });

    Future.wait(<Future<void>>[
      // DESTINATION MARKER
      mapController.addOrUpdatePurpleDestinationMarker(
        latLng: LatLng(
          order.value!.to.latitude,
          order.value!.to.longitude,
        ),
      ),
      // USER MARKER
      mapController.addOrUpdateUserMarker(
        latLng: LatLng(
          deliveryAuthAuthController.currentLocation.latitude!,
          deliveryAuthAuthController.currentLocation.longitude!,
        ),
      ),
      // LAUNDRY MARKER
      mapController.addOrUpdateUserMarker(
        latLng: LatLng(
          order.value!.laundry!.location.latitude,
          order.value!.laundry!.location.longitude,
        ),
        customImgHttpUrl: order.value!.laundry!.image,
        markerId: order.value!.laundry!.id,
      )
    ]).then((_) {
      mapController.setLocation(
        Location.fromLocationData(
          deliveryAuthAuthController.currentLocation,
        ),
      );
      mapController.minMaxZoomPrefs = MinMaxZoomPreference.unbounded; // LEZEM
      mapController.animateMarkersPolyLinesBounds.value = true;
      mapController.periodicRerendering.value = true;
      handleLaundryOrder(order.value as LaundryOrder);
    });

    waitForOrderIfNotLoaded().then((void value) {
      if (order.value == null) {
        // ignore: inference_failure_on_function_invocation
        Future<Null>.delayed(Duration.zero, () {
          Get.back<Null>();
          MezSnackbar("Error", "Order does not exist");
        });
      } else {
        initilializeMap(mapController, order, order.value!.laundry!);
      }
    });
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
    _orderListener = null;
    super.dispose();
  }

  double _recenterBtnBottomPadding = 180;
  EdgeInsets _mapPadding = EdgeInsets.only(top: 10, bottom: 180);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mezcalmosAppBar(AppBarLeftButtonType.Back, onClick: Get.back),
      bottomNavigationBar: Obx(
        () => DriverLaundryBottomButtons(
          order: order.value!,
        ),
      ),
      body: Obx(
        () => order.value != null
            ? Stack(
                children: [
                  MGoogleMap(
                    recenterBtnBottomPadding: _recenterBtnBottomPadding,
                    mGoogleMapController: mapController,
                    padding: _mapPadding,
                  ),
                  Positioned(
                    bottom: 2,
                    left: 5,
                    right: 5,
                    child: Card(
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: LaundryOrderFromToComponent(
                          onSlide: (bool isExpanded) {
                            setState(() {
                              if (isExpanded) {
                                _recenterBtnBottomPadding = 275;
                                _mapPadding =
                                    EdgeInsets.only(top: 10, bottom: 275);
                              } else {
                                _recenterBtnBottomPadding = 180;
                                _mapPadding =
                                    EdgeInsets.only(top: 10, bottom: 180);
                              }
                            });
                          },
                          order: order.value!,
                        ),
                      ),
                    ),
                  )
                ],
              )
            : MezLogoAnimation(
                centered: true,
              ),
      ),
    );
  }

  /// This basically controlls if to fitBound or Not on Laundry and Customer Markers.
  void _addOrUpdateLaundryAndCustomerMarkers(
    LaundryOrder laundryOrder, {
    required bool fitLaundryMarkerInBounds,
    required bool fitCustomerMarlerInBounds,
  }) {
    // Landry Marker
    mapController.addOrUpdateUserMarker(
      latLng: LatLng(
        laundryOrder.laundry!.location.latitude,
        laundryOrder.laundry!.location.longitude,
      ),
      customImgHttpUrl: laundryOrder.laundry!.image,
      markerId: laundryOrder.laundry!.id,
      fitWithinBounds: fitLaundryMarkerInBounds,
    );
    // Destination Marker
    mapController.addOrUpdatePurpleDestinationMarker(
      latLng: LatLng(
        laundryOrder.to.latitude,
        laundryOrder.to.longitude,
      ),
      fitWithinBounds: fitCustomerMarlerInBounds,
    );
    _orderStatusSnapshot = laundryOrder.status;
  }

  /// When the phase is DropOff.
  void _onDropOffPhase(LaundryOrder laundryOrder) {
    switch (laundryOrder.status) {
      case LaundryOrderStatus.ReadyForDelivery:
        if (_orderStatusSnapshot != laundryOrder.status) {
          _addOrUpdateLaundryAndCustomerMarkers(
            laundryOrder,
            fitLaundryMarkerInBounds: true,
            fitCustomerMarlerInBounds: false,
          );

          _orderStatusSnapshot = laundryOrder.status;
        }

        mapController.addOrUpdateUserMarker(
          latLng: LatLng(
            laundryOrder.dropoffDriver!.location!.latitude,
            laundryOrder.dropoffDriver!.location!.longitude,
          ),
          fitWithinBounds: true,
        );
        break;
      case LaundryOrderStatus.OtwDelivery:
        if (_orderStatusSnapshot != laundryOrder.status) {
          _addOrUpdateLaundryAndCustomerMarkers(
            laundryOrder,
            fitLaundryMarkerInBounds: false,
            fitCustomerMarlerInBounds: true,
          );
          _orderStatusSnapshot = laundryOrder.status;
        }
        // DropOff driver Marker
        mapController.addOrUpdateUserMarker(
          latLng: LatLng(
            laundryOrder.dropoffDriver!.location!.latitude,
            laundryOrder.dropoffDriver!.location!.longitude,
          ),
        );
        // mapController.moveToNewLatLng(
        //   laundryOrder.dropoffDriver!.location!.latitude,
        //   laundryOrder.dropoffDriver!.location!.longitude,
        // );
        mapController.animateAndUpdateBounds();
        break;
      default:
    }
  }

  /// When the phase is PickUp.
  void _onPickUpPhase(LaundryOrder laundryOrder) {
    switch (laundryOrder.status) {
      case LaundryOrderStatus.OtwPickup:
        // Driver marker
        if (_orderStatusSnapshot != laundryOrder.status) {
          // Landry Marker
          _addOrUpdateLaundryAndCustomerMarkers(
            laundryOrder,
            fitLaundryMarkerInBounds: false,
            fitCustomerMarlerInBounds: true,
          );
          // set snapshot to currentSttaus so we don't need to re-update.
          _orderStatusSnapshot = laundryOrder.status;
        }
        mapController.addOrUpdateUserMarker(
          latLng: LatLng(
            laundryOrder.pickupDriver!.location!.latitude,
            laundryOrder.pickupDriver!.location!.longitude,
          ),
          fitWithinBounds: true,
        );

        mapController.animateAndUpdateBounds();
        break;
      case LaundryOrderStatus.PickedUp:
        // user going from customer's to laundry
        if (_orderStatusSnapshot != laundryOrder.status) {
          _addOrUpdateLaundryAndCustomerMarkers(
            laundryOrder,
            fitLaundryMarkerInBounds: true,
            fitCustomerMarlerInBounds: false,
          );
          _orderStatusSnapshot = laundryOrder.status;
        }
        mapController.addOrUpdateUserMarker(
          latLng: LatLng(
            laundryOrder.pickupDriver!.location!.latitude,
            laundryOrder.pickupDriver!.location!.longitude,
          ),
          fitWithinBounds: true,
        );
        mapController.animateAndUpdateBounds();
        break;
      default:
    }
  }

  /// this handles Laundry Orders depending on it's Phase
  void handleLaundryOrder(LaundryOrder laundryOrder) {
    final LaundryOrderPhase _phase = laundryOrder.getCurrentPhase();

    if (_phase == LaundryOrderPhase.Pickup) {
      _onPickUpPhase(laundryOrder);
    } else if (_phase == LaundryOrderPhase.Dropoff) {
      _onDropOffPhase(laundryOrder);
    } else {
      // Neither
      // in case we later wanna do something for this.
      // Calling this will reset to initial markers states (3 of them fit in)
      if (_orderStatusSnapshot != laundryOrder.status) {
        _orderStatusSnapshot = laundryOrder.status;
        mapController.addOrUpdatePurpleDestinationMarker(
          latLng: LatLng(
            laundryOrder.to.latitude,
            laundryOrder.to.longitude,
          ),
          fitWithinBounds: true,
        );
        // USER MARKER
        mapController.addOrUpdateUserMarker(
          latLng: LatLng(
            deliveryAuthAuthController.currentLocation.latitude!,
            deliveryAuthAuthController.currentLocation.longitude!,
          ),
          fitWithinBounds: true,
        );
        // LAUNDRY MARKER
        mapController.addOrUpdateUserMarker(
          latLng: LatLng(
            laundryOrder.laundry!.location.latitude,
            laundryOrder.laundry!.location.longitude,
          ),
          customImgHttpUrl: laundryOrder.laundry!.image,
          markerId: laundryOrder.laundry!.id,
          fitWithinBounds: true,
        );
      }
    }
  }
}
