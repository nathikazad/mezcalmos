import 'dart:async';

import 'package:get/get.dart';
import 'package:mezcalmos/MezAdminApp/pages/AdminTabsView/controllers/AdminTabsViewController.dart';
import 'package:mezcalmos/Shared/graphql/admin/service_providers/hsAdminServiceProviders.dart';
import 'package:mezcalmos/Shared/graphql/service_provider/hsServiceProvider.dart';
import 'package:mezcalmos/Shared/models/Services/DeliveryCompany/DeliveryCompany.dart';
import 'package:mezcalmos/Shared/models/Services/Laundry.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Restaurant.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServiceProviderType.dart';

class AdminServicesViewController {
  late AdminTabsViewController adminTabsViewController;
  // obs //
  Rxn<List<Restaurant>> _restaurants = Rxn();
  Rxn<List<Laundry>> _laundries = Rxn();
  Rxn<List<DeliveryCompany>> _dvCompanies = Rxn();
  RxInt restLimit = RxInt(5);
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
        await admin_get_laundries(withCache: false, limit: dvLimit.value);
  }

  Future<void> fetchRestaurants() async {
    _restaurants.value?.clear();
    _restaurants.value =
        await admin_get_restaurants(withCache: false, limit: restLimit.value);
  }

  Future<void> switchServiceStatus(
      {required int serviceDetailsId,
      required ServiceProviderType providerType,
      required bool value}) async {
    await update_service_state(
        status: value ? ServiceStatus.Open : ServiceStatus.Closed_temporarily,
        detailsId: serviceDetailsId,
        approved: null);
    _fetchCurrent();
  }

  void _fetchCurrent() {
    switch (currentService) {
      case ServiceProviderType.Laundry:
        unawaited(fetchLaundries());
        break;
      case ServiceProviderType.Restaurant:
        unawaited(fetchRestaurants());
        break;
      case ServiceProviderType.DeliveryCompany:
        unawaited(fetchCompanies());
        break;
      default:
    }
  }

  Future<void> approveService({required int detailsId}) async {
    await update_service_state(
        status: null, detailsId: detailsId, approved: true);
    _fetchCurrent();
  }
}
