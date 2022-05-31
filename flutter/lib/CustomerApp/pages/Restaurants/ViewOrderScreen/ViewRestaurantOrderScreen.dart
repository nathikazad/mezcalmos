import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/CustomerApp/components/AppBar.dart';
import 'package:mezcalmos/CustomerApp/controllers/orderController.dart';
import 'package:mezcalmos/CustomerApp/controllers/restaurant/restaurantController.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewOrderScreen/components/OrderFooterCard.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewOrderScreen/components/OrderRestaurantCard.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewOrderScreen/components/OrderStatusCard.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewOrderScreen/components/OrderSummaryCard.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewOrderScreen/components/OrdersItemsCard.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewOrderScreen/components/RestaurantOrderDriverCard.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewOrderScreen/components/notesWidget.dart';
import 'package:mezcalmos/Shared/controllers/MGoogleMapController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Location.dart' as LocModel;
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/widgets/MGoogleMap.dart';
import 'package:mezcalmos/Shared/widgets/MezSnackbar.dart';

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
  StreamSubscription<Order?>? _orderListener;
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

    if (Get.parameters['orderId'] == null) Get.back();
    // orderId = Get.parameters['orderId']!;
    controller.clearOrderNotifications(orderId);
    order.value = controller.getOrder(orderId) as RestaurantOrder?;
    initMap();

    _orderListener =
        controller.getOrderStream(orderId).listen((Order? newOrderEvent) {
      if (newOrderEvent != null) {
        order.value = newOrderEvent as RestaurantOrder?;
        if (order.value!.inProcess()) {
          updateMapIfDeliveryPhase(order.value!.status);
        }
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
        initMap();
        updateMapIfDeliveryPhase(order.value!.status);
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
        title: order.value?.restaurant.name,
      ),
      body: Obx(
        () {
          if (order.value != null) {
            return LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraint) {
                return SingleChildScrollView(
                  padding: const EdgeInsets.all(8),
                  child: ConstrainedBox(
                    constraints:
                        BoxConstraints(minHeight: constraint.maxHeight),
                    child: IntrinsicHeight(
                      child: Column(
                        children: <Widget>[
                          OrderStatusCard(
                            order: order.value!,
                            ordersStates: order.value!.status,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          RestaurantOrderDriverCard(
                            order: order.value!,
                          ),
                          if (order.value!.inDeliveryPhase()) ..._mapWidget,
                          OrderRestaurantCard(order: order.value!),

                          SizedBox(
                            height: 15,
                          ),
                          OrderItemsCard(
                            items: order.value!.items,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          OrderSummaryCard(order: order.value!),
                          order.value?.notes == null ||
                                  order.value!.notes!.length <= 0
                              ? Container()
                              : notesWidget(order),
                          //===============================>button cancel===========================
                          //  Expanded(child: Container()),
                          Spacer(),
                          Flexible(
                            child: Container(
                                alignment: Alignment.center,
                                child: OrderFooterCard(order: order.value!)),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
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
          width: Get.width - 20,
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
          order.value?.to.latitude,
          order.value?.to.longitude,
        ),
      ),
    );

    // restaurant ad customer's location are fixed (fit in bound at start)
    mapController.addOrUpdateUserMarker(
      latLng: order.value!.restaurant.location.toLatLng(),
      markerId: order.value!.restaurant.id,
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
        mezDbgPrint(
            "Encoded poly => ${order.value!.routeInformation?.toJson()}");
        mezDbgPrint("+ markers => ${mapController.markers.length}");
        mezDbgPrint("+ polys => ${mapController.polylines.length}");

        // Customer + Restau  + Polyline

        // PICKUP :  DELIVERY -> restau
        //
        if (_statusSnapshot != status) {
          _statusSnapshot = status;
          // we ignore the marker within bounds
          mapController.addOrUpdateUserMarker(
            latLng: order.value!.restaurant.location.toLatLng(),
            markerId: order.value!.restaurant.id,
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
        mapController.animateAndUpdateBounds();
        break;

      case RestaurantOrderStatus.OnTheWay:
        if (_statusSnapshot != status) {
          _statusSnapshot = status;
          // we ignore the restaurant's marker within bounds
          mapController.addOrUpdateUserMarker(
            latLng: order.value!.restaurant.location.toLatLng(),
            markerId: order.value!.restaurant.id,
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
