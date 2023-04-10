import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/MezAdminApp/pages/AdminTabsView/controllers/AdminTabsViewController.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/graphql/admin/service_providers/hsAdminServiceProviders.dart';
import 'package:mezcalmos/Shared/graphql/service_provider/hsServiceProvider.dart';
import 'package:mezcalmos/Shared/models/Services/DeliveryCompany/DeliveryCompany.dart';
import 'package:mezcalmos/Shared/models/Services/Laundry.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Restaurant.dart';
import 'package:mezcalmos/Shared/models/Services/Service.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServiceProviderType.dart';

class AdminServicesViewController {
  late AdminTabsViewController adminTabsViewController;
  ScrollController scrollController = ScrollController();
  // obs //
  Rxn<List<Restaurant>> _restaurants = Rxn();
  Rxn<List<Laundry>> _laundries = Rxn();
  Rxn<List<DeliveryCompany>> _dvCompanies = Rxn();
  RxBool isFetching = RxBool(false);
  RxInt restLimit = RxInt(10);
  RxInt dvLimit = RxInt(5);
  RxInt laundryLimit = RxInt(5);
// getters //
  bool get hasData => _dvCompanies.value != null && _restaurants.value != null;
  ServiceProviderType get currentService =>
      adminTabsViewController.selectedServiceProviderType.value;
  List<Restaurant>? get restaurants => _restaurants.value;
  List<DeliveryCompany>? get companies => _dvCompanies.value;
  List<Laundry>? get laundries => _laundries.value;

  Future<void> init(
      {required AdminTabsViewController adminTabsViewController}) async {
    this.adminTabsViewController = adminTabsViewController;
    await fetchRestaurants();
    await fetchLaundries();
    await fetchCompanies();
  }

  Future<void> fetchCompanies() async {
    _dvCompanies.value?.clear();
    _dvCompanies.value =
        await admin_get_dv_companies(withCache: false, limit: dvLimit.value);
  }

  Future<void> fetchLaundries() async {
    _laundries.value?.clear();
    _laundries.value =
        await admin_get_laundries(withCache: false, limit: laundryLimit.value);
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
      required ServiceProviderType providerType,
      required bool value}) async {
    await update_service_state(
        status: value ? ServiceStatus.Open : ServiceStatus.ClosedTemporarily,
        detailsId: serviceDetailsId,
        approved: null);
    fetchCurrent();
  }

  void fetchCurrent({int? increaseLimit}) {
    switch (currentService) {
      case ServiceProviderType.Laundry:
        laundryLimit.value += increaseLimit ?? 0;
        unawaited(fetchLaundries());
        break;
      case ServiceProviderType.Restaurant:
        restLimit.value += increaseLimit ?? 0;
        unawaited(fetchRestaurants());
        break;
      case ServiceProviderType.DeliveryCompany:
        dvLimit.value += increaseLimit ?? 0;
        unawaited(fetchCompanies());
        break;
      default:
    }
  }

  List<Service>? get getCurrentService {
    switch (currentService) {
      case ServiceProviderType.Laundry:
        return _laundries.value;
      case ServiceProviderType.Restaurant:
        return _restaurants.value;
      case ServiceProviderType.DeliveryCompany:
        return _dvCompanies.value;
      case ServiceProviderType.Customer:
        return null;
    }
  }

  Future<void> approveService({required int detailsId}) async {
    await update_service_state(
        status: null, detailsId: detailsId, approved: true);
    fetchCurrent();
  }
}
