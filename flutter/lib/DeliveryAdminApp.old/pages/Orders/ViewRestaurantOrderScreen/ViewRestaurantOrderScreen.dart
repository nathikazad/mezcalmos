import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show Clipboard, ClipboardData;
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/DeliveryAdminApp.old/components/DeliveryAdminAppbar.dart';
import 'package:mezcalmos/DeliveryAdminApp.old/controllers/deliveryDriverController.dart';
import 'package:mezcalmos/DeliveryAdminApp.old/controllers/restaurantOrderController.dart';
import 'package:mezcalmos/DeliveryAdminApp.old/pages/Orders/Components/DriverCard.dart';
import 'package:mezcalmos/DeliveryAdminApp.old/pages/Orders/ViewRestaurantOrderScreen/components/CurrentOrderInfo.dart';
import 'package:mezcalmos/DeliveryAdminApp.old/pages/Orders/ViewRestaurantOrderScreen/components/OrderInfoCard.dart';
import 'package:mezcalmos/DeliveryAdminApp.old/pages/Orders/ViewRestaurantOrderScreen/components/OrderNoteCard.dart';
import 'package:mezcalmos/DeliveryAdminApp.old/pages/Orders/ViewRestaurantOrderScreen/components/OrderShippingLocation.dart';
import 'package:mezcalmos/DeliveryAdminApp.old/pages/Orders/ViewRestaurantOrderScreen/components/OrderTotalCostCard.dart';
import 'package:mezcalmos/DeliveryAdminApp.old/pages/Orders/ViewRestaurantOrderScreen/components/PastOrderInfo.dart';
import 'package:mezcalmos/DeliveryAdminApp.old/pages/Orders/ViewRestaurantOrderScreen/components/SetOrderEstTime.dart';
import 'package:mezcalmos/Shared/controllers/MGoogleMapController.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Drivers/DeliveryDriver.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart' as LocModel;
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MGoogleMap.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';
import 'package:mezcalmos/Shared/widgets/MezSnackbar.dart';
import 'package:mezcalmos/Shared/widgets/RestaurantOrderDeliveryTimeCard.dart';
import 'package:mezcalmos/Shared/MezRouter.dart';

final NumberFormat currency = new NumberFormat("#,##0.00", "en_US");

class ViewRestaurantOrderScreen extends StatefulWidget {
  const ViewRestaurantOrderScreen({Key? key}) : super(key: key);

  @override
  _ViewRestaurantOrderScreen createState() => _ViewRestaurantOrderScreen();
}

class _ViewRestaurantOrderScreen extends State<ViewRestaurantOrderScreen> {
  /// AuthController
  AuthController auth = Get.find<AuthController>();

  /// RestaurantOrderController
  RestaurantOrderController controller = Get.find<RestaurantOrderController>();

  /// DeliveryDriverController
  DeliveryDriverController deliveryDriverController = Get.find<
      DeliveryDriverController>(); // Since we have alot of buttons we check loading by name

  /// driver
  DeliveryDriverUserInfo? driver;

  /// hasNewMessage
  Rx<bool> hasNewMessage = false.obs;

  /// RestaurantOrder
  Rxn<RestaurantOrder> order = Rxn<RestaurantOrder>();

  /// orderId
  late String orderId;

  /// LanguageType
  LanguageType userLanguage = Get.find<LanguageController>().userLanguageKey;

  /// _orderListener
  StreamSubscription<RestaurantOrder?>? _orderListener;

  final MGoogleMapController mapController = MGoogleMapController(
    enableMezSmartPointer: false,
  );
  RestaurantOrderStatus? _statusSnapshot;

