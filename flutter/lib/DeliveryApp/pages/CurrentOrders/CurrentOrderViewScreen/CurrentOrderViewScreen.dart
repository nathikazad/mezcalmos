import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryApp/components/DeliveryAppBar.dart';
import 'package:mezcalmos/DeliveryApp/controllers/deliveryAuthController.dart';
import 'package:mezcalmos/DeliveryApp/controllers/orderController.dart';
import 'package:mezcalmos/DeliveryApp/pages/CurrentOrders/CurrentOrderViewScreen/Components/DriverOrderBottomCard.dart';
import 'package:mezcalmos/DeliveryApp/pages/CurrentOrders/CurrentOrderViewScreen/Components/DriverOrderMapComponent.dart';
import 'package:mezcalmos/Shared/controllers/MGoogleMapController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezSideMenu.dart';

import '../../../../Shared/widgets/MezLogoAnimation.dart';

class CurrentOrderViewScreen extends StatefulWidget {
  @override
  _ViewCurrentOrderScreenState createState() => _ViewCurrentOrderScreenState();
}

class _ViewCurrentOrderScreenState extends State<CurrentOrderViewScreen> {
  MGoogleMapController mGoogleMapController = MGoogleMapController();
  LanguageController lang = Get.find<LanguageController>();
  Order? order;
  OrderController controller = Get.find<OrderController>();
  StreamSubscription? _orderListener;
  DeliveryAuthController deliveryAuthAuthController =
      Get.find<DeliveryAuthController>();

  @override
  void initState() {
    // String orderId = Get.parameters['orderId']!;
    // order = controller.currentOrders
    //     .firstWhere((element) => element.orderId == orderId);

    //   if (_orderSnapshot.inProcess()) {
    //     // // populate the LatLngPoints from the encoded PolyLine String + SetState!
    //     // mGoogleMapController.decodeAndAddPolyline(
    //     //     encodedPolylineString: _orderSnapshot.routeInformation.polyline);
    //     // mGoogleMapController.setLocation(_orderSnapshot.from);
    //     // // mGoogleMapController.setLocation(Location(
    //     // //     "CurrentLocation",
    //     // //     LocationLibrary.LocationData.fromMap({
    //     // //       "latitude": _orderSnapshot.driver!.location!.latitude,
    //     // //       "longitude": _orderSnapshot.driver!.location!.longitude
    //     // //     })));
    //     // // handle OrderStatus first time (since this.order will be null)!
    //     // updateOrder(orderStreamEvent: _orderSnapshot);
    //     // // set InitialPosition
    //     // if (order?.driver?.location != null)
    //     //   mGoogleMapController.moveToNewLatLng(
    //     //       order!.driver!.location!.latitude,
    //     //       order!.driver!.location!.longitude);

    mezDbgPrint("Inside _ViewCurrentOrderScreenState::InitState");
    String orderId = Get.parameters['orderId']!;
    mezDbgPrint("orderId :: $orderId");

    controller.clearOrderNotifications(orderId);
    // we need the first snapshot seprated !
    Order? _orderSnapshot = controller.getOrder(orderId);
    mezDbgPrint("_orderSnapshot :: $_orderSnapshot");

    if (_orderSnapshot == null) {
      // TODO ORDERNOTAVAILABLEANYMORE DIALOGUE
      Get.back();
    } else {
      if (_orderSnapshot.inProcess()) {
        // // populate the LatLngPoints from the encoded PolyLine String + SetState!
        // mGoogleMapController.decodeAndAddPolyline(
        //     encodedPolylineString: _orderSnapshot.routeInformation.polyline);
        // mGoogleMapController.setLocation(_orderSnapshot.from);
        // // mGoogleMapController.setLocation(Location(
        // //     "CurrentLocation",
        // //     LocationLibrary.LocationData.fromMap({
        // //       "latitude": _orderSnapshot.driver!.location!.latitude,
        // //       "longitude": _orderSnapshot.driver!.location!.longitude
        // //     })));
        // // handle OrderStatus first time (since this.order will be null)!
        // updateOrder(orderStreamEvent: _orderSnapshot);
        // // set InitialPosition
        // if (order?.driver?.location != null)
        //   mGoogleMapController.moveToNewLatLng(
        //       order!.driver!.location!.latitude,
        //       order!.driver!.location!.longitude);

        // Listener
        _orderListener =
            controller.getCurrentOrderStream(orderId).listen((event) {
          if (event != null) {
            order = event;
            // updateOrder(orderStreamEvent: order);
          } else {
            cancelOrderSubscription();
            controller.getPastOrderStream(orderId).listen((order) {
              if (order != null) {
                // updateOrder(orderStreamEvent: order);
              }
            });
            // this will get the order inCase it moved to /past
          }
        });
      }
    }
    super.initState();
  }

  @override
  void dispose() {
    // cancelOrderSubscription();
    super.dispose();
  }

  Widget build(BuildContext context) {
    // make sure can't be poped, unless we do.
    mezDbgPrint("***************************************");

    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: Get.find<SideMenuDrawerController>().getNewKey(),
          drawer: MezSideMenu(),
          backgroundColor: Colors.white,
          appBar: DeliveryAppBar(AppBarLeftButtonType.Back),
          body: Obx(
            () => order != null
                //  && this.mGoogleMapController.location.value != null
                ? Stack(alignment: Alignment.topCenter, children: [
                    DriverOrderMapComponent(order: order!),
                    DriverBottomOrderCard(order: order!)
                    // MGoogleMap(
                    //   mGoogleMapController: this.mGoogleMapController,
                    //   myLocationButtonEnabled: false,
                    //   debugString: "CurrentOrderScreen",
                    // ),
                    // CurrentPositionedBottomBar(order!),
                    // CurrentPositionedFromToTopBar(order!),
                  ])
                : MezLogoAnimation(
                    centered: true,
                  ),
          ),
        )); // no need for obx here.
  }

  void cancelOrderSubscription() {
    _orderListener?.cancel();
    _orderListener = null;
  }
}
