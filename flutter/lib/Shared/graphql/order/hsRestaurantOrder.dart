import 'package:get/get.dart';
import 'package:graphql/client.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart' as cModels;
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/hasuraTypes.dart';
import 'package:mezcalmos/Shared/graphql/order/__generated/restaurant_order.graphql.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/helpers/thirdParty/MapHelper.dart';
import 'package:mezcalmos/Shared/helpers/thirdParty/StripeHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/DeliveryOrder/utilities/DeliveryAction.dart';
import 'package:mezcalmos/Shared/models/Orders/Minimal/MinimalOrder.dart';
import 'package:mezcalmos/Shared/models/Orders/Minimal/MinimalOrderStatus.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Choice.dart';
import 'package:mezcalmos/Shared/models/User.dart';
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
      fetchPolicy: FetchPolicy.noCache,
      variables: Variables$Subscription$listen_on_restaurant_order_by_id(
        order_id: orderId,
      ),
    ),
  )
      .map<RestaurantOrder?>(
          (QueryResult<Subscription$listen_on_restaurant_order_by_id> event) {
    mezDbgPrint(
        "Event from hs restaurant order 🚀🚀🚀 =====>driver ${event.parsedData?.restaurant_order_by_pk?.delivery?.delivery_driver}");

    if (event.parsedData?.restaurant_order_by_pk != null) {
      final List<RestaurantOrderItem> items = [];
      final Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk
          orderData = event.parsedData!.restaurant_order_by_pk!;
      orderData.items.forEach(
          (Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items
              item) {
        final RestaurantOrderItem _restauItem = RestaurantOrderItem(
          costPerOne: item.cost_per_one,
          idInCart: item.id,
          name: toLanguageMap(
              translations: item.restaurant_item.name.translations),
          image: item.restaurant_item.image,
          quantity: item.quantity,
          totalCost: item.cost_per_one,
          idInRestaurant: item.restaurant_item.id,
        );
        mezDbgPrint("[544D] item.in_json ===> ${item.in_json}");
        if (item.in_json['selected_options'] != null) {
          (item.in_json['selected_options'] as Map<String, dynamic>)
              .forEach((String key, value) {
            final List<Choice> choices = [];
            _restauItem.optionNames[key] = {
              LanguageType.EN: value['optionName']["en"],
              LanguageType.ES: value['optionName']["es"]
            };

            value['choices'].forEach((key, value) {
              choices.add(
                Choice(
                  id: value['id'],
                  name: {
                    LanguageType.EN: value['name']
                        [userLanguage.toFirebaseFormatString()],
                    LanguageType.ES: value['name']
                        [userLanguage.toFirebaseFormatString()]
                  },
                  cost: value['cost'],
                ),
              );
            });

            mezDbgPrint("[544D] Parsed Choices ===> ${choices.length}");
            _restauItem.chosenChoices[key] = choices;
          });
        }
        items.add(_restauItem);
      });
      StripeOrderPaymentInfo? _paymentInfo;
      if (orderData.stripe_info != null) {
        _paymentInfo = StripeOrderPaymentInfo.fromJson(orderData.stripe_info);
      }

      final RestaurantOrder res = RestaurantOrder(
        deliveryProviderType:
            orderData.delivery!.service_provider_type.toServiceProviderType(),
        serviceProviderDriverChatId:
            orderData.delivery?.chat_with_service_provider_id,
        chatId: orderData.chat_id!,
        orderId: orderData.id,
        notes: orderData.notes,
        estimatedPackageReadyTime: (orderData.estimated_food_ready_time != null)
            ? DateTime.tryParse(orderData.estimated_food_ready_time!)
            : null,
        estimatedArrivalAtDropoff:
            (orderData.delivery?.estimated_arrival_at_dropoff_time != null)
                ? DateTime.tryParse(
                    orderData.delivery!.estimated_arrival_at_dropoff_time!)
                : null,
        estimatedArrivalAtPickup:
            (orderData.delivery?.estimated_arrival_at_pickup_time != null)
                ? DateTime.tryParse(
                    orderData.delivery!.estimated_arrival_at_pickup_time!)
                : null,
        status: orderData.status.toRestaurantOrderStatus(),
        deliveryOrderId: orderData.delivery_id,
        serviceProviderId: orderData.restaurant.id,
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
        routeInformation: (orderData.delivery?.trip_polyline != null &&
                orderData.delivery?.trip_polyline != null &&
                orderData.delivery?.trip_polyline != null)
            ? RouteInformation(
                duration: RideDuration(
                    orderData.delivery!.trip_duration!.toString(),
                    orderData.delivery!.trip_duration!),
                distance: RideDistance(
                    orderData.delivery!.trip_distance!.toString(),
                    orderData.delivery!.trip_distance!),
                polyline: orderData.delivery!.trip_polyline!)
            : null,
        paymentType: orderData.payment_type.convertToPaymentType(),
        customerDriverChatId: orderData.delivery?.chat_with_customer_id,
        orderTime: DateTime.parse(orderData.order_time),
        serviceProvider: ServiceInfo(
          location: MezLocation(
            orderData.restaurant.details!.location.address,
            orderData.restaurant.details!.location.gps.toLocationData(),
          ),
          firebaseId: orderData.restaurant.details!.firebase_id,
          hasuraId: orderData.restaurant.id,
          image: orderData.restaurant.details!.image,
          name: orderData.restaurant.details!.name,
        ),
        driverInfo: (orderData.delivery?.delivery_driver != null)
            ? UserInfo(
                hasuraId: orderData.delivery!.delivery_driver!.user.id,
                name: orderData.delivery!.delivery_driver!.user.name,
                image: orderData.delivery!.delivery_driver!.user.image,
                language: orderData.delivery!.delivery_driver!.user.language_id
                    .toLanguageType())
            : null,
        scheduleTime: (orderData.scheduled_time != null)
            ? DateTime.tryParse(orderData.scheduled_time!)
            : null,
        customer: UserInfo(
            hasuraId: orderData.customer.user.id,
            image: orderData.customer.user.image,
            name: orderData.customer.user.name),
        dropOffLocation: MezLocation(orderData.to_location_address!,
            orderData.to_location_gps!.toLocationData()),
        // itemsCost: orderData.items_cost ?? 0,
        // totalCost: orderData.total_cost,
        // shippingCost: orderData.delivery_cost,
        // refundAmount: orderData.refund_amount,
        costs: OrderCosts(
            deliveryCost: orderData.delivery_cost,
            refundAmmount: orderData.refund_amount,
            tax: null,
            orderItemsCost: orderData.items_cost,
            totalCost: orderData.total_cost),
        deliveryCompany: null, driverLocation: null,
        deliveryDirection: cModels.DeliveryDirection.ToCustomer,
        pickupLocation: null,
      );

      res.items = items;
      res.stripePaymentInfo = _paymentInfo;
      return res;
    }
    return null;
  });
}

