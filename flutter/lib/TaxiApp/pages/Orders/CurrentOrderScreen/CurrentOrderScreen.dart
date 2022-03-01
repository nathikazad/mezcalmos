import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location/location.dart' as LocationLibrary;
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/MGoogleMapController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Location.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MGoogleMap.dart';
import 'package:mezcalmos/Shared/widgets/MezDialogs.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';
import 'package:mezcalmos/Shared/widgets/MezSideMenu.dart';
import 'package:mezcalmos/TaxiApp/controllers/orderController.dart';
import 'package:mezcalmos/TaxiApp/controllers/taxiAuthController.dart';
import 'package:mezcalmos/TaxiApp/pages/Orders/CurrentOrderScreen/CPositionedBottomBar.dart';
import 'package:mezcalmos/TaxiApp/pages/Orders/CurrentOrderScreen/CPositionedFromToBar.dart';

import '../../../router.dart';

class CurrentOrderScreen extends StatefulWidget {
  @override
  _ViewCurrentOrderScreenState createState() => _ViewCurrentOrderScreenState();
}

class _ViewCurrentOrderScreenState extends State<CurrentOrderScreen> {
  MGoogleMapController mGoogleMapController = MGoogleMapController();
  LanguageController lang = Get.find<LanguageController>();
  TaxiOrder? order;
  OrderController controller = Get.find<OrderController>();
  StreamSubscription? _orderListener;
  bool _clickedButton = false;
  TaxiAuthController taxiAuthController = Get.find<TaxiAuthController>();

  @override
  void initState() {
    mezDbgPrint("Inside _ViewCurrentOrderScreenState::InitState");
    String orderId = taxiAuthController.taxiState!.currentOrder!;
    mezDbgPrint("orderId :: $orderId");

    controller.clearOrderNotifications();
    // we need the first snapshot seprated !
    TaxiOrder? _orderSnapshot = controller.getOrder(orderId);
    mezDbgPrint("_orderSnapshot :: $_orderSnapshot");

    if (_orderSnapshot == null) {
      // TODO ORDERNOTAVAILABLEANYMORE DIALOGUE
      Get.back();
    } else {
      if (_orderSnapshot.inProcess()) {
        // populate the LatLngPoints from the encoded PolyLine String + SetState!
        mGoogleMapController.decodeAndAddPolyline(
            encodedPolylineString: _orderSnapshot.routeInformation!.polyline);
        mGoogleMapController.setLocation(_orderSnapshot.from);
        updateOrder(orderStreamEvent: _orderSnapshot);
        // set InitialPosition
        if (order?.driver?.location != null)
          mGoogleMapController.moveToNewLatLng(
              order!.driver!.location!.latitude,
              order!.driver!.location!.longitude);

        // Listener
        _orderListener =
            controller.getCurrentOrderStream(orderId).listen((order) {
          if (order != null) {
            updateOrder(orderStreamEvent: order);
          } else {
            cancelOrderSubscription();
            controller.getPastOrderStream(orderId).listen((order) {
              if (order != null) {
                updateOrder(orderStreamEvent: order);
              }
            });
            // this will get the order inCase it moved to /past
            if (order?.status == TaxiOrdersStatus.CancelledByCustomer) {
              oneButtonDialog(
                  body: lang.strings['taxi']['orders']['cancelledMessage'],
                  imagUrl: aOrderUnavailable);
            }
          }
        });
      }
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

    mezDbgPrint(order!.status);
    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: Get.find<SideMenuDrawerController>().getNewKey(),
          drawer: MezSideMenu(),
          backgroundColor: Colors.white,
          appBar: getRightAppBar(order!.status),
          body:
              order != null && this.mGoogleMapController.location.value != null
                  ? Stack(alignment: Alignment.topCenter, children: [
                      MGoogleMap(
                        mGoogleMapController: this.mGoogleMapController,
                        myLocationButtonEnabled: false,
                        debugString: "CurrentOrderScreen",
                      ),
                      CurrentPositionedBottomBar(order!),
                      CurrentPositionedFromToTopBar(order!),
                    ])
                  : MezLogoAnimation(
                      centered: true,
                    ),
        )); // no need for obx here.
  }

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
      setState(() {
        order = orderStreamEvent;
        if (order?.driver?.location != null)
          mGoogleMapController.setLocation(Location(
              "CurrentLocation",
              LocationLibrary.LocationData.fromMap({
                "latitude": order!.driver!.location!.latitude,
                "longitude": order!.driver!.location!.longitude
              })));
      });
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
    if (status == TaxiOrdersStatus.CancelledByCustomer) {
      return mezcalmosAppBar(AppBarLeftButtonType.Back,
          onClick: () => Get.offNamedUntil(
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
