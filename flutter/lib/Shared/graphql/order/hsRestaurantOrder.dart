import 'package:get/get.dart';
import 'package:graphql/client.dart';
import 'package:mezcalmos/CustomerApp/models/Customer.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/hasuraTypes.dart';
import 'package:mezcalmos/Shared/graphql/order/__generated/restaurant_order.graphql.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/Minimal/MinimalRestaurantOrder.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/models/User.dart';
import 'package:mezcalmos/Shared/models/Utilities/DeliveryMode.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';
import 'package:mezcalmos/Shared/models/Utilities/PaymentInfo.dart';

HasuraDb _hasuraDb = Get.find<HasuraDb>();

Stream<RestaurantOrder?> listen_on_restaurant_order_by_id(
    {required int orderId}) {
  return _hasuraDb.graphQLClient
      .subscribe$listen_on_restaurant_order_by_id(
    Options$Subscription$listen_on_restaurant_order_by_id(
      variables: Variables$Subscription$listen_on_restaurant_order_by_id(
        order_id: orderId,
      ),
    ),
  )
      .map<RestaurantOrder?>(
          (QueryResult<Subscription$listen_on_restaurant_order_by_id> event) {
    mezDbgPrint("Event from hs restaurant order 🚀🚀🚀 $event");
    final List<RestaurantOrderItem> items = [];

    final Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk?
        orderData = event.parsedData?.restaurant_order_by_pk;
    if (orderData != null) {
      orderData.items.forEach(
          (Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items
              item) {
        items.add(
          RestaurantOrderItem(
            costPerOne: item.cost_per_one,
            idInCart: item.id,
            idInRestaurant: item.restaurant_item.category_id!,
            name: toLanguageMap(
                translations: item.restaurant_item.name.translations),
            image: '',
            quantity: item.quantity,
            totalCost: item.cost_per_one,
          ),
        );
      });
      final RestaurantOrder res = RestaurantOrder(
        chatId: orderData.chat_id,
        orderId: orderData.id,
        notes: orderData.notes.toString(),
        status: orderData.status.toRestaurantOrderStatus(),
        quantity: 1,
        serviceProviderId: orderData.restaurant.id,
        paymentType: orderData.payment_type.toPaymentType(),
        orderTime: DateTime.parse(orderData.order_time),
        cost: orderData.delivery_cost,
        restaurant: ServiceInfo(
          location: Location(
            orderData.restaurant.location_text,
            orderData.restaurant.location_gps.toLocationData(),
          ),
          firebaseId: orderData.restaurant.firebase_id,
          hasuraId: orderData.restaurant.id,
          image: orderData.restaurant.image,
          name: orderData.restaurant.name,
        ),
        customer: UserInfo(
            hasuraId: orderData.customer.user.id,
            image: orderData.customer.user.image,
            name: orderData.customer.user.name),
        to: Location(orderData.to_location_address!,
            orderData.to_location_gps!.toLocationData()),
        itemsCost: orderData.items_cost ?? 0,
        shippingCost: orderData.delivery_cost,
        deliveryMode: DeliveryMode.ForwardedToMezCalmos,
      );

      res.items = items;
      return res;
    } else {
      throw Exception("🚨🚨🚨🚨 listen_on_restaurant_order_by_id exception ");
    }
  });
}

Future<RestaurantOrder?> get_restaurant_order_by_id(
    {required int orderId}) async {
  final QueryResult<Query$get_restaurant_order_by_id> response =
      await _hasuraDb.graphQLClient.query$get_restaurant_order_by_id(
    Options$Query$get_restaurant_order_by_id(
      variables: Variables$Query$get_restaurant_order_by_id(order_id: orderId),
    ),
  );
  final Query$get_restaurant_order_by_id$restaurant_order_by_pk? orderData =
      response.parsedData?.restaurant_order_by_pk;
  if (orderData != null) {
    final List<RestaurantOrderItem> items = [];
    orderData.items.forEach(
        (Query$get_restaurant_order_by_id$restaurant_order_by_pk$items item) {
      items.add(
        RestaurantOrderItem(
          costPerOne: item.cost_per_one,
          idInCart: item.id,
          //  idInRestaurant: item.restaurant_item.category_id!,
          name: toLanguageMap(
              translations: item.restaurant_item.name.translations),
          image: null,
          quantity: item.quantity,
          totalCost: item.cost_per_one,
          idInRestaurant: item.restaurant_item.category_id!,
        ),
      );
    });
    final RestaurantOrder res = RestaurantOrder(
      chatId: orderData.chat_id,
      orderId: orderData.id,
      notes: orderData.notes,
      status: orderData.status.toRestaurantOrderStatus(),
      quantity: 1,
      serviceProviderId: orderData.restaurant.id,
      paymentType: orderData.payment_type.toPaymentType(),
      orderTime: DateTime.parse(orderData.order_time),
      cost: orderData.delivery_cost,
      restaurant: ServiceInfo(
        location: Location(
          orderData.restaurant.location_text,
          orderData.restaurant.location_gps.toLocationData(),
        ),
        firebaseId: orderData.restaurant.firebase_id,
        hasuraId: orderData.restaurant.id,
        image: orderData.restaurant.image,
        name: orderData.restaurant.name,
      ),
      customer: UserInfo(
          hasuraId: orderData.customer.user.id,
          image: orderData.customer.user.image,
          name: orderData.customer.user.name),
      to: Location(orderData.to_location_address!,
          orderData.to_location_gps!.toLocationData()),
      totalCost: orderData.total_cost,
      itemsCost: orderData.items_cost ?? 0,
      shippingCost: orderData.delivery_cost,
      deliveryMode: DeliveryMode.ForwardedToMezCalmos,
    );

    res.items = items;
    return res;
  }
  return null;
}

