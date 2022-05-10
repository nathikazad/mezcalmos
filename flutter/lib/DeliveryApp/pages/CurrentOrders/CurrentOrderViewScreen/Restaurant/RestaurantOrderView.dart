import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:mezcalmos/DeliveryApp/components/deliveryAppBar.dart';
import 'package:mezcalmos/DeliveryApp/controllers/deliveryAuthController.dart';
import 'package:mezcalmos/DeliveryApp/controllers/orderController.dart';
import 'package:mezcalmos/DeliveryApp/pages/CurrentOrders/CurrentOrderViewScreen/Components/DriverOrderMapComponent.dart';
import 'package:mezcalmos/DeliveryApp/pages/CurrentOrders/CurrentOrderViewScreen/Restaurant/Components/DriverBottomRestaurantOrderCard.dart';
import 'package:mezcalmos/DeliveryApp/pages/CurrentOrders/CurrentOrderViewScreen/Restaurant/Components/RestaurantControllButtons.dart';
import 'package:mezcalmos/DeliveryApp/pages/CurrentOrders/CurrentOrderViewScreen/mapInitHelper.dart';
import 'package:mezcalmos/Shared/controllers/MGoogleMapController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Location.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';
import 'package:mezcalmos/Shared/widgets/MezSnackbar.dart';

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

    // doing this once to avoid doing it constaintly in [handleRestaurantOrder::switch::default]
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
      // Restaurant Marker
      mapController.addOrUpdateUserMarker(
        latLng: LatLng(
          order.value!.restaurant.location.latitude,
          order.value!.restaurant.location.longitude,
        ),
        markerId: order.value!.restaurantId,
        customImgHttpUrl: order.value!.restaurant.image,
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
      handleRestaurantOrder(order.value as RestaurantOrder);
    });

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
    return Obx(
      () {
        if (order.value != null) {
          return Scaffold(
              appBar:
                  mezcalmosAppBar(AppBarLeftButtonType.Back, onClick: Get.back),
              bottomNavigationBar:
                  RestaurantControllButtons(order: order.value!),
              body: Column(children: <Widget>[
                DriverOrderMapComponent(
                  order: order.value!,
                  mapController: mapController,
                ),
                Expanded(
                  child: DriverBottomRestaurantOrderCard(
                    order: order.value as RestaurantOrder,
                  ),
                ),
              ]));
        } else {
          return MezLogoAnimation(
            centered: true,
          );
        }
      },
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
