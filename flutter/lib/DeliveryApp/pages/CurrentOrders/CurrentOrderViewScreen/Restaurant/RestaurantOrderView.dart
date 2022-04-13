import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mezcalmos/DeliveryApp/components/deliveryAppBar.dart';
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
    super.initState();

    final String orderId = Get.parameters['orderId']!;
    controller.clearOrderNotifications(orderId);
    order.value = controller.getOrder(orderId) as RestaurantOrder;
    _orderListener =
        controller.getOrderStream(orderId).listen((Order? newOrderEvent) {
      if (newOrderEvent != null) {
        order.value = newOrderEvent as RestaurantOrder;
        handleRestaurantOrder(newOrderEvent);
        order.refresh();
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
      () => Scaffold(
        appBar: deliveryAppBar(AppBarLeftButtonType.Back, function: Get.back),
        bottomNavigationBar: Obx(() => BottomAppBar(
            child: RestaurantControllButtons(order: order.value!))),
        body: order.value != null
            ? Column(children: <Widget>[
                DriverOrderMapComponent(
                  order: order.value!,
                  mapController: mapController,
                ),
                Expanded(
                  child: DriverBottomRestaurantOrderCard(
                    order: order.value as RestaurantOrder,
                  ),
                ),
              ])
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
        }
        // updating our delivery guy location
        mapController.addOrUpdateUserMarker(
          latLng: LatLng(
            order.dropoffDriver!.location!.latitude,
            order.dropoffDriver!.location!.longitude,
          ),
        );
        mapController.animateAndUpdateBounds();
        orderStatusSnapshot = order.status;
        break;
      default:
        orderStatusSnapshot = order.status;
    }
  }
}