Future<RestaurantOrder?> get_restaurant_order_by_id(
    {required int orderId, bool withCache = true}) async {
  final QueryResult<Query$get_restaurant_order_by_id> response =
      await _hasuraDb.graphQLClient.query$get_restaurant_order_by_id(
    Options$Query$get_restaurant_order_by_id(
      fetchPolicy:
          withCache ? FetchPolicy.cacheAndNetwork : FetchPolicy.networkOnly,
      variables: Variables$Query$get_restaurant_order_by_id(order_id: orderId),
    ),
  );
  if (response.parsedData?.restaurant_order_by_pk == null) {
    throw Exception(
        "[544D] 🚨🚨 Get restaurant order $orderId exceptions ${response.exception}");
  }

  final Query$get_restaurant_order_by_id$restaurant_order_by_pk orderData =
      response.parsedData!.restaurant_order_by_pk!;
  mezDbgPrint(
      "Event from hs restaurant order from query 🚀🚀🚀 =====>driver ${orderData.delivery?.delivery_driver}");

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
    if (item.in_json['selected_options'] != null) {
      mezDbgPrint(
          "[544D] item.in_json ===> ${item.in_json['selected_options']}");
      (item.in_json['selected_options'] as Map<String, dynamic>)
          .forEach((String key, value) {
        final List<Choice> choices = [];
        _restauItem.optionNames[key] = {
          LanguageType.EN: value['optionName']["en"],
          LanguageType.ES: value['optionName']["es"]
        };

        value['choices'].forEach((key, value) {
          choices.add(
            Choice(
              id: value['id'],
              name: {
                LanguageType.EN: value['name']
                    [userLanguage.toFirebaseFormatString()],
                LanguageType.ES: value['name']
                    [userLanguage.toFirebaseFormatString()]
              },
              cost: value['cost'],
            ),
          );
        });

        _restauItem.chosenChoices[key] = choices;
      });
    }
    items.add(_restauItem);
  });
  StripeOrderPaymentInfo? _paymentInfo;
  if (orderData.stripe_info != null) {
    _paymentInfo = StripeOrderPaymentInfo.fromJson(orderData.stripe_info);
  }
  final RestaurantOrder res = RestaurantOrder(
    pickupLocation: null,
    deliveryProviderType:
        orderData.delivery!.service_provider_type.toServiceProviderType(),
    serviceProviderDriverChatId:
        orderData.delivery?.chat_with_service_provider_id,
    chatId: orderData.chat_id!,
    orderId: orderData.id,
    notes: orderData.notes,
    estimatedPackageReadyTime: (orderData.estimated_food_ready_time != null)
        ? DateTime.tryParse(orderData.estimated_food_ready_time!)
        : null,
    estimatedArrivalAtDropoff:
        (orderData.delivery?.estimated_arrival_at_dropoff_time != null)
            ? DateTime.tryParse(
                orderData.delivery!.estimated_arrival_at_dropoff_time!)
            : null,
    estimatedArrivalAtPickup:
        (orderData.delivery?.estimated_arrival_at_pickup_time != null)
            ? DateTime.tryParse(
                orderData.delivery!.estimated_arrival_at_pickup_time!)
            : null,
    status: orderData.status.toRestaurantOrderStatus(),
    deliveryOrderId: orderData.delivery_id,
    serviceProviderId: orderData.restaurant.id,
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
    routeInformation: (orderData.delivery?.trip_polyline != null &&
            orderData.delivery?.trip_polyline != null &&
            orderData.delivery?.trip_polyline != null)
        ? RouteInformation(
            duration: RideDuration(
                orderData.delivery!.trip_duration!.toString(),
                orderData.delivery!.trip_duration!),
            distance: RideDistance(
                orderData.delivery!.trip_distance!.toString(),
                orderData.delivery!.trip_distance!),
            polyline: orderData.delivery!.trip_polyline!)
        : null,
    paymentType: orderData.payment_type.convertToPaymentType(),
    customerDriverChatId: orderData.delivery?.chat_with_customer_id,
    orderTime: DateTime.parse(orderData.order_time),
    serviceProvider: ServiceInfo(
      location: MezLocation(
        orderData.restaurant.details!.location.address,
        orderData.restaurant.details!.location.gps.toLocationData(),
      ),
      firebaseId: orderData.restaurant.details!.firebase_id,
      hasuraId: orderData.restaurant.id,
      image: orderData.restaurant.details!.image,
      name: orderData.restaurant.details!.name,
    ),
    driverInfo: (orderData.delivery?.delivery_driver != null)
        ? UserInfo(
            hasuraId: orderData.delivery!.delivery_driver!.user.id,
            name: orderData.delivery!.delivery_driver!.user.name,
            image: orderData.delivery!.delivery_driver!.user.image,
            language: orderData.delivery!.delivery_driver!.user.language_id
                .toLanguageType())
        : null,
    scheduleTime: (orderData.scheduled_time != null)
        ? DateTime.tryParse(orderData.scheduled_time!)
        : null,
    customer: UserInfo(
        hasuraId: orderData.customer.user.id,
        image: orderData.customer.user.image,
        name: orderData.customer.user.name),
    dropOffLocation: MezLocation(orderData.to_location_address!,
        orderData.to_location_gps!.toLocationData()),
    // itemsCost: orderData.items_cost ?? 0,
    // totalCost: orderData.total_cost,
    // shippingCost: orderData.delivery_cost,
    // refundAmount: orderData.refund_amount,
    costs: OrderCosts(
        deliveryCost: orderData.delivery_cost,
        refundAmmount: orderData.refund_amount,
        tax: null,
        orderItemsCost: orderData.items_cost,
        totalCost: orderData.total_cost),
    deliveryCompany: null, driverLocation: null,
    deliveryDirection: cModels.DeliveryDirection.ToCustomer,
  );

  res.items = items;
  mezDbgPrint(
      "⏰⏰⏰⏰⏰⏰⏰⏰⏰⏰⏰⏰ From  get restuarnt order By id =============>>>>$_paymentInfo");
  res.stripePaymentInfo = _paymentInfo;
  return res;
}

