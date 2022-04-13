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
import 'package:mezcalmos/DeliveryApp/pages/CurrentOrders/CurrentOrderViewScreen/mapInitHelper.dart';
import 'package:mezcalmos/Shared/controllers/MGoogleMapController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Location.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
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
          fitWithinBounds: false,
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
        );
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
