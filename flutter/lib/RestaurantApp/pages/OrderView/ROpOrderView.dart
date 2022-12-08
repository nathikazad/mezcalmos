import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:mezcalmos/RestaurantApp/controllers/orderController.dart';
import 'package:mezcalmos/RestaurantApp/pages/OrderView/components/ROpDriverCard.dart';
import 'package:mezcalmos/RestaurantApp/pages/OrderView/components/ROpEstDeliveryTime.dart';
import 'package:mezcalmos/RestaurantApp/pages/OrderView/components/ROpOrderCustomer.dart';
import 'package:mezcalmos/RestaurantApp/pages/OrderView/components/ROpOrderEstTime.dart';
import 'package:mezcalmos/RestaurantApp/pages/OrderView/components/ROpOrderHandleButton.dart';
import 'package:mezcalmos/RestaurantApp/pages/OrderView/components/ROpOrderItems.dart';
import 'package:mezcalmos/RestaurantApp/pages/OrderView/components/ROpOrderNote.dart';
import 'package:mezcalmos/RestaurantApp/pages/OrderView/components/ROpOrderStatusCard.dart';
import 'package:mezcalmos/RestaurantApp/pages/OrderView/components/ROpRefundBtn.dart';
import 'package:mezcalmos/RestaurantApp/pages/OrderView/controller/ROpORderViewController.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/MGoogleMapController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart' as LocModel;
import 'package:mezcalmos/Shared/models/Utilities/ServerResponse.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MGoogleMap.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';
import 'package:mezcalmos/Shared/widgets/Order/OrderDeliveryLocation.dart';
import 'package:mezcalmos/Shared/widgets/Order/OrderPaymentMethod.dart';
import 'package:mezcalmos/Shared/widgets/Order/OrderSummaryCard.dart';
import 'package:mezcalmos/Shared/widgets/RestaurantOrderDeliveryTimeCard.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['RestaurantApp']
    ['pages']['ROpOrderView'];

class ROpOrderView extends StatefulWidget {
  const ROpOrderView({Key? key}) : super(key: key);

  @override
  State<ROpOrderView> createState() => _ROpOrderViewState();
}

class _ROpOrderViewState extends State<ROpOrderView> {
  // Rxn<RestaurantOrder> order = Rxn<RestaurantOrder>();
  ROpOrderController controller = Get.find<ROpOrderController>();
  ROpOrderViewController viewController = ROpOrderViewController();
  final MGoogleMapController mGoogleMapController = MGoogleMapController(
    enableMezSmartPointer: true,
  );

  RestaurantOrderStatus? _statusSnapshot;
  @override
  void initState() {
    final String? orderId = Get.parameters['orderId'];
    mezDbgPrint("ORDER ID ==================================>>>>$orderId");
    if (orderId != null && int.tryParse(orderId) != null) {
      viewController.init(orderId: int.parse(orderId));
    }
  }

  void _updateMapByPhaseAndStatus() {
    if (viewController.order.value!.inDeliveryPhase()) {
      mezDbgPrint(
          "PICK UP PHASE snapshot [$_statusSnapshot] - [${viewController.order.value!.status}]");
      if (_statusSnapshot != viewController.order.value!.status) {
        if (viewController.order.value?.restaurant.location != null)
          mGoogleMapController.setLocation(
            LocModel.Location(
              "_",
              LocationData.fromMap(
                <String, dynamic>{
                  "latitude":
                      viewController.order.value!.restaurant.location.latitude,
                  "longitude":
                      viewController.order.value!.restaurant.location.longitude
                },
              ),
            ),
          );

        _statusSnapshot = viewController.order.value?.status;
        // add laundry marker
        mGoogleMapController.addOrUpdateUserMarker(
          latLng: viewController.order.value?.restaurant.location.toLatLng(),
          customImgHttpUrl: viewController.order.value?.restaurant.image,
          fitWithinBounds: true,
          markerId: viewController.order.value?.restaurant.firebaseId,
        );
        // add customer's marker - destination
        mGoogleMapController.addOrUpdatePurpleDestinationMarker(
          latLng: viewController.order.value?.to.toLatLng(),
          fitWithinBounds: true,
        );
      }
      // keep updating driver's marker
      mGoogleMapController.addOrUpdateUserMarker(
        latLng: viewController.order.value?.dropoffDriver?.location,
        customImgHttpUrl: viewController.order.value?.dropoffDriver?.image,
        fitWithinBounds: true,
        markerId: "dropOff_driver",
      );

      mGoogleMapController.animateAndUpdateBounds();
    }
  }

  Future<void> waitForOrderIfNotLoaded() {
    if (viewController.order.value != null) {
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
          titleWidget: Obx(() =>
              Text("${viewController.order.value?.customer.name ?? ""}"))),
      body: Obx(() {
        if (viewController.order.value != null) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                // order status
                ROpOrderStatusCard(order: viewController.order.value!),

                ROpOrderHandleButton(order: viewController.order.value!),
                ROpOrderEstTime(order: viewController.order.value!),
                if (viewController.order.value?.selfDelivery ?? false)
                  ROpEstDeliveryTime(order: viewController.order.value!),
                ROpDriverCard(order: viewController.order.value!),
                _getMapWidget(),
                ROpOrderCustomer(order: viewController.order.value!),
                _orderItemsList(),
                RestaurantOrderDeliveryTimeCard(
                    order: viewController.order.value!),
                Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    child: OrderDeliveryLocation(
                        order: viewController.order.value!)),
                Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    child:
                        OrderPaymentMethod(order: viewController.order.value!)),
                OrderSummaryCard(
                  order: viewController.order.value!,
                  margin: const EdgeInsets.only(bottom: 20),
                ),
                ROpOrderNote(order: viewController.order.value!),

                ROpRefundButton(
                  order: viewController.order.value!,
                ),
                if (viewController.order.value!.inProcess())
                  TextButton(
                      style: TextButton.styleFrom(
                          foregroundColor: Colors.red,
                          backgroundColor: offRedColor),
                      onPressed: () {
                        showConfirmationDialog(context, onYesClick: () async {
                          await controller
                              .cancelOrder(viewController.order.value!.orderId)
                              .then((ServerResponse value) => Get.back());
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(8),
                        child: Text('${_i18n()["cancelOrder"]}'),
                      ))
              ],
            ),
          );
        } else
          return Container(
            alignment: Alignment.center,
            child: MezLogoAnimation(centered: true),
          );
      }),
    );
  }

  Widget _orderItemsList() {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${_i18n()["orderItems"]}',
            style: Get.textTheme.bodyText1,
          ),
          SizedBox(
            height: 10,
          ),
          Column(
            children: List.generate(
                viewController.order.value!.items.length,
                (int index) => ROpOrderItems(
                      item: viewController.order.value!.items[index],
                      order: viewController.order.value!,
                    )),
          ),
        ],
      ),
    );
  }

  Widget _getMapWidget() {
    if (viewController.order.value!.inDeliveryPhase())
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
