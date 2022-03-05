import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/MGoogleMapController.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder.dart';
import 'package:mezcalmos/Shared/models/User.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:mezcalmos/TaxiApp/controllers/incomingOrdersController.dart';
import 'package:mezcalmos/TaxiApp/controllers/taxiAuthController.dart';
import 'package:mezcalmos/TaxiApp/models/CounterOffer.dart';
import 'package:mezcalmos/TaxiApp/router.dart';

class IOrderViewController {
  final LanguageController lang = Get.find<LanguageController>();
  final AuthController authController = Get.find<AuthController>();
  final TaxiAuthController taxiAuthController = Get.find<TaxiAuthController>();
  final IncomingOrdersController controller =
      Get.find<IncomingOrdersController>();
  final MGoogleMapController mGoogleMapController = MGoogleMapController();

  TaxiOrder? order;
  StreamSubscription? orderListener;
  Rxn<CounterOffer> counterOffer = Rxn();
  Timer? countOfferTimerValidator;
  RxBool clickedAcceptButton = false.obs;
  RxBool submittedCounterOffer = false.obs;

  bool checkIfCounterOfferIsNotExpired(CounterOffer? offer) {
    return offer != null && offer.validityTimeDifference() < 0;
  }

  /// Check the counterOffers Validity each 1 second,
  ///
  /// this is needed because just in case TaxiDriver got out of the app while the counter didn't end then the counter
  ///
  /// offer will stay on the databse.
  void startCountOffersValidityCheckPeriodically(String orderId, customerId) {
    countOfferTimerValidator =
        Timer.periodic(Duration(seconds: 1), (timer) async {
      countOfferTimerValidator?.cancel();
      await Future.delayed(Duration(seconds: 1));
      CounterOffer? _offer = await controller
          .getDriverCountOfferInCustomersNode(orderId, customerId);
      // order!.findCounterOfferByDriverId(_authController.user!.id);
      if (checkIfCounterOfferIsNotExpired(_offer)) {
        counterOffer.value = _offer;
      } else {
        counterOffer.value = null;
      }
      // in case counter Offer was accepted.
      if (counterOffer.value?.counterOfferStatus ==
          CounterOfferStatus.Accepted) {
        await waitForOrderToBeUpdatedAfterAccept(orderId);
        // canceling Subscription Just to Avoid possible Racing Conditions
        cancelOrderSubscription();
        // Go to CurrentOrder View !
        Future.delayed(Duration.zero, () {
          Get.offNamedUntil(
              kCurrentOrderRoute, ModalRoute.withName(kHomeRoute));
        });
        // Notice the User !
      }
      // recursivity needed to actually use await inside this periodic counter.
      startCountOffersValidityCheckPeriodically(orderId, customerId);
      // if it's not null
    });
  }

  Future removeCounterOfferAndResetState({bool expired = true}) async {
    await controller.removeFromNegotiationMode(
        order!.orderId, order!.customer.id,
        expired: expired);
    submittedCounterOffer.value = false;
  }

  /// this gets invoked when the Taxi Driver presses [Send offer] button.
  void onCountOfferSent(num price) {
    controller
        .submitCounterOffer(
            order!.orderId,
            order!.customer.id,
            CounterOffer.buildWithExpiration(
                price: price,
                taxiUserInfo: UserInfo(
                    id: authController.user!.id,
                    name: authController.user!.name!,
                    image: authController.user!.image!)))
        .then((value) => submittedCounterOffer.value = false);
  }

  /// Call this right after accept order
  /// Uses : Make sure that the orderId has been written to the taxiState since we do not await it in backend.
  Future<void> waitForOrderToBeUpdatedAfterAccept(String orderId) async {
    if (taxiAuthController.taxiState?.currentOrder == null) {
      mezDbgPrint(
          "[+] s@@d ==> [ ACCEPT TAXI ORDER ]  RACING CONDITION HAPPENING ... ");
      await taxiAuthController.stateStream
          .firstWhere((taxiState) => taxiState?.currentOrder != null);
    } else
      mezDbgPrint(
          "[+] s@@d ==> [ ACCEPT TAXI ORDER ] NO RACING CONDITION HAPPEND ! ");
  }

  void cancelOrderSubscription() {
    orderListener?.cancel();
    orderListener = null;
    countOfferTimerValidator?.cancel();
    countOfferTimerValidator = null;
  }
}
