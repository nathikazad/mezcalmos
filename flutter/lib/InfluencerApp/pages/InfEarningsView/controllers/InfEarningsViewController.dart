import 'package:collection/collection.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/InfluencerApp/controllers/influencerAuthController.dart';
import 'package:mezcalmos/Shared/graphql/influencer/hsInfluencer.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/OffersHelper/InfEarningHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/thirdParty/MapHelper.dart';
import 'package:mezcalmos/Shared/models/User.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';
import 'package:url_launcher/url_launcher.dart';

class InfEarningsViewController {
  InfluencerAuthController _authController =
      Get.find<InfluencerAuthController>();
  RxNum _totalEranings = RxNum(0);
  // RxNum _totalDiscounts = RxNum(0);
  RxList<InfEarning> earnings = RxList<InfEarning>.empty();
  num get totalEarnings => _totalEranings.value;
//  num get totalDiscounts => _totalDiscounts.value;
  int get influencerId => _authController.influencer!.id.toInt();
  RxBool _isFetching = RxBool(false);
  bool get isFetching => _isFetching.value;
  Future<void> init() async {
    await _fetchTotalEarnings();
  }

  Future<void> _fetchTotalEarnings() async {
    try {
      _isFetching.value = true;
      _totalEranings.value =
          await get_influencer_earnings_sum(influencerId: influencerId) ?? 0;
      // _totalDiscounts.value = await get_influencer_discount_sum(
      //         influencerId: _authController.influencer!.id.toInt()) ??
      //     0;
      earnings.value =
          await get_inf_earnings(influencerId: influencerId) ?? <InfEarning>[];
    } catch (e, stk) {
      showErrorSnackBar();
      mezDbgPrint(e);
      mezDbgPrint(stk);
    } finally {
      _isFetching.value = false;
    }
  }

  Map<ServiceInfo, List<InfEarning>> get groupedByRestaurant {
    final Map<ServiceInfo, List<InfEarning>> groupedInfEarnings = groupBy(
        earnings.value, (InfEarning infEarning) => infEarning.serviceInfo);
    return groupedInfEarnings;
  }

  Future<void> openGmaps(MezLocation location) async {
    final String mapsUrl = getGMapsDirectionLink(null, location.toLatLng()!);
    try {
      await launchUrl(Uri.parse(mapsUrl), mode: LaunchMode.externalApplication);
    } catch (e) {
      mezDbgPrint(e);
      // TODO
    }
  }

  Future<void> callWhatsapp({String? phone}) async {
    if (phone != null) {
      await callWhatsappNumber(phone);
    }
  }
}
