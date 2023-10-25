import 'package:get/get.dart';
import 'package:mezcalmos/InfluencerApp/controllers/influencerAuthController.dart';
import 'package:mezcalmos/Shared/graphql/influencer/hsInfluencer.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/OffersHelper/InfEarningHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';

class InfEarningsViewController {
  InfluencerAuthController _authController =
      Get.find<InfluencerAuthController>();
  RxNum _totalEranings = RxNum(0);
  RxNum _totalDiscounts = RxNum(0);
  RxList<InfEarning> earnings = RxList<InfEarning>.empty();
  num get totalEarnings => _totalEranings.value;
  num get totalDiscounts => _totalDiscounts.value;
  int get influencerId => _authController.influencer!.id.toInt();
  Future<void> init() async {
    await _fetchTotalEarnings();
  }

  Future<void> _fetchTotalEarnings() async {
    try {
      _totalEranings.value =
          await get_influencer_earnings_sum(influencerId: influencerId) ?? 0;
      _totalDiscounts.value = await get_influencer_discount_sum(
              influencerId: _authController.influencer!.id.toInt()) ??
          0;
      earnings.value =
          await get_inf_earnings(influencerId: influencerId) ?? <InfEarning>[];
    } catch (e, stk) {
      showErrorSnackBar();
      mezDbgPrint(e);
      mezDbgPrint(stk);
    }
  }
}
