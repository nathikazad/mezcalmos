import 'package:get/get.dart';
import 'package:graphql/client.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/admin/orders/__generated/admin_orders.graphql.dart';
import 'package:mezcalmos/Shared/models/Orders/DeliveryOrder/utilities/DeliveryOrderStatus.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';
import 'package:mezcalmos/Shared/models/Orders/Minimal/MinimalOrder.dart';
import 'package:mezcalmos/Shared/models/Orders/Minimal/MinimalOrderStatus.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServiceProviderType.dart';

HasuraDb _hasuraDb = Get.find<HasuraDb>();

Future<List<MinimalOrder>?> get_admin_dv_orders({
  required bool inProcess,
  bool withCache = true,
}) async {
  final QueryResult<Query$admin_get_dv_orders> queryResult = await _hasuraDb
      .graphQLClient
      .query$admin_get_dv_orders(Options$Query$admin_get_dv_orders(
          fetchPolicy:
              withCache ? FetchPolicy.cacheAndNetwork : FetchPolicy.noCache,
          variables: Variables$Query$admin_get_dv_orders(
            inProccess: inProcess,
          )));

  if (queryResult.parsedData?.delivery_order != null) {
    final List<Query$admin_get_dv_orders$delivery_order> ordersData =
        queryResult.parsedData!.delivery_order;

    final List<MinimalOrder> orders =
        ordersData.map((Query$admin_get_dv_orders$delivery_order orderData) {
      return MinimalOrder(
          id: orderData.id,
          orderType: orderData.order_type.toOrderType(),
          serviceProviderId: orderData.service_provider_id,
          serviceProviderType: orderData.service_provider_type
              .toString()
              .toServiceProviderType(),
          toAdress: orderData.dropoff_address,
          orderTime: DateTime.parse(orderData.order_time),
          title: orderData.customer.user.name!,
          image: orderData.customer.user.image,
          deliveryCost: orderData.delivery_cost,
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

Stream<List<MinimalOrder>?> listen_on_admin_dv_orders({
  required bool inProcess,
}) {
  return _hasuraDb.graphQLClient
      .subscribe$admin_listen_on_dv_orders(
    Options$Subscription$admin_listen_on_dv_orders(
      fetchPolicy: FetchPolicy.noCache,
      variables: Variables$Subscription$admin_listen_on_dv_orders(
        inProccess: inProcess,
      ),
    ),
  )
      .map<List<MinimalOrder>?>(
          (QueryResult<Subscription$admin_listen_on_dv_orders> event) {
    final List<Subscription$admin_listen_on_dv_orders$delivery_order>?
        ordersData = event.parsedData?.delivery_order;
    if (ordersData != null) {
      final List<MinimalOrder> orders = ordersData.map(
          (Subscription$admin_listen_on_dv_orders$delivery_order orderData) {
        return MinimalOrder(
            id: orderData.id,
            orderType: orderData.order_type.toOrderType(),
            serviceProviderId: orderData.service_provider_id,
            serviceProviderType: orderData.service_provider_type
                .toString()
                .toServiceProviderType(),
            toAdress: orderData.dropoff_address,
            orderTime: DateTime.parse(orderData.order_time),
            title: orderData.customer.user.name!,
            deliveryCost: orderData.delivery_cost,
            image: orderData.customer.user.image,
            status:
                orderData.status.toDeliveryOrderStatus().toMinimalOrderStatus(),
            totalCost: orderData.package_cost);
      }).toList();
      return orders;
    }
    return null;
  });
}

Future<List<MinimalOrder>?> get_admin_restaurant_orders({
  required bool inProcess,
  bool withCache = true,
}) async {
  final QueryResult<Query$admin_get_restaurant_orders> queryResult =
      await _hasuraDb.graphQLClient.query$admin_get_restaurant_orders(
          Options$Query$admin_get_restaurant_orders(
              fetchPolicy:
                  withCache ? FetchPolicy.cacheAndNetwork : FetchPolicy.noCache,
              variables: Variables$Query$admin_get_restaurant_orders(
                inProccess: inProcess,
              )));

  if (queryResult.parsedData?.restaurant_order != null) {
    final List<Query$admin_get_restaurant_orders$restaurant_order> ordersData =
        queryResult.parsedData!.restaurant_order;

    final List<MinimalOrder> orders = ordersData
        .map((Query$admin_get_restaurant_orders$restaurant_order orderData) {
      return MinimalOrder(
          id: orderData.id,
          orderType: OrderType.Restaurant,
          serviceProviderId: orderData.restaurant_id,
          serviceProviderType: ServiceProviderType.Restaurant,
          toAdress: orderData.to_location_address,
          orderTime: DateTime.parse(orderData.order_time),
          title: orderData.customer.user.name!,
          image: orderData.customer.user.image,
          deliveryCost: orderData.delivery?.delivery_cost,
          status:
              orderData.status.toRestaurantOrderStatus().toMinimalOrderStatus(),
          totalCost: orderData.total_cost!);
    }).toList();
    return orders;
  } else {
    throw Exception(
        "🚨 Getting min orders exceptions \n ${queryResult.exception}");
  }
}

Stream<List<MinimalOrder>?> listen_on_admin_restaurant_orders({
  required bool inProcess,
}) {
  return _hasuraDb.graphQLClient
      .subscribe$admin_listen_on_restaurant_orders(
    Options$Subscription$admin_listen_on_restaurant_orders(
      fetchPolicy: FetchPolicy.noCache,
      variables: Variables$Subscription$admin_listen_on_restaurant_orders(
        inProccess: inProcess,
      ),
    ),
  )
      .map<List<MinimalOrder>?>(
          (QueryResult<Subscription$admin_listen_on_restaurant_orders> event) {
    final List<Subscription$admin_listen_on_restaurant_orders$restaurant_order>?
        ordersData = event.parsedData?.restaurant_order;
    if (ordersData != null) {
      final List<MinimalOrder> orders = ordersData.map(
          (Subscription$admin_listen_on_restaurant_orders$restaurant_order
              orderData) {
        return MinimalOrder(
            id: orderData.id,
            orderType: OrderType.Restaurant,
            serviceProviderId: orderData.restaurant_id,
            serviceProviderType: ServiceProviderType.Restaurant,
            toAdress: orderData.to_location_address,
            orderTime: DateTime.parse(orderData.order_time),
            deliveryCost: orderData.delivery?.delivery_cost,
            title: orderData.customer.user.name!,
            image: orderData.customer.user.image,
            status: orderData.status
                .toRestaurantOrderStatus()
                .toMinimalOrderStatus(),
            totalCost: orderData.total_cost!);
      }).toList();
      return orders;
    }
    return null;
  });
}

Future<List<MinimalOrder>?> get_admin_laundry_orders({
  required bool inProcess,
  bool withCache = true,
}) async {
  final QueryResult<Query$admin_get_laundry_orders> queryResult =
      await _hasuraDb.graphQLClient.query$admin_get_laundry_orders(
          Options$Query$admin_get_laundry_orders(
              fetchPolicy:
                  withCache ? FetchPolicy.cacheAndNetwork : FetchPolicy.noCache,
              variables: Variables$Query$admin_get_laundry_orders(
                inProccess: inProcess,
              )));

  if (queryResult.parsedData?.laundry_order != null) {
    final List<Query$admin_get_laundry_orders$laundry_order> ordersData =
        queryResult.parsedData!.laundry_order;

    final List<MinimalOrder> orders = ordersData
        .map((Query$admin_get_laundry_orders$laundry_order orderData) {
      return MinimalOrder(
          id: orderData.id,
          orderType: OrderType.Laundry,
          serviceProviderId: orderData.store_id,
          serviceProviderType: ServiceProviderType.Laundry,
          toAdress: orderData.customer_address,
          orderTime: DateTime.parse(orderData.order_time),
          title: orderData.customer.user.name!,
          image: orderData.customer.user.image,
          deliveryCost: orderData.to_customer_delivery?.delivery_cost ??
              orderData.from_customer_delivery?.delivery_cost,
          status:
              orderData.status.toLaundryOrderStatus().toMinimalOrderStatus(),
          totalCost: orderData.total_cost!);
    }).toList();
    return orders;
  } else {
    throw Exception(
        "🚨 Getting min orders exceptions \n ${queryResult.exception}");
  }
}

Stream<List<MinimalOrder>?> listen_on_admin_laundry_orders({
  required bool inProcess,
}) {
  return _hasuraDb.graphQLClient
      .subscribe$admin_listen_on_laundry_orders(
    Options$Subscription$admin_listen_on_laundry_orders(
      fetchPolicy: FetchPolicy.noCache,
      variables: Variables$Subscription$admin_listen_on_laundry_orders(
        inProccess: inProcess,
      ),
    ),
  )
      .map<List<MinimalOrder>?>(
          (QueryResult<Subscription$admin_listen_on_laundry_orders> event) {
    final List<Subscription$admin_listen_on_laundry_orders$laundry_order>?
        ordersData = event.parsedData?.laundry_order;
    if (ordersData != null) {
      final List<MinimalOrder> orders = ordersData.map(
          (Subscription$admin_listen_on_laundry_orders$laundry_order
              orderData) {
        return MinimalOrder(
            id: orderData.id,
            orderType: OrderType.Laundry,
            serviceProviderId: orderData.store_id,
            serviceProviderType: ServiceProviderType.Restaurant,
            toAdress: orderData.customer_address,
            orderTime: DateTime.parse(orderData.order_time),
            title: orderData.customer.user.name!,
            deliveryCost: orderData.to_customer_delivery?.delivery_cost ??
                orderData.from_customer_delivery?.delivery_cost,
            image: orderData.customer.user.image,
            status:
                orderData.status.toLaundryOrderStatus().toMinimalOrderStatus(),
            totalCost: orderData.total_cost!);
      }).toList();
      return orders;
    }
    return null;
  });
}

Future<List<MinimalOrder>?> get_admin_service__orders({
  required bool inProcess,
  required int serviceProviderId,
  required int limit,
  required ServiceProviderType serviceProviderType,
}) async {
  final QueryResult<Query$admin_get_service__orders> queryResult =
      await _hasuraDb.graphQLClient.query$admin_get_service__orders(
          Options$Query$admin_get_service__orders(
              variables: Variables$Query$admin_get_service__orders(
                  inProccess: inProcess,
                  limit: limit,
                  serviceProviderId: serviceProviderId,
                  serviceProviderType:
                      serviceProviderType.toFirebaseFormatString())));

  if (queryResult.parsedData?.delivery_order != null) {
    final List<Query$admin_get_service__orders$delivery_order> ordersData =
        queryResult.parsedData!.delivery_order;

    final List<MinimalOrder> orders = ordersData
        .map((Query$admin_get_service__orders$delivery_order orderData) {
      return MinimalOrder(
          id: orderData.id,
          orderType: orderData.order_type.toOrderType(),
          serviceProviderId: orderData.service_provider_id,
          serviceProviderType: orderData.service_provider_type
              .toString()
              .toServiceProviderType(),
          toAdress: orderData.dropoff_address,
          orderTime: DateTime.parse(orderData.order_time),
          title: orderData.customer.user.name!,
          image: orderData.customer.user.image,
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
