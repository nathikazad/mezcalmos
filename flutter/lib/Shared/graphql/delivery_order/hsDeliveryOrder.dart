import 'package:get/get.dart';
import 'package:graphql/client.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/delivery_order/__generated/delivery_order.graphql.dart';
import 'package:mezcalmos/Shared/models/Orders/Minimal/MinimalOrder.dart';
import 'package:mezcalmos/Shared/models/Orders/Minimal/MinimalOrderStatus.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';

HasuraDb _hasuraDb = Get.find<HasuraDb>();

Stream<List<MinimalOrder>?> listen_on_current_driver_orders(
    {required int driverId}) {
  return _hasuraDb.graphQLClient
      .subscribe$listen_on_inprocess_driver_orders(
    Options$Subscription$listen_on_inprocess_driver_orders(
      fetchPolicy: FetchPolicy.noCache,
      variables: Variables$Subscription$listen_on_inprocess_driver_orders(
          driverId: driverId),
    ),
  )
      .map<List<MinimalOrder>?>(
          (QueryResult<Subscription$listen_on_inprocess_driver_orders> event) {
    final List<Subscription$listen_on_inprocess_driver_orders$delivery_order>?
        ordersData = event.parsedData?.delivery_order;
    if (ordersData != null) {
      final List<MinimalOrder> orders = ordersData.map(
          (Subscription$listen_on_inprocess_driver_orders$delivery_order
              orderData) {
        return MinimalOrder(
            id: orderData.id,
            toAdress: orderData.dropoff_address,
            orderTime: DateTime.parse(orderData.order_time),
            customerName: orderData.customer.user.name!,
            customerImage: orderData.customer.user.image,
            status: orderData.status
                .toRestaurantOrderStatus()
                .toMinimalOrderStatus(),
            totalCost: orderData.package_cost);
      }).toList();
      return orders;
    }
    return null;
  });
}

Future<List<MinimalOrder>?> get_current_driver_orders(
    {required int driverId}) async {
  final QueryResult<Query$get_inprocess_driver_orders> queryResult =
      await _hasuraDb.graphQLClient.query$get_inprocess_driver_orders(
    Options$Query$get_inprocess_driver_orders(
      fetchPolicy: FetchPolicy.networkOnly,
      variables:
          Variables$Query$get_inprocess_driver_orders(driverId: driverId),
    ),
  );
  if (queryResult.parsedData?.delivery_order != null) {
    final List<Query$get_inprocess_driver_orders$delivery_order> ordersData =
        queryResult.parsedData!.delivery_order;

    final List<MinimalOrder> orders = ordersData
        .map((Query$get_inprocess_driver_orders$delivery_order orderData) {
      return MinimalOrder(
          id: orderData.id,
          toAdress: orderData.dropoff_address,
          orderTime: DateTime.parse(orderData.order_time),
          customerName: orderData.customer.user.name!,
          customerImage: orderData.customer.user.image,
          status:
              orderData.status.toRestaurantOrderStatus().toMinimalOrderStatus(),
          totalCost: orderData.package_cost);
    }).toList();
    return orders;
  } else {
    throw Exception(
        "🚨 Getting min orders exceptions \n ${queryResult.exception}");
  }
}

Future<List<MinimalOrder>?> get_past_driver_orders(
    {required int driverId}) async {
  final QueryResult<Query$get_past_driver_orders> queryResult =
      await _hasuraDb.graphQLClient.query$get_past_driver_orders(
    Options$Query$get_past_driver_orders(
      fetchPolicy: FetchPolicy.networkOnly,
      variables: Variables$Query$get_past_driver_orders(driverId: driverId),
    ),
  );
  if (queryResult.parsedData?.delivery_order != null) {
    final List<Query$get_past_driver_orders$delivery_order> ordersData =
        queryResult.parsedData!.delivery_order;

    final List<MinimalOrder> orders =
        ordersData.map((Query$get_past_driver_orders$delivery_order orderData) {
      return MinimalOrder(
          id: orderData.id,
          toAdress: orderData.dropoff_address,
          orderTime: DateTime.parse(orderData.order_time),
          customerName: orderData.customer.user.name!,
          customerImage: orderData.customer.user.image,
          status:
              orderData.status.toRestaurantOrderStatus().toMinimalOrderStatus(),
          totalCost: orderData.package_cost);
    }).toList();
    return orders;
  } else {
    throw Exception(
        "🚨 Getting min orders exceptions \n ${queryResult.exception}");
  }
}