Stream<List<MinimalOrder>?> listen_on_current_restaurant_orders(
    {required int restaurantId}) {
  return _hasuraDb.graphQLClient
      .subscribe$listen_restaurant_current_orders(
    Options$Subscription$listen_restaurant_current_orders(
      fetchPolicy: FetchPolicy.noCache,
      variables: Variables$Subscription$listen_restaurant_current_orders(
          restaurantId: restaurantId),
    ),
  )
      .map<List<MinimalOrder>?>(
          (QueryResult<Subscription$listen_restaurant_current_orders> event) {
    final List<Subscription$listen_restaurant_current_orders$restaurant_order>?
        ordersData = event.parsedData?.restaurant_order;
    if (ordersData != null) {
      final List<MinimalOrder> orders = ordersData.map(
          (Subscription$listen_restaurant_current_orders$restaurant_order
              orderData) {
        return MinimalOrder(
            id: orderData.id,
            orderType: cModels.OrderType.Restaurant,
            toAdress: orderData.to_location_address,
            deliveryCost: orderData.delivery?.delivery_cost,
            orderTime: DateTime.parse(orderData.order_time),
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

Future<List<MinimalOrder>?> get_current_restaurant_orders(
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

    final List<MinimalOrder> orders = ordersData
        .map((Query$get_restaurant_current_orders$restaurant_order orderData) {
      return MinimalOrder(
          id: orderData.id,
          orderType: cModels.OrderType.Restaurant,
          toAdress: orderData.to_location_address,
          deliveryCost: orderData.delivery?.delivery_cost,
          orderTime: DateTime.parse(orderData.order_time),
          title: orderData.customer.user.name!,
          image: orderData.customer.user.image,
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

Future<List<MinimalOrder>?> get_past_restaurant_orders(
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

    final List<MinimalOrder> orders = ordersData
        .map((Query$get_restaurant_past_orders$restaurant_order orderData) {
      return MinimalOrder(
          id: orderData.id,
          orderType: cModels.OrderType.Restaurant,
          toAdress: orderData.to_location_address,
          orderTime: DateTime.parse(orderData.order_time),
          title: orderData.customer.user.name!,
          image: orderData.customer.user.image,
          status:
              orderData.status.toRestaurantOrderStatus().toMinimalOrderStatus(),
          totalCost: orderData.total_cost ?? 0);
    }).toList();
    return orders;
  } else {
    throw Exception(
        "🚨 Getting min orders exceptions \n ${queryResult.exception}");
  }
}
