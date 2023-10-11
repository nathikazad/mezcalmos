import 'package:get/get.dart';
import 'package:mezcalmos/InfluencerApp/controllers/influencerAuthController.dart';
import 'package:mezcalmos/Shared/graphql/influencer/hsInfluencer.dart';

class InfEarningsViewController {
  InfluencerAuthController _authController =
      Get.find<InfluencerAuthController>();
  RxNum _totalEranings = RxNum(0);
  RxList earnings = RxList.empty();
  num get totalEarnings => _totalEranings.value;
  Future<void> init() async {
    await _fetchTotalEarnings();
  }

  Future<void> _fetchTotalEarnings() async {
    _totalEranings.value = await get_influencer_earnings_sum(
            influencerId: _authController.influencer!.id.toInt()) ??
        0;
  }
}
