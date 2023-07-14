import 'dart:async';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/cloudFunctions/index.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/delivery_order/mutations/hsDeliveryOrderMutations.dart';
import 'package:mezcalmos/Shared/graphql/delivery_order/subscriptions/hsDeliveryOrderSubscriptions.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/services/DeliveryOfferHelper.dart';

class CustDeliveryOffersListController {
  //
  HasuraDb _db = Get.find<HasuraDb>();
  //
  late int orderId;
  RxMap<int, CounterOffer> _offers = RxMap({});
  Map<int, CounterOffer> get offers => _offers.value;

  Map<int, CounterOffer> get counterOffers {
    return offers.entries
        .where((MapEntry<int, CounterOffer> element) =>
            element.value.isExpired == false &&
            element.value.isRequested == true)
        .fold({},
            (Map<int, CounterOffer> map, MapEntry<int, CounterOffer> entry) {
      map[entry.key] = entry.value;
      return map;
    });
  }

  // streams //
  StreamSubscription<Map<int, CounterOffer>?>? _streamSubscription;
  String? subscriptionId;

  Future<void> init({required int orderId}) async {
    this.orderId = orderId;
    _offers.value = await get_dv_order_offers(orderId: orderId) ?? {};
    subscriptionId = _db.createSubscription(start: () {
      _streamSubscription = listen_on_dv_order_offers(orderId: orderId)
          .listen((Map<int, CounterOffer>? event) {
        if (event != null) {
          _offers.value = event;
        }
      });
    }, cancel: () {
      _streamSubscription?.cancel();
      _streamSubscription = null;
    });
  }

  void dispose() {
    if (subscriptionId != null) _db.cancelSubscription(subscriptionId!);
  }

  Future<void> acceptOffer({required int id}) async {
    mezDbgPrint("👋 Assigning driver : $id  to order : $orderId");
    MapEntry<int, CounterOffer>? offer = offers.entries
        .firstWhere((MapEntry<int, CounterOffer> element) => element.key == id);
    if (offer == null) {
      return;
    }
    if (offer.value.isExpired) {
      showErrorSnackBar(
          errorTitle: "Expired", errorText: "This offer have been expired");
      return;
    }
    try {
      final AssignDriverResponse res =
          await CloudFunctions.delivery3_assignDriver(
              deliveryOrderId: orderId, deliveryDriverId: id);
      mezDbgPrint("response ===>${res.toFirebaseFormattedJson()}");
      if (res.success) {
        showSavedSnackBar(
            title: "Picked", subtitle: "Driver picked successfully");
      } else {
        mezDbgPrint("🔴 Error =>${res.error} ");
        mezDbgPrint("🔴 Error =>${res.unhandledError} ");
      }
    } on FirebaseFunctionsException catch (e) {
      mezDbgPrint(e);
      showErrorSnackBar(errorText: e.message.toString());
    } catch (e, stk) {
      mezDbgPrint(e);
      mezDbgPrint(stk);
    }
  }

  Future<void> rejectOffer({required int id}) async {
    Map<int, CounterOffer>? newOffers = offers;
    newOffers[id]?.status = CounterOfferStatus.Rejected;
    final bool res =
        await update_delivery_order_offers(offers: newOffers, orderId: orderId);
    if (res == true) {
      showSavedSnackBar(
          title: "Rejected", subtitle: "Offer rejected successfully");
    }
  }
}
