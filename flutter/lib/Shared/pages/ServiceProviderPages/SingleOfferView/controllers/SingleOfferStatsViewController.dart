import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/graphql/offer/hsOffer.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';

class SingleOfferStatsViewController {
  late int offerId;
  RxNum _revenue = RxNum(0);
  RxNum _cost = RxNum(0);

  // inputs //
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController orderTotal = TextEditingController();
  TextEditingController infCommission = TextEditingController();
  TextEditingController infCode = TextEditingController();

  void init({required int offerId}) {
    this.offerId = offerId;
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
        } else
          showErrorSnackBar();
      }
    }
  }
}
