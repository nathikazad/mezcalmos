import 'package:get/get.dart';
import 'package:graphql/client.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/laundry_order/__generated/laundry_order.graphql.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';
import 'package:mezcalmos/Shared/models/Orders/Minimal/MinimalOrder.dart';
import 'package:mezcalmos/Shared/models/Orders/Minimal/MinimalOrderStatus.dart';

HasuraDb _hasuraDb = Get.find<HasuraDb>();
Stream<List<MinimalOrder>?> listen_on_laundry_orders(
    {required int laundryStoreID, required bool inProcess}) {
  return _hasuraDb.graphQLClient
      .subscribe$listen_on_laundry_orders(
    Options$Subscription$listen_on_laundry_orders(
      fetchPolicy: FetchPolicy.noCache,
      variables: Variables$Subscription$listen_on_laundry_orders(
          laundryStoreId: laundryStoreID, inProcess: inProcess),
    ),
  )
      .map<List<MinimalOrder>?>(
          (QueryResult<Subscription$listen_on_laundry_orders> event) {
    List<Subscription$listen_on_laundry_orders$laundry_order>? ordersData =
        event.parsedData?.laundry_order;
    if (ordersData != null) {
      final List<MinimalOrder> orders = ordersData
          .map((Subscription$listen_on_laundry_orders$laundry_order orderData) {
        return MinimalOrder(
            id: orderData.id,
            toAdress: orderData.customer_address,
            orderTime: DateTime.parse(orderData.order_time),
            customerName: orderData.customer.user.name!,
            customerImage: orderData.customer.user.image,
            status:
                orderData.status.toLaundryOrderStatus().toMinimalOrderStatus(),
            totalCost: null);
      }).toList();
      return orders;
    }
    return null;
  });
}

Future<List<MinimalOrder>?> get_laundry_orders(
    {required int laundryStoreID, required bool inProcess}) async {
  final QueryResult<Query$get_laundry_orders> queryResult =
      await _hasuraDb.graphQLClient.query$get_laundry_orders(
    Options$Query$get_laundry_orders(
      fetchPolicy: FetchPolicy.networkOnly,
      variables: Variables$Query$get_laundry_orders(
          laundryStoreId: laundryStoreID, inProcess: inProcess),
    ),
  );
  if (queryResult.parsedData?.laundry_order != null) {
    List<Query$get_laundry_orders$laundry_order> ordersData =
        queryResult.parsedData!.laundry_order;

    final List<MinimalOrder> orders =
        ordersData.map((Query$get_laundry_orders$laundry_order orderData) {
      return MinimalOrder(
          id: orderData.id,
          toAdress: orderData.customer_address,
          orderTime: DateTime.parse(orderData.order_time),
          customerName: orderData.customer.user.name!,
          customerImage: orderData.customer.user.image,
          status:
              orderData.status.toLaundryOrderStatus().toMinimalOrderStatus(),
          totalCost: null);
    }).toList();
    return orders;
  } else {
    throw Exception(
        "🚨 Getting min orders exceptions \n ${queryResult.exception}");
  }
}