// Stream<List<RestaurantOrder>?> listen_on_orders_by_restaurant_id(
//     {required int restaurantId}) async* {
//   yield* _hasuraDb.graphQLClient
//       .watchSubscription$get_restaurant_orders(
//         WatchOptions$Subscription$get_restaurant_orders(
//           fetchPolicy: FetchPolicy.noCache,
//           variables: Variables$Subscription$get_restaurant_orders(
//               restaurantId: restaurantId),
//         ),
//       )
//       .stream
//       .asyncMap<List<RestaurantOrder>?>(
//           (QueryResult<Subscription$get_restaurant_orders> event) {
//     final List<Subscription$get_restaurant_orders$restaurant_order>?
//         ordersData = event.parsedData?.restaurant_order;
//     if (ordersData != null) {
//       final List<RestaurantOrder> orders = ordersData
//           .map((Subscription$get_restaurant_orders$restaurant_order orderData) {
//         num _itemsCost = 0;
//         final List<RestaurantOrderItem> items = [];
//         orderData.items.forEach(
//             (Subscription$get_restaurant_orders$restaurant_order$items item) {
//           _itemsCost += (item.cost_per_one * item.quantity);
//           // items.add(
//           //   RestaurantOrderItem(
//           //     costPerOne: item.cost_per_one,
//           //     idInCart: item.id,
//           //     idInRestaurant: item.restaurant_item.category_id!,
//           //     name: item.restaurant_item.name,
//           //   ),
//           // );
//         });
//         final RestaurantOrder res = RestaurantOrder(
//           chatId: orderData.chat_id,
//           orderId: orderData.id,
//           status: orderData.status.toRestaurantOrderStatus(),
//           quantity: 1,
//           serviceProviderId: orderData.restaurant.id,
//           paymentType: orderData.payment_type.toPaymentType(),
//           orderTime: DateTime.parse(orderData.order_time),
//           cost: orderData.delivery_cost,
//           restaurant: ServiceInfo(
//             location: Location(
//               orderData.restaurant.location_text,
//               orderData.restaurant.location_gps.toLocationData(),
//             ),
//             firebaseId: orderData.restaurant.firebase_id!,
//             hasuraId: orderData.restaurant.id,
//             image: orderData.restaurant.image,
//             name: orderData.restaurant.name,
//           ),
//           customer: UserInfo(
//               hasuraId: orderData.customer.user.id,
//               image: orderData.customer.user.image,
//               name: orderData.customer.user.name),
//           to: Location(orderData.to_location_address!,
//               orderData.to_location_gps!.toLocationData()),
//           itemsCost: _itemsCost,
//           shippingCost: orderData.delivery_cost,
//           deliveryMode: DeliveryMode.ForwardedToMezCalmos,
//         );

//         res.items = items;
//         return res;
//         // return RestaurantOrder(
//         //     orderId: orderId,
//         //     status: status,
//         //     quantity: quantity,
//         //     serviceProviderId: serviceProviderId,
//         //     paymentType: paymentType,
//         //     orderTime: orderTime,
//         //     cost: cost,
//         //     restaurant: restaurant,
//         //     customer: customer,
//         //     to: to,
//         //     deliveryMode: deliveryMode,
//         //     itemsCost: itemsCost,
//         //     shippingCost: shippingCost);
//       }).toList();
//       return orders;
//     }
//     return null;
//   });
// }

