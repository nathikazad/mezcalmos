import 'package:get/get.dart';
import 'package:graphql/client.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/__generated/schema.graphql.dart';
import 'package:mezcalmos/Shared/graphql/hasuraTypes.dart';
import 'package:mezcalmos/Shared/graphql/laundry_order/__generated/laundry_order.graphql.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/DeliveryOrder/utilities/DeliveryAction.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';
import 'package:mezcalmos/Shared/models/Orders/Minimal/MinimalOrder.dart';
import 'package:mezcalmos/Shared/models/Orders/Minimal/MinimalOrderStatus.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/User.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';
import 'package:mezcalmos/Shared/models/Utilities/Review.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServiceProviderType.dart';

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
    {required int laundryStoreID,
    required bool inProcess,
    int? offset,
    int? limit}) async {
  final QueryResult<Query$get_laundry_orders> queryResult =
      await _hasuraDb.graphQLClient.query$get_laundry_orders(
    Options$Query$get_laundry_orders(
      fetchPolicy: FetchPolicy.networkOnly,
      variables: Variables$Query$get_laundry_orders(
          laundryStoreId: laundryStoreID,
          inProcess: inProcess,
          offset: offset,
          limit: limit),
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
    deliveryProviderType: orderData.to_customer_delivery?.service_provider_type
            .toServiceProviderType() ??
        orderData.from_customer_delivery!.service_provider_type
            .toServiceProviderType(),
    estimatedArrivalAtDropoff: DateTime.tryParse(
        orderData.to_customer_delivery?.estimated_arrival_at_dropoff_time ??
            ""),
    estimatedDropoffAtServiceProviderTime: DateTime.tryParse(
        orderData.from_customer_delivery?.estimated_arrival_at_dropoff_time ??
            ""),
    estimatedPickupFromCustomerTime: DateTime.tryParse(
        orderData.from_customer_delivery?.estimated_arrival_at_pickup_time ??
            ""),
    estimatedArrivalAtPickup: DateTime.tryParse(
        orderData.to_customer_delivery?.estimated_arrival_at_pickup_time ?? ""),
    estimatedPackageReadyTime: (orderData.estimated_ready_time != null)
        ? DateTime.parse(orderData.estimated_ready_time!)
        : null,
    orderId: orderData.id,
    review: (orderData.review != null)
        ? Review(
            comment: orderData.review!.note,
            rating: orderData.review!.rating,
            toEntityId: orderData.review!.to_entity_id,
            fromImage: orderData.review!.from_image,
            fromName: orderData.review!.from_name,
            toImage: orderData.review!.to_image,
            toName: orderData.review!.to_name,
            toEntityType:
                orderData.review!.to_entity_type.toServiceProviderType(),
            fromEntityId: orderData.review!.from_entity_id,
            fromEntityType:
                orderData.review!.from_entity_type.toServiceProviderType(),
            reviewTime: DateTime.parse(orderData.review!.created_at))
        : null,
    notes: orderData.notes,
    customerPickupDriverChatId:
        orderData.from_customer_delivery?.chat_with_customer_id,
    customerDriverChatId: orderData.to_customer_delivery?.chat_with_customer_id,
    serviceProviderDriverChatId:
        orderData.to_customer_delivery?.chat_with_service_provider_id,
    serviceProviderPickupDriverChatId:
        orderData.from_customer_delivery?.chat_with_service_provider_id,
    driverInfo: orderData.to_customer_delivery?.delivery_driver != null
        ? UserInfo(
            hasuraId: orderData.to_customer_delivery!.delivery_driver!.user.id,
            name: orderData.to_customer_delivery!.delivery_driver!.user.name,
            image: orderData.to_customer_delivery!.delivery_driver!.user.image,
            language: LanguageType.EN)
        : null,
    pickupDriver: orderData.from_customer_delivery?.delivery_driver != null
        ? UserInfo(
            hasuraId:
                orderData.from_customer_delivery!.delivery_driver!.user.id,
            name: orderData.from_customer_delivery!.delivery_driver!.user.name,
            image:
                orderData.from_customer_delivery!.delivery_driver!.user.image,
            language: LanguageType.EN)
        : null,
    toCustomerDeliveryId: orderData.to_customer_delivery_id,
    fromCustomerDeliveryId: orderData.from_customer_delivery_id!,
    costsByType: LaundryOrderCosts(
        lineItems: orderData.categories
            .map((Query$get_laundry_order_by_id$laundry_order_by_pk$categories
                    cat) =>
                LaundryOrderCostLineItem(
                    cost: cat.category.cost_by_kilo,
                    id: cat.category_id,
                    name: toLanguageMap(
                        translations: cat.category.name.translations),
                    weight: cat.weight_in_kilo!))
            .toList()),
    // cost: orderData.items_cost ?? 0,
    customerLocation: MezLocation.fromHasura(
        orderData.customer_location_gps!, orderData.customer_address!),
    laundryLocation: MezLocation.fromHasura(
        orderData.store.details!.location.gps,
        orderData.store.details!.location.address),
    orderTime: DateTime.parse(orderData.order_time),
    paymentType: orderData.payment_type.toPaymentType(),
    status: orderData.status.toLaundryOrderStatus(),
    customer: UserInfo(
      hasuraId: orderData.customer_id,
      name: orderData.customer.user.name,
      image: orderData.customer.user.image,
    ),
    serviceProvider: ServiceInfo(
        location: MezLocation.fromHasura(orderData.store.details!.location.gps,
            orderData.store.details!.location.address),
        hasuraId: orderData.store_id,
        image: orderData.store.details!.image,
        name: orderData.store.details!.name),
    shippingCost: orderData.delivery_cost,
    chatId: orderData.chat_id!,
    pickupLocation: null,
    costs: OrderCosts(
        deliveryCost: orderData.delivery_cost,
        refundAmmount: orderData.refund_amount,
        tax: orderData.tax,
        orderItemsCost: orderData.items_cost,
        totalCost: orderData.total_cost),
    deliveryCompany: null,
    deliveryDirection: orderData.to_customer_delivery != null
        ? DeliveryDirection.ToCustomer
        : DeliveryDirection.FromCustomer,
    deliveryOrderId: orderData.to_customer_delivery_id != null
        ? orderData.to_customer_delivery_id
        : orderData.from_customer_delivery_id,
    driverLocation: null,

    dropOffLocation: orderData.to_customer_delivery != null
        ? MezLocation.fromHasura(
            orderData.customer_location_gps!, orderData.customer_address!)
        : MezLocation.fromHasura(orderData.store.details!.location.gps,
            orderData.store.details!.location.address),
  );
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
        deliveryProviderType: orderData
                .to_customer_delivery?.service_provider_type
                .toServiceProviderType() ??
            orderData.from_customer_delivery!.service_provider_type
                .toServiceProviderType(),
        estimatedArrivalAtDropoff: DateTime.tryParse(
            orderData.to_customer_delivery?.estimated_arrival_at_dropoff_time ??
                ""),
        estimatedDropoffAtServiceProviderTime: DateTime.tryParse(orderData
                .from_customer_delivery?.estimated_arrival_at_dropoff_time ??
            ""),
        estimatedPickupFromCustomerTime: DateTime.tryParse(orderData
                .from_customer_delivery?.estimated_arrival_at_pickup_time ??
            ""),
        estimatedArrivalAtPickup: DateTime.tryParse(
            orderData.to_customer_delivery?.estimated_arrival_at_pickup_time ??
                ""),
        estimatedPackageReadyTime: (orderData.estimated_ready_time != null)
            ? DateTime.parse(orderData.estimated_ready_time!)
            : null,
        orderId: orderData.id,
        review: (orderData.review != null)
            ? Review(
                comment: orderData.review!.note,
                rating: orderData.review!.rating,
                toEntityId: orderData.review!.to_entity_id,
               fromImage: orderData.review!.from_image,
          fromName: orderData.review!.from_name,
          toImage: orderData.review!.to_image,
          toName: orderData.review!.to_name,
                toEntityType:
                    orderData.review!.to_entity_type.toServiceProviderType(),
                fromEntityId: orderData.review!.from_entity_id,
                fromEntityType:
                    orderData.review!.from_entity_type.toServiceProviderType(),
                reviewTime: DateTime.parse(orderData.review!.created_at))
            : null,
        notes: orderData.notes,
        customerPickupDriverChatId:
            orderData.from_customer_delivery?.chat_with_customer_id,
        customerDriverChatId:
            orderData.to_customer_delivery?.chat_with_customer_id,
        serviceProviderDriverChatId:
            orderData.to_customer_delivery?.chat_with_service_provider_id,
        serviceProviderPickupDriverChatId:
            orderData.from_customer_delivery?.chat_with_service_provider_id,
        driverInfo: orderData.to_customer_delivery?.delivery_driver != null
            ? UserInfo(
                hasuraId:
                    orderData.to_customer_delivery!.delivery_driver!.user.id,
                name:
                    orderData.to_customer_delivery!.delivery_driver!.user.name,
                image:
                    orderData.to_customer_delivery!.delivery_driver!.user.image,
                language: LanguageType.EN)
            : null,
        pickupDriver: orderData.from_customer_delivery?.delivery_driver != null
            ? UserInfo(
                hasuraId:
                    orderData.from_customer_delivery!.delivery_driver!.user.id,
                name: orderData
                    .from_customer_delivery!.delivery_driver!.user.name,
                image: orderData
                    .from_customer_delivery!.delivery_driver!.user.image,
                language: LanguageType.EN)
            : null,
        toCustomerDeliveryId: orderData.to_customer_delivery_id,
        fromCustomerDeliveryId: orderData.from_customer_delivery_id!,
        costsByType: LaundryOrderCosts(
            lineItems: orderData.categories
                .map(
                    (Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories
                            cat) =>
                        LaundryOrderCostLineItem(
                            cost: cat.category.cost_by_kilo,
                            id: cat.category_id,
                            name: toLanguageMap(
                                translations: cat.category.name.translations),
                            weight: cat.weight_in_kilo!))
                .toList()),
        // cost: orderData.items_cost ?? 0,
        customerLocation: MezLocation.fromHasura(
            orderData.customer_location_gps!, orderData.customer_address!),
        laundryLocation: MezLocation.fromHasura(
            orderData.store.details!.location.gps,
            orderData.store.details!.location.address),
        orderTime: DateTime.parse(orderData.order_time),
        paymentType: orderData.payment_type.toPaymentType(),
        status: orderData.status.toLaundryOrderStatus(),
        customer: UserInfo(
          hasuraId: orderData.customer_id,
          name: orderData.customer.user.name,
          image: orderData.customer.user.image,
        ),
        serviceProvider: ServiceInfo(
            location: MezLocation.fromHasura(
                orderData.store.details!.location.gps,
                orderData.store.details!.location.address),
            hasuraId: orderData.store_id,
            image: orderData.store.details!.image,
            name: orderData.store.details!.name),
        shippingCost: orderData.delivery_cost,
        chatId: orderData.chat_id!,
        pickupLocation: null,
        costs: OrderCosts(
            deliveryCost: orderData.delivery_cost,
            refundAmmount: orderData.refund_amount,
            tax: orderData.tax,
            orderItemsCost: orderData.items_cost,
            totalCost: orderData.total_cost),
        deliveryCompany: null,
        deliveryDirection: orderData.to_customer_delivery != null
            ? DeliveryDirection.ToCustomer
            : DeliveryDirection.FromCustomer,
        deliveryOrderId: orderData.to_customer_delivery_id != null
            ? orderData.to_customer_delivery_id
            : orderData.from_customer_delivery_id,
        driverLocation: null,
        dropOffLocation: orderData.to_customer_delivery != null
            ? MezLocation.fromHasura(
                orderData.customer_location_gps!, orderData.customer_address!)
            : MezLocation.fromHasura(orderData.store.details!.location.gps,
                orderData.store.details!.location.address),
      );
    }
    return null;
  });
  //////
}

