import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mezcalmos/DeliveryApp/components/deliveryAppBar.dart';
import 'package:mezcalmos/DeliveryApp/controllers/deliveryAuthController.dart';
import 'package:mezcalmos/DeliveryApp/controllers/orderController.dart';
import 'package:mezcalmos/DeliveryApp/pages/CurrentOrders/CurrentOrderViewScreen/Components/DriverOrderMapComponent.dart';
import 'package:mezcalmos/DeliveryApp/pages/CurrentOrders/CurrentOrderViewScreen/Laundry/Components/DriverBottomLaundryOrderCard.dart';
import 'package:mezcalmos/DeliveryApp/pages/CurrentOrders/CurrentOrderViewScreen/Laundry/Components/DriverLaundryOrderButtons.dart';
import 'package:mezcalmos/Shared/controllers/MGoogleMapController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Location.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';

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
  @override
  void initState() {
    super.initState();

    final String orderId = Get.parameters['orderId']!;
    controller.clearOrderNotifications(orderId);
    order.value = controller.getOrder(orderId) as LaundryOrder;
    if (order.value == null) {
      Get.back<void>();
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
        mapController.animateAndUpdateBounds();
      });

      _orderListener =
          controller.getCurrentOrderStream(orderId).listen((Order? newOrder) {
        mezDbgPrint("nEW oRDER LISTENET TRIGGER !!");
        final DeliverableOrder? _order = controller.getOrder(orderId);
        if (_order == null) {
          Get.back<void>();
        } else {
          handleLaundryOrder(_order as LaundryOrder);
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
    return Scaffold(
      appBar: deliveryAppBar(AppBarLeftButtonType.Back, function: Get.back),
      bottomNavigationBar: Obx(
        () => DriverLaundryBottomButtons(
          order: order.value!,
        ),
      ),
      body: Obx(
        () => order.value != null
            ? Column(
                children: <Widget>[
                  DriverOrderMapComponent(
                      mapController: mapController, order: order.value!),
                  Expanded(
                    child: Container(
                      child: DriverBottomLaundryOrderCard(
                          order: order.value as LaundryOrder),
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

  /// this handles Laundry Orders depending on it's Phase
  void handleLaundryOrder(LaundryOrder laundryOrder) {
    final LaundryOrderStatus _status = laundryOrder.status;
    switch (_status) {
      case LaundryOrderStatus.OtwPickup:
        // Driver marker
        mapController.addOrUpdateUserMarker(
          latLng: LatLng(
            laundryOrder.pickupDriver!.location!.latitude,
            laundryOrder.pickupDriver!.location!.longitude,
          ),
        );
        // Landry Marker
        mapController.addOrUpdateUserMarker(
          latLng: LatLng(
            laundryOrder.laundry!.location.latitude,
            laundryOrder.laundry!.location.longitude,
          ),
          customImgHttpUrl: laundryOrder.laundry!.image,
          markerId: laundryOrder.laundry!.id,
        );
        // Destination Marker
        mapController.addOrUpdatePurpleDestinationMarker(
            latLng: LatLng(
              laundryOrder.to.latitude,
              laundryOrder.to.longitude,
            ),
            fitWithinBounds: false);
        mapController.animateAndUpdateBounds();
        break;
      case LaundryOrderStatus.OtwDelivery:
        // DropOff driver Marker
        mapController.addOrUpdateUserMarker(
          latLng: LatLng(
            laundryOrder.dropoffDriver!.location!.latitude,
            laundryOrder.dropoffDriver!.location!.longitude,
          ),
        );
        // Laundry location marker
        mapController.addOrUpdateUserMarker(
          latLng: LatLng(
            laundryOrder.laundry!.location.latitude,
            laundryOrder.laundry!.location.longitude,
          ),
          customImgHttpUrl: laundryOrder.laundry!.image,
          markerId: laundryOrder.laundry!.id,
          fitWithinBounds: false,
        );
        // Destination Marker
        mapController.addOrUpdatePurpleDestinationMarker(
          latLng: LatLng(
            laundryOrder.to.latitude,
            laundryOrder.to.longitude,
          ),
        );
        mapController.moveToNewLatLng(
          laundryOrder.dropoffDriver!.location!.latitude,
          laundryOrder.dropoffDriver!.location!.longitude,
        );
        mapController.animateAndUpdateBounds();

        break;
      default:
        return;
    }
  }
}
