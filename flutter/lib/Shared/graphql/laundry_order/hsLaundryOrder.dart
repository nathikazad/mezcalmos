import 'package:get/get.dart';
import 'package:graphql/client.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/hasuraTypes.dart';
import 'package:mezcalmos/Shared/graphql/laundry_order/__generated/laundry_order.graphql.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';
import 'package:mezcalmos/Shared/models/Orders/Minimal/MinimalOrder.dart';
import 'package:mezcalmos/Shared/models/Orders/Minimal/MinimalOrderStatus.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/User.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';
import 'package:mezcalmos/Shared/models/Utilities/PaymentInfo.dart';

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
            orderType: OrderType.Laundry,
            toAdress: orderData.customer_address,
            orderTime: DateTime.parse(orderData.order_time),
            title: orderData.customer.user.name!,
            image: orderData.customer.user.image,
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
          orderType: OrderType.Laundry,
          toAdress: orderData.customer_address,
          orderTime: DateTime.parse(orderData.order_time),
          title: orderData.customer.user.name!,
          image: orderData.customer.user.image,
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

Future<LaundryOrder?> get_laundry_order_by_id(
    {required int orderId, bool withCache = true}) async {
  QueryResult<Query$get_laundry_order_by_id> res = await _hasuraDb.graphQLClient
      .query$get_laundry_order_by_id(Options$Query$get_laundry_order_by_id(
          fetchPolicy:
              withCache ? FetchPolicy.cacheAndNetwork : FetchPolicy.noCache,
          variables:
              Variables$Query$get_laundry_order_by_id(orderId: orderId)));
  if (res.parsedData?.laundry_order_by_pk == null) {
    throwError(res.exception);
  }
  Query$get_laundry_order_by_id$laundry_order_by_pk orderData =
      res.parsedData!.laundry_order_by_pk!;
  return LaundryOrder(
      orderId: orderData.id,
      costsByType: LaundryOrderCosts(
          lineItems: orderData.categories
              .map((Query$get_laundry_order_by_id$laundry_order_by_pk$categories
                      cat) =>
                  LaundryOrderCostLineItem(
                      cost: cat.category.cost_by_kilo * cat.weight_in_kilo!,
                      id: cat.category_id,
                      name: toLanguageMap(
                          translations: cat.category.name.translations),
                      weight: cat.weight_in_kilo!))
              .toList()),
      cost: 0,
      to: Location.fromHasura(
          orderData.customer_location_gps!, orderData.customer_address),
      orderTime: DateTime.parse(orderData.order_time),
      paymentType: orderData.payment_type.toPaymentType(),
      status: orderData.status.toLaundryOrderStatus(),
      customer: UserInfo(
        hasuraId: orderData.customer_id,
        name: orderData.customer.user.name,
        image: orderData.customer.user.image,
      ),
      laundry: ServiceInfo(
          location: Location.fromHasura(
              orderData.store.location.gps, orderData.store.location.address),
          hasuraId: orderData.store_id,
          image: orderData.store.image,
          name: orderData.store.name),
      shippingCost: orderData.delivery_cost,
      chatId: orderData.chat_id!);
}

Stream<LaundryOrder?> listen_on_laundry_order_by_id({
  required int orderId,
}) {
  return _hasuraDb.graphQLClient
      .subscribe$liston_on_laundry_order_by_id(
          Options$Subscription$liston_on_laundry_order_by_id(
              variables: Variables$Subscription$liston_on_laundry_order_by_id(
                  orderId: orderId)))
      .map<LaundryOrder?>(
          (QueryResult<Subscription$liston_on_laundry_order_by_id> event) {
    if (event.parsedData?.laundry_order_by_pk == null) {
      throwError(event.exception);
    } else {
      Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk orderData =
          event.parsedData!.laundry_order_by_pk!;
      return LaundryOrder(
          orderId: orderData.id,
          cost: 0,
          costsByType: LaundryOrderCosts(
              lineItems: orderData.categories
                  .map(
                      (Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories
                              cat) =>
                          LaundryOrderCostLineItem(
                              cost: cat.category.cost_by_kilo *
                                  cat.weight_in_kilo!,
                              id: cat.category_id,
                              name: toLanguageMap(
                                  translations: cat.category.name.translations),
                              weight: cat.weight_in_kilo!))
                  .toList()),
          to: Location.fromHasura(
              orderData.customer_location_gps!, orderData.customer_address),
          orderTime: DateTime.parse(orderData.order_time),
          paymentType: orderData.payment_type.toPaymentType(),
          status: orderData.status.toLaundryOrderStatus(),
          customer: UserInfo(
            hasuraId: orderData.customer_id,
            name: orderData.customer.user.name,
            image: orderData.customer.user.image,
          ),
          laundry: ServiceInfo(
              location: Location.fromHasura(orderData.store.location.gps,
                  orderData.store.location.address),
              hasuraId: orderData.store_id,
              image: orderData.store.image,
              name: orderData.store.name),
          shippingCost: orderData.delivery_cost,
          chatId: orderData.chat_id!);
    }
    return null;
  });
  //////
}
