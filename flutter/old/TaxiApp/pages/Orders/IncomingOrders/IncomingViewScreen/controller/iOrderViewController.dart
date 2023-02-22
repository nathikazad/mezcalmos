import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/MGoogleMapController.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder/CounterOffer.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder/TaxiOrder.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServerResponse.dart';
import 'package:mezcalmos/Shared/models/User.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:mezcalmos/Shared/widgets/AnimatedSlider/AnimatedSliderController.dart';
import 'package:mezcalmos/Shared/widgets/MezSnackbar.dart';
import 'package:mezcalmos/TaxiApp/controllers/incomingOrdersController.dart';
import 'package:mezcalmos/TaxiApp/controllers/taxiAuthController.dart';
import 'package:mezcalmos/TaxiApp/router.dart';
import 'package:mezcalmos/Shared/MezRouter.dart';

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
      controller.markOrderAsRead(orderId, order.value!.customer.firebaseId);

      // Nathik
      // if (order.value!.inProcess()) {
      // we check valid counterOffer
      startListeningOnCounterOffer(orderId, order.value!.customer.firebaseId);

      // populate the LatLngPoints from the encoded PolyLine String + SetState!
      if (order.value!.routeInformation != null)
        mGoogleMapController.decodeAndAddPolyline(
            encodedPolylineString: order.value!.routeInformation!.polyline);

      // add the corresponding markers
      mGoogleMapController.addOrUpdateUserMarker(
        markerId: order.value?.customer.firebaseId,
        latLng: order.value?.from.toLatLng(),
        customImgHttpUrl: order.value?.customer.image,
      );

      mGoogleMapController.addOrUpdatePurpleDestinationMarker(
        latLng: order.value?.to.toLatLng(),
      );

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
      // }
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
      counterOffer.value = _counterOffer;
      if (counterOffer.value != null && counterOffer.value!.isValid) {
        submittedCounterOffer.value = true;
        animatedSliderController.slideUp();
      }
      if (_counterOffer?.counterOfferStatus == CounterOfferStatus.Accepted) {
        await updateCounterOfferStatus(newStatus: CounterOfferStatus.Accepted);
        await waitForOrderToBeUpdatedAfterAccept(orderId);
        // canceling Subscription Just to Avoid possible Racing Conditions
        await cancelStreamsSubscriptions();
        // Go to CurrentOrder View !
        Future<void>.delayed(Duration.zero, () {
          MezRouter.offNamedUntil(
              getTaxiOrderRoute(orderId), ModalRoute.withName(kHomeRoute));
        });
      }
    });
  }

  Future<void> onTaxiRideAccept() async {
    final String _orderId = order.value!.orderId;
    clickedAcceptButton.value = true;

    // first check if there is already an on-going CounterOffer - cancel it.
    // maybe later on tell the driver first.
    if (counterOffer.value != null && counterOffer.value!.isValid) {
      await controller.removeFromNegotiationMode(
        order.value!.orderId,
        order.value!.customer.firebaseId,
        newStatus: CounterOfferStatus.Cancelled,
      );
    }
    final ServerResponse serverResponse = await controller.acceptTaxi(_orderId);

    if (serverResponse.success) {
      await waitForOrderToBeUpdatedAfterAccept(_orderId);
      // canceling Subscription Just to Avoid possible Racing Conditions
      await cancelStreamsSubscriptions();
      // Go to CurrentOrder View !
      unawaited(MezRouter.offNamedUntil<void>(
          getTaxiOrderRoute(_orderId), ModalRoute.withName(kHomeRoute)));
      // Notice the User !
    } else {
      // in case Taxi User failed accepting the iOrderViewController.order.
      clickedAcceptButton.value = false;
      MezRouter.back<void>();
      MezSnackbar("Oops..", serverResponse.errorMessage!);
    }
  }

  /// This removes the counterOffer from the database + reseting state by setting `submittedCounterOffer = false`.
  ///
  /// Also calls `_minimizeBottomSheet()` Minimize the BottomSheet
  Future<void> updateCounterOfferStatus(
      {CounterOfferStatus newStatus = CounterOfferStatus.Expired}) async {
    await controller.removeFromNegotiationMode(
      order.value!.orderId,
      order.value!.customer.firebaseId,
      newStatus: newStatus,
    );
  }

  /// this gets invoked when the Taxi Driver presses [Send offer] button.
  Future<void> onCountOfferSent(num price) async {
    await controller.submitCounterOffer(
      order.value!.orderId,
      order.value!.customer.firebaseId,
      CounterOffer.buildWithExpiration(
        validTimeInSeconds: order.value!.scheduledTime != null
            ? nScheduledCounterOfferValidExpireTimeInSeconds
            : nDefaultCounterOfferValidExpireTimeInSeconds,
        price: price,
        taxiUserInfo: UserInfo(
          firebaseId: authController.user!.firebaseId,
          name: authController.user!.name!,
          image: authController.user!.image!,
        ),
      ),
    );
    // .then((value) {
    submittedCounterOffer.value = true;
    animatedSliderController.slideUp();
    // });
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
