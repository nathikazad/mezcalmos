import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mezcalmos/CustomerApp/components/AppBar.dart';
import 'package:mezcalmos/CustomerApp/controllers/orderController.dart';
import 'package:mezcalmos/CustomerApp/controllers/restaurant/restaurantController.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewOrderScreen/components/CustomerRestaurantOrderEst.dart';
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
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart' as LocModel;
import 'package:mezcalmos/Shared/widgets/CreditCardInfo.dart';
import 'package:mezcalmos/Shared/widgets/MGoogleMap.dart';
import 'package:mezcalmos/Shared/widgets/MezSnackbar.dart';
import 'package:mezcalmos/Shared/widgets/RestaurantOrderDeliveryTimeCard.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
    ["pages"]["Restaurants"]["ViewOrderScreen"]["ViewRestaurantOrderScreen"];

class ViewRestaurantOrderScreen extends StatefulWidget {
  @override
  _ViewRestaurantOrderScreenState createState() =>
      _ViewRestaurantOrderScreenState();
}

class _ViewRestaurantOrderScreenState extends State<ViewRestaurantOrderScreen> {
  final MGoogleMapController mapController = MGoogleMapController(
    enableMezSmartPointer: true,
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
    if (order.value != null) {
      initMap();
      updateMapIfDeliveryPhase(order.value!.status);
    }

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
        Future<void>.delayed(Duration.zero, () {
          Get.back<void>();
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
                          SizedBox(
                            height: 10,
                          ),
                          OrderStatusCard(
                            order: order.value!,
                            ordersStates: order.value!.status,
                          ),
                          RestaurantOrderDeliveryTimeCard(
                            order: order.value!,
                            margin: EdgeInsets.only(top: 20),
                          ),
                          CustomerRestaurantOrderEst(order: order.value!),

                          RestaurantOrderDriverCard(
                            order: order.value!,
                          ),
                          if (order.value!.inDeliveryPhase()) ..._mapWidget,

                          OrderRestaurantCard(order: order.value!),

                          OrderItemsCard(
                            items: order.value!.items,
                          ),
                          order.value?.notes == null ||
                                  order.value!.notes!.length <= 0
                              ? Container()
                              : notesWidget(order),

                          OrderSummaryCard(order: order.value!),
                          if (order.value!.stripePaymentInfo != null)
                            CreditCardInfo(
                                paymentInfo: order.value!.stripePaymentInfo!),

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
        SizedBox(
          height: 20,
        ),
        Container(
          height: 350,
          width: Get.width - 20,
          child: MGoogleMap(
            padding: EdgeInsets.zero,
            mGoogleMapController: mapController,
            recenterBtnBottomPadding: 20,
          ),
        ),
      ];

  void initMap() {
    mapController.periodicRerendering.value = true;
    mapController.minMaxZoomPrefs = MinMaxZoomPreference.unbounded; // LEZEM
    mapController.animateMarkersPolyLinesBounds.value = true;

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
      latLng: order.value?.restaurant.location.toLatLng(),
      markerId: order.value?.restaurant.id,
      customImgHttpUrl: order.value?.restaurant.image,
      fitWithinBounds: true,
    );
    // customer's
    mapController.addOrUpdatePurpleDestinationMarker(
      latLng: order.value?.to.toLatLng(),
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
        mezDbgPrint("+ poly => ${order.value!.routeInformation?.toJson()}");
        mezDbgPrint("+ markers => ${mapController.markers.length}");
        mezDbgPrint("+ polys => ${mapController.polylines.length}");

        // Customer + Restau  + Polyline

        // PICKUP :  DELIVERY -> restau
        //
        if (_statusSnapshot != status) {
          _statusSnapshot = status;
          mapController.addOrUpdateUserMarker(
            latLng: order.value?.restaurant.location.toLatLng(),
            markerId: order.value?.restaurant.id,
            customImgHttpUrl: order.value?.restaurant.image,
            fitWithinBounds: true,
          );
          mapController.addOrUpdatePurpleDestinationMarker(
            latLng: order.value?.to.toLatLng(),
            fitWithinBounds: true,
          );
        }
        mapController.addOrUpdateUserMarker(
          latLng: order.value?.dropoffDriver?.location,
          markerId: order.value?.dropoffDriver?.id,
          customImgHttpUrl: order.value?.dropoffDriver?.image,
          fitWithinBounds: true,
        );

        mapController.animateAndUpdateBounds();
        break;

      case RestaurantOrderStatus.OnTheWay:
        if (_statusSnapshot != status) {
          _statusSnapshot = status;
          // we ignore the restaurant's marker within bounds
          mapController.addOrUpdateUserMarker(
            latLng: order.value?.restaurant.location.toLatLng(),
            markerId: order.value?.restaurant.id,
            customImgHttpUrl: order.value?.restaurant.image,
            fitWithinBounds: true,
          );
          // we fit the destination into bounds
          mapController.addOrUpdatePurpleDestinationMarker(
            latLng: order.value?.to.toLatLng(),
            fitWithinBounds: true,
          );
        }

        // we keep updating the delivery's
        mapController.addOrUpdateUserMarker(
          latLng: order.value?.dropoffDriver?.location,
          markerId: order.value?.dropoffDriver?.id,
          customImgHttpUrl: order.value?.dropoffDriver?.image,
          fitWithinBounds: true,
        );
        mapController.animateAndUpdateBounds();

        break;
      default:
    }
  }
}
