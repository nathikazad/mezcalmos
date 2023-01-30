import 'package:get/state_manager.dart';
import 'package:mezcalmos/Shared/graphql/admin/orders/hsAdminOrders.dart';
import 'package:mezcalmos/Shared/models/Orders/Minimal/MinimalOrder.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServiceProviderType.dart';

class AdminServiceOrdersViewController {
  late int serviceId;
  late ServiceProviderType providerType;
  Rxn<List<MinimalOrder>> currentOrders = Rxn();
  Rxn<List<MinimalOrder>> pastOrders = Rxn();
  bool get hasData => currentOrders.value != null && pastOrders.value != null;
  RxInt pastOrdersLimit = RxInt(10);

  Future<void> init(
      {required int serviceId,
      required ServiceProviderType serviceProviderType}) async {
    this.serviceId = serviceId;
    providerType = serviceProviderType;
    currentOrders.value = await get_admin_service__orders(
            inProcess: true,
            limit: 100,
            serviceProviderId: serviceId,
            serviceProviderType: providerType) ??
        [];
    await fetchPastOrders();
  }

  Future<void> fetchPastOrders() async {
    pastOrders.value = await get_admin_service__orders(
            inProcess: false,
            limit: pastOrdersLimit.value,
            serviceProviderId: serviceId,
            serviceProviderType: providerType) ??
        [];
  }
}
