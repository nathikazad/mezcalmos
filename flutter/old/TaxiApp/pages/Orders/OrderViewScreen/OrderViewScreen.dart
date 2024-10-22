import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location/location.dart' as LocationLibrary;
import 'package:mezcalmos/Shared/MezRouter.dart';
import 'package:mezcalmos/Shared/controllers/MGoogleMapController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
import 'package:mezcalmos/Shared/helpers/DateTimeHelper.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/thirdParty/MapHelper.dart'
    as MapHelper;
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder/TaxiOrder.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServerResponse.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:mezcalmos/Shared/widgets/MGoogleMap.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezDialogs.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';
import 'package:mezcalmos/Shared/widgets/MezSideMenu.dart';
import 'package:mezcalmos/Shared/widgets/MezSnackbar.dart';
import 'package:mezcalmos/Shared/widgets/OrderFromToBar.dart';
import 'package:mezcalmos/TaxiApp/components/taxiDialogs.dart';
import 'package:mezcalmos/TaxiApp/controllers/orderController.dart';
import 'package:mezcalmos/TaxiApp/controllers/taxiAuthController.dart';
import 'package:mezcalmos/TaxiApp/pages/Orders/IncomingOrders/IncomingViewScreen/components/IPositionedBottomBar.dart';
import 'package:mezcalmos/TaxiApp/router.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["TaxiApp"]["pages"]
    ["Orders"]["CurrentOrderScreen"]["CurrentOrderScreen"];

class CurrentOrderScreen extends StatefulWidget {
  @override
  _ViewCurrentOrderScreenState createState() => _ViewCurrentOrderScreenState();
}

bool isSmallDevice(BuildContext context) {
  return (context.width <= 320);
}

class _ViewCurrentOrderScreenState extends State<CurrentOrderScreen> {
  MGoogleMapController mGoogleMapController = MGoogleMapController();
  TaxiOrder? order;
  OrderController controller = Get.find<OrderController>();
  StreamSubscription<TaxiOrder?>? _orderListener;
  TaxiAuthController taxiAuthController = Get.find<TaxiAuthController>();
  RxBool _clickedBottomButton = false.obs;
  Timer? _scheduledTimeDiffrence;
  RxString _scheduledTimeDiffrenceString = "".obs;

  @override
  void initState() {
    mezDbgPrint("Inside _ViewCurrentOrderScreenState::InitState");
    final String orderId = MezRouter.urlArguments['orderId']!;
    mezDbgPrint("orderId :: $orderId");
    controller.clearOrderNotifications();
    // we need the first snapshot seprated !
    final TaxiOrder? _orderSnapshot = controller.getOrder(orderId);
    mezDbgPrint("_orderSnapshot :: $_orderSnapshot");

    if (_orderSnapshot == null) {
      MezRouter.back();
      mezcalmosDialogOrderNoMoreAvailable(context);
    } else {
      // firstTimeExecution
      _startScheduleTimeDiffrenceChecker(_orderSnapshot);

      // if (_orderSnapshot.inProcess()) {
      // populate the LatLngPoints from the encoded PolyLine String + SetState!
      mGoogleMapController.decodeAndAddPolyline(
          encodedPolylineString: _orderSnapshot.routeInformation!.polyline);
      mGoogleMapController.setLocation(_orderSnapshot.from);
      updateOrder(orderStreamEvent: _orderSnapshot);
      // set InitialPosition
      if (order?.driver?.location != null)
        mGoogleMapController.moveToNewLatLng(order!.driver!.location!.latitude,
            order!.driver!.location!.longitude);
      mGoogleMapController.lockInAutoZoomAnimation();
      // Listener
      _orderListener =
          controller.getOrderStream(orderId).listen((TaxiOrder? order) {
        if (order != null) {
          // _startScheduleTimeDiffrenceChecker(order);
          updateOrder(orderStreamEvent: order);
        }
      });
      // }
    }
    super.initState();
  }

