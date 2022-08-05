import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:mezcalmos/RestaurantApp/controllers/orderController.dart';
import 'package:mezcalmos/RestaurantApp/pages/OrderView/components/ROpDriverCard.dart';
import 'package:mezcalmos/RestaurantApp/pages/OrderView/components/ROpOrderCustomer.dart';
import 'package:mezcalmos/RestaurantApp/pages/OrderView/components/ROpOrderEstTime.dart';
import 'package:mezcalmos/RestaurantApp/pages/OrderView/components/ROpOrderHandleButton.dart';
import 'package:mezcalmos/RestaurantApp/pages/OrderView/components/ROpOrderItems.dart';
import 'package:mezcalmos/RestaurantApp/pages/OrderView/components/ROpOrderNote.dart';
import 'package:mezcalmos/RestaurantApp/pages/OrderView/components/ROpOrderStatusCard.dart';
import 'package:mezcalmos/RestaurantApp/pages/OrderView/components/ROpOrderSummaryCard.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/MGoogleMapController.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart' as LocModel;
import 'package:mezcalmos/Shared/models/Utilities/ServerResponse.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MGoogleMap.dart';
import 'package:mezcalmos/Shared/widgets/MezSnackbar.dart';

// dynamic _i18n() => Get.find<LanguageController>().strings['LaundryApp']['pages']
//     ['OrderView']['ROpOrderView'];

class ROpOrderView extends StatefulWidget {
  const ROpOrderView({Key? key}) : super(key: key);

  @override
  State<ROpOrderView> createState() => _ROpOrderViewState();
}

class _ROpOrderViewState extends State<ROpOrderView> {
  Rxn<RestaurantOrder> order = Rxn<RestaurantOrder>();
  ROpOrderController controller = Get.find<ROpOrderController>();
  final MGoogleMapController mGoogleMapController = MGoogleMapController(
    enableMezSmartPointer: true,
  );
  StreamSubscription? _orderListener;
  RestaurantOrderStatus? _statusSnapshot;
  @override
  void initState() {
    final String orderId = Get.parameters['orderId']!;
    controller.clearOrderNotifications(orderId);
    order.value = controller.getOrder(orderId) as RestaurantOrder;
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
        .listen((RestaurantOrder? newOrderEvent) {
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
          Get.back<Null>();
          MezSnackbar("Error", "Order does not exist");
        });
      } else {
        // controller.setNotifiedAsTrue(order.value!);
      }
    });
  }

  void _updateMapByPhaseAndStatus() {
    if (order.value!.inDeliveryPhase()) {
      mezDbgPrint(
          "PICK UP PHASE snapshot [$_statusSnapshot] - [${order.value!.status}]");
      if (_statusSnapshot != order.value!.status) {
        if (order.value?.restaurant.location != null)
          mGoogleMapController.setLocation(
            LocModel.Location(
              "_",
              LocationData.fromMap(
                <String, dynamic>{
                  "latitude": order.value!.restaurant.location.latitude,
                  "longitude": order.value!.restaurant.location.longitude
                },
              ),
            ),
          );

        _statusSnapshot = order.value?.status;
        // add laundry marker
        mGoogleMapController.addOrUpdateUserMarker(
          latLng: order.value?.restaurant.location.toLatLng(),
          customImgHttpUrl: order.value?.restaurant.image,
          fitWithinBounds: true,
          markerId: order.value?.restaurant.id,
        );
        // add customer's marker - destination
        mGoogleMapController.addOrUpdatePurpleDestinationMarker(
          latLng: order.value?.to.toLatLng(),
          fitWithinBounds: true,
        );
      }
      // keep updating driver's marker
      mGoogleMapController.addOrUpdateUserMarker(
        latLng: order.value?.dropoffDriver?.location,
        customImgHttpUrl: order.value?.dropoffDriver?.image,
        fitWithinBounds: true,
        markerId: "dropOff_driver",
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
          onClick: Get.back,
          titleWidget: Obx(() => Text("${order.value!.customer.name}"))),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Obx(
          () => Column(
            children: [
              // order status
              ROpOrderStatusCard(order: order.value!),

              ROpOrderHandleButton(order: order.value!),
              ROpOrderEstTime(order: order.value!),
              ROpDriverCard(order: order.value!),
              _getMapWidget(),
              ROpOrderCustomer(order: order.value!),
              _orderItemsList(),

              ROpOrderSummaryCard(
                order: order.value!,
              ),
              ROpOrderNote(order: order.value!),
              // ROpRefundButton(
              //   order: order.value!,
              // ),
              if (order.value!.inProcess())
                TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: offRedColor, primary: Colors.red),
                    onPressed: () {
                      showConfirmationDialog(context, onYesClick: () async {
                        await controller
                            .cancelOrder(order.value!.orderId)
                            .then((ServerResponse value) => Get.back());
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(8),
                      child: Text("Cancel order"),
                    ))
            ],
          ),
        ),
      ),
    );
  }

  Widget _orderItemsList() {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Order items",
            style: Get.textTheme.bodyText1,
          ),
          SizedBox(
            height: 10,
          ),
          Column(
            children: List.generate(
                order.value!.items.length,
                (int index) => ROpOrderItems(
                      item: order.value!.items[index],
                      order: order.value!,
                    )),
          ),
        ],
      ),
    );
  }

  Widget _getMapWidget() {
    if (order.value!.inDeliveryPhase())
      return Container(
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
