import 'package:get/get.dart';
import 'package:mezcalmos/MezAdminApp/pages/AdminTabsView/controllers/AdminTabsViewController.dart';
import 'package:mezcalmos/Shared/graphql/admin/service_providers/hsAdminServiceProviders.dart';
import 'package:mezcalmos/Shared/models/User.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServiceProviderType.dart';

class AdminServicesViewController {
  late AdminTabsViewController adminTabsViewController;
  // obs //
  Rxn<List<ServiceInfo>> _restaurants = Rxn();
  Rxn<List<UserInfo>> _dvCompanies = Rxn();
// getters //
  ServiceProviderType get currentService =>
      adminTabsViewController.selectedServiceProviderType.value;
  List<UserInfo> get services {
    switch (currentService) {
      case ServiceProviderType.Restaurant:
        return _restaurants.value ?? [];
      case ServiceProviderType.Delivery_company:
        return _dvCompanies.value ?? [];

      default:
        return [];
    }
  }

  Future<void> init(
      {required AdminTabsViewController adminTabsViewController}) async {
    this.adminTabsViewController = adminTabsViewController;
    _restaurants.value = await admin_get_restaurants();

    _dvCompanies.value = await admin_get_dv_companies();
  }
}
