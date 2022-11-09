import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:mezcalmos/LaundryApp/controllers/orderController.dart';
import 'package:mezcalmos/LaundryApp/pages/OrderView/components/LaundryOpCustomer.dart';
import 'package:mezcalmos/LaundryApp/pages/OrderView/components/LaundryOpDriverCard.dart';
import 'package:mezcalmos/LaundryApp/pages/OrderView/components/LaundryOpOrderNote.dart';
import 'package:mezcalmos/LaundryApp/pages/OrderView/components/LaundryOpOrderStatusCard.dart';
import 'package:mezcalmos/LaundryApp/pages/OrderView/components/LaundryOpOrderTimes.dart';
import 'package:mezcalmos/LaundryApp/pages/OrderView/components/LaundryOpSetCategoryComponent.dart';
import 'package:mezcalmos/LaundryApp/pages/OrderView/components/OrderEstimatedTimeComponent.dart';
import 'package:mezcalmos/LaundryApp/router.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/MGoogleMapController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart' as LocModel;
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MGoogleMap.dart';
import 'package:mezcalmos/Shared/widgets/MezSnackbar.dart';
import 'package:mezcalmos/Shared/MezRouter.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['LaundryApp']['pages']
    ['OrderView']['LaundryOpOrderView'];

class LaundryOpOrderView extends StatefulWidget {
  const LaundryOpOrderView({Key? key}) : super(key: key);

  @override
  State<LaundryOpOrderView> createState() => _LaundryOpOrderViewState();
}

class _LaundryOpOrderViewState extends State<LaundryOpOrderView> {
  Rxn<LaundryOrder> order = Rxn<LaundryOrder>();
  OrderController controller = Get.find<OrderController>();
  final MGoogleMapController mGoogleMapController = MGoogleMapController(
    enableMezSmartPointer: true,
  );
  StreamSubscription? _orderListener;

  LaundryOrderStatus? _statusSnapshot;

  @override
  void initState() {
    final String orderId = Get.parameters['orderId']!;
    controller.clearOrderNotifications(orderId);
    order.value = controller.getOrder(orderId) as LaundryOrder;
    // first time init map
    //mGoogleMapController.animateMarkersPolyLinesBounds(true);
    mGoogleMapController.minMaxZoomPrefs = MinMaxZoomPreference.unbounded;
    mGoogleMapController.recenterButtonEnabled.value = false;
    mGoogleMapController.periodicRerendering.value = true;

    // mGoogleMapController.periodicRerendering.value = true;
    if (order.value?.routeInformation?.polyline != null)
      mGoogleMapController.decodeAndAddPolyline(
        encodedPolylineString: order.value!.routeInformation!.polyline,
      );

    _updateMapByPhaseAndStatus();
    _orderListener = controller
        .getOrderStream(orderId)
        .listen((LaundryOrder? newOrderEvent) {
      if (newOrderEvent != null) {
        order.value = newOrderEvent;
        order.refresh();
        mezDbgPrint("getOrderStream.listen");
        _updateMapByPhaseAndStatus();
      }
    });

    waitForOrderIfNotLoaded().then((void value) {
      if (order.value == null) {
        // ignore: inference_failure_on_function_invocation
        Future<Null>.delayed(Duration.zero, () {
          MezRouter.back<Null>();
          MezSnackbar("Error", "Order does not exist");
        });
      } else {
        controller.setNotifiedAsTrue(order.value!);
      }
    });
  }

