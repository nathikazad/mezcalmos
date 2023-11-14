import 'package:collection/collection.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/InfluencerApp/controllers/influencerAuthController.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart' as cm;
import 'package:mezcalmos/Shared/graphql/influencer/hsInfluencer.dart';
import 'package:mezcalmos/Shared/graphql/offer/hsOffer.dart';
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
  RxList<InfPayout> payouts = RxList<InfPayout>.empty();
  Rx<OrdersPaymentsView> _ordersPaymentView =
      Rx<OrdersPaymentsView>(OrdersPaymentsView.Orders);
  bool get isOrdersView =>
      _ordersPaymentView.value == OrdersPaymentsView.Orders;
  bool get isPaymentsView =>
      _ordersPaymentView.value == OrdersPaymentsView.Payments;
  num get totalEarnings => _totalEranings.value;
//  num get totalDiscounts => _totalDiscounts.value;
  int get influencerId => _authController.influencer!.id.toInt();
  RxBool _isFetching = RxBool(false);
  bool get isFetching => _isFetching.value;

  /* SCROLL CONTROLLER */
  final int fetchSize = 10;
  int _eraningCurrentOffset = 0;
  bool _earningsFetchingData = false;
  bool _earningReachedEndOfData = false;
  int _payoutsCurrentOffset = 0;
  bool _payoutsFetchingData = false;
  bool _payoutsReachedEndOfData = false;
  bool get earningsReachedEndData => _earningReachedEndOfData;
  bool get payoutsReachedEndOfData => _payoutsReachedEndOfData;
  /* SCROLL CONTROLLER */
  Future<void> init() async {
    await Future.wait(<Future<void>>[
      _fetchTotalEarnings(),
      fetchInfEarnings(),
      fetchPayouts()
    ]);
  }

  Future<void> _fetchTotalEarnings() async {
    try {
      _isFetching.value = true;
      _totalEranings.value =
          await get_influencer_earnings_sum(influencerId: influencerId) ?? 0;
    } catch (e, stk) {
      showErrorSnackBar();
      mezDbgPrint(e);
      mezDbgPrint(stk);
    } finally {
      _isFetching.value = false;
    }
  }

  Future<void> fetchInfEarnings() async {
    if (_earningsFetchingData || _earningReachedEndOfData) {
      return;
    }

    try {
      _earningsFetchingData = true;
      final List<InfEarning> newData = await get_inf_earnings(
              influencerId: influencerId,
              offset: _eraningCurrentOffset,
              limit: fetchSize) ??
          <InfEarning>[];
      earnings.value += newData;
      if (newData.length == 0) {
        _earningReachedEndOfData = true;
      }
      _eraningCurrentOffset += fetchSize;
    } finally {
      _earningsFetchingData = false;
    }
  }

  Future<void> fetchPayouts() async {
    if (_payoutsFetchingData || _payoutsReachedEndOfData) {
      return;
    }

    try {
      _payoutsFetchingData = true;
      final List<InfPayout> newData = await get_influencer_payouts(
              influencerId: influencerId,
              offset: _payoutsCurrentOffset,
              limit: fetchSize) ??
          <InfPayout>[];
      payouts.value += newData;
      if (newData.length == 0) {
        _payoutsReachedEndOfData = true;
      }
      _payoutsCurrentOffset += fetchSize;
    } finally {
      _payoutsFetchingData = false;
    }
  }

  Future<double> fetchInfluencerPayouts({required int serviceId}) async {
    return await get_service_influencer_payouts(
            serviceId: serviceId,
            influencerId: influencerId,
            spType: cm.ServiceProviderType.Restaurant) ??
        0;
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

  void switchOrdersPayments(OrdersPaymentsView view) {
    _ordersPaymentView.value = view;
  }
}

enum OrdersPaymentsView { Orders, Payments }
