import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mezcalmos/DeliveryApp/controllers/deliveryAuthController.dart';
import 'package:mezcalmos/DeliveryApp/controllers/orderController.dart';
import 'package:mezcalmos/DeliveryApp/pages/CurrentOrders/CurrentOrderViewScreen/Restaurant/Components/RestaurantControllButtons.dart';
import 'package:mezcalmos/DeliveryApp/pages/CurrentOrders/CurrentOrderViewScreen/Restaurant/Components/RestaurantOrderFromToComponent.dart';
import 'package:mezcalmos/DeliveryApp/pages/CurrentOrders/CurrentOrderViewScreen/components/AnimatedOrderInfoCard.dart';
import 'package:mezcalmos/DeliveryApp/pages/CurrentOrders/CurrentOrderViewScreen/mapInitHelper.dart';
import 'package:mezcalmos/Shared/controllers/MGoogleMapController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Location.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MGoogleMap.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';
import 'package:mezcalmos/Shared/widgets/MezSnackbar.dart';
import 'package:url_launcher/url_launcher.dart';

//
dynamic _i18n() => Get.find<LanguageController>().strings["DeliveryApp"]
    ["pages"]["RestaurantOrderView"];
//

class RestaurantOrderView extends StatefulWidget {
  const RestaurantOrderView({Key? key}) : super(key: key);

  @override
  _RestaurantOrderViewState createState() => _RestaurantOrderViewState();
}

class _RestaurantOrderViewState extends State<RestaurantOrderView> {
  MGoogleMapController mapController = MGoogleMapController();
  Rxn<RestaurantOrder> order = Rxn<RestaurantOrder>();
  OrderController controller = Get.find<OrderController>();
  StreamSubscription<Order?>? _orderListener;
  RestaurantOrderStatus? orderStatusSnapshot;
  DeliveryAuthController deliveryAuthAuthController =
      Get.find<DeliveryAuthController>();
  @override
  void initState() {
    final String orderId = Get.parameters['orderId']!;

    controller.clearOrderNotifications(orderId);
    order.value = controller.getOrder(orderId) as RestaurantOrder;
    mezDbgPrint(
        "orderID ===============================================> $orderId");
    if (order.value!.routeInformation != null) {
      mapController.decodeAndAddPolyline(
          encodedPolylineString: order.value!.routeInformation!.polyline);
    }

    _orderListener =
        controller.getOrderStream(orderId).listen((Order? newOrderEvent) {
      if (newOrderEvent != null) {
        order.value = newOrderEvent as RestaurantOrder;
        handleRestaurantOrder(newOrderEvent);
        order.refresh();
      }
    });

    // init the map
    Future<void>.microtask(
      () => mapController.setLocation(
        Location.fromLocationData(
          deliveryAuthAuthController.currentLocation,
        ),
      ),
    );
    mapController.minMaxZoomPrefs = MinMaxZoomPreference.unbounded; // LEZEM
    mapController.animateMarkersPolyLinesBounds.value = true;
    mapController.periodicRerendering.value = true;

    // doing this once to avoid doing it constaintly in [handleRestaurantOrder::switch::default]
    // Future.wait(<Future<void>>[
    // DESTINATION MARKER
    mapController.addOrUpdatePurpleDestinationMarker(
      latLng: LatLng(
        order.value!.to.latitude,
        order.value!.to.longitude,
      ),
    );
    // USER MARKER
    mapController.addOrUpdateUserMarker(
      latLng: LatLng(
        deliveryAuthAuthController.currentLocation.latitude!,
        deliveryAuthAuthController.currentLocation.longitude!,
      ),
    );
    // Restaurant Marker
    mapController.addOrUpdateUserMarker(
      latLng: LatLng(
        order.value!.restaurant.location.latitude,
        order.value!.restaurant.location.longitude,
      ),
      markerId: order.value!.restaurantId,
      customImgHttpUrl: order.value!.restaurant.image,
    );

    handleRestaurantOrder(order.value as RestaurantOrder);

    waitForOrderIfNotLoaded().then((void value) {
      if (order.value == null) {
        // ignore: inference_failure_on_function_invocation
        Future<Null>.delayed(Duration.zero, () {
          Get.back<Null>();
          MezSnackbar("Error", "Order does not exist");
        });
      } else {
        initilializeMap(mapController, order, order.value!.restaurant);
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
        onClick: Get.back,
        showNotifications: true,
        title: '${_i18n()["title"]}',
      ),
      bottomNavigationBar: Obx(
        () => RestaurantControllButtons(
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
                                color: Colors.black.withOpacity(.5),
                                offset: Offset(-1, 0),
                                spreadRadius: 1,
                                blurRadius: 10)
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
                    right: 4,
                    child: Card(
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: RestaurantOrderFromToComponent(
                          order: order.value!,
                          onCardStateChange: (OrderInfoCardState state) {
                            setState(() {
                              if (state == OrderInfoCardState.Maximized) {
                                _recenterBtnBottomPadding = 300;
                                _mapPadding =
                                    EdgeInsets.only(top: 10, bottom: 300);
                              } else {
                                _recenterBtnBottomPadding = 180;
                                _mapPadding =
                                    EdgeInsets.only(top: 10, bottom: 180);
                              }
                            });
                          },
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

  /// this handles Restaurant Order.
  void handleRestaurantOrder(RestaurantOrder order) {
    switch (order.status) {
      case RestaurantOrderStatus.ReadyForPickup:
        // only update once upon ReadyForPickUp
        if (orderStatusSnapshot != order.status) {
          // ignoring customer's marker (destination)
          mapController.addOrUpdatePurpleDestinationMarker(
            latLng: LatLng(
              order.to.latitude,
              order.to.longitude,
            ),
            fitWithinBounds: false,
          );
        }
        // update position of our delivery Guy
        mapController.addOrUpdateUserMarker(
          latLng: LatLng(
            order.dropoffDriver!.location!.latitude,
            order.dropoffDriver!.location!.longitude,
          ),
        );
        mapController.animateAndUpdateBounds();
        orderStatusSnapshot = order.status;
        break;

      case RestaurantOrderStatus.OnTheWay:
        // only update once.
        if (orderStatusSnapshot != order.status) {
          // ignoring Restaurant's marker
          mapController.addOrUpdateUserMarker(
            latLng: LatLng(
              order.restaurant.location.latitude,
              order.restaurant.location.longitude,
            ),
            markerId: order.restaurantId,
            customImgHttpUrl: order.restaurant.image,
            fitWithinBounds: false,
          );

          mapController.addOrUpdatePurpleDestinationMarker(
            latLng: LatLng(
              order.to.latitude,
              order.to.longitude,
            ),
            fitWithinBounds: true,
          );
        }
        // updating our delivery guy location
        mapController.addOrUpdateUserMarker(
          latLng: LatLng(
            order.dropoffDriver!.location!.latitude,
            order.dropoffDriver!.location!.longitude,
          ),
          fitWithinBounds: true,
        );
        mapController.animateAndUpdateBounds();
        orderStatusSnapshot = order.status;
        break;
      default:
        orderStatusSnapshot = order.status;
    }
  }
}
