import 'package:get/get.dart';
import 'package:graphql/client.dart';
import 'package:mezcalmos/CustomerApp/models/Customer.dart';
import 'package:mezcalmos/Shared/controllers/appLifeCycleController.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/hasuraTypes.dart';
import 'package:mezcalmos/Shared/graphql/order/__generated/restaurant_order.graphql.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/Minimal/MinimalRestaurantOrder.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Choice.dart';
import 'package:mezcalmos/Shared/models/User.dart';
import 'package:mezcalmos/Shared/models/Utilities/DeliveryMode.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';
import 'package:mezcalmos/Shared/models/Utilities/PaymentInfo.dart';
import 'package:mezcalmos/Shared/models/Utilities/Review.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServiceProviderType.dart';

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
    final Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk
        orderData = event.parsedData!.restaurant_order_by_pk!;
    orderData.items.forEach(
        (Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items
            item) {
      final RestaurantOrderItem _restauItem = RestaurantOrderItem(
        costPerOne: item.cost_per_one,
        idInCart: item.id,
        name:
            toLanguageMap(translations: item.restaurant_item.name.translations),
        image: item.restaurant_item.image,
        quantity: item.quantity,
        totalCost: item.cost_per_one,
        idInRestaurant: item.restaurant_item.id,
      );
      mezDbgPrint("[544D] item.in_json ===> ${item.in_json}");
      (item.in_json['selected_options'] as Map<String, dynamic>)
          .forEach((key, value) {
        final List<Choice> choices = [];
        _restauItem.optionNames[key] = {
          LanguageType.EN: value['optionName']['en'],
          LanguageType.ES: value['optionName']['en']
        };

        ((value['choices'] ?? []) as List).forEach((element) {
          choices.add(
            Choice(
              id: element['id'],
              name: {
                LanguageType.EN: element['name']['en'],
                LanguageType.ES: element['name']['es']
              },
              cost: element['cost'],
            ),
          );
        });

        mezDbgPrint("[544D] Parsed Choices ===> ${choices.length}");
        _restauItem.chosenChoices[key] = choices;
      });
      items.add(_restauItem);
    });

    final RestaurantOrder res = RestaurantOrder(
      chatId: orderData.chat_id,
      orderId: orderData.id,
      notes: orderData.notes,
      estimatedFoodReadyTime: (orderData.estimated_food_ready_time != null)
          ? DateTime.tryParse(orderData.estimated_food_ready_time!)
          : null,
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
  if (response.parsedData?.restaurant_order_by_pk == null) {
    throw Exception(
        "[544D] 🚨🚨 Get restaurant order $orderId exceptions ${response.exception}");
  }
  mezDbgPrint("[544D] get_restaurant_order_by_id::SUCCESS ");
  final Query$get_restaurant_order_by_id$restaurant_order_by_pk orderData =
      response.parsedData!.restaurant_order_by_pk!;

  final List<RestaurantOrderItem> items = [];

  orderData.items.forEach(
      (Query$get_restaurant_order_by_id$restaurant_order_by_pk$items item) {
    final RestaurantOrderItem _restauItem = RestaurantOrderItem(
      costPerOne: item.cost_per_one,
      idInCart: item.id,
      name: toLanguageMap(translations: item.restaurant_item.name.translations),
      image: item.restaurant_item.image,
      quantity: item.quantity,
      totalCost: item.cost_per_one,
      idInRestaurant: item.restaurant_item.id,
    );
    mezDbgPrint("[544D] item.in_json ===> ${item.in_json}");
    (item.in_json['selected_options'] as Map<String, dynamic>)
        .forEach((key, value) {
      final List<Choice> choices = [];
      _restauItem.optionNames[key] = {
        LanguageType.EN: value['optionName']['en'],
        LanguageType.ES: value['optionName']['en']
      };

      ((value['choices'] ?? []) as List).forEach((element) {
        choices.add(
          Choice(
            id: element['id'],
            name: {
              LanguageType.EN: element['name']['en'],
              LanguageType.ES: element['name']['es']
            },
            cost: element['cost'],
          ),
        );
      });

      mezDbgPrint("[544D] Parsed Choices ===> ${choices.length}");
      _restauItem.chosenChoices[key] = choices;
    });
    items.add(_restauItem);
  });

  final RestaurantOrder res = RestaurantOrder(
    chatId: orderData.chat_id,
    orderId: orderData.id,
    notes: orderData.notes,
    estimatedFoodReadyTime: (orderData.estimated_food_ready_time != null)
        ? DateTime.tryParse(orderData.estimated_food_ready_time!)
        : null,
    status: orderData.status.toRestaurantOrderStatus(),
    quantity: 1,
    serviceProviderId: orderData.restaurant.id,
    paymentType: orderData.payment_type.toPaymentType(),
    orderTime: DateTime.parse(orderData.order_time),
    cost: orderData.delivery_cost,
    review: (orderData.review != null)
        ? Review(
            comment: orderData.review!.note,
            rating: orderData.review!.rating,
            toEntityId: orderData.review!.to_entity_id,
            customer: UserInfo(
              name: orderData.review?.customer?.user.name,
              image: orderData.review?.customer?.user.image,
              hasuraId: orderData.review!.customer!.user.id,
            ),
            toEntityType:
                orderData.review!.to_entity_type.toServiceProviderType(),
            fromEntityId: orderData.review!.from_entity_id,
            fromEntityType:
                orderData.review!.from_entity_type.toServiceProviderType(),
            reviewTime: DateTime.parse(orderData.review!.created_at))
        : null,
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

  // final List<RestaurantOrderItem> items = [];
  // orderData.items.forEach(
  //     (Query$get_restaurant_order_by_id$restaurant_order_by_pk$items item) {
  //   final RestaurantOrderItem _restauItem = RestaurantOrderItem(
  //     costPerOne: item.cost_per_one,
  //     idInCart: item.id,
  //     name: toLanguageMap(translations: item.restaurant_item.name.translations),
  //     image: item.restaurant_item.image,
  //     quantity: item.quantity,
  //     totalCost: item.cost_per_one,
  //     idInRestaurant: item.restaurant_item.id,
  //   );
  //   mezDbgPrint("[544D] item.in_json ===> ${item.in_json}");
  //   (item.in_json as Map<String, dynamic>).forEach((key, value) {
  //     final List<Choice> choices = [];
  //     ((value['choices'] ?? []) as List).forEach((element) {
  //       choices.add(Choice(
  //           id: element['id'], name: element['name'], cost: element['cost']));
  //     });
  //     _restauItem.chosenChoices[key] = choices;
  //   });

  //   items.add(_restauItem);
  // });

  // final RestaurantOrder res = RestaurantOrder(
  //   chatId: orderData.chat_id,
  //   orderId: orderData.id,
  //   notes: orderData.notes,
  //   status: orderData.status.toRestaurantOrderStatus(),
  //   quantity: 1,
  //   estimatedFoodReadyTime: (orderData.estimated_food_ready_time != null)
  //       ? DateTime.tryParse(orderData.estimated_food_ready_time!)
  //       : null,
  //   serviceProviderId: orderData.restaurant.id,
  //   paymentType: orderData.payment_type.toPaymentType(),
  //   orderTime: DateTime.parse(orderData.order_time),
  //   deliveryTime: (orderData.scheduled_time != null)
  //       ? DateTime.tryParse(orderData.scheduled_time!)
  //       : null,
  //   cost: orderData.delivery_cost,
  //   restaurant: ServiceInfo(
  //     location: Location(
  //       orderData.restaurant.location_text,
  //       orderData.restaurant.location_gps.toLocationData(),
  //     ),
  //     firebaseId: orderData.restaurant.firebase_id,
  //     hasuraId: orderData.restaurant.id,
  //     image: orderData.restaurant.image,
  //     name: orderData.restaurant.name,
  //   ),
  //   customer: UserInfo(
  //       hasuraId: orderData.customer.user.id,
  //       image: orderData.customer.user.image,
  //       name: orderData.customer.user.name),
  //   to: Location(orderData.to_location_address!,
  //       orderData.to_location_gps!.toLocationData()),
  //   totalCost: orderData.total_cost,
  //   itemsCost: orderData.items_cost ?? 0,
  //   shippingCost: orderData.delivery_cost,
  //   deliveryMode: DeliveryMode.ForwardedToMezCalmos,
  // );

  // res.items = items;
  // return res;
}

Stream<List<MinimalRestaurantOrder>?> listen_on_current_restaurant_orders(
    {required int restaurantId}) {
  return _hasuraDb.graphQLClient
      .subscribe$listen_restaurant_current_orders(
    Options$Subscription$listen_restaurant_current_orders(
      fetchPolicy: FetchPolicy.noCache,
      variables: Variables$Subscription$listen_restaurant_current_orders(
          restaurantId: restaurantId),
    ),
  )
      .map<List<MinimalRestaurantOrder>?>(
          (QueryResult<Subscription$listen_restaurant_current_orders> event) {
    final List<Subscription$listen_restaurant_current_orders$restaurant_order>?
        ordersData = event.parsedData?.restaurant_order;
    if (ordersData != null) {
      final List<MinimalRestaurantOrder> orders = ordersData.map(
          (Subscription$listen_restaurant_current_orders$restaurant_order
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

Future<List<MinimalRestaurantOrder>?> get_current_restaurant_orders(
    {required int restaurantId}) async {
  final QueryResult<Query$get_restaurant_current_orders> queryResult =
      await _hasuraDb.graphQLClient.query$get_restaurant_current_orders(
    Options$Query$get_restaurant_current_orders(
      fetchPolicy: FetchPolicy.networkOnly,
      variables: Variables$Query$get_restaurant_current_orders(
          restaurantId: restaurantId),
    ),
  );
  if (queryResult.parsedData?.restaurant_order != null) {
    final List<Query$get_restaurant_current_orders$restaurant_order>
        ordersData = queryResult.parsedData!.restaurant_order;

    final List<MinimalRestaurantOrder> orders = ordersData
        .map((Query$get_restaurant_current_orders$restaurant_order orderData) {
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

Future<List<MinimalRestaurantOrder>?> get_past_restaurant_orders(
    {required int restaurantId}) async {
  final QueryResult<Query$get_restaurant_past_orders> queryResult =
      await _hasuraDb.graphQLClient.query$get_restaurant_past_orders(
    Options$Query$get_restaurant_past_orders(
      fetchPolicy: FetchPolicy.networkOnly,
      variables: Variables$Query$get_restaurant_past_orders(
          restaurantId: restaurantId),
    ),
  );
  if (queryResult.parsedData?.restaurant_order != null) {
    final List<Query$get_restaurant_past_orders$restaurant_order> ordersData =
        queryResult.parsedData!.restaurant_order;

    final List<MinimalRestaurantOrder> orders = ordersData
        .map((Query$get_restaurant_past_orders$restaurant_order orderData) {
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