Future<int?> add_laundry_order_category(
    {required int categoryId,
    required int orderId,
    required double weightInKilo}) async {
  QueryResult<Mutation$insertLaundryOrderCategory> res =
      await _hasuraDb.graphQLClient.mutate$insertLaundryOrderCategory(
    Options$Mutation$insertLaundryOrderCategory(
      variables: Variables$Mutation$insertLaundryOrderCategory(
        data: Input$laundry_order_category_insert_input(
          order_id: orderId,
          category_id: categoryId,
          weight_in_kilo: weightInKilo,
        ),
      ),
    ),
  );
  if (res.parsedData?.insert_laundry_order_category_one == null) {
    throwError(res.exception);
  } else {
    return res.parsedData!.insert_laundry_order_category_one!.id;
  }
  return null;
}

Future<int?> update_laundry_order_category(
    {required LaundryOrderCostLineItem cat, required int orderId}) async {
  QueryResult<Mutation$updateLaundryOrderCategory> res =
      await _hasuraDb.graphQLClient.mutate$updateLaundryOrderCategory(
    Options$Mutation$updateLaundryOrderCategory(
      variables: Variables$Mutation$updateLaundryOrderCategory(
          categoryId: cat.id,
          data: Input$laundry_order_category_set_input(
            weight_in_kilo: cat.weight.toDouble(),
          )),
    ),
  );
  if (res.parsedData?.update_laundry_order_category == null) {
    throwError(res.exception);
  } else {
    return res.parsedData!.update_laundry_order_category!.returning.first.id;
  }
  return null;
}

