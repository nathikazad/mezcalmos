import 'package:get/get.dart';
import 'package:mezcalmos/InfluencerApp/controllers/influencerAuthController.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/graphql/influencer/hsInfluencer.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';

class InfDealsViewController {
  InfluencerAuthController _influencerAuthController =
      Get.find<InfluencerAuthController>();
  RxList<Offer> _openOffers = RxList<Offer>.empty();

  List<Offer> get openOffers => _openOffers.value;
  RxList<Offer> _currentOffers = RxList<Offer>.empty();

  List<Offer> get currentOffers => _currentOffers.value;

  Influencer get influencer => _influencerAuthController.influencer!;

  void init() {
    fetchOffers();
  }

  Future<void> fetchOffers() async {
    _currentOffers.value = await get_inf_current_offers(
        influencerId: _influencerAuthController.influencer!.id.toInt(),
        withCache: false);
    _openOffers.value = await get_inf_open_offers(withCache: false);
  }

  Future<void> promote({required num offerId}) async {
    try {
      final bool res = await assign_influencer_offer(
          influencerId: _influencerAuthController.influencer!.id.toInt(),
          offerId: offerId.toInt());
      if (res) {
        showSavedSnackBar(
            title: "Promoting", subtitle: "you are now promoting the offer");
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
      }
    } on Exception catch (e) {
      mezDbgPrint(e);
      // TODO
    }
  }
}
