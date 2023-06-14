import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/MezAdminApp/pages/AdminTabsView/controllers/AdminTabsViewController.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart' as cModels;
import 'package:mezcalmos/Shared/graphql/admin/service_providers/hsAdminServiceProviders.dart';
import 'package:mezcalmos/Shared/graphql/service_provider/hsServiceProvider.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/ScrollHelper.dart';
import 'package:mezcalmos/Shared/models/Services/DeliveryCompany/DeliveryCompany.dart';
import 'package:mezcalmos/Shared/models/Services/Laundry.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Restaurant.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';

class AdminServicesViewController {
  late AdminTabsViewController adminTabsViewController;
  ScrollController scrollController = ScrollController();
  // obs //
  RxList<Restaurant> _restaurants = RxList.empty();
  RxList<Laundry> _laundries = RxList.empty();
  RxList<DeliveryCompany> _dvCompanies = RxList.empty();
  RxList<cModels.Business> _businesses = RxList.empty();
  RxBool isFetching = RxBool(false);

  RxInt laundryLimit = RxInt(3);
  final int businessFetchSize = 10;
  int _businessCurrentOffset = 0;
  bool _businessFetchingData = false;
  bool _businessReachedEndOfData = false;
  final int laundryFetchSize = 10;
  int _laundryCurrentOffset = 0;
  bool _laundryFetchingData = false;
  bool _laundryReachedEndOfData = false;
  final int restFetchSize = 10;
  int _restCurrentOffset = 0;
  bool _restFetchingData = false;
  bool _restReachedEndOfData = false;
  final int dvFetchSize = 10;
  int _dvCurrentOffset = 0;
  bool _dvFetchingData = false;
  bool _dvReachedEndOfData = false;

// getters //

  cModels.ServiceProviderType get currentService =>
      adminTabsViewController.selectedServiceProviderType.value;
  List<Restaurant> get restaurants => _restaurants;
  List<DeliveryCompany> get companies => _dvCompanies;
  List<Laundry> get laundries => _laundries;
  List<cModels.Business>? get businesses => _businesses;

  Future<void> init(
      {required AdminTabsViewController adminTabsViewController}) async {
    this.adminTabsViewController = adminTabsViewController;

    await Future.wait([
      fetchRestaurants(),
      fetchLaundries(),
      fetchCompanies(),
      fetchBusiness()
    ]);
    scrollController.onBottomReach(fetchCurrent, sensitivity: 500);
  }

  Future<void> fetchCompanies() async {
    isFetching.value = true;
    if (_dvFetchingData || _dvReachedEndOfData) {
      return;
    }
    _dvFetchingData = true;
    mezDbgPrint("fetching companies from admin controller");
    List<DeliveryCompany> newList = await admin_get_dv_companies(
        withCache: false, limit: dvFetchSize, offset: _dvCurrentOffset);
    _dvCompanies.value += newList;
    _dvCompanies.refresh();
    if (newList.length == 0) {
      _dvReachedEndOfData = true;
    }
    _dvCurrentOffset += dvFetchSize;
    _dvFetchingData = false;
    isFetching.value = false;
  }

  Future<void> fetchBusiness() async {
    isFetching.value = true;
    if (_businessFetchingData || _businessReachedEndOfData) {
      return;
    }
    _businessFetchingData = true;
    mezDbgPrint("fetching businesses from admin controller");
    List<cModels.Business> newList = await admin_get_businesses(
        withCache: false,
        limit: businessFetchSize,
        offset: _businessCurrentOffset);
    _businesses.value += newList;
    _businesses.refresh();
    if (newList.length == 0) {
      _businessReachedEndOfData = true;
    }

    _businessCurrentOffset += businessFetchSize;
    _businessFetchingData = false;
    isFetching.value = false;
  }

  Future<void> fetchLaundries() async {
    isFetching.value = true;
    if (_laundryFetchingData || _laundryReachedEndOfData) {
      return;
    }
    _laundryFetchingData = true;
    mezDbgPrint("fetching laundries from admin controller");
    List<Laundry> newList = await admin_get_laundries(
        withCache: false,
        limit: laundryFetchSize,
        offset: _laundryCurrentOffset);
    _laundries.value += newList;
    _laundries.refresh();
    if (newList.length == 0) {
      _laundryReachedEndOfData = true;
    }
    _laundryCurrentOffset += laundryFetchSize;

    _laundryFetchingData = false;
    isFetching.value = false;
  }

  Future<void> fetchRestaurants() async {
    isFetching.value = true;
    if (_restFetchingData || _restReachedEndOfData) {
      return;
    }
    _restFetchingData = true;
    mezDbgPrint("fetching restaurants from admin controller");
    List<Restaurant> newList = await admin_get_restaurants(
        withCache: false, limit: restFetchSize, offset: _restCurrentOffset);
    _restaurants.value += newList;
    _restaurants.refresh();
    if (newList.length == 0) {
      _restReachedEndOfData = true;
    }
    _restCurrentOffset += restFetchSize;

    _restFetchingData = false;
    isFetching.value = false;
    mezDbgPrint("restaurant length =======>${_restaurants.value.length}");
  }

  Future<void> switchServiceStatus(
      {required int serviceDetailsId,
      required cModels.ServiceProviderType providerType,
      required bool value}) async {
    await update_service_state(
        status: value ? ServiceStatus.Open : ServiceStatus.ClosedTemporarily,
        detailsId: serviceDetailsId,
        approved: null);
    fetchCurrent();
  }

  void fetchCurrent() {
    switch (currentService) {
      case cModels.ServiceProviderType.Laundry:
        unawaited(fetchLaundries());
        break;
      case cModels.ServiceProviderType.Restaurant:
        unawaited(fetchRestaurants());
        break;
      case cModels.ServiceProviderType.DeliveryCompany:
        unawaited(fetchCompanies());
        break;
      case cModels.ServiceProviderType.Business:
        unawaited(fetchBusiness());
        break;
      default:
    }
  }

  int get currentServiceLength {
    switch (currentService) {
      case cModels.ServiceProviderType.Laundry:
        return _laundries.value.length ?? 0;
      case cModels.ServiceProviderType.Restaurant:
        return _restaurants.value.length ?? 0;
      case cModels.ServiceProviderType.DeliveryCompany:
        return _dvCompanies.value.length ?? 0;
      case cModels.ServiceProviderType.Business:
        return _businesses.value.length ?? 0;
      default:
        throw Exception("Service type not found");
    }
  }

  Future<void> approveService(
      {required int detailsId, required bool approved}) async {
    await update_service_state(
        status: null, detailsId: detailsId, approved: approved);
    fetchCurrent();
  }
}