  void _updateMapByPhaseAndStatus() {
    if (order.value!.getCurrentPhase() == LaundryOrderPhase.Pickup &&
        order.value!.inDeliveryPhase()) {
      mezDbgPrint(
          "PICK UP PHASE snapshot [$_statusSnapshot] - [${order.value!.status}]");
      if (_statusSnapshot != order.value!.status) {
        if (order.value?.laundry?.location != null)
          mGoogleMapController.setLocation(
            LocModel.Location(
              "_",
              LocationData.fromMap(
                <String, dynamic>{
                  "latitude": order.value!.laundry!.location.latitude,
                  "longitude": order.value!.laundry!.location.longitude
                },
              ),
            ),
          );

        _statusSnapshot = order.value?.status;
        // add laundry marker
        mGoogleMapController.addOrUpdateUserMarker(
          latLng: order.value?.laundry?.location.toLatLng(),
          customImgHttpUrl: order.value?.laundry?.image,
          fitWithinBounds: true,
          markerId: order.value?.laundry?.id,
        );
        // add customer's marker - destination
        mGoogleMapController.addOrUpdatePurpleDestinationMarker(
          latLng: order.value?.to.toLatLng(),
          fitWithinBounds: true,
        );
      }
      // keep updating driver's marker
      mGoogleMapController.addOrUpdateUserMarker(
        latLng: order.value?.pickupDriver?.location,
        customImgHttpUrl: order.value?.pickupDriver?.image,
        fitWithinBounds: true,
        markerId: "pickup_driver",
      );

      mGoogleMapController.animateAndUpdateBounds();
    } else if (order.value!.getCurrentPhase() == LaundryOrderPhase.Dropoff &&
        order.value!.inDeliveryPhase()) {
      mezDbgPrint("DROP OFF PHASE");

      if (_statusSnapshot != order.value!.status) {
        if (order.value?.laundry?.location != null)
          mGoogleMapController.setLocation(
            LocModel.Location(
              "_",
              LocationData.fromMap(
                <String, dynamic>{
                  "latitude": order.value!.laundry!.location.latitude,
                  "longitude": order.value!.laundry!.location.longitude
                },
              ),
            ),
          );
        _statusSnapshot = order.value?.status;
        mGoogleMapController.removeMarkerById("pickup_driver");
        // add laundry marker
        mGoogleMapController.addOrUpdateUserMarker(
          latLng: order.value?.laundry?.location.toLatLng(),
          customImgHttpUrl: order.value?.laundry?.image,
          fitWithinBounds: true,
          markerId: order.value?.laundry?.id,
        );
        // add customer's marker - destination
        mGoogleMapController.addOrUpdatePurpleDestinationMarker(
          latLng: order.value?.to.toLatLng(),
          fitWithinBounds: true,
        );
      }
      // keep updating driver marker
      mezDbgPrint(
          "DROP OFF DRIVER LOCATION FROM ORDER VIEW==============>${order.value?.dropoffDriver?.location}");
      mGoogleMapController.addOrUpdateUserMarker(
        latLng: order.value?.dropoffDriver?.location,
        customImgHttpUrl: order.value?.dropoffDriver?.image,
        fitWithinBounds: true,
        markerId: "dropoff_driver",
      );
      mGoogleMapController.animateAndUpdateBounds();
    }
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mezcalmosAppBar(AppBarLeftButtonType.Back,
          autoBack: true,
          showNotifications: true,
          ordersRoute: kPastOrdersListView),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8),
        child: Obx(
          () => Column(
            children: [
              // order status
              LaundryOpOrderStatusCard(order: order.value!),
              LaundryOpOrderTimes(
                order: order.value!,
              ),
              if (_setReadyForDeliveryButton() != null)
                _setReadyForDeliveryButton()!,

              OrderEstimatedTimeComponent(order: order.value!),

              LaundryOpOrderDriverCard(order: order.value!),
              _getMapWidget(),
              LaundryOpCustomer(order: order.value!),
              if (order.value!.afterAtLaundry())
                LaundyOpSetCategoryComponent(
                  order: order.value!,
                ),

              _totalCostcomponent(context),

              LaundryOpOrderNote(order: order.value!),
              // TextButton(
              //     onPressed: () {
              //       controller.cancelOrder(order.value!.orderId);
              //     },
              //     style: TextButton.styleFrom(
              //         primary: Colors.red, backgroundColor: offRedColor),
              //     child: Container(
              //       padding: const EdgeInsets.symmetric(vertical: 5),
              //       alignment: Alignment.center,
              //       child: Text("Cancel order"),
              //     ))
            ],
          ),
        ),
      ),
    );
  }

  Widget _totalCostcomponent(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "${_i18n()["total"]}:",
              style: Theme.of(context).textTheme.bodyText1,
            ),
            (order.value!.costsByType?.totalPrice != null)
                ? Text(
                    '\$${order.value!.costsByType?.totalPrice}',
                    style: Theme.of(context).textTheme.bodyText1,
                  )
                : Text(
                    '${_i18n()["toBeCalculated"]}',
                    style: Get.textTheme.bodyText2
                        ?.copyWith(fontStyle: FontStyle.italic),
                  ),
          ],
        ),
      ),
    );
  }

  Widget? _setReadyForDeliveryButton() {
    final RxBool isClicked = RxBool(false);
    if (order.value!.isAtLaundry()) {
      return Obx(
        () => Container(
          margin: const EdgeInsets.only(bottom: 20),
          child: TextButton(
              onPressed: (order.value?.costsByType != null &&
                      order.value!.costsByType!.lineItems.isNotEmpty)
                  ? () {
                      isClicked.value = true;
                      controller
                          .setAsReadyForDelivery(order.value!.orderId)
                          .whenComplete(() => isClicked.value = false);
                    }
                  : null,
              style: TextButton.styleFrom(
                  backgroundColor: (order.value!.costsByType != null &&
                          order.value!.costsByType!.lineItems.isNotEmpty)
                      ? primaryBlueColor
                      : Colors.grey),
              child: Container(
                alignment: Alignment.center,
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                child: (isClicked.isTrue)
                    ? CircularProgressIndicator(
                        color: Colors.white,
                      )
                    : Text("${_i18n()["orderReady"]}"),
              )),
        ),
      );
    }
    return null;
  }

  Widget _getMapWidget() {
    if (order.value!.inDeliveryPhase())
      return Container(
        // color: Colors.black,
        margin: const EdgeInsets.only(bottom: 20),

        height: 350,
        child: MGoogleMap(
          mGoogleMapController: mGoogleMapController,
          padding: EdgeInsets.all(20),
          rerenderDuration: Duration(seconds: 30),
          recenterBtnBottomPadding: 20,
        ),
      );
    else
      return SizedBox();
  }
}
