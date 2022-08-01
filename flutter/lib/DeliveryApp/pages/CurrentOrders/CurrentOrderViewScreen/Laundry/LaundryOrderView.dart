import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:mezcalmos/DeliveryApp/components/deliveryAppBar.dart';
import 'package:mezcalmos/DeliveryApp/controllers/deliveryAuthController.dart';
import 'package:mezcalmos/DeliveryApp/controllers/orderController.dart';
import 'package:mezcalmos/DeliveryApp/pages/CurrentOrders/CurrentOrderViewScreen/Laundry/Components/DriverLaundryOrderButtons.dart';
import 'package:mezcalmos/DeliveryApp/pages/CurrentOrders/CurrentOrderViewScreen/Laundry/Components/laundryOrderFromToComponent.dart';
import 'package:mezcalmos/DeliveryApp/pages/CurrentOrders/CurrentOrderViewScreen/components/AnimatedOrderInfoCard.dart';
import 'package:mezcalmos/DeliveryApp/pages/CurrentOrders/CurrentOrderViewScreen/mapInitHelper.dart';
import 'package:mezcalmos/Shared/controllers/MGoogleMapController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Location.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MGoogleMap.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';
import 'package:mezcalmos/Shared/widgets/MezSnackbar.dart';
import 'package:url_launcher/url_launcher.dart';

//
dynamic _i18n() => Get.find<LanguageController>().strings["DeliveryApp"]
    ["pages"]["CurrentOrders"]["CurrentOrderViewScreen"]["LaundryOrderView"];
//

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
    // init the map
    mapController.setLocation(
      Location.fromLocationData(
        deliveryAuthAuthController.currentLocation,
      ),
    );
    mapController.minMaxZoomPrefs = MinMaxZoomPreference.unbounded; // LEZEM
    mapController.animateMarkersPolyLinesBounds.value = true;
    mapController.periodicRerendering.value = true;

    // Future.wait(<Future<void>>[
    // DESTINATION MARKER
    if (order.value != null)
      mapController.addOrUpdatePurpleDestinationMarker(
        latLng: LatLng(
          order.value!.to.latitude,
          order.value!.to.longitude,
        ),
      );
    // USER MARKER
    if (deliveryAuthAuthController.currentLocation.latitude != null &&
        deliveryAuthAuthController.currentLocation.longitude != null)
      mapController.addOrUpdateUserMarker(
        latLng: LatLng(
          deliveryAuthAuthController.currentLocation.latitude!,
          deliveryAuthAuthController.currentLocation.longitude!,
        ),
      );
    // LAUNDRY MARKER
    if (order.value!.laundry != null)
      mapController.addOrUpdateUserMarker(
        latLng: LatLng(
          order.value!.laundry!.location.latitude,
          order.value!.laundry!.location.longitude,
        ),
        customImgHttpUrl: order.value!.laundry!.image,
        markerId: order.value!.laundry!.id,
      );

    if (order.value?.routeInformation?.polyline != null)
      mapController.decodeAndAddPolyline(
        encodedPolylineString: order.value!.routeInformation!.polyline,
      );

    handleLaundryOrder(order.value as LaundryOrder);

    waitForOrderIfNotLoaded().then((void value) {
      if (order.value == null) {
        // ignore: inference_failure_on_function_invocation
        Future<Null>.delayed(Duration.zero, () {
          Get.back<Null>();
          MezSnackbar("Error", "Order does not exist");
        });
      } else {
        initilizeMap(mapController, order, order.value!.laundry!);
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

  double _recenterBtnBottomPadding = 300;
  EdgeInsets _mapPadding = EdgeInsets.only(top: 10, bottom: 300);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mezcalmosAppBar(
        AppBarLeftButtonType.Back,
        autoBack: true,
        showNotifications: true,
        title: getTitle(),
      ),
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
                    bottom: _recenterBtnBottomPadding,
                    right: 12,
                    child: InkWell(
                      onTap: () async {
                        final LatLng _destination = LatLng(
                            order.value!.to.latitude,
                            order.value!.to.longitude);

                        final String url =
                            "https://www.google.com/maps/dir/?api=1&destination=${_destination.latitude},${_destination.longitude}";

                        try {
                          await launch(url);
                        } catch (e) {
                          await launch(url);
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(.2),
                                offset: Offset(-1, 0),
                                spreadRadius: 2.5,
                                blurRadius: 9)
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(
                          Icons.navigation_rounded,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 2,
                    left: 5,
                    right: 5,
                    child: Card(
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: LaundryOrderFromToComponent(
                          onCardStateChange: (OrderInfoCardState state) {
                            mezDbgPrint("New State ==> $state");
                            setState(() {
                              if (state == OrderInfoCardState.Maximized) {
                                _recenterBtnBottomPadding = 300;
                                _mapPadding =
                                    EdgeInsets.only(top: 10, bottom: 300);
                              } else {
                                _recenterBtnBottomPadding = 170;
                                _mapPadding =
                                    EdgeInsets.only(top: 10, bottom: 170);
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
        if (laundryOrder.dropoffDriver?.location != null)
          mapController.addOrUpdateUserMarker(
            latLng: LatLng(
              laundryOrder.dropoffDriver!.location!.latitude,
              laundryOrder.dropoffDriver!.location!.longitude,
            ),
            fitWithinBounds: true,
          );
        break;
      case LaundryOrderStatus.OtwPickupFromCustomer:
        if (_orderStatusSnapshot != laundryOrder.status) {
          _addOrUpdateLaundryAndCustomerMarkers(
            laundryOrder,
            fitLaundryMarkerInBounds: false,
            fitCustomerMarlerInBounds: true,
          );
          _orderStatusSnapshot = laundryOrder.status;
        }
        // DropOff driver Marker
        if (laundryOrder.dropoffDriver?.location != null)
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
      case LaundryOrderStatus.OtwPickupFromCustomer:
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
        if (laundryOrder.pickupDriver?.location != null)
          mapController.addOrUpdateUserMarker(
            latLng: LatLng(
              laundryOrder.pickupDriver!.location!.latitude,
              laundryOrder.pickupDriver!.location!.longitude,
            ),
            fitWithinBounds: true,
          );

        mapController.animateAndUpdateBounds();
        break;
      case LaundryOrderStatus.PickedUpFromCustomer:
        // user going from customer's to laundry
        if (_orderStatusSnapshot != laundryOrder.status) {
          _addOrUpdateLaundryAndCustomerMarkers(
            laundryOrder,
            fitLaundryMarkerInBounds: true,
            fitCustomerMarlerInBounds: false,
          );
          _orderStatusSnapshot = laundryOrder.status;
        }
        if (laundryOrder.pickupDriver?.location != null)
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

  // get appbar title
  String? getTitle() {
    if (order.value!.getCurrentPhase() == LaundryOrderPhase.Pickup) {
      return "${_i18n()['pickup']}";
    } else if (order.value!.status == LaundryOrderStatus.AtLaundry) {
      return null;
    } else {
      return "${_i18n()['dropoff']}";
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
        if (deliveryAuthAuthController.currentLocation.latitude != null &&
            deliveryAuthAuthController.currentLocation.longitude != null)
          mapController.addOrUpdateUserMarker(
            latLng: LatLng(
              deliveryAuthAuthController.currentLocation.latitude!,
              deliveryAuthAuthController.currentLocation.longitude!,
            ),
            fitWithinBounds: true,
          );
        // LAUNDRY MARKER
        if (laundryOrder.laundry != null)
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
