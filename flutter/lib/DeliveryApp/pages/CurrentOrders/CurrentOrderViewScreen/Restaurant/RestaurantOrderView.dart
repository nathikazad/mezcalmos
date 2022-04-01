import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mezcalmos/DeliveryApp/components/deliveryAppBar.dart';
import 'package:mezcalmos/DeliveryApp/controllers/deliveryAuthController.dart';
import 'package:mezcalmos/DeliveryApp/controllers/orderController.dart';
import 'package:mezcalmos/DeliveryApp/pages/CurrentOrders/CurrentOrderViewScreen/Components/DriverOrderMapComponent.dart';
import 'package:mezcalmos/DeliveryApp/pages/CurrentOrders/CurrentOrderViewScreen/Restaurant/Components/DriverBottomRestaurantOrderCard.dart';
import 'package:mezcalmos/Shared/controllers/MGoogleMapController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Location.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';

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
  DeliveryAuthController deliveryAuthAuthController =
      Get.find<DeliveryAuthController>();
  @override
  void initState() {
    super.initState();
    // TODO : Add Restaurant's Markers location.
    final String orderId = Get.parameters['orderId']!;
    controller.clearOrderNotifications(orderId);
    order.value = controller.getOrder(orderId) as RestaurantOrder;
    if (order.value == null) {
      mezDbgPrint("ORDER NULL");
    } else {
      mapController.minMaxZoomPrefs = MinMaxZoomPreference.unbounded; // LEZEM
      mapController.periodicRerendering.value = true;
      mapController.periodicRerendering.refresh();

      mezDbgPrint(
          "lat lng DeliveryDriver => ${deliveryAuthAuthController.currentLocation.toString()}");

      if (order.value!.routeInformation != null) {
        mapController.decodeAndAddPolyline(
            encodedPolylineString: order.value!.routeInformation!.polyline);
      }

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
        mapController.animateAndUpdateBounds();
      });

      _orderListener =
          controller.getCurrentOrderStream(orderId).listen((Order? newOrder) {
        final DeliverableOrder? _order = controller.getOrder(orderId);
        if (_order == null) {
          Get.back<void>();
        } else {
          handleRestaurantOrder(_order as RestaurantOrder);
          order.value = _order;
          order.refresh();
        }
      });
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
        body: SingleChildScrollView(
          child: order.value != null
              ? Column(children: <Widget>[
                  DriverOrderMapComponent(
                    order: order.value!,
                    mapController: mapController,
                  ),
                  DriverBottomRestaurantOrderCard(
                    order: order.value as RestaurantOrder,
                  ),
                ])
              : MezLogoAnimation(
                  centered: true,
                ),
        ),
      ),
    );
  }

  /// this handles Restaurant Order.
  void handleRestaurantOrder(RestaurantOrder order) {
    switch (order.status) {
      case RestaurantOrderStatus.ReadyForPickup:
        break;

      case RestaurantOrderStatus.OnTheWay:
        mapController.animateMarkersPolyLinesBounds.value = true;
        mapController.myLocationButtonEnabled.value = true;
        // user marker
        mapController.addOrUpdateUserMarker(
          latLng: LatLng(order.dropoffDriver!.location!.latitude,
              order.dropoffDriver!.location!.longitude),
        );
        mapController.animateAndUpdateBounds();
        break;
      default:
    }
  }
}
