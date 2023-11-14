import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql/client.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart' as cm;
import 'package:mezcalmos/Shared/controllers/ServiceProfileController.dart';
import 'package:mezcalmos/Shared/graphql/offer/hsOffer.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/OffersHelper/InfEarningHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/User.dart';

class SingleOfferStatsViewController {
  late int offerId;
  RxNum _revenue = RxNum(0);
  RxNum _cost = RxNum(0);
  Rx<TransactionsPaymentsView> _transactionsPaymentsView =
      Rx<TransactionsPaymentsView>(TransactionsPaymentsView.Orders);
  RxList<InfEarning> _earnings = RxList<InfEarning>.empty();
  RxList<InfPayout> _payouts = RxList<InfPayout>.empty();
  ServiceProfileController _serviceProfileController =
      Get.find<ServiceProfileController>();
  // getters //
  List<InfEarning> get earnings => _earnings.value;
  List<InfPayout> get payouts => _payouts.value;
  num get revenue => _revenue.value;
  num get loss => _cost.value;
  bool get isOrdersView =>
      _transactionsPaymentsView.value == TransactionsPaymentsView.Orders;
  bool get isPaymentsView =>
      _transactionsPaymentsView.value == TransactionsPaymentsView.Payments;

  // inputs //
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController orderTotal = TextEditingController();
  TextEditingController infCommission = TextEditingController();
  TextEditingController discountTxt = TextEditingController();
  TextEditingController infCode = TextEditingController();
  TextEditingController infPayoutAmmount = TextEditingController();
  // pagination //
  final int fetchSize = 10;
  int _eraningCurrentOffset = 0;
  bool _earningsFetchingData = false;
  bool _earningReachedEndOfData = false;
  int _payoutsCurrentOffset = 0;
  bool _payoutsFetchingData = false;
  bool _payoutsReachedEndOfData = false;
  bool get earningsReachedEndData => _earningReachedEndOfData;
  bool get payoutsReachedEndOfData => _payoutsReachedEndOfData;

  void init({required int offerId}) {
    this.offerId = offerId;
    _fetchRevAndLoss();
    fetchOfferEarnings();
    fetchAllPayouts();
  }

  Future<void> _fetchRevAndLoss() async {
    mezDbgPrint("Calling func Fetch loss and cost🇵🇸");
    _revenue.value = await get_offer_total_revenue(offerId: offerId) ?? 0;
    _cost.value = await get_offer_total_loss(offerId: offerId) ?? 0;
  }

  // Future<void> _fetchOfferEarnings() async {
  //   _earnings.value =
  //       await get_offer_applied_by_offer(offerId: offerId) ?? <InfEarning>[];
  // }

  // Future<void> _fetchAllPayouts() async {
  //   _payouts.value = await get_all_service_influencer_payouts(
  //           serviceId: _serviceProfileController.serviceId,
  //           spType: cm.ServiceProviderType.Restaurant) ??
  //       <InfPayout>[];
  // }

  Future<void> fetchOfferEarnings() async {
    if (_earningsFetchingData || _earningReachedEndOfData) {
      return;
    }

    try {
      _earningsFetchingData = true;
      final List<InfEarning> newData = await get_offer_applied_by_offer(
              offerId: offerId,
              offset: _eraningCurrentOffset,
              limit: fetchSize) ??
          <InfEarning>[];
      _earnings.value += newData;
      if (newData.length == 0) {
        _earningReachedEndOfData = true;
      }
      _eraningCurrentOffset += fetchSize;
    } finally {
      _earningsFetchingData = false;
    }
  }

  Future<void> fetchAllPayouts() async {
    if (_payoutsFetchingData || _payoutsReachedEndOfData) {
      return;
    }

    try {
      _payoutsFetchingData = true;
      final List<InfPayout> newData = await get_all_service_influencer_payouts(
              serviceId: _serviceProfileController.serviceId,
              spType: cm.ServiceProviderType.Restaurant,
              offset: _payoutsCurrentOffset,
              limit: fetchSize) ??
          <InfPayout>[];
      _payouts.value += newData;
      if (newData.length == 0) {
        _payoutsReachedEndOfData = true;
      }
      _payoutsCurrentOffset += fetchSize;
    } finally {
      _payoutsFetchingData = false;
    }
  }

  Future<double> fetchInfluencerPayouts({required int influencerId}) async {
    return await get_service_influencer_payouts(
            serviceId: _serviceProfileController.serviceId,
            influencerId: influencerId,
            spType: cm.ServiceProviderType.Restaurant) ??
        0;
  }

  Future<void> recordSale(BuildContext context) async {
    if (formKey.currentState?.validate() == true) {
      final int? infId = await get_inf_id_by_tag(tag: infCode.text);
      if (infId != null) {
        final bool res = await insert_offer_applied(
            orderTotal: double.parse(orderTotal.text),
            infComission: double.parse(infCommission.text),
            discount: double.parse(discountTxt.text),
            serviceProviderId: _serviceProfileController.serviceId,
            influencerId: infId,
            offerId: offerId);
        if (res) {
          showSavedSnackBar();
          Navigator.pop(context);
          unawaited(_fetchRevAndLoss());
          unawaited(fetchOfferEarnings());
          unawaited(fetchAllPayouts());
        } else
          showErrorSnackBar();
      } else {
        showErrorSnackBar(
            errorText:
                "Can't find any influencer with this tag ${infCode.text}");
      }
    }
  }

  Map<UserInfo, num> get groupedByInf {
    final Map<UserInfo, List<InfEarning>> groupedInfEarnings =
        groupBy(earnings, (InfEarning infEarning) => infEarning.influencerInfo);
    mezDbgPrint("LENGTH ===============>${groupedInfEarnings.length}");
    return groupedInfEarnings.map<UserInfo, num>(
        (UserInfo key, List<InfEarning> value) => MapEntry(
            key,
            value.fold(
                0,
                (num previous, InfEarning current) =>
                    previous + current.comission)));
  }

  Future<void> recordInfPayout(
      {required int infId, required BuildContext context}) async {
    try {
      final int? res = await insert_influencer_payout(
          influencerId: infId,
          spId: _serviceProfileController.serviceId,
          amount: double.parse(infPayoutAmmount.text),
          spType: cm.ServiceProviderType.Restaurant);
      if (res != null) {
        showSavedSnackBar();
        await fetchInfluencerPayouts(influencerId: infId);
        Navigator.pop(context);
      }
    } on OperationException catch (e, stk) {
      showErrorSnackBar(errorText: e.graphqlErrors.first.message);
      mezDbgPrint(e);
      mezDbgPrint(stk);
    }
  }

  void switchOrdersPayments(TransactionsPaymentsView view) {
    _transactionsPaymentsView.value = view;
  }
}

enum TransactionsPaymentsView { Orders, Payments }
