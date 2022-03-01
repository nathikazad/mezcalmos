import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/locationController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
import 'package:mezcalmos/Shared/firebaseNodes/taxiNodes.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/NotificationsHelper.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';
import 'package:mezcalmos/Shared/widgets/MezSideMenu.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/controllers/foregroundNotificationsController.dart';
import 'package:mezcalmos/TaxiApp/controllers/incomingOrdersController.dart';
import 'package:mezcalmos/TaxiApp/controllers/taxiAuthController.dart';
import 'package:mezcalmos/TaxiApp/models/CounterOffer.dart';
import 'package:mezcalmos/Shared/models/Notification.dart' as MezNotification;
import 'package:mezcalmos/TaxiApp/models/TaxiDriver.dart';
import 'package:mezcalmos/TaxiApp/notificationHandler.dart';
import 'package:mezcalmos/TaxiApp/router.dart';

class TaxiWrapper extends StatefulWidget {
  @override
  _TaxiWrapperState createState() => _TaxiWrapperState();
}

class _TaxiWrapperState extends State<TaxiWrapper> {
  StreamSubscription<MezNotification.Notification>?
      _notificationsStreamListener;
  StreamSubscription<bool>? _locationStreamSub;
  AuthController _authController = Get.find<AuthController>();
  TaxiAuthController _taxiAuthController = Get.find<TaxiAuthController>();
  @override
  void initState() {
    mezDbgPrint("TaxiWrapper::init state");
    Future.microtask(() {
      mezDbgPrint("TaxiWrapper::microtask handleState first time");
      TaxiState? taxiState = _taxiAuthController.taxiState;
      mezDbgPrint("taxiState = $taxiState");
      if (taxiState != null) {
        mezDbgPrint("inside if  = $taxiState");
        handleState(taxiState);
      } else {
        mezDbgPrint("inside else  = $taxiState");
        _taxiAuthController.stateStream.first.then((_taxiState) {
          mezDbgPrint("inside else -> then  = $_taxiState");
          handleState(_taxiState);
        });
      }
    });

    String userId = _authController.fireAuthUser!.uid;
    _notificationsStreamListener = initializeShowNotificationsListener();
    listenForLocationPermissions();
    Get.find<ForegroundNotificationsController>()
        .startListeningForNotificationsFromFirebase(
            taxiNotificationsNode(userId), taxiNotificationHandler);
    super.initState();
  }

  void listenForLocationPermissions() {
    _locationStreamSub?.cancel();
    _locationStreamSub = Get.find<LocationController>().locationPermissionStream
        // .distinct()
        .listen((locationPermission) {
      if (locationPermission == false &&
          Get.currentRoute != kLocationPermissionPage) {
        Get.toNamed(kLocationPermissionPage);
      }
    });
  }

  void handleState(TaxiState? state) async {
    mezDbgPrint(state);
    if (state != null) {
      mezDbgPrint("Current order ====> ${state.currentOrder}");
      mezDbgPrint("isAuthorized ====> ${state.isAuthorized}");
      mezDbgPrint("isLooking ====> ${state.isLooking}");

      mezDbgPrint("TaxiWrapper::handleState ${state.toJson().toString()}");
      if (!state.isAuthorized) {
        mezDbgPrint("TaxiWrapper::handleState going to unauthorized");
        Get.toNamed(kUnauthorizedRoute);
      } else if (state.currentOrder != null) {
        mezDbgPrint("TaxiWrapper::handleState going to current order");
        Get.toNamed(kCurrentOrderRoute);
      } else if (state.inNegotationOrderId != null) {
        handleInNegotationMode(state.inNegotationOrderId!);
      } else {
        mezDbgPrint("TaxiWrapper::handleState going to incoming orders");
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
  void handleInNegotationMode(String orderId) {
    IncomingOrdersController incomingOrdersController =
        Get.put<IncomingOrdersController>(IncomingOrdersController());
    TaxiOrder? taxiOrder = incomingOrdersController.getOrder(orderId);
    // assuming orders have been loaded
    // check if order is null
    // TODO: make sure incoming orders are loaded
    if (taxiOrder == null) {
      incomingOrdersController.removeFromNegotiationMode(
          orderId, taxiOrder!.customer.id,
          expired: true);
      Get.toNamed(kIncomingOrdersListRoute);
    } else {
      String userId = _authController.fireAuthUser!.uid;
      CounterOffer? counterOffer = taxiOrder.findCounterOfferByDriverId(userId);
      // check if counter offer data exists
      if (counterOffer == null) {
        incomingOrdersController.removeFromNegotiationMode(
            orderId, taxiOrder.customer.id,
            expired: true);
        Get.toNamed(kIncomingOrdersListRoute);
      } else {
        // check if counter offer is expired
        if (DateTime.now().toUtc().isAfter(counterOffer.offerValidTime) ||
            counterOffer.counterOfferStatus != CounterOfferStatus.Submitted) {
          incomingOrdersController.removeFromNegotiationMode(
              orderId, taxiOrder.customer.id,
              expired: true);
          Get.toNamed(kIncomingOrdersListRoute);
        } else {
          Get.toNamed(getIncomingOrderRoute(orderId));
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    mezDbgPrint("TaxiWrapper:: build");
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
