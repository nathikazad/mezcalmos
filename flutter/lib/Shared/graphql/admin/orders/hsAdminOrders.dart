import 'package:get/get.dart';
import 'package:graphql/client.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/admin/orders/__generated/admin_orders.graphql.dart';
import 'package:mezcalmos/Shared/models/Orders/DeliveryOrder/utilities/DeliveryOrderStatus.dart';
import 'package:mezcalmos/Shared/models/Orders/Minimal/MinimalOrder.dart';
import 'package:mezcalmos/Shared/models/Orders/Minimal/MinimalOrderStatus.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServiceProviderType.dart';

HasuraDb _hasuraDb = Get.find<HasuraDb>();

Future<List<MinimalOrder>?> get_admin__orders({
  required bool inProcess,
  required ServiceProviderType serviceProviderType,
}) async {
  final QueryResult<Query$admin_get__orders> queryResult = await _hasuraDb
      .graphQLClient
      .query$admin_get__orders(Options$Query$admin_get__orders(
          variables: Variables$Query$admin_get__orders(
              inProccess: inProcess,
              serviceProviderType:
                  serviceProviderType.toFirebaseFormatString())));

  if (queryResult.parsedData?.delivery_order != null) {
    final List<Query$admin_get__orders$delivery_order> ordersData =
        queryResult.parsedData!.delivery_order;

    final List<MinimalOrder> orders =
        ordersData.map((Query$admin_get__orders$delivery_order orderData) {
      return MinimalOrder(
          id: orderData.id,
          toAdress: orderData.dropoff_address,
          orderTime: DateTime.parse(orderData.order_time),
          customerName: orderData.customer.user.name!,
          customerImage: orderData.customer.user.image,
          status:
              orderData.status.toDeliveryOrderStatus().toMinimalOrderStatus(),
          totalCost: orderData.package_cost);
    }).toList();
    return orders;
  } else {
    throw Exception(
        "🚨 Getting min orders exceptions \n ${queryResult.exception}");
  }
}

Stream<List<MinimalOrder>?> listen_on_admin_orders({
  required bool inProcess,
  required ServiceProviderType serviceProviderType,
}) {
  return _hasuraDb.graphQLClient
      .subscribe$admin_listen_on_orders(
    Options$Subscription$admin_listen_on_orders(
      fetchPolicy: FetchPolicy.noCache,
      variables: Variables$Subscription$admin_listen_on_orders(
          inProccess: inProcess,
          serviceProviderType: serviceProviderType.toFirebaseFormatString()),
    ),
  )
      .map<List<MinimalOrder>?>(
          (QueryResult<Subscription$admin_listen_on_orders> event) {
    final List<Subscription$admin_listen_on_orders$delivery_order>? ordersData =
        event.parsedData?.delivery_order;
    if (ordersData != null) {
      final List<MinimalOrder> orders = ordersData
          .map((Subscription$admin_listen_on_orders$delivery_order orderData) {
        return MinimalOrder(
            id: orderData.id,
            toAdress: orderData.dropoff_address,
            orderTime: DateTime.parse(orderData.order_time),
            customerName: orderData.customer.user.name!,
            customerImage: orderData.customer.user.image,
            status:
                orderData.status.toDeliveryOrderStatus().toMinimalOrderStatus(),
            totalCost: orderData.package_cost);
      }).toList();
      return orders;
    }
    return null;
  });
}
