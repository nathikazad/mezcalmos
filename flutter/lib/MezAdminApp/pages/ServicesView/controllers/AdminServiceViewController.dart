import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/MezAdminApp/pages/AdminTabsView/controllers/AdminTabsViewController.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart' as cModels;
import 'package:mezcalmos/Shared/graphql/admin/service_providers/hsAdminServiceProviders.dart';
import 'package:mezcalmos/Shared/graphql/service_provider/hsServiceProvider.dart';
import 'package:mezcalmos/Shared/models/Services/DeliveryCompany/DeliveryCompany.dart';
import 'package:mezcalmos/Shared/models/Services/Laundry.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Restaurant.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';

class AdminServicesViewController {
  late AdminTabsViewController adminTabsViewController;
  ScrollController scrollController = ScrollController();
  // obs //
  Rxn<List<Restaurant>> _restaurants = Rxn();
  Rxn<List<Laundry>> _laundries = Rxn();
  Rxn<List<DeliveryCompany>> _dvCompanies = Rxn();
  Rxn<List<cModels.Business>> _businesses = Rxn();
  RxBool isFetching = RxBool(false);
  RxInt restLimit = RxInt(10);
  RxInt dvLimit = RxInt(10);
  RxInt bsLimit = RxInt(100);
  RxInt laundryLimit = RxInt(10);
// getters //
  bool get hasData => _dvCompanies.value != null && _restaurants.value != null;
  cModels.ServiceProviderType get currentService =>
      adminTabsViewController.selectedServiceProviderType.value;
  List<Restaurant>? get restaurants => _restaurants.value;
  List<DeliveryCompany>? get companies => _dvCompanies.value;
  List<Laundry>? get laundries => _laundries.value;
  List<cModels.Business>? get businesses => _businesses.value;

  Future<void> init(
      {required AdminTabsViewController adminTabsViewController}) async {
    this.adminTabsViewController = adminTabsViewController;
    // await fetchRestaurants();
    // await fetchLaundries();
    // await fetchCompanies();
    await Future.wait([
      fetchRestaurants(),
      fetchLaundries(),
      fetchCompanies(),
      fetchBusiness()
    ]);
  }

  Future<void> fetchCompanies() async {
    isFetching.value = true;
    _dvCompanies.value?.clear();
    _dvCompanies.value =
        await admin_get_dv_companies(withCache: false, limit: dvLimit.value);
    isFetching.value = false;
  }

  Future<void> fetchBusiness() async {
    isFetching.value = true;
    _businesses.value?.clear();
    _businesses.value =
        await admin_get_businesses(withCache: false, limit: bsLimit.value);
    isFetching.value = false;
  }

  Future<void> fetchLaundries() async {
    isFetching.value = true;
    _laundries.value?.clear();
    _laundries.value =
        await admin_get_laundries(withCache: false, limit: laundryLimit.value);
    isFetching.value = false;
  }

  Future<void> fetchRestaurants() async {
    isFetching.value = true;
    _restaurants.value?.clear();
    _restaurants.value =
        await admin_get_restaurants(withCache: false, limit: restLimit.value);
    isFetching.value = false;
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

  void fetchCurrent({int? increaseLimit}) {
    switch (currentService) {
      case cModels.ServiceProviderType.Laundry:
        laundryLimit.value += increaseLimit ?? 0;
        unawaited(fetchLaundries());
        break;
      case cModels.ServiceProviderType.Restaurant:
        restLimit.value += increaseLimit ?? 0;
        unawaited(fetchRestaurants());
        break;
      case cModels.ServiceProviderType.DeliveryCompany:
        dvLimit.value += increaseLimit ?? 0;
        unawaited(fetchCompanies());
        break;
      case cModels.ServiceProviderType.Business:
        dvLimit.value += increaseLimit ?? 0;
        unawaited(fetchBusiness());
        break;
      default:
    }
  }

  int get currentServiceLength {
    switch (currentService) {
      case cModels.ServiceProviderType.Laundry:
        return _laundries.value?.length ?? 0;
      case cModels.ServiceProviderType.Restaurant:
        return _restaurants.value?.length ?? 0;
      case cModels.ServiceProviderType.DeliveryCompany:
        return _dvCompanies.value?.length ?? 0;
      case cModels.ServiceProviderType.Business:
        return _businesses.value?.length ?? 0;
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
