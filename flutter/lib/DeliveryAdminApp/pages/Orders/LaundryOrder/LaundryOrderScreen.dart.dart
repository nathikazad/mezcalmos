import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryAdminApp/components/DeliveryAdminAppbar.dart';
import 'package:mezcalmos/DeliveryAdminApp/controllers/deliveryDriverController.dart';
import 'package:mezcalmos/DeliveryAdminApp/controllers/laundryOrderController.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/Orders/Components/DriverCard.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/Orders/Components/LaundryProviderCard.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/Orders/LaundryOrder/Components/BuildOrderButtons.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/Orders/LaundryOrder/Components/LaundryOrderCustomer.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/Orders/LaundryOrder/Components/LaundryOrderStatusCard.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/Orders/LaundryOrder/Components/LaundryOrderSummary.dart';
import 'package:mezcalmos/Shared/controllers/MGoogleMapController.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Drivers/DeliveryDriver.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/ServerResponse.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MGoogleMap.dart';
import 'package:mezcalmos/Shared/models/Location.dart' as LocModel;

dynamic _i18n() => Get.find<LanguageController>().strings["DeliveryAdminApp"]
    ['pages']['Orders']["LaundryOrder"]["LaundryOrderScreen"];

class LaundryOrderScreen extends StatefulWidget {
  const LaundryOrderScreen({Key? key}) : super(key: key);

  @override
  State<LaundryOrderScreen> createState() => _LaundryOrderScreenState();
}

class _LaundryOrderScreenState extends State<LaundryOrderScreen> {
  ///--------------- Controllers ------------------------//
  AuthController auth = Get.find<AuthController>();
  LaundryOrderController controller = Get.find<LaundryOrderController>();
  DeliveryDriverController deliveryDriverController =
      Get.find<DeliveryDriverController>();

  ///--------------- Controllers ------------------------//

  /// ------------------ variables ------------------//
  Rxn<LaundryOrder> order = Rxn<LaundryOrder>();

  late String orderId;
  Rx<bool> hasNewMessage = false.obs;
  StreamSubscription<dynamic>? _orderListener;

  /// ------------------ variables ------------------//
  DeliveryDriverUserInfo? driver;

  /// DeliveryDriverUserInfoAndUpdateStatus
  ValueNotifier<DeliveryDriverUserInfoAndUpdateStatus>
      _deliveryDriverUserInfoAndUpdateStatusNotifier =
      ValueNotifier<DeliveryDriverUserInfoAndUpdateStatus>(
    DeliveryDriverUserInfoAndUpdateStatus(),
  );

  LaundryOrderPhase? _phaseSnapshot;
  final MGoogleMapController mapController = MGoogleMapController(
    enableMezSmartPointer: false,
  );

  @override
  void initState() {
    super.initState();
    initMap();
    orderId = Get.parameters['orderId']!;
    controller.clearNewOrderNotifications();
    order.value = controller.getOrder(orderId);
    if (order.value == null) {
      Get.back<void>();
    } else {
      updateMapByPhase(order.value!.getCurrentPhase());
      _orderListener = controller.getCurrentOrderStream(orderId).listen(
        (LaundryOrder? newOrder) {
          if (newOrder != null) {
            updateMapByPhase(newOrder.getCurrentPhase());
            order.value = controller.getOrder(orderId);

            if (order.value?.dropoffDriver != null) {
              driver = order.value!.dropoffDriver;
            }
          } else {
            //    Get.back();
          }
        },
      );
    }

    /// Get Right driver
    _deliveryDriverUserInfoAndUpdateStatusNotifier.value =
        DeliveryDriverUserInfoAndUpdateStatus(
      deliveryDriverUserInfo: getRightDriver(),
    );
  }

