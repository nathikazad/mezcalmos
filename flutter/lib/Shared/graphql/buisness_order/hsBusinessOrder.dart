import 'package:get/get.dart';
import 'package:graphql/client.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/__generated/schema.graphql.dart';
import 'package:mezcalmos/Shared/graphql/buisness_order/__generated/business_order.graphql.dart';
import 'package:mezcalmos/Shared/graphql/buisness_order/models/MinimumBsOrder.dart';
import 'package:mezcalmos/Shared/graphql/hasuraTypes.dart';
import 'package:mezcalmos/Shared/helpers/BusinessHelpers/BusinessItemHelpers.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';

HasuraDb _db = Get.find<HasuraDb>();
Future<List<MinimalBsOrder>?> get_bs_orders(
    {required int businessId,
    required BusinessOrderRequestStatus status,
    bool withCache = true}) async {
  QueryResult<Query$getBsOrders> res = await _db.graphQLClient
      .query$getBsOrders(Options$Query$getBsOrders(
          fetchPolicy:
              withCache ? FetchPolicy.cacheFirst : FetchPolicy.networkOnly,
          variables: Variables$Query$getBsOrders(
              busnessId: businessId, status: status.toFirebaseFormatString())));
  if (res.hasException || res.parsedData?.business_order_request == null) {
    throw res.exception!;
  }
  mezDbgPrint(res.data);
  return res.parsedData!.business_order_request
      .map<MinimalBsOrder>((Query$getBsOrders$business_order_request data) {
    return MinimalBsOrder(
      id: data.id,
      customerImage: data.customer.user.image!,
      customerName: data.customer.user.name!,
      time: DateTime.parse(data.order_time),
      cost: data.cost?.toDouble() ?? 0,
      numberOfItems: data.items.length,
    );
  }).toList();
}

Stream<List<MinimalBsOrder>?> listen_on_bs_orders({
  required int businessId,
  required BusinessOrderRequestStatus status,
}) {
  return _db.graphQLClient
      .subscribe$listenToBsOrders(Options$Subscription$listenToBsOrders(
          variables: Variables$Subscription$listenToBsOrders(
              busnessId: businessId, status: status.toFirebaseFormatString())))
      .map((QueryResult<Subscription$listenToBsOrders> event) {
    if (event.hasException) {
      throw event.exception!;
    }
    if (Get.find<HasuraDb>().dataConsumption.containsKey("listenToBsOrders")) {
      Get.find<HasuraDb>().dataConsumption["listenToBsOrders"]![0] +=
          event.data?.toString().length ?? 0;
      Get.find<HasuraDb>().dataConsumption["listenToBsOrders"]![1] += 1;
    } else {
      Get.find<HasuraDb>().dataConsumption["listenToBsOrders"] = <int>[
        event.data?.toString().length ?? 0,
        1
      ];
    }
    return event.parsedData!.business_order_request.map<MinimalBsOrder>(
        (Subscription$listenToBsOrders$business_order_request data) {
      return MinimalBsOrder(
        id: data.id,
        customerImage: data.customer.user.image!,
        customerName: data.customer.user.name!,
        time: DateTime.parse(data.order_time),
        cost: data.cost?.toDouble() ?? 0,
        numberOfItems: data.items.length,
      );
    }).toList();
  });
}

