import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:location/location.dart';
import 'package:mezcalmos/CustomerApp/components/Appbar.dart';
import 'package:mezcalmos/CustomerApp/controllers/orderController.dart';
import 'package:mezcalmos/CustomerApp/controllers/restaurant/restaurantController.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewOrderScreen/components/OrderFooterCard.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewOrderScreen/components/OrderStatusCard.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewOrderScreen/components/OrderSummaryCard.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewOrderScreen/components/OrdersItemsCard.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewOrderScreen/components/notesWidget.dart';
import 'package:mezcalmos/Shared/controllers/MGoogleMapController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Location.dart' as LocModel;
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/widgets/MGoogleMap.dart';

final NumberFormat currency = new NumberFormat("#0", "en_US");
////////////===========
dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
    ["pages"]["Restaurants"]["ViewOrderScreen"]["ViewRestaurantOrderScreen"];

class ViewRestaurantOrderScreen extends StatefulWidget {
  @override
  _ViewRestaurantOrderScreenState createState() =>
      _ViewRestaurantOrderScreenState();
}

class _ViewRestaurantOrderScreenState extends State<ViewRestaurantOrderScreen> {
  final MGoogleMapController mapController = MGoogleMapController(
    enableMezSmartPointer: false,
  );

  /// order
  Rxn<RestaurantOrder> order = Rxn<RestaurantOrder>();

  /// controller
  OrderController controller = Get.find<OrderController>();

  /// restaurantController
  RestaurantController restaurantController = Get.find<RestaurantController>();

  /// _orderListener
  StreamSubscription<dynamic>? _orderListener;

  /// _clickedButton
  bool _clickedButton = false;

  RestaurantOrderStatus? _statusSnapshot;

  Future<void> onTapButtonsShowLoading(Function function) async {
    if (!_clickedButton) {
      // set true to show loading button
      setState(() {
        _clickedButton = true;
      });

      await function();

      // after function done set to back to false
      setState(() {
        _clickedButton = false;
      });
    }
  }

  Widget getWidgetOrShowLoading(Widget desiredWidget) {
    if (!_clickedButton) {
      return desiredWidget;
    } else {
      return Container(
        width: 20,
        height: 20,
        child: CircularProgressIndicator(
          color: Colors.white,
          strokeWidth: 1.5,
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();

    final String orderId = Get.parameters['orderId']!;
    controller.clearOrderNotifications(orderId);
    order.value = controller.getOrder(orderId) as RestaurantOrder?;
    if (order.value == null) {
      Get.back();
    } else {
      initMap();
      if (order.value!.inProcess()) {
        updateMapIfDeliveryPhase(order.value!.status);
        _orderListener =
            controller.getCurrentOrderStream(orderId).listen((Order? event) {
          if (event != null) {
            mezDbgPrint("===================" +
                (event as RestaurantOrder).status.toString());
            updateMapIfDeliveryPhase(event.status);
            order.value = event;
          } else {
            _orderListener?.cancel();
            _orderListener = null;
            controller.getPastOrderStream(orderId).listen((Order? event) {
              if (event != null) {
                mezDbgPrint("the past order is ========== $event ==========");
                order.value = event as RestaurantOrder;
              } else {
                mezDbgPrint("the past order is ========== 'empty' ==========");
              }
            });
            order.value = controller.getOrder(orderId) as RestaurantOrder?;
          }
        });
      }
      //mezDbgPrint("=========> ${order.value}");
    }
    super.initState();
  }

  @override
  void didUpdateWidget(ViewRestaurantOrderScreen oldWidget) {
    final String orderId = Get.parameters['orderId']!;
    super.didUpdateWidget(oldWidget);
    mezDbgPrint("this widget is updated");
    if (order.value == null) {
      order.value = controller.getOrder(orderId) as RestaurantOrder?;
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
      appBar: CustomerAppBar(
        autoBack: true,
        title: '${_i18n()["orderStatus"]}',
      ),
      body: Obx(
        () {
          if (order.value != null) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    OrderStatusCard(
                      order: order.value!,
                      ordersStates: order.value!.status,
                    ),
                    SizedBox(
                      height: 10,
                    ),

                    if (order.value!.inDeliveryPhase()) ..._mapWidget,

                    OrderItemsCard(
                      items: order.value!.items,
                    ),

                    SizedBox(
                      height: 10,
                    ),
                    OrderSummaryCard(order: order.value!),
                    //===============================>notes========================>
                    order.value?.notes == null ||
                            order.value!.notes!.length <= 0
                        ? Container()
                        : notesWidget(order),
                    //===============================>button cancel===========================
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        alignment: Alignment.center,
                        child: OrderFooterCard(order: order.value!)),
                  ],
                ),
              ),
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

    // restaurant ad customer's location are fixed (fit in bound at start)
    mapController.addOrUpdateUserMarker(
      latLng: order.value!.restaurant.location.toLatLng(),
      markerId: order.value!.restaurantId,
      customImgHttpUrl: order.value!.restaurant.image,
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

  void updateMapIfDeliveryPhase(RestaurantOrderStatus status) {
    switch (status) {
      case RestaurantOrderStatus.ReadyForPickup:
        if (_statusSnapshot != status) {
          _statusSnapshot = status;
          // we ignore the marker within bounds
          mapController.addOrUpdateUserMarker(
            latLng: order.value!.restaurant.location.toLatLng(),
            markerId: order.value!.restaurantId,
            customImgHttpUrl: order.value!.restaurant.image,
            fitWithinBounds: true,
          );
          mapController.addOrUpdatePurpleDestinationMarker(
            latLng: order.value!.to.toLatLng(),
            fitWithinBounds: false,
          );
        }
        mapController.addOrUpdateUserMarker(
          latLng: order.value!.dropoffDriver!.location!,
          markerId: order.value!.dropoffDriver!.id,
          customImgHttpUrl: order.value!.dropoffDriver!.image,
          fitWithinBounds: true,
        );
        mapController.animateAndUpdateBounds(shouldFitPolylineInBound: false);
        break;

      case RestaurantOrderStatus.OnTheWay:
        if (_statusSnapshot != status) {
          _statusSnapshot = status;
          // we ignore the restaurant's marker within bounds
          mapController.addOrUpdateUserMarker(
            latLng: order.value!.restaurant.location.toLatLng(),
            markerId: order.value!.restaurantId,
            customImgHttpUrl: order.value!.restaurant.image,
            fitWithinBounds: false,
          );
          // we fit the destination into bounds
          mapController.addOrUpdatePurpleDestinationMarker(
            latLng: order.value!.to.toLatLng(),
            fitWithinBounds: true,
          );
        }

        // we keep updating the delivery's
        mapController.addOrUpdateUserMarker(
          latLng: order.value!.dropoffDriver!.location!,
          markerId: order.value!.dropoffDriver!.id,
          customImgHttpUrl: order.value!.dropoffDriver!.image,
          fitWithinBounds: true,
        );
        mapController.animateAndUpdateBounds();
        break;
      default:
    }
  }
}