  void _startScheduleTimeDiffrenceChecker(TaxiOrder? order) {
    void _timeDiffCheck(DateTime scheduleTime) {
      final Duration? _d = scheduleTime.toLocal().difference(DateTime.now());
      if (_d != null) {
        _scheduledTimeDiffrenceString.value = _d.ParseToHoursMinutes();
      }
    }

    if (order != null && order.status == TaxiOrdersStatus.Scheduled) {
      // first time check
      _timeDiffCheck(order.scheduledTime!);
      _scheduledTimeDiffrence =
          Timer.periodic(Duration(minutes: 1), (Timer _t) {
        // safe check as usual
        if (_scheduledTimeDiffrence == null ||
            _scheduledTimeDiffrence?.isActive == false) {
          mezDbgPrint("Inside TaxiOrdersStatus.Scheduled - timer - null!!");

          _t.cancel();
          return;
        }
        _timeDiffCheck(order.scheduledTime!);
      });
    }
  }

  @override
  void dispose() {
    cancelOrderSubscription();
    super.dispose();
  }

  Widget build(BuildContext context) {
    // make sure can't be poped, unless we do.
    mezDbgPrint("***************************************");

    return WillPopScope(
      onWillPop: () async =>
          order != null && order!.status != TaxiOrdersStatus.Scheduled,
      child: Scaffold(
        key: Get.find<SideMenuDrawerController>().getNewKey(),
        drawer: MezSideMenu(),
        backgroundColor: Colors.white,
        appBar: getRightAppBar(order!.status),
        body: order != null && mGoogleMapController.location.value != null
            ? Stack(
                alignment: Alignment.topCenter,
                children: <Widget>[
                  MGoogleMap(
                    recenterBtnBottomPadding:
                        order!.status == TaxiOrdersStatus.Scheduled ? 170 : 130,
                    mGoogleMapController: mGoogleMapController,
                    debugString: "CurrentOrderScreen",
                  ),
                  ...OrderPositionedFromToTopBar.buildWithOrderTimeBar(
                    context: context,
                    order: order!,
                  ),
                  Obx(
                    () => getScheduleTimeInfoBar(
                        order!, _scheduledTimeDiffrenceString.value),
                  ),
                  CurrentTaxiOrderPositionedBottomBar(
                    order: order!,
                  ),
                  Positioned(
                    bottom: 12, // GetStorage().read(getxGmapBottomPaddingKey),
                    left: 10,
                    right: 10,
                    child: Container(
                      width: Get.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: getRideBottomBtns(
                          _clickedBottomButton.value,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            : MezLogoAnimation(
                centered: true,
              ),
      ),
    ); // no need for obx here.
  }

  List<Widget> getRideBottomBtns(bool inActiveClick) {
    switch (order!.status) {
      case TaxiOrdersStatus.LookingForTaxi:
      case TaxiOrdersStatus.LookingForTaxiScheduled:
      case TaxiOrdersStatus.Scheduled:
        if (order?.scheduledTime != null) {
          return order!.scheduledTime!.difference(DateTime.now()).inMinutes <=
                  30
              ? [
                  Obx(
                    () => Expanded(
                      child: button(
                        inActiveClick: _clickedBottomButton.value,
                        bgColor: Color.fromRGBO(233, 219, 245, 1),
                        color: Color.fromRGBO(172, 89, 252, 1),
                        text: 'Start Ride',
                        onTap: () async {
                          _clickedBottomButton.value = true;

                          await controller.startScheduledRide();
                          setState(() {});
                          _clickedBottomButton.value = false;
                        },
                      ),
                    ),
                  ),
                  SizedBox(width: 4),
                  _cancelButton,
                ]
              : [
                  Obx(
                    () => Expanded(
                      child: button(
                          inActiveClick: _clickedBottomButton.value,
                          bgColor: Color.fromRGBO(237, 237, 237, 1),
                          color: Color.fromRGBO(120, 120, 120, 1),
                          text: 'Start Ride',
                          onTap: () => null),
                    ),
                  ),
                  SizedBox(width: 4),
                  _cancelButton
                ];
        }
        // if nto scheduled
        return [
          Obx(
            () => Expanded(
              child: button(
                  bgColor: Color.fromRGBO(233, 219, 245, 1),
                  color: Color.fromRGBO(172, 89, 252, 1),
                  inActiveClick: _clickedBottomButton.value,
                  text: 'Start Ride',
                  onTap: () {
                    _clickedBottomButton.value = true;
                    controller.startRide();
                    setState(() {});
                    _clickedBottomButton.value = false;
                  }),
            ),
          ),
          SizedBox(width: 4),
          _cancelButton
        ];
      case TaxiOrdersStatus.OnTheWay:
        return [
          Obx(
            () => Expanded(
              child: button(
                bgColor: Color.fromRGBO(233, 219, 245, 1),
                color: Color.fromRGBO(172, 89, 252, 1),
                inActiveClick: _clickedBottomButton.value,
                text: 'Pick up',
                onTap: () async {
                  if (Get.find<TaxiAuthController>().currentLocation == null)
                    await _showConfirmationDialog();
                  else if ((MapHelper.calculateDistance(
                        Get.find<TaxiAuthController>().currentLocation!,
                        order!.dropOffLocation.position,
                      ) >
                      0.5)) {
                    await _showConfirmationDialog();
                  } else {
                    _clickedBottomButton.value = true;
                    await controller.startRide();
                    setState(() {});
                    _clickedBottomButton.value = false;
                  }
                },
              ),
            ),
          ),
          SizedBox(width: 4),
          _cancelButton
        ];

      case TaxiOrdersStatus.InTransit:
        return [
          Obx(
            () => Expanded(
              child: button(
                bgColor: Color.fromRGBO(233, 219, 245, 1),
                color: Color.fromRGBO(172, 89, 252, 1),
                text: 'Finish ride',
                inActiveClick: _clickedBottomButton.value,
                onTap: () async {
                  await showConfirmationDialog(
                    context,
                    title: 'Oops!',
                    primaryButtonText: "Yes, finish ride",
                    helperText: _i18n()["tooFarFromfinishRide"],
                    onYesClick: () async {
                      final ServerResponse resp = await controller.finishRide();
                      if (!resp.success) {
                        MezSnackbar("Error", "Server Error");
                      }
                      setState(() {});
                      _clickedBottomButton.value = false;
                      MezRouter.back();
                    },
                  );
                },
              ),
            ),
          ),
          SizedBox(width: 4),
          _cancelButton
        ];

      case TaxiOrdersStatus.DroppedOff:
        return [
          getTaxiRideStatusBar(
            'Customer has been dropped off.',
            Icon(
              Icons.check_circle,
              color: Color.fromRGBO(33, 145, 37, 0.86),
            ),
          )
        ];

      case TaxiOrdersStatus.CancelledByCustomer:
        return [
          getTaxiRideStatusBar(
            'Customer has cancelled the ride',
            Icon(
              Icons.cancel,
              color: Colors.red,
            ),
          )
        ];
      case TaxiOrdersStatus.CancelledByTaxi:
        return [
          getTaxiRideStatusBar(
            'You have cancelled this ride',
            Icon(
              Icons.cancel,
              color: Colors.red,
            ),
          )
        ];
      default:
        return [SizedBox()];
    }
  }

  Future<void> _showConfirmationDialog() async {
    return showStatusInfoDialog(
      context,
      status: "Confirm",
      description: _i18n()["tooFarFromstartRide"],
      primaryClickTitle: "Yes, start ride",
      primaryCallBack: () async {
        final ServerResponse resp = await controller.startRide();
        if (!resp.success) {
          MezSnackbar("Error", "Server Error");
        }
      },
      secondaryClickTitle: "No",
      secondaryCallBack: () => MezRouter.back<void>(),
    );

    // showConfirmationDialog(
    //   context,
    //   title: 'Oops!',
    //   primaryButtonText: "Yes, start ride",
    //   helperText: _i18n()["tooFarFromstartRide"],
    //   onYesClick: () async {
    //     final ServerResponse resp = await controller.startRide();
    //     if (!resp.success) {
    //       MezSnackbar("Error", "Server Error");
    //     }
    //     _clickedBottomButton.value = false;
    //     setState(() {});
    //     MezRouter.back();
    //   },
    // );
  }

  Expanded get _cancelButton => Expanded(
        child: button(
          bgColor: Color.fromRGBO(249, 216, 214, 1),
          color: Color.fromRGBO(226, 17, 50, 1),
          text: 'Cancel Ride',
          inActiveClick: _clickedBottomButton.value,
          onTap: () {
            showConfirmationDialog(context, onYesClick: () async {
              _clickedBottomButton.value = true;
              final ServerResponse resp = await controller.cancelTaxi(null);
              if (!resp.success) {
                MezSnackbar("Error", "Server Error");
              }
              MezRouter.back();
            }).whenComplete(() => _clickedBottomButton.value = false);
          },
        ),
      );

  // Handling Event ------------------------------------------------------------------------------------

  /// 1 - Check if the [orderStreamEvent.status] has a diffrent status than the last [order.status]
  ///
  /// 2 - handle marker changes depending on which state.
  ///
  /// 3 - Change some variables that we use in viewParts.
  ///```dart
  /// setState((){
  ///   order = orderStreamEvent;
  ///   initialPosition = order.driver.location;
  /// });
  /// ```
  void updateOrder({required TaxiOrder orderStreamEvent}) {
    mezDbgPrint("UPDATING ORDER ùùùùùùùù");
    if (orderStreamEvent.status != order?.status) {
      switch (orderStreamEvent.status) {
        case TaxiOrdersStatus.Scheduled:
        case TaxiOrdersStatus.OnTheWay:
          // Add the customer's Marker
          mGoogleMapController.addOrUpdateUserMarker(
              markerId: orderStreamEvent.customer.firebaseId,
              latLng: orderStreamEvent.from.toLatLng(),
              customImgHttpUrl: orderStreamEvent.customer.image);
          // add the Taxi's
          // if (orderStreamEvent.driver?.location != null)
          //   mGoogleMapController.addOrUpdateTaxiDriverMarker(
          //       orderStreamEvent.driver!.id,
          //       orderStreamEvent.driver!.location!);

          mGoogleMapController.addOrUpdatePurpleDestinationMarker(
            latLng: orderStreamEvent.dropOffLocation.toLatLng(),
          );
          break;
        case TaxiOrdersStatus.InTransit:
          // no more showing the customer's marker
          mGoogleMapController
              .removeMarkerById(orderStreamEvent.customer.firebaseId);
          // add the destination marker
          mGoogleMapController.addOrUpdatePurpleDestinationMarker(
            latLng: orderStreamEvent.dropOffLocation.toLatLng(),
          );
          break;
        case TaxiOrdersStatus.DroppedOff:
          // no more showing the taxi's Marker:
          mGoogleMapController
              .removeMarkerById(orderStreamEvent.driver!.firebaseId);
          // Add the customer's from Marker
          mGoogleMapController.addOrUpdateUserMarker(
            markerId: orderStreamEvent.customer.firebaseId,
            latLng: orderStreamEvent.from.toLatLng(),
            customImgHttpUrl: orderStreamEvent.customer.image,
          );

          mGoogleMapController.addOrUpdatePurpleDestinationMarker(
            latLng: orderStreamEvent.dropOffLocation.toLatLng(),
          );

          break;
        default:
      }
      setState(
        () {
          order = orderStreamEvent;
          if (order?.driver?.location != null)
            mGoogleMapController.setLocation(
              MezLocation(
                "CurrentLocation",
                LocationLibrary.LocationData.fromMap(
                  <String, double>{
                    "latitude": order!.driver!.location!.latitude,
                    "longitude": order!.driver!.location!.longitude
                  },
                ),
              ),
            );
        },
      );
    } else {
      // in case there is no status Changes
      // we simply keep updating the taxi's Marker's location , only if inProcess!
      if (orderStreamEvent.inProcess()) {
        mGoogleMapController.addOrUpdateTaxiDriverMarker(
          orderStreamEvent.driver?.firebaseId,
          orderStreamEvent.driver?.location,
        );
      }
    }
  }

  PreferredSizeWidget getRightAppBar(TaxiOrdersStatus status) {
    if (order!.isPastOrder() || order!.status == TaxiOrdersStatus.Scheduled) {
      return MezcalmosAppBar(AppBarLeftButtonType.Back,
          //   onClick: MezRouter.back,
          // );
          onClick: () => MezRouter.offNamedUntil<void>(
              kIncomingOrdersListRoute, ModalRoute.withName(kHomeRoute)));
    } else {
      return MezcalmosAppBar(AppBarLeftButtonType.Menu, onClick: () async {
        Get.find<SideMenuDrawerController>().openMenu();
      });
    }
  }

  void cancelOrderSubscription() {
    _orderListener?.cancel();
    _orderListener = null;
  }
}

Widget button({
  required Color color,
  required Color bgColor,
  required String text,
  required void Function() onTap,
  required bool inActiveClick,
}) {
  return InkWell(
      onTap: inActiveClick ? null : onTap,
      child: Container(
        height: 45,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(175, 175, 175, 0.25),
              offset: Offset(2.47, 2.47),
              blurRadius: 8.23,
            )
          ],
          borderRadius: BorderRadius.circular(8),
          color: inActiveClick
              ? Colors.grey.shade400
              : bgColor, // Color.fromRGBO(206, 225, 205, 1),
        ),
        child: Center(
          child: Text(
            // _i18n()["acceptOrders"],
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: inActiveClick ? Colors.grey.shade700 : color,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ));
}

Widget getScheduleTimeInfoBar(TaxiOrder order, String t) {
  if (order.scheduledTime != null &&
      order.scheduledTime!.difference(DateTime.now()).inMinutes > 30 &&
      order.status == TaxiOrdersStatus.Scheduled)
    return Positioned(
      bottom: 128,
      left: 10,
      right: 10,
      child: Container(
        height: 34,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(9),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(175, 175, 175, .25),
              offset: Offset(2.47, 2.47),
              blurRadius: 8.23,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 5,
            ),
            Icon(
              Icons.info_outline,
              size: 13,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              'You can start your ride 30 min before the ride',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
                fontSize: 13,
                fontStyle: FontStyle.italic,
                color: Colors.black,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              width: 1,
              color: Colors.grey.withOpacity(.3),
              height: 20,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              t,
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
                fontSize: 13,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  else
    return SizedBox();
}

Widget getTaxiRideStatusBar(String text, Icon icon) {
  return Positioned(
    bottom: 135,
    left: 10,
    right: 10,
    child: Expanded(
      child: Container(
        height: 46,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(9),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(175, 175, 175, .25),
              offset: Offset(2.47, 2.47),
              blurRadius: 8.23,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: 10),
            Text(
              text,
              textAlign: TextAlign.start,
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w700,
                fontSize: 15,
                color: Colors.black,
              ),
            ),
            Spacer(),
            icon,
            SizedBox(width: 10),
          ],
        ),
      ),
    ),
  );
}

Future<void> showNoConfirmationDialog(
    Function callback, Icon? icon, String bodyText) async {
  final YesNoDialogButton clickedYes = await yesNoDialog(
    text: 'Oops!',
    icon: Container(
      child: icon,
    ),
    body: bodyText,
  );
  if (clickedYes == YesNoDialogButton.Yes) {
    await callback();
  }
}

Future<void> checkDistanceAndExecute({
  required TaxiOrder order,
  required dynamic Function() callback,
  Icon? icon,
  required String bodyText,
}) async {
  mezDbgPrint("checkDistanceAndExecute => called !");
  if (Get.find<TaxiAuthController>().currentLocation == null)
    await showNoConfirmationDialog(callback, icon, bodyText);
  else if ((MapHelper.calculateDistance(
          Get.find<TaxiAuthController>().currentLocation!,
          order.dropOffLocation.position) >
      0.5)) {
    await showNoConfirmationDialog(callback, icon, bodyText);
  } else {
    await callback();
  }
}
