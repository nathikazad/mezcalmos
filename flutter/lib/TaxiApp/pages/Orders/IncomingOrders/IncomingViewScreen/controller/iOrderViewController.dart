import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/MGoogleMapController.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder/CounterOffer.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder/TaxiOrder.dart';
import 'package:mezcalmos/Shared/models/ServerResponse.dart';
import 'package:mezcalmos/Shared/models/User.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:mezcalmos/Shared/widgets/AnimatedSlider/AnimatedSliderController.dart';
import 'package:mezcalmos/Shared/widgets/MezSnackbar.dart';
import 'package:mezcalmos/TaxiApp/controllers/incomingOrdersController.dart';
import 'package:mezcalmos/TaxiApp/controllers/taxiAuthController.dart';
import 'package:mezcalmos/TaxiApp/router.dart';

class IOrderViewController {
  final AnimatedSliderController animatedSliderController;
  IOrderViewController({required this.animatedSliderController});

  final AuthController authController = Get.find<AuthController>();
  final TaxiAuthController taxiAuthController = Get.find<TaxiAuthController>();
  final IncomingOrdersController controller =
      Get.find<IncomingOrdersController>();
  final MGoogleMapController mGoogleMapController = MGoogleMapController();

  Rxn<TaxiOrder> order = Rxn();
  StreamSubscription? _orderListener;
  Rxn<CounterOffer> counterOffer = Rxn();
  RxBool clickedAcceptButton = false.obs;
  RxBool submittedCounterOffer = false.obs;
  StreamSubscription? _counterOfferStream;

  void initController(
      {required String orderId, required Function() onOrderNoMoreAvailable}) {
    order.value = controller.getOrder(orderId);

    // we do not setState here yet !
    if (order.value == null) {
      onOrderNoMoreAvailable();
    } else {
      controller.markOrderAsRead(orderId, order.value!.customer.id);

      if (order.value!.inProcess()) {
        // we check valid counterOffer
        startListeningOnCounterOffer(orderId, order.value!.customer.id);

        // populate the LatLngPoints from the encoded PolyLine String + SetState!
        mGoogleMapController.decodeAndAddPolyline(
            encodedPolylineString: order.value!.routeInformation!.polyline);

        // add the corresponding markers
        mGoogleMapController.addOrUpdateUserMarker(
            markerId: order.value!.customer.id,
            latLng: order.value!.from.toLatLng(),
            customImgHttpUrl: order.value!.customer.image);

        mGoogleMapController.addOrUpdatePurpleDestinationMarker(
            latLng: order.value!.to.toLatLng());

        // set initial position
        mGoogleMapController.setLocation(order.value!.from);
        mGoogleMapController.lockInAutoZoomAnimation();
        // start Listening for the vailability of the iOrderViewController.order
        _orderListener =
            controller.getIncomingOrderStream(orderId).listen((order) {
          if (order != null) {
            // keep updating our Order only when neeeded
            if (order.cost != this.order.value?.cost ||
                order.distanceToClient != this.order.value?.distanceToClient) {
              this.order.value = order;
            }
          } else {
            // if the Order is no more available , Show a pop up while poping back back !
            if (clickedAcceptButton.value == false) {
              cancelStreamsSubscriptions();
              onOrderNoMoreAvailable();
            }
          }
        });
      }
    }
  }

  /// Start listening on This Authenticated Driver's CounterOffer nnode on customer's Node.
  void startListeningOnCounterOffer(String orderId, customerId) {
    _counterOfferStream?.cancel();
    _counterOfferStream = null;
    _counterOfferStream = controller
        .listenOnCounterOfferChanges(orderId, customerId)
        .distinct()
        .listen((_counterOffer) async {
      // we start listening here and we make sure to duspose the StreamSub when it's disposed.

      this.counterOffer.value = _counterOffer;
      if (this.counterOffer.value != null) {
        this.animatedSliderController.slideUp();
      }
      if (_counterOffer?.counterOfferStatus == CounterOfferStatus.Accepted) {
        await removeCounterOfferAndResetState(expired: false);
        await waitForOrderToBeUpdatedAfterAccept(orderId);
        // canceling Subscription Just to Avoid possible Racing Conditions
        await cancelStreamsSubscriptions();
        // Go to CurrentOrder View !
        Future.delayed(Duration.zero, () {
          Get.offNamedUntil(
              kCurrentOrderRoute, ModalRoute.withName(kHomeRoute));
        });
      } else if (_counterOffer?.counterOfferStatus ==
          CounterOfferStatus.Rejected) {
        await removeCounterOfferAndResetState();
      }
    });
  }

  Future<void> onTaxiRideAccept() async {
    String _orderId = order.value!.orderId;
    clickedAcceptButton.value = true;

    ServerResponse serverResponse = await controller.acceptTaxi(_orderId);

    if (serverResponse.success) {
      await waitForOrderToBeUpdatedAfterAccept(_orderId);
      // canceling Subscription Just to Avoid possible Racing Conditions
      cancelStreamsSubscriptions();
      // Go to CurrentOrder View !
      Get.offNamedUntil(kCurrentOrderRoute, ModalRoute.withName(kHomeRoute));
      // Notice the User !
    } else {
      // in case Taxi User failed accepting the iOrderViewController.order.
      clickedAcceptButton.value = false;
      Get.back();
      MezSnackbar("Oops..", serverResponse.errorMessage!);
    }
  }

  /// This removes the counterOffer from the database + reseting state by setting `submittedCounterOffer = false`.
  ///
  /// Also calls `_minimizeBottomSheet()` Minimize the BottomSheet
  Future removeCounterOfferAndResetState({bool expired = true}) async {
    await controller.removeFromNegotiationMode(
        order.value!.orderId, order.value!.customer.id,
        expired: expired);
    submittedCounterOffer.value = false;
    this.animatedSliderController.slideDown();
  }

  /// this gets invoked when the Taxi Driver presses [Send offer] button.
  void onCountOfferSent(num price) {
    controller
        .submitCounterOffer(
            order.value!.orderId,
            order.value!.customer.id,
            CounterOffer.buildWithExpiration(
                price: price,
                taxiUserInfo: UserInfo(
                    id: authController.user!.id,
                    name: authController.user!.name!,
                    image: authController.user!.image!)))
        .then((value) {
      submittedCounterOffer.value = true;
      animatedSliderController.slideUp();
    });
  }

  /// Call this right after accept order
  /// Uses : Make sure that the orderId has been written to the taxiState since we do not await it in backend.
  Future<void> waitForOrderToBeUpdatedAfterAccept(String orderId) async {
    if (taxiAuthController.taxiState?.currentOrder == null) {
      await taxiAuthController.stateStream
          .firstWhere((taxiState) => taxiState?.currentOrder != null);
    }
  }

  /// THIS is important to call upon a disposale of the State.
  ///
  /// cancels `_orderListener` and `_counterOfferStream`.
  Future<void> cancelStreamsSubscriptions() async {
    await _orderListener?.cancel();
    _orderListener = null;
    await _counterOfferStream?.cancel();
    _counterOfferStream = null;
  }
}