Future<List<MinimumBusinessItem>> get_upcoming_rental_orders_items(
    {required int businessId,
    required int offset,
    required int limit,
    bool withCache = true}) async {
  QueryResult<Query$getBsRentalUpcomingOrdersItems> res =
      await _db.graphQLClient.query$getBsRentalUpcomingOrdersItems(
          Options$Query$getBsRentalUpcomingOrdersItems(
              fetchPolicy:
                  withCache ? FetchPolicy.cacheFirst : FetchPolicy.networkOnly,
              variables: Variables$Query$getBsRentalUpcomingOrdersItems(
                  rentalBusinessId: businessId, offset: offset, limit: limit)));
  if (res.hasException || res.parsedData?.business_order_request_item == null) {
    throw res.exception!;
  }
  String mapImage(
      Query$getBsRentalUpcomingOrdersItems$business_order_request_item data) {
    if (data.rental != null) {
      return data.rental!.details.image!.first.toString();
    } else if (data.home != null) {
      return data.home!.details!.image!.first.toString();
    } else if (data.service != null) {
      return data.service!.details.image!.first.toString();
    } else if (data.product != null) {
      return data.product!.details.image!.first.toString();
    } else if (data.event != null) {
      return data.event!.details.image!.first.toString();
    } else {
      return "";
    }
  }

  Map<Language, String> mapNames(
      Query$getBsRentalUpcomingOrdersItems$business_order_request_item data) {
    if (data.rental != null) {
      return toLanguageMap(
          translations: data.rental!.details.name.translations);
    } else if (data.home != null) {
      return toLanguageMap(translations: data.home!.details!.name.translations);
    } else if (data.service != null) {
      return toLanguageMap(
          translations: data.service!.details.name.translations);
    } else if (data.product != null) {
      return toLanguageMap(
          translations: data.product!.details.name.translations);
    } else if (data.event != null) {
      return toLanguageMap(translations: data.event!.details.name.translations);
    } else {
      return toLanguageMap(translations: []);
    }
  }

  mezDbgPrint(res.data);
  return res.parsedData!.business_order_request_item.map<MinimumBusinessItem>(
      (Query$getBsRentalUpcomingOrdersItems$business_order_request_item data) {
    return MinimumBusinessItem(
      orderId: data.order_request_id,
      time: data.product != null ? DateTime.now() : DateTime.parse(data.time!),
      parameters: businessItemParamsFromData(data.parameters),
      cost: data.cost.toDouble(),
      customerName: data.order.customer.user.name!,
      image: mapImage(data),
      name: mapNames(data),
    );
  }).toList();
}

Future<List<MinimumBusinessItem>> get_past_rental_orders_items(
    {required int businessId,
    required int offset,
    required int limit,
    bool withCache = true}) async {
  QueryResult<Query$getBsRentalPastOrdersItems> res = await _db.graphQLClient
      .query$getBsRentalPastOrdersItems(
          Options$Query$getBsRentalPastOrdersItems(
              fetchPolicy:
                  withCache ? FetchPolicy.cacheFirst : FetchPolicy.networkOnly,
              variables: Variables$Query$getBsRentalPastOrdersItems(
                  rentalBusinessId: businessId, offset: offset, limit: limit)));
  if (res.hasException || res.parsedData?.business_order_request_item == null) {
    throw res.exception!;
  }
  String mapImage(
      Query$getBsRentalPastOrdersItems$business_order_request_item data) {
    if (data.rental != null) {
      return data.rental!.details.image!.first.toString();
    } else if (data.home != null) {
      return data.home!.details!.image!.first.toString();
    } else if (data.service != null) {
      return data.service!.details.image!.first.toString();
    } else if (data.product != null) {
      return data.product!.details.image!.first.toString();
    } else if (data.event != null) {
      return data.event!.details.image!.first.toString();
    } else {
      return "";
    }
  }

  Map<Language, String> mapNames(
      Query$getBsRentalPastOrdersItems$business_order_request_item data) {
    if (data.rental != null) {
      return toLanguageMap(
          translations: data.rental!.details.name.translations);
    } else if (data.home != null) {
      return toLanguageMap(translations: data.home!.details!.name.translations);
    } else if (data.service != null) {
      return toLanguageMap(
          translations: data.service!.details.name.translations);
    } else if (data.product != null) {
      return toLanguageMap(
          translations: data.product!.details.name.translations);
    } else if (data.event != null) {
      return toLanguageMap(translations: data.event!.details.name.translations);
    } else {
      return toLanguageMap(translations: []);
    }
  }

  mezDbgPrint(res.data);
  return res.parsedData!.business_order_request_item.map<MinimumBusinessItem>(
      (Query$getBsRentalPastOrdersItems$business_order_request_item data) {
    return MinimumBusinessItem(
      orderId: data.order_request_id,
      time: data.product != null ? DateTime.now() : DateTime.parse(data.time!),
      parameters: businessItemParamsFromData(data.parameters),
      cost: data.cost.toDouble(),
      customerName: data.order.customer.user.name!,
      image: mapImage(data),
      name: mapNames(data),
    );
  }).toList();
}

Future<void> update_bs_order_item(
    {required int id, required BusinessOrderItem item}) async {
  QueryResult<Mutation$updateBsOrderItem> res =
      await _db.graphQLClient.mutate$updateBsOrderItem(
    Options$Mutation$updateBsOrderItem(
      variables: Variables$Mutation$updateBsOrderItem(
        id: id,
        data: Input$business_order_request_item_set_input(
            time: item.time,
            parameters: item.parameters.toFirebaseFormattedJson(),
            cost: item.cost.toDouble(),
            available: item.available),
      ),
    ),
  );
  if (res.hasException) {
    throw res.exception!;
  }
  mezDbgPrint(res.data);
}
