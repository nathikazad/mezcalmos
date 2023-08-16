// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/cloudFunctions/index.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/delivery_order/hsDeliveryOrderModels.dart';
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
  Rxn<num> customerOffer = Rxn<num>();
  RxMap<int, CounterOffer> _offers = RxMap({});
  Map<int, CounterOffer> get offers => _offers.value;
  RxMap<int, bool> notifiedDrivers = RxMap<int, bool>({});

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

  int get driversSawOfferCount => notifiedDrivers.entries
      .where((MapEntry<int, bool> element) => element.value == true)
      .length;
  // streams //
  StreamSubscription? _streamSubscription;
  String? subscriptionId;

  Future<void> init({required int orderId}) async {
    this.orderId = orderId;
    CustDeliveryOffersListVariables? res =
        await get_dv_order_offers(orderId: orderId);
    if (res != null) {
      mezDbgPrint("Customer offer =========>${res.customerOffer}");
      customerOffer.value = res.customerOffer;
      _offers.value = res.offers ?? {};
      notifiedDrivers.value = res.notifiedDrivers ?? {};
    }
    subscriptionId = _db.createSubscription(start: () {
      _streamSubscription = listen_on_dv_order_offers(orderId: orderId)
          .listen((CustDeliveryOffersListVariables? event) {
        if (event != null) {
          _offers.value = event.offers ?? {};
          notifiedDrivers.value = event.notifiedDrivers ?? {};
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
    try {
      final bool res = await update_delivery_order_offers(
          offers: newOffers, orderId: orderId);
      if (res == true) {
        showSavedSnackBar(
            title: "Rejected", subtitle: "Offer rejected successfully");
      }
    } catch (e, stk) {
      mezDbgPrint(e);
      mezDbgPrint(stk);
      // TODO
    }
  }

  Future<void> updateCustomerOffer() async {
    num? res = await update_delivery_order_customer_offer(
        customerOffer: customerOffer.value! + 10, orderId: orderId);
    if (res != null) {
      customerOffer.value = res;
    }
  }
}
