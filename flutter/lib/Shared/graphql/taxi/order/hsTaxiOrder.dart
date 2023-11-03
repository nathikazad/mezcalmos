import 'package:get/get.dart';
import 'package:graphql/client.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart' as cm;
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/__generated/schema.graphql.dart';
import 'package:mezcalmos/Shared/graphql/taxi/order/__generated/taxi_order.graphql.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/thirdParty/MapHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder/TaxiOrder.dart';
import 'package:mezcalmos/Shared/models/User.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';

HasuraDb _hasuraDb = Get.find<HasuraDb>();

Future<List<TaxiOrder>?> get_taxi_delivery_minimal_orders({
  required cm.MinimalDeliveryOrderStatus status,
  int? driverId,
  required int limit,
  required int offset,
}) async {
  mezDbgPrint(
      "👋 fetch taxi order with status : ${status.toFirebaseFormatString()} &&&&& driver id : $driverId");
  final QueryResult<Query$GetTaxiMinimalDeliveryOrders> res =
      await _hasuraDb.graphQLClient.query$GetTaxiMinimalDeliveryOrders(
          Options$Query$GetTaxiMinimalDeliveryOrders(
              fetchPolicy: FetchPolicy.networkOnly,
              variables: Variables$Query$GetTaxiMinimalDeliveryOrders(
                  driver_id: (driverId == null)
                      ? Input$Int_comparison_exp($_is_null: false)
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
      .map<TaxiOrder>((Query$GetTaxiMinimalDeliveryOrders$taxi_order data) =>
          TaxiOrder(
              id: data.id,
              status: data.status.toMinimalDeliveryOrderStatus(),
              pickupLocation: MezLocation.fromHasura(data.pickup_gps,
                  data.pickup_address),
              dropoffLocation:
                  MezLocation
                      .fromHasura(data.dropoff_gps, data.dropoff_address),
              customer:
                  UserInfo(
                      hasuraId: data.customer!.user.id,
                      name: data.customer!.user.name,
                      image: data.customer!.user.image),
              rideCost: data.ride_cost,
              orderTime: DateTime.parse(data.order_time),
              carType: data.car_type.toTaxiCarType(),
              routeInformation: RouteInformation(
                  duration: RideDuration(
                      data.trip_duration.toString(), data.trip_duration),
                  distance: RideDistance(
                      data.trip_distance.toString(), data.trip_distance),
                  polyline: data.trip_polyline)))
      .toList();
}

Stream<List<TaxiOrder>?> listen_taxi_delivery_minimal_orders({
  required cm.MinimalDeliveryOrderStatus status,
  int? driverId,
  required int limit,
  required int offset,
}) {
  return _hasuraDb.graphQLClient
      .subscribe$ListenTaxiMinimalDeliveryOrders(
          Options$Subscription$ListenTaxiMinimalDeliveryOrders(
              fetchPolicy: FetchPolicy.networkOnly,
              variables: Variables$Subscription$ListenTaxiMinimalDeliveryOrders(
                  driver_id: (driverId == null)
                      ? Input$Int_comparison_exp($_is_null: true)
                      : Input$Int_comparison_exp(
                          $_eq: driverId,
                        ),
                  status: status.toFirebaseFormatString(),
                  limit: limit,
                  offset: offset)))
      .map<List<TaxiOrder>?>(
          (QueryResult<Subscription$ListenTaxiMinimalDeliveryOrders> res) {
    if (res.hasException) {
      throwError(res.exception);
    }

    return res.parsedData?.taxi_order
        .map<TaxiOrder>((Subscription$ListenTaxiMinimalDeliveryOrders$taxi_order
                data) =>
            TaxiOrder(
                id: data.id,
                status: data.status.toMinimalDeliveryOrderStatus(),
                pickupLocation: MezLocation.fromHasura(
                    data.pickup_gps, data.pickup_address),
                dropoffLocation: MezLocation.fromHasura(
                    data.dropoff_gps, data.dropoff_address),
                customer: UserInfo(
                    hasuraId: data.customer!.user.id,
                    name: data.customer!.user.name,
                    image: data.customer!.user.image),
                rideCost: data.ride_cost,
                orderTime: DateTime.parse(data.order_time),
                carType: data.car_type.toTaxiCarType(),
                routeInformation: RouteInformation(
                    duration: RideDuration(
                        data.trip_duration.toString(), data.trip_duration),
                    distance: RideDistance(
                        data.trip_distance.toString(), data.trip_distance),
                    polyline: data.trip_polyline)))
        .toList();
  });
}

Future<TaxiOrder?> get_taxi_order_by_id(
    {required int orderId, bool withCache = true}) async {
  final QueryResult<Query$get_taxi_order> res = await _hasuraDb.graphQLClient
      .query$get_taxi_order(Options$Query$get_taxi_order(
          fetchPolicy: withCache ? null : FetchPolicy.networkOnly,
          variables: Variables$Query$get_taxi_order(orderId: orderId)));
  if (res.hasException) {
    throwError(res.exception);
  }
  if (res.parsedData?.taxi_order_by_pk != null) {
    final Query$get_taxi_order$taxi_order_by_pk data =
        res.parsedData!.taxi_order_by_pk!;
    return TaxiOrder(
        id: data.id,
        status: data.status.toMinimalDeliveryOrderStatus(),
        pickupLocation:
            MezLocation.fromHasura(data.pickup_gps, data.pickup_address),
        dropoffLocation:
            MezLocation.fromHasura(data.dropoff_gps, data.dropoff_address),
        customer: UserInfo(
            hasuraId: data.customer!.user.id,
            name: data.customer!.user.name,
            phoneNumber: data.customer!.user.phone,
            image: data.customer!.user.image),
        driver: (data.driver == null)
            ? null
            : UserInfo(
                hasuraId: data.driver!.user!.id,
                name: data.driver!.user!.name,
                image: data.driver!.user!.image),
        rideCost: data.ride_cost,
        orderTime: DateTime.parse(data.order_time),
        carType: data.car_type.toTaxiCarType(),
        routeInformation: RouteInformation(
            duration:
                RideDuration(data.trip_duration.toString(), data.trip_duration),
            distance:
                RideDistance(data.trip_distance.toString(), data.trip_distance),
            polyline: data.trip_polyline));
  }

  return null;
}

Stream<UserInfo?> listen_on_taxi_order_driver({required int orderId}) {
  return _hasuraDb.graphQLClient
      .subscribe$listen_taxi_order_driver(
    Options$Subscription$listen_taxi_order_driver(
      fetchPolicy: FetchPolicy.noCache,
      variables: Variables$Subscription$listen_taxi_order_driver(
        orderId: orderId,
      ),
    ),
  )
      .map<UserInfo?>(
          (QueryResult<Subscription$listen_taxi_order_driver> event) {
    if (event.parsedData?.taxi_order_by_pk?.driver != null) {
      final Subscription$listen_taxi_order_driver$taxi_order_by_pk? orderData =
          event.parsedData!.taxi_order_by_pk;
      return UserInfo(
        hasuraId: orderData!.driver!.user!.id,
        name: orderData.driver!.user!.name,
        phoneNumber: orderData.driver!.user!.phone,
        image: orderData.driver!.user!.image,
      );
    }
    return null;
  });
}
