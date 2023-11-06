import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:graphql/client.dart';
import 'package:mezcalmos/InfluencerApp/controllers/influencerAuthController.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/graphql/influencer/hsInfluencer.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';

class InfDealsViewController {
  InfluencerAuthController _influencerAuthController =
      Get.find<InfluencerAuthController>();

  TextEditingController refTxt = TextEditingController();
  RxList<Offer> _openOffers = RxList<Offer>.empty();

  List<Offer> get openOffers => _openOffers.value;
  RxList<Offer> _currentOffers = RxList<Offer>.empty();

  List<Offer> get currentOffers => _currentOffers.value;

  Influencer get influencer => _influencerAuthController.influencer!;

  void init() {
    refTxt.text = _influencerAuthController.influencer!.tag;
    fetchOffers();
  }

  Future<void> fetchOffers() async {
    _currentOffers.value = await get_inf_current_offers(
      offset: 0,
      limit: 25,
      influencerId: _influencerAuthController.influencer!.id.toInt(),
      withCache: false,
    );

    final List<Offer> _newOpenOffers =
        await get_inf_open_offers(withCache: false);

    _openOffers.value = _newOpenOffers.where((Offer element) {
      return !_currentOffers.value
          .any((Offer currentOffer) => currentOffer.id == element.id);
    }).toList();
  }

  Future<void> promote({required num offerId}) async {
    try {
      final bool res = await assign_influencer_offer(
          influencerId: _influencerAuthController.influencer!.id.toInt(),
          offerId: offerId.toInt());
      if (res) {
        showSavedSnackBar(
            title: "Promoting", subtitle: "you are now promoting the offer");
        unawaited(fetchOffers());
      }
    } on Exception catch (e) {
      mezDbgPrint(e);
      // TODO
    }
  }

  Future<void> unpromote({required num offerId}) async {
    try {
      final bool res = await unassign_influencer_offer(
          influencerId: _influencerAuthController.influencer!.id.toInt(),
          offerId: offerId.toInt());
      if (res) {
        showSavedSnackBar(
            title: "Removed", subtitle: "no longer promoting the offer");
        unawaited(fetchOffers());
      }
    } on Exception catch (e) {
      mezDbgPrint(e);
      // TODO
    }
  }

  Future<void> updateTag(BuildContext context) async {
    if (refTxt.text.isNotEmpty) {
      try {
        final String? res = await update_influencer_tag(
            infId: _influencerAuthController.influencer!.id.toInt(),
            tag: refTxt.text);
        if (res != null) {
          showSavedSnackBar();
          _influencerAuthController.setTag(res);
          refTxt.text = res;
          Navigator.pop(context);
        }
      } on OperationException catch (e) {
        if (e.graphqlErrors.first.message.startsWith("Uniqueness")) {
          showErrorSnackBar(
              errorText: "This tag is taken please choose another one");
        } else {
          showErrorSnackBar(errorText: e.graphqlErrors.first.message);
        }

        mezDbgPrint(e);
      }
    }
  }
}
