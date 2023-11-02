import 'package:get/get.dart';
import 'package:graphql/client.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/__generated/schema.graphql.dart';
import 'package:mezcalmos/Shared/graphql/taxi/order/__generated/taxi_order.graphql.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/Minimal/MinimalOrder.dart';
import 'package:mezcalmos/Shared/models/Orders/Minimal/MinimalOrderStatus.dart';

HasuraDb _hasuraDb = Get.find<HasuraDb>();

Future<List<MinimalOrder>?> get_taxi_delivery_minimal_orders({
  required MinimalDeliveryOrderStatus status,
  bool forCompany = false,
  int? driverId,
  required int limit,
  required int offset,
}) async {
  final QueryResult<Query$GetTaxiMinimalDeliveryOrders> res =
      await _hasuraDb.graphQLClient.query$GetTaxiMinimalDeliveryOrders(
          Options$Query$GetTaxiMinimalDeliveryOrders(
              fetchPolicy: FetchPolicy.networkOnly,
              variables: Variables$Query$GetTaxiMinimalDeliveryOrders(
                  driver_id: (driverId == null && forCompany == true)
                      ? Input$Int_comparison_exp($_is_null: false)
                      : (driverId == null)
                          ? Input$Int_comparison_exp($_is_null: true)
                          : Input$Int_comparison_exp(
                              $_eq: driverId,
                            ),
                  status: status.toFirebaseFormatString(),
                  limit: limit,
                  offset: offset)));
  if (res.hasException) {
    throwError(res.exception);
  }

  return res.parsedData?.taxi_order
      .map<MinimalOrder>(
          (Query$GetTaxiMinimalDeliveryOrders$taxi_order e) => MinimalOrder(
                id: e.id,
                toAdress: e.dropoff_address,
                orderTime: DateTime.parse(e.order_time),
                title: e.customer!.user.name,
                image: e.customer!.user.image,
                status: e.status
                    .toString()
                    .toMinimalDeliveryOrderStatus()
                    .toMinimalOrderStatus(),
                totalCost: e.ride_cost,
                orderType: OrderType.Taxi,
              ))
      .toList();
}

Stream<List<MinimalOrder>?> listen_taxi_delivery_minimal_orders({
  required MinimalDeliveryOrderStatus status,
  int? driverId,
  bool forCompany = false,
  required int limit,
  required int offset,
}) {
  return _hasuraDb.graphQLClient
      .subscribe$ListenTaxiMinimalDeliveryOrders(
          Options$Subscription$ListenTaxiMinimalDeliveryOrders(
              fetchPolicy: FetchPolicy.networkOnly,
              variables: Variables$Subscription$ListenTaxiMinimalDeliveryOrders(
                  driver_id: (driverId == null && forCompany == true)
                      ? Input$Int_comparison_exp($_is_null: false)
                      : (driverId == null)
                          ? Input$Int_comparison_exp($_is_null: true)
                          : Input$Int_comparison_exp(
                              $_eq: driverId,
                            ),
                  status: status.toFirebaseFormatString(),
                  limit: limit,
                  offset: offset)))
      .map<List<MinimalOrder>?>(
          (QueryResult<Subscription$ListenTaxiMinimalDeliveryOrders> res) {
    if (res.hasException) {
      throwError(res.exception);
    }

    return res.parsedData?.taxi_order
        .map<MinimalOrder>(
            (Subscription$ListenTaxiMinimalDeliveryOrders$taxi_order e) =>
                MinimalOrder(
                  id: e.id,
                  toAdress: e.dropoff_address,
                  orderTime: DateTime.parse(e.order_time),
                  title: e.customer!.user.name,
                  image: e.customer!.user.image,
                  status: e.status
                      .toString()
                      .toMinimalDeliveryOrderStatus()
                      .toMinimalOrderStatus(),
                  totalCost: e.ride_cost,
                  orderType: OrderType.Taxi,
                ))
        .toList();
  });
}