Future<int?> delete_laundry_order_category({required int catId}) async {
  QueryResult<Mutation$deleteLaundryOrderCategory> res =
      await _hasuraDb.graphQLClient.mutate$deleteLaundryOrderCategory(
    Options$Mutation$deleteLaundryOrderCategory(
      variables: Variables$Mutation$deleteLaundryOrderCategory(
        categoryId: catId,
      ),
    ),
  );
  mezDbgPrint("Data $catId 👋👋👋👋👋👋👋👋👋👋👋👋👋👋");
  mezDbgPrint(res.data);
  if (res.parsedData?.delete_laundry_order_category == null) {
    throwError(res.exception);
  } else {
    return res.parsedData!.delete_laundry_order_category!.returning.first.id;
  }
  return null;
}

Future<void> set_laundry_est_ready_time(
    {required int orderId,
    required int deliveryOrderId,
    required DateTime time}) async {
  final QueryResult<Mutation$setLaundryOrderEstReadyTime> response =
      await _hasuraDb.graphQLClient.mutate$setLaundryOrderEstReadyTime(
    Options$Mutation$setLaundryOrderEstReadyTime(
      variables: Variables$Mutation$setLaundryOrderEstReadyTime(
          orderId: orderId,
          time: time.toUtc().toString(),
          deliveryOrderId: deliveryOrderId),
    ),
  );
  if (response.parsedData?.update_laundry_order_by_pk == null ||
      response.parsedData?.update_delivery_order_by_pk == null) {
    throw Exception(
        "🚨set fod est ready time exceptions => ${response.exception}");
  }
}
