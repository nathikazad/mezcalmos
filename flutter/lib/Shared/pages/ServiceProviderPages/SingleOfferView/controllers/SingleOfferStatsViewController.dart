import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/graphql/offer/hsOffer.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/OffersHelper/InfEarningHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';

class SingleOfferStatsViewController {
  late int offerId;
  RxNum _revenue = RxNum(0);
  RxNum _cost = RxNum(0);
  RxList<InfEarning> _earnings = RxList<InfEarning>.empty();
  // getters //
  List<InfEarning> get earnings => _earnings.value;
  num get revenue => _revenue.value;
  num get loss => _cost.value;

  // inputs //
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController orderTotal = TextEditingController();
  TextEditingController infCommission = TextEditingController();
  TextEditingController infCode = TextEditingController();

  void init({required int offerId}) {
    this.offerId = offerId;
    _fetchRevAndLoss();
    fetchOfferEarnings();
  }

  Future<void> _fetchRevAndLoss() async {
    mezDbgPrint("Calling func Fetch loss and cost🇵🇸");
    _revenue.value = await get_offer_total_revenue(offerId: offerId) ?? 0;
    _cost.value = await get_offer_total_loss(offerId: offerId) ?? 0;
  }

  Future<void> fetchOfferEarnings() async {
    _earnings.value =
        await get_offer_applied_by_offer(offerId: offerId) ?? <InfEarning>[];
  }

  Future<void> recordSale() async {
    if (formKey.currentState?.validate() == true) {
      final int? infId = await get_inf_id_by_tag(tag: infCode.text);
      if (infId != null) {
        final bool res = await insert_offer_applied(
            orderTotal: double.parse(orderTotal.text),
            infComission: double.parse(infCommission.text),
            influencerId: infId,
            offerId: offerId);
        if (res) {
          showSavedSnackBar();
          unawaited(_fetchRevAndLoss());
        } else
          showErrorSnackBar();
      }
    }
  }
}
