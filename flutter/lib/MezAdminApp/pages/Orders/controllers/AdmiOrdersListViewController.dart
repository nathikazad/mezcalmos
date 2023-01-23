import 'package:get/state_manager.dart';
import 'package:mezcalmos/MezAdminApp/pages/AdminTabsView/controllers/AdminTabsViewController.dart';
import 'package:mezcalmos/Shared/graphql/admin/orders/hsAdminOrders.dart';
import 'package:mezcalmos/Shared/models/Orders/Minimal/MinimalOrder.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServiceProviderType.dart';

class AdmiOrdersListViewController {
  late AdminTabsViewController adminTabsViewController;
  // obs //
  Rxn<List<MinimalOrder>> _restaurantOrders = Rxn();
  Rxn<List<MinimalOrder>> _deliveryOrders = Rxn();
// getters //
  ServiceProviderType get currentService =>
      adminTabsViewController.selectedServiceProviderType.value;
  List<MinimalOrder> get orders {
    switch (currentService) {
      case ServiceProviderType.Restaurant:
        return _restaurantOrders.value ?? [];
      case ServiceProviderType.Delivery_company:
        return _deliveryOrders.value ?? [];

      default:
        return [];
    }
  }

  Future<void> init(
      {required AdminTabsViewController adminTabsViewController}) async {
    this.adminTabsViewController = adminTabsViewController;
    _restaurantOrders.value = await get_admin__orders(
        inProcess: false, serviceProviderType: ServiceProviderType.Restaurant);

    _deliveryOrders.value = await get_admin__orders(
        inProcess: true,
        serviceProviderType: ServiceProviderType.Delivery_company);
  }
}