  @override
  void dispose() {
    _orderListener?.cancel();
    _orderListener = null;
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    mezDbgPrint("ViewOrderScreen");
    orderId = Get.parameters['orderId']!;
    controller.clearOrderNotifications(orderId);

    order.value = controller.getOrder(orderId);
    _orderListener = controller
        .getOrderStream(orderId)
        .listen((RestaurantOrder? newOrderEvent) {
      if (newOrderEvent != null) {
        order.value = newOrderEvent;
      }
    });

    // if order value is null and
    if (order.value == null) {
      Timer(Duration(seconds: 5), () {
        if (order.value == null) {
          // ignore: inference_failure_on_function_invocation
          MezRouter.back();
          MezSnackbar("Error", "Order does not exist");
        }
      });
    } else {
      controller.setNotifiedAsTrue(order.value!);
      initMap();
      updateMapIfDeliveryPhase(order.value!.status);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: new FloatingActionButton(
        focusColor: Colors.grey.shade100,
        hoverColor: Colors.grey.shade100,
        splashColor: Colors.grey.shade100,
        backgroundColor: Colors.grey.shade100,
        foregroundColor: Colors.purple.shade700,
        onPressed: () {
          Clipboard.setData(
                  ClipboardData(text: order.value?.clipBoardText(userLanguage)))
              .then((value) => MezSnackbar("Done :D", "Copied to clipboard.",
                  position: SnackPosition.TOP));
        },
        tooltip: 'Copy',
        child: new Icon(Icons.copy),
      ),
      appBar: deliveryAdminAppBar(AppBarLeftButtonType.Back,
          withOrder: true, function: MezRouter.back),
      // backgroundColor: Colors.white,
      body: Obx(
        () {
          if (order.value == null) {
            return MezLogoAnimation(
              centered: true,
            );
          } else {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    //====================Restaurant Info=======================
                    (!controller.isPast(order.value!))
                        ? CurrentOrderInfo(
                            order: order.value!,
                          )
                        : PastOrderInfo(order: order.value!),

                    //============================= Customer info====================
                    RestaurantOrderDeliveryTimeCard(order: order.value!),
                    if (order.value?.inProcess() ?? false)
                      DaRestaurantOrderTime(
                        order: order.value!,
                      ),
                    if (order.value?.inProcess() ?? false)
                      DriverCard(
                        driver: order.value!.dropoffDriver,
                        order: order.value!,
                        assignDriverCallback: (
                            {required bool changeDriver,
                            required DeliveryDriver deliveryDriver}) async {
                          await deliveryDriverController.assignDeliveryDriver(
                            deliveryDriverId: deliveryDriver.deliveryDriverId,
                            orderId: order.value!.orderId,
                            orderType: OrderType.Restaurant,
                            deliveryDriverType:
                                DeliveryDriverType.Delivery_driver,
                            changeDriver: changeDriver,
                          );
                        },
                      ),

                    if (order.value!.inDeliveryPhase()) ..._mapWidget,

                    OrderInfoCard(order: order),
                    orderTotalCostCard(order),

                    orderShippingLocation(order),
                    //===============================>notes========================>
                    orderNoteCard(order)
                  ],
                ),
              ),
            );
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
      latLng: order.value?.restaurant.location.toLatLng(),
      markerId: order.value?.restaurantId.toString(),
      customImgHttpUrl: order.value?.restaurant.image,
      fitWithinBounds: true,
    );
    // customer's
    mapController.addOrUpdatePurpleDestinationMarker(
      latLng: order.value?.to.toLatLng(),
      fitWithinBounds: true,
    );
    if (order.value?.routeInformation != null)
      mapController.decodeAndAddPolyline(
          encodedPolylineString: order.value!.routeInformation!.polyline);

    mapController.animateAndUpdateBounds(
        shouldFitPolylineInBound: order.value?.routeInformation != null);
  }

  void updateMapIfDeliveryPhase(RestaurantOrderStatus status) {
    switch (status) {
      case RestaurantOrderStatus.Ready:
        if (_statusSnapshot != status) {
          _statusSnapshot = status;
          // we ignore the marker within bounds
          mapController.addOrUpdateUserMarker(
            latLng: order.value?.restaurant.location.toLatLng(),
            markerId: order.value?.restaurantId.toString(),
            customImgHttpUrl: order.value?.restaurant.image,
            fitWithinBounds: true,
          );
          mapController.addOrUpdatePurpleDestinationMarker(
            latLng: order.value?.to.toLatLng(),
            fitWithinBounds: false,
          );
        }
        mapController.addOrUpdateUserMarker(
          latLng: order.value?.dropoffDriver?.location,
          markerId: order.value?.dropoffDriver?.firebaseId,
          customImgHttpUrl: order.value?.dropoffDriver?.image,
          fitWithinBounds: true,
        );
        mapController.animateAndUpdateBounds(shouldFitPolylineInBound: false);
        break;

      case RestaurantOrderStatus.OnTheWay:
        if (_statusSnapshot != status) {
          _statusSnapshot = status;
          // we ignore the restaurant's marker within bounds
          mapController.addOrUpdateUserMarker(
            latLng: order.value?.restaurant.location.toLatLng(),
            markerId: order.value?.restaurantId.toString(),
            customImgHttpUrl: order.value?.restaurant.image,
            fitWithinBounds: false,
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
          markerId: order.value?.dropoffDriver?.firebaseId,
          customImgHttpUrl: order.value?.dropoffDriver?.image,
          fitWithinBounds: true,
        );
        mapController.animateAndUpdateBounds();
        break;
      default:
    }
  }
}
