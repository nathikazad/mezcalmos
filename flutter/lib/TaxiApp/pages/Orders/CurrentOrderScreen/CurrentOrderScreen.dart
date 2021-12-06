import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder.dart';
import 'package:mezcalmos/Shared/widgets/MGoogleMap.dart';
import 'package:mezcalmos/Shared/widgets/MezDialogs.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';
import 'package:mezcalmos/Shared/widgets/MezSideMenu.dart';
import 'package:mezcalmos/TaxiApp/components/taxiAppBar.dart';
import 'package:mezcalmos/TaxiApp/controllers/orderController.dart';
import 'package:mezcalmos/TaxiApp/controllers/taxiAuthController.dart';
import 'package:mezcalmos/TaxiApp/pages/Orders/CurrentOrderScreen/CPositionedBottomBar.dart';
import 'package:mezcalmos/TaxiApp/pages/Orders/CurrentOrderScreen/CPositionedFromToBar.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';

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
  late LatLng initialPosition;

  @override
  void initState() {
    String orderId = taxiAuthController.taxiState!.currentOrder!;
    controller.clearOrderNotifications();
    // we need the first snapshot seprated !
    TaxiOrder? _orderSnapshot = controller.getOrder(orderId);
    if (_orderSnapshot == null) {
      // TODO ORDERNOTAVAILABLEANYMORE DIALOGUE
      Get.back();
    } else {
      if (_orderSnapshot.inProcess()) {
        // populate the LatLngPoints from the encoded PolyLine String + SetState!
        mGoogleMapController.decodeAndAddPolyline(
            encodedPolylineString: _orderSnapshot.routeInformation.polyline);
        // handle OrderStatus first time (since this.order will be null)!
        updateOrder(orderStreamEvent: _orderSnapshot);
        // set InitialPosition
        setState(() {
          initialPosition = order!.driver!.location!.toLatLng();
        });
        // Listener
        _orderListener =
            controller.getCurrentOrderStream(orderId).listen((event) {
          if (event != null) {
            updateOrder(orderStreamEvent: event);
          } else {
            cancelOrderSubscription();
            // this will get the order inCase it moved to /past
            order = controller.getOrder(orderId);
            //TODO: status change check if status is cancelledByCustomer
            if (order?.status == TaxiOrdersStatus.CancelledByCustomer) {
              oneButtonDialog(
                  message: lang.strings['taxi']['orders']['cancelledMessage'],
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
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      // TODO : add post
      // First time Init, MGoogleMapController late fucntions won't get executed because thery're not implemented yet!
      // with this we 're sure they got implemented!
    });

    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: Get.find<SideMenuDrawerController>().getNewKey(),
          drawer: MezSideMenu(),
          backgroundColor: Colors.white,
          appBar: taxiAppBar(AppBarLeftButtonType.Menu),
          body: SafeArea(
              child: order != null
                  ? Stack(alignment: Alignment.topCenter, children: [
                      Obx(
                        () => MGoogleMap(
                          mGoogleMapController: this.mGoogleMapController,
                          initialLocation: initialPosition,
                          myLocationButtonEnabled: false,
                          debugString: "CurrentOrderScreen",
                        ),
                      ),
                      CurrentPositionedBottomBar(order!),
                      CurrentPositionedFromToTopBar(order!)
                    ])
                  : MezLogoAnimation(
                      centered: true,
                    )),
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
              orderStreamEvent.customer.id, orderStreamEvent.from.toLatLng());
          // add the Taxi's
          mGoogleMapController.addOrUpdateTaxiDriverMarker(
              orderStreamEvent.driver!.id,
              orderStreamEvent.driver!.location!.toLatLng());
          break;
        case TaxiOrdersStatus.InTransit:
          // no more showing the customer's marker
          mGoogleMapController.removeMarker(orderStreamEvent.customer.id);
          // add the destination marker
          mGoogleMapController.addOrUpdatePurpleDestinationMarker(
              latLng: orderStreamEvent.to.toLatLng());
          break;
        case TaxiOrdersStatus.DroppedOff:
          // no more showing the taxi's Marker:
          mGoogleMapController.removeMarker(orderStreamEvent.driver!.id);
          // Add the customer's from Marker
          mGoogleMapController.addOrUpdateUserMarker(
              orderStreamEvent.customer.id, orderStreamEvent.from.toLatLng());
          break;
        default:
      }
    } else {
      // in case there is no status Changes
      // we simply keep updating the taxi's Marker's location , only if inProcess!
      if (orderStreamEvent.inProcess()) {
        mGoogleMapController.addOrUpdateTaxiDriverMarker(
            orderStreamEvent.driver!.id,
            orderStreamEvent.driver!.location!.toLatLng());
      }
    }

    setState(() {
      order = orderStreamEvent;
      initialPosition = order!.driver!.location!.toLatLng();
    });
  }

  void cancelOrderSubscription() {
    _orderListener?.cancel();
    _orderListener = null;
  }
}
