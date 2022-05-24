import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location/location.dart' as LocationLibrary;
import 'package:mezcalmos/Shared/controllers/MGoogleMapController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Location.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder/TaxiOrder.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/helpers/MapHelper.dart' as MapHelper;
import 'package:mezcalmos/Shared/widgets/MGoogleMap.dart';
import 'package:mezcalmos/Shared/widgets/MezDialogs.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';
import 'package:mezcalmos/Shared/widgets/MezSideMenu.dart';
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

  @override
  void initState() {
    mezDbgPrint("Inside _ViewCurrentOrderScreenState::InitState");
    final String orderId = Get.parameters['orderId']!;
    mezDbgPrint("orderId :: $orderId");
    controller.clearOrderNotifications();
    // we need the first snapshot seprated !
    final TaxiOrder? _orderSnapshot = controller.getOrder(orderId);
    mezDbgPrint("_orderSnapshot :: $_orderSnapshot");

    if (_orderSnapshot == null) {
      Get.back<void>();
      mezcalmosDialogOrderNoMoreAvailable(context);
    } else {
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
          updateOrder(orderStreamEvent: order);
        }
      });
      // }
    }
    super.initState();
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
                    recenterBtnBottomPadding: 130,
                    mGoogleMapController: mGoogleMapController,
                    debugString: "CurrentOrderScreen",
                  ),
                  ...OrderPositionedFromToTopBar.buildWithOrderTimeBar(
                    context: context,
                    order: order!,
                  ),
                  getScheduleTimeInfoBar(order!),
                  CurrentTaxiOrderPositionedBottomBar(
                    order: order!,
                  ),
                  Positioned(
                    bottom: 12, // GetStorage().read(getxGmapBottomPaddingKey),
                    left: 10,
                    right: 10,
                    child: Container(
                      width: Get.width,
                      child: Obx(
                        () => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children:
                              getRideBottomBtns(_clickedBottomButton.value),
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
        if (order!.scheduledTime != null) {
          return order!.scheduledTime!.difference(DateTime.now()).inMinutes <=
                  30
              ? [
                  Expanded(
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
                  SizedBox(width: 4),
                  _cancelButton,
                ]
              : [
                  Expanded(
                    child: button(
                        inActiveClick: _clickedBottomButton.value,
                        bgColor: Color.fromRGBO(237, 237, 237, 1),
                        color: Color.fromRGBO(120, 120, 120, 1),
                        text: 'Start Ride',
                        onTap: () => null),
                  ),
                  SizedBox(width: 4),
                  _cancelButton
                ];
        }
        // if nto scheduled
        return [
          Expanded(
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
          SizedBox(width: 4),
          _cancelButton
        ];
      case TaxiOrdersStatus.OnTheWay:
        return [
          Expanded(
            child: button(
              bgColor: Color.fromRGBO(233, 219, 245, 1),
              color: Color.fromRGBO(172, 89, 252, 1),
              inActiveClick: _clickedBottomButton.value,
              text: 'Pick up',
              onTap: () async {
                if ((MapHelper.calculateDistance(
                      Get.find<TaxiAuthController>().currentLocation,
                      order!.to.position,
                    ) >
                    0.5)) {
                  await showConfirmationDialog(
                    context,
                    title: 'Oops!',
                    primaryBtnText: "Yes, start ride",
                    bodyText: _i18n()["tooFarFromstartRide"],
                    onYesClick: () async {
                      await controller.startRide();
                      setState(() {});
                      _clickedBottomButton.value = false;
                    },
                  );
                } else {
                  _clickedBottomButton.value = true;
                  await controller.startRide();
                  setState(() {});
                  _clickedBottomButton.value = false;
                }
              },
            ),
          ),
          SizedBox(width: 4),
          _cancelButton
        ];

      case TaxiOrdersStatus.InTransit:
        return [
          Expanded(
            child: button(
              bgColor: Color.fromRGBO(233, 219, 245, 1),
              color: Color.fromRGBO(172, 89, 252, 1),
              text: 'Finish ride',
              inActiveClick: _clickedBottomButton.value,
              onTap: () async {
                await showConfirmationDialog(
                  context,
                  title: 'Oops!',
                  primaryBtnText: "Yes, finish ride",
                  bodyText: _i18n()["tooFarFromfinishRide"],
                  onYesClick: () async {
                    await controller.finishRide();
                    setState(() {});
                    _clickedBottomButton.value = false;
                  },
                );
                // if ((MapHelper.calculateDistance(
                //       Get.find<TaxiAuthController>().currentLocation,
                //       order!.to.position,
                //     ) >
                //     0.5)) {
                //   final YesNoDialogButton clickedYes = await yesNoDialog(
                //     text: 'Oops!',
                //     icon: Container(
                //       child: Icon(
                //         Icons.highlight_off,
                //         size: 65,
                //         color: Color(0xffdb2846),
                //       ),
                //     ),
                //     body: _i18n()["tooFarFromfinishRide"],
                //   );
                //   if (clickedYes == YesNoDialogButton.Yes) {
                //     _clickedBottomButton.value = true;
                //     await controller.finishRide();
                //     setState(() {});
                //     _clickedBottomButton.value = false;
                //   }
                // } else {
                //   mezDbgPrint("Distance  is GOOOD  => yesNoDialog");
                //   _clickedBottomButton.value = true;
                //   await controller.finishRide();
                //   setState(() {});
                //   _clickedBottomButton.value = false;
                // }
              },
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
              ))
        ];

      case TaxiOrdersStatus.CancelledByCustomer:
        return [
          getTaxiRideStatusBar(
            'Customer has cancelled the ride',
            Icon(
              Icons.check_circle,
              color: Colors.red,
            ),
          )
        ];
      case TaxiOrdersStatus.CancelledByTaxi:
        return [
          getTaxiRideStatusBar(
            'You have cancelled this ride',
            Icon(
              Icons.check_circle,
              color: Colors.red,
            ),
          )
        ];
      default:
        return [SizedBox()];
    }
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
              await controller.cancelTaxi(null);
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
    if (orderStreamEvent.status != order?.status) {
      switch (orderStreamEvent.status) {
        case TaxiOrdersStatus.OnTheWay:
          // Add the customer's Marker
          mGoogleMapController.addOrUpdateUserMarker(
              markerId: orderStreamEvent.customer.id,
              latLng: orderStreamEvent.from.toLatLng(),
              customImgHttpUrl: orderStreamEvent.customer.image);
          // add the Taxi's
          if (orderStreamEvent.driver?.location != null)
            mGoogleMapController.addOrUpdateTaxiDriverMarker(
                orderStreamEvent.driver!.id,
                orderStreamEvent.driver!.location!);

          mGoogleMapController.addOrUpdatePurpleDestinationMarker(
              latLng: orderStreamEvent.to.toLatLng());
          break;
        case TaxiOrdersStatus.InTransit:
          // no more showing the customer's marker
          mGoogleMapController.removeMarkerById(orderStreamEvent.customer.id);
          // add the destination marker
          mGoogleMapController.addOrUpdatePurpleDestinationMarker(
              latLng: orderStreamEvent.to.toLatLng());
          break;
        case TaxiOrdersStatus.DroppedOff:
          // no more showing the taxi's Marker:
          mGoogleMapController.removeMarkerById(orderStreamEvent.driver!.id);
          // Add the customer's from Marker
          mGoogleMapController.addOrUpdateUserMarker(
              markerId: orderStreamEvent.customer.id,
              latLng: orderStreamEvent.from.toLatLng(),
              customImgHttpUrl: orderStreamEvent.customer.image);

          mGoogleMapController.addOrUpdatePurpleDestinationMarker(
              latLng: orderStreamEvent.to.toLatLng());

          break;
        default:
      }
      setState(
        () {
          order = orderStreamEvent;
          if (order?.driver?.location != null)
            mGoogleMapController.setLocation(
              Location(
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
      if (orderStreamEvent.inProcess() &&
          orderStreamEvent.driver?.location != null) {
        mGoogleMapController.addOrUpdateTaxiDriverMarker(
            orderStreamEvent.driver!.id, orderStreamEvent.driver!.location!);
      }
    }
  }

  PreferredSizeWidget getRightAppBar(TaxiOrdersStatus status) {
    if (order!.isPastOrder() || order!.status == TaxiOrdersStatus.Scheduled) {
      return mezcalmosAppBar(AppBarLeftButtonType.Back,
          onClick: () => Get.offNamedUntil<void>(
              kIncomingOrdersListRoute, ModalRoute.withName(kHomeRoute)));
    } else {
      return mezcalmosAppBar(AppBarLeftButtonType.Menu, onClick: () async {
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

Widget getScheduleTimeInfoBar(TaxiOrder order) {
  if (order.scheduledTime != null &&
      order.scheduledTime!.difference(DateTime.now()).inMinutes > 30 &&
      order.status == TaxiOrdersStatus.Scheduled)
    return Positioned(
      bottom: 135,
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
              '03:20',
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

Future<void> checkDistanceAndExecute({
  required TaxiOrder order,
  required dynamic Function() callback,
  Icon? icon,
  required String bodyText,
}) async {
  mezDbgPrint("checkDistanceAndExecute => called !");
  if ((MapHelper.calculateDistance(
          Get.find<TaxiAuthController>().currentLocation, order.to.position) >
      0.5)) {
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
  } else {
    mezDbgPrint("Distance  is GOOOD  => yesNoDialog");
    await callback();
  }
}
