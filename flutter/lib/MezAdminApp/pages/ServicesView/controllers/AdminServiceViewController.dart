import 'dart:async';

import 'package:get/get.dart';
import 'package:mezcalmos/MezAdminApp/pages/AdminTabsView/controllers/AdminTabsViewController.dart';
import 'package:mezcalmos/Shared/graphql/admin/service_providers/hsAdminServiceProviders.dart';
import 'package:mezcalmos/Shared/graphql/delivery_company/hsDeliveryCompany.dart';
import 'package:mezcalmos/Shared/graphql/restaurant/hsRestaurant.dart';
import 'package:mezcalmos/Shared/models/Services/DeliveryCompany/DeliveryCompany.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Restaurant.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServiceProviderType.dart';

class AdminServicesViewController {
  late AdminTabsViewController adminTabsViewController;
  // obs //
  Rxn<List<Restaurant>> _restaurants = Rxn();
  Rxn<List<DeliveryCompany>> _dvCompanies = Rxn();
  RxInt restLimit = RxInt(5);
  RxInt dvLimit = RxInt(5);
// getters //
  bool get hasData => _dvCompanies.value != null && _restaurants.value != null;
  ServiceProviderType get currentService =>
      adminTabsViewController.selectedServiceProviderType.value;
  List<Restaurant>? get restaurants => _restaurants.value;
  List<DeliveryCompany>? get companies => _dvCompanies.value;

  Future<void> init(
      {required AdminTabsViewController adminTabsViewController}) async {
    this.adminTabsViewController = adminTabsViewController;
    await fetchRestaurants();

    await fetchCompanies();
  }

  Future<void> fetchCompanies() async {
    _dvCompanies.value?.clear();
    _dvCompanies.value =
        await admin_get_dv_companies(withCache: false, limit: dvLimit.value);
  }

  Future<void> fetchRestaurants() async {
    _restaurants.value?.clear();
    _restaurants.value =
        await admin_get_restaurants(withCache: false, limit: restLimit.value);
  }

  Future<void> switchServiceStatus(
      {required int serviceId,
      required ServiceProviderType providerType,
      required bool value}) async {
    if (providerType == ServiceProviderType.Restaurant) {
      await update_restaurant_status(
          id: serviceId,
          status:
              (value) ? ServiceStatus.Open : ServiceStatus.Closed_temporarily);
      unawaited(fetchRestaurants());
    } else {
      await update_deliveryCompany_status(
          id: serviceId,
          status:
              (value) ? ServiceStatus.Open : ServiceStatus.Closed_temporarily);
      unawaited(fetchCompanies());
    }
  }

  Future<void> approveService({required Restaurant restaurant}) async {
    await update_restaurant_info(
        id: restaurant.restaurantId, restaurant: restaurant, approved: true);
    unawaited(fetchRestaurants());
  }
}