  @override
  void dispose() {
    _orderListener?.cancel();
    _orderListener = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    /// TextTheme
    final TextTheme txt = Theme.of(context).textTheme;
    return Obx(
      () => Scaffold(
          appBar: deliveryAdminAppBar(AppBarLeftButtonType.Back,
              function: Get.back, withOrder: true),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  LaundryOrderStatusCard(
                    order: order.value!,
                  ),
                  const SizedBox(height: 10),
                  if (order.value!.getCurrentPhase() !=
                      LaundryOrderPhase.Neither)
                    ..._mapWidget,
                  LaundryProviderCard(
                    laundryID: order.value?.laundry?.id ?? null,
                    order: order.value!,
                  ),

                  //   if (order.value?.inProcess() ?? false)

                  ValueListenableBuilder<DeliveryDriverUserInfoAndUpdateStatus>(
                    valueListenable:
                        _deliveryDriverUserInfoAndUpdateStatusNotifier,
                    builder: (
                      _,
                      DeliveryDriverUserInfoAndUpdateStatus
                          deliveryDriverUserInfo,
                      __,
                    ) {
                      return DriverCard(
                        driver: (order.value!.getCurrentPhase() ==
                                LaundryOrderPhase.Pickup)
                            ? order.value!.pickupDriver
                            : order.value!.dropoffDriver,
                        order: order.value!,
                        driverUserInfoAndUpdateStatus: deliveryDriverUserInfo
                            .driverUserInfoAndUpdateStatus,
                        assignDriverCallback: ({
                          required DeliveryDriver deliveryDriver,
                          required bool changeDriver,
                        }) async {
                          /// Check That The driver has been changed!
                          if (deliveryDriverUserInfo.deliveryDriverUserInfo !=
                                  null &&
                              (deliveryDriver.driverInfo.id !=
                                  deliveryDriverUserInfo
                                      .deliveryDriverUserInfo!.id)) {
                            /// Uploading
                            deliveryDriverUserInfo
                                    .driverUserInfoAndUpdateStatus =
                                DriverUserInfoAndUpdateStatus.uploading;

                            /// notifyListeners
                            _deliveryDriverUserInfoAndUpdateStatusNotifier
                                .notifyListeners();
                          }

                          /// assignDeliveryDriver
                          final ServerResponse serverResponse =
                              await deliveryDriverController
                                  .assignDeliveryDriver(
                            deliveryDriverId: deliveryDriver.deliveryDriverId,
                            orderId: order.value!.orderId,
                            orderType: OrderType.Laundry,
                            deliveryDriverType: getRightDeliveryDriverType(),
                            changeDriver: changeDriver,
                          );
                          mezDbgPrint(
                              "mmmmmmmmmmmmmmmmzzzzzzzzzz $changeDriver");

                          if (serverResponse.status == ResponseStatus.Success) {
                            /// Set the new driver
                            _deliveryDriverUserInfoAndUpdateStatusNotifier
                                .value = DeliveryDriverUserInfoAndUpdateStatus(
                              deliveryDriverUserInfo: deliveryDriver.driverInfo,
                              driverUserInfoAndUpdateStatus:
                                  DriverUserInfoAndUpdateStatus.staring,
                            );

                            /// Them Show The notification

                          } else {
                            /// Error
                            Get.snackbar(
                              'Ops!',
                              'Something went wrong, Please try to edit the driver again!',
                            );

                            /// Change status to staring
                            deliveryDriverUserInfo
                                    .driverUserInfoAndUpdateStatus =
                                DriverUserInfoAndUpdateStatus.staring;

                            /// notifyListeners
                            _deliveryDriverUserInfoAndUpdateStatusNotifier
                                .notifyListeners();
                          }
                        },
                      );
                    },
                  ),

                  if (order.value?.inProcess() ?? false)
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: buildOrderButtons(order),
                      ),
                    ),
                  LaundryOrderCustomer(order: order.value!),
                  const SizedBox(height: 10),
                  const SizedBox(height: 10),
                  LaundryOrderSummary(
                    order: order.value!,
                  ),
                  SizedBox(height: 10),
                  deliveryLocation(txt, context),
                  const SizedBox(height: 10),
                  orderNotes(txt),
                ],
              ),
            ),
          )),
    );
  }

