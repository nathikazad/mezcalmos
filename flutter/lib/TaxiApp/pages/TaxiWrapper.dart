// ignore_for_file: unawaited_futures

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/foregroundNotificationsController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
import 'package:mezcalmos/Shared/firebaseNodes/taxiNodes.dart';
import 'package:mezcalmos/Shared/helpers/NotificationsHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Drivers/TaxiDriver.dart';
import 'package:mezcalmos/Shared/models/Utilities/Notification.dart'
    as MezNotification;
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder/CounterOffer.dart';
import 'package:mezcalmos/Shared/routes/sharedRouter.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';
import 'package:mezcalmos/Shared/widgets/MezSideMenu.dart';
import 'package:mezcalmos/TaxiApp/controllers/incomingOrdersController.dart';
import 'package:mezcalmos/TaxiApp/controllers/taxiAuthController.dart';
import 'package:mezcalmos/TaxiApp/notificationHandler.dart';
import 'package:mezcalmos/TaxiApp/router.dart';

class TaxiWrapper extends StatefulWidget {
  const TaxiWrapper({Key? key}) : super(key: key);

  @override
  _TaxiWrapperState createState() => _TaxiWrapperState();
}

class _TaxiWrapperState extends State<TaxiWrapper> {
  ///
  StreamSubscription<MezNotification.Notification>?
      _notificationsStreamListener;

  ///
  StreamSubscription<bool>? _locationStreamSub;

  ///
  AuthController _authController = Get.find<AuthController>();
  TaxiAuthController _taxiAuthController = Get.find<TaxiAuthController>();

  //------- incomingOrdersController ------------
  IncomingOrdersController incomingOrdersController =
      Get.put<IncomingOrdersController>(IncomingOrdersController());
  //---------------------------------------------
  @override
  void initState() {
    mezDbgPrint("TaxiWrapper::init state");
    Future<void>.microtask(() {
      mezDbgPrint("TaxiWrapper::microtask handleState first time");
      final TaxiState? taxiState = _taxiAuthController.taxiState;
      mezDbgPrint("taxiState = $taxiState");
      if (taxiState != null) {
        mezDbgPrint("inside if  = $taxiState");
        handleState(taxiState);
      } else {
        mezDbgPrint("inside else  = $taxiState");
        _taxiAuthController.stateStream.first.then((TaxiState? _taxiState) {
          mezDbgPrint("inside else -> then  = $_taxiState");
          handleState(_taxiState);
        });
      }
    });

    String userId = _authController.fireAuthUser!.uid;
    _notificationsStreamListener = initializeShowNotificationsListener();
    // listenForLocationPermissions();
    Get.find<ForegroundNotificationsController>()
        .startListeningForNotificationsFromFirebase(
      taxiNotificationsNode(userId),
      taxiNotificationHandler,
    );
    super.initState();
  }

  // void listenForLocationPermissions() {
  //   _locationStreamSub?.cancel();
  //   _locationStreamSub = Get.find<LocationController>().locationPermissionStream
  //       // .distinct()
  //       .listen((locationPermission) {
  //     if (locationPermission == false &&
  //         Get.currentRoute != kLocationPermissionPage) {
  //       Get.toNamed(kLocationPermissionPage);
  //     }
  //   });
  // }

  Future<void> handleState(TaxiState? state) async {
    mezDbgPrint(state);
    if (state != null) {
      mezDbgPrint("Current order ====> ${state.currentOrder}");
      mezDbgPrint("isAuthorized ====> ${state.isAuthorized}");
      mezDbgPrint("isLooking ====> ${state.isLooking}");

      mezDbgPrint("TaxiWrapper::handleState ${state.toJson().toString()}");
      if (!state.isAuthorized) {
        mezDbgPrint("TaxiWrapper::handleState going to unauthorized");
        Get.toNamed<void>(kUnauthorizedRoute);
      } else if (state.currentOrder != null) {
        mezDbgPrint("TaxiWrapper::handleState going to current order");
        Get.toNamed<void>(getTaxiOrderRoute(state.currentOrder!));
      } else if (state.inOrderNegotation != null) {
        await handleInNegotationMode(state.inOrderNegotation!);
      } else {
        Get.toNamed(kIncomingOrdersListRoute);
      }
    } else {
      mezDbgPrint("TaxiWrapper::handleState state is null, ERROR");
    }
  }

  /// check if counter offer is expired, if expired
  ///   remove from negotiation
  /// else
  ///   go to order with listener
  Future<void> handleInNegotationMode(
      InCounterOfferNegotiation negotiation) async {
    mezDbgPrint("handleInNegotationMode!");
    // Because when calling getOrder , the IncomingOrdersController's Orders listener hasn't even been started,
    // thus we check directly and quickly the db first, if it does exists then we wait for the IncomingOrdersController
    // to get the order.
    CounterOffer? _driverCounterOffer =
        await incomingOrdersController.getDriverCountOfferInCustomersNode(
            negotiation.orderId, negotiation.customerId);
    if (_driverCounterOffer == null) {
      mezDbgPrint("handleInNegotationMode - if !");
      incomingOrdersController.removeFromNegotiationMode(
        negotiation.orderId,
        negotiation.customerId,
        newStatus: CounterOfferStatus.Expired,
      );
      Get.toNamed(kIncomingOrdersListRoute);
    } else {
      mezDbgPrint("handleInNegotationMode - else !");

      // check if counter offer is expired
      if (_driverCounterOffer.validityTimeDifference() > 0) {
        mezDbgPrint("handleInNegotationMode - else - if!");

        incomingOrdersController.removeFromNegotiationMode(
          negotiation.orderId,
          negotiation.customerId,
          newStatus: CounterOfferStatus.Expired,
        );
        Get.toNamed(kIncomingOrdersListRoute);
      } else {
        mezDbgPrint("handleInNegotationMode - else - else !");
        Get.toNamed(kIncomingOrdersListRoute);
        Get.toNamed(getIncomingOrderRoute(negotiation.orderId));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: Get.find<SideMenuDrawerController>().getNewKey(),
        drawer: MezSideMenu(),
        backgroundColor: Colors.white,
        appBar: mezcalmosAppBar(AppBarLeftButtonType.Menu),
        body: MezLogoAnimation(centered: true));
  }

  @override
  void dispose() {
    _notificationsStreamListener?.cancel();
    _notificationsStreamListener = null;
    _locationStreamSub?.cancel();
    _locationStreamSub = null;
    super.dispose();
  }
}