Future<List<RestaurantOrder>?> get_restaurant_orders_by_restaurant_id(
    {required int restaurantId}) async {
  final QueryResult<Query$querry_restaurant_orders_by_restaurant_id>
      queryResult = await _hasuraDb.graphQLClient
          .query$querry_restaurant_orders_by_restaurant_id(
    Options$Query$querry_restaurant_orders_by_restaurant_id(
      fetchPolicy: FetchPolicy.networkOnly,
      variables: Variables$Query$querry_restaurant_orders_by_restaurant_id(
        restaurantId: restaurantId,
      ),
    ),
  );
  if (queryResult.parsedData?.restaurant_order != null) {
    final List<Query$querry_restaurant_orders_by_restaurant_id$restaurant_order>
        ordersData = queryResult.parsedData!.restaurant_order;
    final List<RestaurantOrder> orders = ordersData.map(
        (Query$querry_restaurant_orders_by_restaurant_id$restaurant_order
            orderData) {
      num _itemsCost = 0;
      final List<RestaurantOrderItem> items = [];
      orderData.items.forEach(
          (Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items
              item) {
        _itemsCost += (item.cost_per_one * item.quantity);
        // items.add(
        //   RestaurantOrderItem(
        //     costPerOne: item.cost_per_one,
        //     idInCart: item.id,
        //     idInRestaurant: item.restaurant_item.category_id!,
        //     name: item.restaurant_item.name,
        //   ),
        // );
      });
      final RestaurantOrder res = RestaurantOrder(
        chatId: orderData.chat_id,
        orderId: orderData.id,
        status: orderData.status.toRestaurantOrderStatus(),
        quantity: 1,
        serviceProviderId: orderData.restaurant.id,
        paymentType: orderData.payment_type.toPaymentType(),
        orderTime: DateTime.parse(orderData.order_time),
        cost: orderData.delivery_cost,
        restaurant: ServiceInfo(
          location: Location(
            orderData.restaurant.location_text,
            orderData.restaurant.location_gps.toLocationData(),
          ),
          firebaseId: orderData.restaurant.firebase_id,
          hasuraId: orderData.restaurant.id,
          image: orderData.restaurant.image,
          name: orderData.restaurant.name,
        ),
        customer: UserInfo(
            hasuraId: orderData.customer.user.id,
            image: orderData.customer.user.image,
            name: orderData.customer.user.name),
        to: Location(orderData.to_location_address!,
            orderData.to_location_gps!.toLocationData()),
        itemsCost: _itemsCost,
        shippingCost: orderData.delivery_cost,
        deliveryMode: DeliveryMode.ForwardedToMezCalmos,
      );

      res.items = items;
      return res;
      // return RestaurantOrder(
      //     orderId: orderId,
      //     status: status,
      //     quantity: quantity,
      //     serviceProviderId: serviceProviderId,
      //     paymentType: paymentType,
      //     orderTime: orderTime,
      //     cost: cost,
      //     restaurant: restaurant,
      //     customer: customer,
      //     to: to,
      //     deliveryMode: deliveryMode,
      //     itemsCost: itemsCost,
      //     shippingCost: shippingCost);
    }).toList();
    return orders;
  } else {
    throw Exception(
        "🚨🚨 Exception can't get orders 🚨🚨\n ${queryResult.exception}");
  }
}

Stream<List<MinimalRestaurantOrder>?> listen_on_minimal_restaurant_orders(
    {required int restaurantId}) {
  return _hasuraDb.graphQLClient
      .subscribe$listen_restaurant_min_orders(
    Options$Subscription$listen_restaurant_min_orders(
      fetchPolicy: FetchPolicy.noCache,
      variables: Variables$Subscription$listen_restaurant_min_orders(
          restaurantId: restaurantId),
    ),
  )
      .map<List<MinimalRestaurantOrder>?>(
          (QueryResult<Subscription$listen_restaurant_min_orders> event) {
    final List<Subscription$listen_restaurant_min_orders$restaurant_order>?
        ordersData = event.parsedData?.restaurant_order;
    if (ordersData != null) {
      final List<MinimalRestaurantOrder> orders = ordersData.map(
          (Subscription$listen_restaurant_min_orders$restaurant_order
              orderData) {
        return MinimalRestaurantOrder(
            id: orderData.id,
            toAdress: orderData.to_location_address,
            orderTime: DateTime.parse(orderData.order_time),
            customerName: orderData.customer.user.name!,
            customerImage: orderData.customer.user.image,
            status: orderData.status.toRestaurantOrderStatus(),
            totalCost: orderData.total_cost!);
      }).toList();
      return orders;
    }
    return null;
  });
}

Future<List<MinimalRestaurantOrder>?> get_minimal_restaurant_orders(
    {required int restaurantId}) async {
  final QueryResult<Query$get_restaurant_min_orders> queryResult =
      await _hasuraDb.graphQLClient.query$get_restaurant_min_orders(
    Options$Query$get_restaurant_min_orders(
      fetchPolicy: FetchPolicy.networkOnly,
      variables:
          Variables$Query$get_restaurant_min_orders(restaurantId: restaurantId),
    ),
  );
  if (queryResult.parsedData?.restaurant_order != null) {
    final List<Query$get_restaurant_min_orders$restaurant_order> ordersData =
        queryResult.parsedData!.restaurant_order;

    final List<MinimalRestaurantOrder> orders = ordersData
        .map((Query$get_restaurant_min_orders$restaurant_order orderData) {
      return MinimalRestaurantOrder(
          id: orderData.id,
          toAdress: orderData.to_location_address,
          orderTime: DateTime.parse(orderData.order_time),
          customerName: orderData.customer.user.name!,
          customerImage: orderData.customer.user.image,
          status: orderData.status.toRestaurantOrderStatus(),
          totalCost: orderData.total_cost!);
    }).toList();
    return orders;
  } else {
    throw Exception(
        "🚨 Getting min orders exceptions \n ${queryResult.exception}");
  }
}