// Card that shows the notes assigned with the orders
  Widget orderNotes(TextTheme txt) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.all(8),
          child: Text(
            '${_i18n()['notes']}',
            style: txt.headline3,
          ),
        ),
        Card(
          child: Container(
            padding: const EdgeInsets.all(16),
            width: double.infinity,
            child: Text(
              order.value!.notes!,
            ),
          ),
        ),
      ],
    );
  }

// Card that shows the delivery location of the order
  Widget deliveryLocation(TextTheme txt, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.all(8),
          child: Text(
            '${_i18n()['deliveryLocation']}',
            style: txt.headline3,
          ),
        ),
        Card(
          child: Container(
            padding: const EdgeInsets.all(8),
            width: double.infinity,
            child: Row(
              children: [
                Icon(
                  Icons.place_rounded,
                  color: Theme.of(context).primaryColorLight,
                ),
                SizedBox(
                  width: 5,
                ),
                Flexible(child: Text(order.value!.to.address, maxLines: 1)),
              ],
            ),
          ),
        ),
      ],
    );
  }

  DeliveryDriverUserInfo? getRightDriver() {
    switch (order.value!.getCurrentPhase()) {
      case (LaundryOrderPhase.Dropoff):
        return order.value!.dropoffDriver;
      case (LaundryOrderPhase.Pickup):
        return order.value!.pickupDriver;
      default:
        return order.value!.dropoffDriver;
    }
  }

  DeliveryDriverType getRightDeliveryDriverType() {
    switch (order.value!.getCurrentPhase()) {
      case (LaundryOrderPhase.Dropoff):
        return DeliveryDriverType.DropOff;
      case (LaundryOrderPhase.Pickup):
        return DeliveryDriverType.Pickup;
      default:
        return DeliveryDriverType.DropOff;
    }
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
      latLng: order.value!.laundry!.location.toLatLng(),
      markerId: order.value!.laundry!.id,
      customImgHttpUrl: order.value!.laundry!.image,
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

  void updateMapByPhase(LaundryOrderPhase phase) {
    switch (phase) {
      case LaundryOrderPhase.Pickup:
        if (_phaseSnapshot != phase) {
          _phaseSnapshot = phase;
          // we ignore the marker within bounds
          mapController.addOrUpdateUserMarker(
            latLng: order.value!.laundry!.location.toLatLng(),
            markerId: order.value!.laundry!.id,
            customImgHttpUrl: order.value!.laundry!.image,
            fitWithinBounds: true,
          );
          mapController.addOrUpdatePurpleDestinationMarker(
            latLng: order.value!.to.toLatLng(),
            fitWithinBounds: false,
          );
        }
        // only if pickUpDriver not null
        if (order.value!.pickupDriver != null) {
          mapController.addOrUpdateUserMarker(
            latLng: order.value!.pickupDriver!.location!,
            markerId: order.value!.pickupDriver!.id,
            customImgHttpUrl: order.value!.pickupDriver!.image,
            fitWithinBounds: true,
          );
        }

        mapController.animateAndUpdateBounds(shouldFitPolylineInBound: false);
        break;

      case LaundryOrderPhase.Dropoff:
        if (_phaseSnapshot != phase) {
          _phaseSnapshot = phase;
          // we ignore the restaurant's marker within bounds
          mapController.addOrUpdateUserMarker(
            latLng: order.value!.laundry!.location.toLatLng(),
            markerId: order.value!.laundry!.id,
            customImgHttpUrl: order.value!.laundry!.image,
            fitWithinBounds: false,
          );
          // we fit the destination into bounds
          mapController.addOrUpdatePurpleDestinationMarker(
            latLng: order.value!.to.toLatLng(),
            fitWithinBounds: true,
          );
        }

        // we keep updating the delivery's
        if (order.value!.dropoffDriver != null) {
          mapController.addOrUpdateUserMarker(
            latLng: order.value!.dropoffDriver!.location!,
            markerId: order.value!.dropoffDriver!.id,
            customImgHttpUrl: order.value!.dropoffDriver!.image,
            fitWithinBounds: true,
          );
        }
        mapController.animateAndUpdateBounds();
        break;
      default:
    }
  }
}
