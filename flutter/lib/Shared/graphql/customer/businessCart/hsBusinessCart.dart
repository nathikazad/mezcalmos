import 'package:get/get.dart';
import 'package:graphql/src/core/policies.dart';
import 'package:graphql/src/core/query_result.dart';
import 'package:mezcalmos/CustomerApp/models/BusinessCartItem.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/__generated/schema.graphql.dart';
import 'package:mezcalmos/Shared/graphql/customer/businessCart/__generated/business_cart.graphql.dart';
import 'package:mezcalmos/Shared/graphql/hasuraTypes.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Business/Business.dart';
import 'package:mezcalmos/Shared/models/Utilities/PaymentInfo.dart';
import 'package:mezcalmos/Shared/models/Utilities/Schedule.dart';

final HasuraDb _hasuraDb = Get.find<HasuraDb>();

Future<CustBusinessCart?> get_business_cart({required int customerId}) async {
  final QueryResult<Query$getBusinessCart> getBusinessCartResp =
      await _hasuraDb.graphQLClient.query$getBusinessCart(
    Options$Query$getBusinessCart(
      fetchPolicy: FetchPolicy.noCache,
      variables: Variables$Query$getBusinessCart(customer_id: customerId),
    ),
  );

  if (getBusinessCartResp.parsedData?.business_cart == null) {
    throw Exception(
        "[🛑] get_customer_cart :: exception ===> ${getBusinessCartResp.exception}!");
  }

  final Query$getBusinessCart$business_cart? cartData =
      getBusinessCartResp.parsedData?.business_cart.isNotEmpty == true
          ? getBusinessCartResp.parsedData?.business_cart.first
          : null;

  if (cartData == null) {
    return null;
  }

  return CustBusinessCart(
    customerId: cartData.customer_id,
    businessId: cartData.business_id?.toInt(),
    cost: cartData.cost ?? 0,
    items: cartData.items
        .map(
          (Query$getBusinessCart$business_cart$items data) => BusinessCartItem(
            id: data.id,
            itemId: data.item_id,
            cost: data.cost,
            time: data.time,
            offeringType: data.offering_type.toOfferingType(),
            parameters: BusinessItemParameters(
              guests: data.parameters?["guests"],
              numberOfUnits: data.parameters?["numberOfUnits"],
              previousCost: data.parameters?["previousCost"],
              previoustime: data.parameters?["previoustime"],
              roomType: data.parameters?["roomType"],
              timeUnit:
                  data.parameters?["timeUnit"]?.toString().toTimeUnit() ?? null,
            ),
            home: data.home != null
                ? HomeWithBusinessCard(
                    business: BusinessCard(
                      id: data.home!.business!.details.id,
                      name: data.home!.business!.details.name,
                      currency:
                          data.home!.business!.details.currency.toCurrency(),
                      acceptedPayments: PaymentInfo.fromData(
                              stripeInfo: {},
                              acceptedPayments: data
                                  .home!.business!.details.accepted_payments)
                          .acceptedPayments,
                      detailsId: data.home!.business!.details.id,
                      image: data.home!.business!.details.image,
                    ),
                    home: Home(
                      id: data.home!.id,
                      bathrooms: data.home!.bathrooms,
                      bedrooms: data.home!.bedrooms,
                      gpsLocation: data.home!.location?.gps != null
                          ? Location(
                              lat: data.home!.location!.gps.latitude,
                              lng: data.home!.location!.gps.longitude,
                              address: data.home!.location!.address,
                            )
                          : null,
                      location: HomeLocation(
                        name: data.home!.location!.name,
                        location: Location(
                          lat: data.home!.location!.gps.latitude,
                          lng: data.home!.location!.gps.longitude,
                          address: data.home!.location!.address,
                        ),
                      ),
                      category1:
                          data.home!.details!.category1.toHomeCategory1(),
                      availableFor:
                          data.home!.available_for.toHomeAvailabilityOption(),
                      details: BusinessItemDetails(
                        cost: constructBusinessServiceCost(
                            data.home!.details!.cost),
                        additionalParameters:
                            data.home!.details!.additional_parameters,
                        id: data.home!.details!.id,
                        nameId: data.home!.details!.name_id,
                        descriptionId: data.home!.details!.description_id,
                        name: toLanguageMap(
                            translations:
                                data.home!.details!.name.translations),
                        position: data.home!.details!.position,
                        businessId: data.home!.business!.details.id,
                        available: data.home!.details!.available,
                        image: data.home!.details!.image
                                ?.map<String>((e) => e.toString())
                                .toList() ??
                            [],
                      ),
                    ),
                  )
                : null,
            rental: data.rental != null
                ? RentalWithBusinessCard(
                    business: BusinessCard(
                      id: data.rental!.business.details.id,
                      name: data.rental!.business.details.name,
                      currency:
                          data.rental!.business.details.currency.toCurrency(),
                      acceptedPayments: PaymentInfo.fromData(
                              stripeInfo: {},
                              acceptedPayments: data
                                  .rental!.business.details.accepted_payments)
                          .acceptedPayments,
                      detailsId: data.rental!.business.details.id,
                      image: data.rental!.business.details.image,
                    ),
                    rental: Rental(
                      id: data.rental!.id,
                      category1:
                          data.rental!.details.category1.toRentalCategory1(),
                      details: BusinessItemDetails(
                        id: data.rental!.details.id,
                        nameId: data.rental!.details.name_id,
                        descriptionId: data.rental!.details.description_id,
                        name: toLanguageMap(
                            translations:
                                data.rental!.details.name.translations),
                        position: data.rental!.details.position,
                        businessId: data.rental!.business.details.id,
                        available: data.rental!.details.available,
                        image: data.rental!.details.image
                                ?.map<String>((e) => e.toString())
                                .toList() ??
                            [],
                        cost: constructBusinessServiceCost(
                            data.rental!.details.cost),
                        additionalParameters:
                            data.rental!.details.additional_parameters,
                      ),
                    ))
                : null,
            event: data.event != null
                ? EventWithBusinessCard(
                    business: BusinessCard(
                      id: data.event!.business.details.id,
                      name: data.event!.business.details.name,
                      currency:
                          data.event!.business.details.currency.toCurrency(),
                      acceptedPayments: PaymentInfo.fromData(
                              stripeInfo: {},
                              acceptedPayments: data
                                  .event!.business.details.accepted_payments)
                          .acceptedPayments,
                      detailsId: data.event!.business.details.id,
                      image: data.event!.business.details.image,
                    ),
                    event: Event(
                      id: data.event!.id,
                      scheduleType: data.event!.schedule_type.toScheduleType(),
                      startsAt: data.event!.starts_at,
                      endsAt: data.event!.ends_at,
                      schedule: (data.event!.schedule != null)
                          ? scheduleFromData(data.event!.schedule)
                          : null,
                      category1:
                          data.event!.details.category1.toEventCategory1(),
                      details: BusinessItemDetails(
                        id: data.event!.details.id,
                        nameId: data.event!.details.name_id,
                        descriptionId: data.event!.details.description_id,
                        name: toLanguageMap(
                            translations:
                                data.event!.details.name.translations),
                        position: data.event!.details.position,
                        businessId: data.event!.business.details.id,
                        available: data.event!.details.available,
                        image: data.event!.details.image
                                ?.map<String>((e) => e.toString())
                                .toList() ??
                            [],
                        cost: constructBusinessServiceCost(
                            data.event!.details.cost),
                        additionalParameters:
                            data.event!.details.additional_parameters,
                      ),
                    ),
                  )
                : null,
            service: data.service != null
                ? ServiceWithBusinessCard(
                    business: BusinessCard(
                      id: data.service!.business.details.id,
                      name: data.service!.business.details.name,
                      currency:
                          data.service!.business.details.currency.toCurrency(),
                      acceptedPayments: PaymentInfo.fromData(
                              stripeInfo: {},
                              acceptedPayments: data
                                  .service!.business.details.accepted_payments)
                          .acceptedPayments,
                      detailsId: data.service!.business.details.id,
                      image: data.service!.business.details.image,
                    ),
                    service: Service(
                      id: data.service!.id,
                      category1:
                          data.service!.details.category1.toServiceCategory1(),
                      details: BusinessItemDetails(
                        id: data.service!.details.id,
                        nameId: data.service!.details.name_id,
                        descriptionId: data.service!.details.description_id,
                        name: toLanguageMap(
                            translations:
                                data.service!.details.name.translations),
                        businessId: data.service!.business.details.id,
                        available: data.service!.details.available,
                        image: data.service!.details.image
                                ?.map<String>((e) => e.toString())
                                .toList() ??
                            [],
                        cost: constructBusinessServiceCost(
                            data.service!.details.cost),
                        additionalParameters:
                            data.service!.details.additional_parameters,
                      ),
                    ),
                  )
                : null,
            product: data.product != null
                ? ProductWithBusinessCard(
                    business: BusinessCard(
                      id: data.product!.business.details.id,
                      name: data.product!.business.details.name,
                      currency:
                          data.product!.business.details.currency.toCurrency(),
                      acceptedPayments: PaymentInfo.fromData(
                              stripeInfo: {},
                              acceptedPayments: data
                                  .product!.business.details.accepted_payments)
                          .acceptedPayments,
                      detailsId: data.product!.business.details.id,
                      image: data.product!.business.details.image,
                    ),
                    product: Product(
                      id: data.product!.id,
                      category1:
                          data.product!.details.category1.toProductCategory1(),
                      details: BusinessItemDetails(
                        id: data.product!.details.id,
                        nameId: data.product!.details.name_id,
                        descriptionId: data.product!.details.description_id,
                        name: toLanguageMap(
                            translations:
                                data.product!.details.name.translations),
                        businessId: data.product!.business.details.id,
                        available: data.product!.details.available,
                        image: data.product!.details.image
                                ?.map<String>((e) => e.toString())
                                .toList() ??
                            [],
                        cost: constructBusinessServiceCost(
                            data.product!.details.cost),
                        additionalParameters:
                            data.product!.details.additional_parameters,
                      ),
                    ),
                  )
                : null,
          ),
        )
        .toList(),
  );
}

Future<int?> create_business_cart({int? businessId}) async {
  final QueryResult<Mutation$insert_business_cart> res =
      await _hasuraDb.graphQLClient.mutate$insert_business_cart(
    Options$Mutation$insert_business_cart(
      fetchPolicy: FetchPolicy.noCache,
      variables: Variables$Mutation$insert_business_cart(
        cart: Input$business_cart_insert_input(
          customer_id: Get.find<AuthController>().hasuraUserId!,
          business_id: businessId,
        ),
      ),
    ),
  );

  if (res.parsedData?.insert_business_cart_one == null) {
    throw Exception(
        "🛑🛑🛑🛑 create_business_cart :: exception ===> ${res.exception}!");
  } else {
    mezDbgPrint(
        "🚨 graphql::create_business_cart::success :: ${res.parsedData!.insert_business_cart_one!.business_id}");
    return res.parsedData!.insert_business_cart_one!.business_id;
  }
}

extension HasuraBusinessOrderItem on BusinessCartItem {
  Input$business_cart_item_insert_input toHasuraInputCartItem() {
    return Input$business_cart_item_insert_input(
      cost: cost.toDouble(),
      customer_id: Get.find<AuthController>().hasuraUserId!,
      item_id: itemId.toInt(),
      offering_type: offeringType.toFirebaseFormatString(),
      time: time,
      parameters: BusinessItemParameters(
        guests: parameters.guests,
        timeUnit: parameters.timeUnit,
        numberOfUnits: parameters.numberOfUnits,
        roomType: parameters.roomType,
        previousCost: parameters.previousCost,
        previoustime: parameters.previoustime,
      ).toFirebaseFormattedJson(),
    );
  }
}

Future<int> add_item_to_business_cart(
    {required BusinessCartItem cartItem}) async {
  final QueryResult<Mutation$addItemToBusinessCart> addItemResult =
      await _hasuraDb.graphQLClient.mutate$addItemToBusinessCart(
    Options$Mutation$addItemToBusinessCart(
      fetchPolicy: FetchPolicy.noCache,
      variables: Variables$Mutation$addItemToBusinessCart(
          item: cartItem.toHasuraInputCartItem()),
    ),
  );

  if (addItemResult.parsedData?.insert_business_cart_item_one?.id == null) {
    throw Exception(
        "🚨 graphql::add_item_to_cart::exception :: ${addItemResult.exception}");
  } else {
    mezDbgPrint(
        "🚨 graphql::add_item_to_cart::success :: ${addItemResult.parsedData!.insert_business_cart_item_one!.id}");
    return addItemResult.parsedData!.insert_business_cart_item_one!.id;
  }
}

Future<bool> update_item_to_business_cart(
    {required BusinessCartItem cartItem}) async {
  final QueryResult<Mutation$update_business_cart_item> addItemResult =
      await _hasuraDb.graphQLClient.mutate$update_business_cart_item(
    Options$Mutation$update_business_cart_item(
      fetchPolicy: FetchPolicy.noCache,
      variables: Variables$Mutation$update_business_cart_item(
        id: cartItem.id!.toInt(),
        cost: cartItem.cost.toDouble(),
        parameters: cartItem.parameters.toFirebaseFormattedJson(),
        time: cartItem.time.toString(),
      ),
    ),
  );

  if (addItemResult.parsedData?.update_business_cart_item_by_pk == null) {
    throw Exception(
        "🚨 graphql::update_item_to_business_cart::exception :: ${addItemResult.exception}");
  } else {
    mezDbgPrint(
        "🚨 graphql::update_item_to_business_cart::success :: ${addItemResult.parsedData!.update_business_cart_item_by_pk}");
    return true;
  }
}

Future<int> delete_item_to_business_cart({required int itemId}) async {
  final QueryResult<Mutation$delete_business_cart_item> deleteItemResult =
      await _hasuraDb.graphQLClient.mutate$delete_business_cart_item(
    Options$Mutation$delete_business_cart_item(
      fetchPolicy: FetchPolicy.noCache,
      variables: Variables$Mutation$delete_business_cart_item(
        $_id: itemId,
      ),
    ),
  );

  if (deleteItemResult.parsedData?.delete_business_cart_item?.affected_rows ==
      null) {
    throw Exception(
        "🚨 graphql::delete_item_to_business_cart::exception :: ${deleteItemResult.exception}");
  } else {
    mezDbgPrint(
        "🚨 graphql::delete_item_to_business_cart::success :: ${deleteItemResult.parsedData!.delete_business_cart_item!.affected_rows}");
    return deleteItemResult
        .parsedData!.delete_business_cart_item!.affected_rows;
  }
}

Future<int> set_cart_business_id({
  required int? business_id,
  required int customer_id,
}) async {
  final QueryResult<Mutation$set_cart_business_id> _cart =
      await _hasuraDb.graphQLClient.mutate$set_cart_business_id(
    Options$Mutation$set_cart_business_id(
      fetchPolicy: FetchPolicy.noCache,
      variables: Variables$Mutation$set_cart_business_id(
        business_id: business_id,
        customer_id: customer_id,
      ),
    ),
  );
  mezDbgPrint("[🛑] called :: set_cart_business_id :: data :: ${_cart.data}");

  if (_cart.parsedData?.update_business_cart_by_pk == null ||
      _cart.parsedData!.update_business_cart_by_pk?.business_id == null) {
    throw Exception(
        "[🛑] called :: set_cart_business_id :: exception :: ${_cart.hasException} ${_cart.exception}");
  } else {
    final int newRestId =
        _cart.parsedData!.update_business_cart_by_pk!.business_id!;
    mezDbgPrint("[🛑] called :: set_cart_business_id :: success :: $newRestId");
    return newRestId;
  }
}

Future<int> update_product_item_count({
  required int id,
  required BusinessItemParameters parameters,
  required double cost,
}) async {
  final QueryResult<Mutation$update_product_item_count> _cart =
      await _hasuraDb.graphQLClient.mutate$update_product_item_count(
    Options$Mutation$update_product_item_count(
      fetchPolicy: FetchPolicy.networkOnly,
      variables: Variables$Mutation$update_product_item_count(
        id: id,
        parameters: parameters.toFirebaseFormattedJson(),
        cost: cost,
      ),
    ),
  );
  mezDbgPrint(
      "[🛑] called :: update_product_item_count :: data :: ${_cart.data}");

  if (_cart.parsedData!.update_business_cart_item?.affected_rows == null) {
    throw Exception(
        "[🛑] called :: update_product_item_count :: exception :: ${_cart.hasException} ${_cart.exception}");
  } else {
    final int newRestId =
        _cart.parsedData!.update_business_cart_item!.affected_rows;
    mezDbgPrint(
        "[🛑] called :: update_product_item_count :: success :: $newRestId");
    return newRestId;
  }
}

Stream<List<CustBusinessCart>?> listen_on_business_order_request(
    {required int customerId}) {
  return _hasuraDb.graphQLClient
      .subscribe$listen_on_business_order_request(
    Options$Subscription$listen_on_business_order_request(
      fetchPolicy: FetchPolicy.noCache,
      variables: Variables$Subscription$listen_on_business_order_request(
        $_id: customerId,
      ),
    ),
  )
      .map(
    (QueryResult<Subscription$listen_on_business_order_request> cart) {
      if (cart.hasException) {
        throw Exception(
            "🛑🛑🛑🛑 listen_on_business_order_request :: exception ===> ${cart.exception}!");
      } else {
        mezDbgPrint(
            "🚨 graphql::listen_on_business_order_request::success :: ${cart.data}");
        final Subscription$listen_on_business_order_request$business_order_request?
            parsedCart =
            (cart.parsedData?.business_order_request.isNotEmpty == true)
                ? cart.parsedData?.business_order_request.first
                : null;
        if (parsedCart != null) {
          final List<
                  Subscription$listen_on_business_order_request$business_order_request>
              _res = cart.parsedData!.business_order_request;
          return _res
              .map((e) => CustBusinessCart(
                    id: e.id,
                    customerId: e.customer_id,
                    businessId: e.business_id,
                    cost: e.cost ?? 0,
                    cancellationTime: e.cancellation_time,
                    status: e.status.toBusinessOrderRequestStatus(),
                    chatId: e.chat_id,
                    items: e.items
                        .map(
                          (data) => BusinessCartItem(
                            id: data.id,
                            itemId: data.item_id,
                            cost: data.cost ?? 0,
                            time: data.time,
                            offeringType: data.offering_type.toOfferingType(),
                            parameters: BusinessItemParameters(
                              guests: data.parameters?["guests"],
                              numberOfUnits: data.parameters?["numberOfUnits"],
                              previousCost: data.parameters?["previousCost"],
                              roomType: data.parameters?["roomType"],
                              previoustime: data.parameters?["previoustime"],
                              timeUnit: data.parameters?["timeUnit"]
                                      ?.toString()
                                      .toTimeUnit() ??
                                  null,
                            ),
                            home: data.home != null
                                ? HomeWithBusinessCard(
                                    business: BusinessCard(
                                      id: data.home!.business!.details.id,
                                      name: data.home!.business!.details.name,
                                      currency: data
                                          .home!.business!.details.currency
                                          .toCurrency(),
                                      acceptedPayments: PaymentInfo.fromData(
                                              stripeInfo: {},
                                              acceptedPayments: data
                                                  .home!
                                                  .business!
                                                  .details
                                                  .accepted_payments)
                                          .acceptedPayments,
                                      detailsId:
                                          data.home!.business!.details.id,
                                      image: data.home!.business!.details.image,
                                    ),
                                    home: Home(
                                      location: HomeLocation(
                                        name: data.home!.location!.name,
                                        location: Location(
                                          lat:
                                              data.home!.location!.gps.latitude,
                                          lng: data
                                              .home!.location!.gps.longitude,
                                          address: data.home!.location!.address,
                                        ),
                                      ),
                                      category1: data.home!.details!.category1
                                          .toHomeCategory1(),
                                      availableFor: data.home!.available_for
                                          .toHomeAvailabilityOption(),
                                      details: BusinessItemDetails(
                                        cost: constructBusinessServiceCost(
                                            data.home!.details!.cost),
                                        additionalParameters: data.home!
                                            .details!.additional_parameters,
                                        id: data.home!.details!.id,
                                        nameId: data.home!.details!.name_id,
                                        descriptionId:
                                            data.home!.details!.description_id,
                                        name: toLanguageMap(
                                            translations: data.home!.details!
                                                .name.translations),
                                        position: data.home!.details!.position,
                                        businessId:
                                            data.home!.business!.details.id,
                                        available:
                                            data.home!.details!.available,
                                        image: data.home!.details!.image
                                                ?.map<String>(
                                                    (e) => e.toString())
                                                .toList() ??
                                            [],
                                      ),
                                    ),
                                  )
                                : null,
                            rental: data.rental != null
                                ? RentalWithBusinessCard(
                                    business: BusinessCard(
                                      id: data.rental!.business.details.id,
                                      name: data.rental!.business.details.name,
                                      currency: data
                                          .rental!.business.details.currency
                                          .toCurrency(),
                                      acceptedPayments: PaymentInfo.fromData(
                                              stripeInfo: {},
                                              acceptedPayments: data
                                                  .rental!
                                                  .business
                                                  .details
                                                  .accepted_payments)
                                          .acceptedPayments,
                                      detailsId:
                                          data.rental!.business.details.id,
                                      image:
                                          data.rental!.business.details.image,
                                    ),
                                    rental: Rental(
                                      category1: data.rental!.details.category1
                                          .toRentalCategory1(),
                                      details: BusinessItemDetails(
                                        id: data.rental!.details.id,
                                        nameId: data.rental!.details.name_id,
                                        descriptionId:
                                            data.rental!.details.description_id,
                                        name: toLanguageMap(
                                            translations: data.rental!.details
                                                .name.translations),
                                        position: data.rental!.details.position,
                                        businessId:
                                            data.rental!.business.details.id,
                                        available:
                                            data.rental!.details.available,
                                        image: data.rental!.details.image
                                                ?.map<String>(
                                                    (e) => e.toString())
                                                .toList() ??
                                            [],
                                        cost: constructBusinessServiceCost(
                                            data.rental!.details.cost),
                                        additionalParameters: data.rental!
                                            .details.additional_parameters,
                                      ),
                                    ))
                                : null,
                            event: data.event != null
                                ? EventWithBusinessCard(
                                    business: BusinessCard(
                                      id: data.event!.business.details.id,
                                      name: data.event!.business.details.name,
                                      currency: data
                                          .event!.business.details.currency
                                          .toCurrency(),
                                      acceptedPayments: PaymentInfo.fromData(
                                              stripeInfo: {},
                                              acceptedPayments: data
                                                  .event!
                                                  .business
                                                  .details
                                                  .accepted_payments)
                                          .acceptedPayments,
                                      detailsId:
                                          data.event!.business.details.id,
                                      image: data.event!.business.details.image,
                                    ),
                                    event: Event(
                                      scheduleType: data.event!.schedule_type
                                          .toScheduleType(),
                                      startsAt: data.event!.starts_at,
                                      endsAt: data.event!.ends_at,
                                      schedule: (data.event!.schedule != null)
                                          ? scheduleFromData(
                                              data.event!.schedule)
                                          : null,
                                      category1: data.event!.details.category1
                                          .toEventCategory1(),
                                      details: BusinessItemDetails(
                                        id: data.event!.details.id,
                                        nameId: data.event!.details.name_id,
                                        descriptionId:
                                            data.event!.details.description_id,
                                        name: toLanguageMap(
                                            translations: data.event!.details
                                                .name.translations),
                                        position: data.event!.details.position,
                                        businessId:
                                            data.event!.business.details.id,
                                        available:
                                            data.event!.details.available,
                                        image: data.event!.details.image
                                                ?.map<String>(
                                                    (e) => e.toString())
                                                .toList() ??
                                            [],
                                        cost: constructBusinessServiceCost(
                                            data.event!.details.cost),
                                        additionalParameters: data.event!
                                            .details.additional_parameters,
                                      ),
                                    ),
                                  )
                                : null,
                            service: data.service != null
                                ? ServiceWithBusinessCard(
                                    business: BusinessCard(
                                      id: data.service!.business.details.id,
                                      name: data.service!.business.details.name,
                                      currency: data
                                          .service!.business.details.currency
                                          .toCurrency(),
                                      acceptedPayments: PaymentInfo.fromData(
                                              stripeInfo: {},
                                              acceptedPayments: data
                                                  .service!
                                                  .business
                                                  .details
                                                  .accepted_payments)
                                          .acceptedPayments,
                                      detailsId:
                                          data.service!.business.details.id,
                                      image:
                                          data.service!.business.details.image,
                                    ),
                                    service: Service(
                                      category1: data.service!.details.category1
                                          .toServiceCategory1(),
                                      details: BusinessItemDetails(
                                        id: data.service!.details.id,
                                        nameId: data.service!.details.name_id,
                                        descriptionId: data
                                            .service!.details.description_id,
                                        name: toLanguageMap(
                                            translations: data.service!.details
                                                .name.translations),
                                        businessId:
                                            data.service!.business.details.id,
                                        available:
                                            data.service!.details.available,
                                        image: data.service!.details.image
                                                ?.map<String>(
                                                    (e) => e.toString())
                                                .toList() ??
                                            [],
                                        cost: constructBusinessServiceCost(
                                            data.service!.details.cost),
                                        additionalParameters: data.service!
                                            .details.additional_parameters,
                                      ),
                                    ),
                                  )
                                : null,
                            product: data.product != null
                                ? ProductWithBusinessCard(
                                    business: BusinessCard(
                                      id: data.product!.business.details.id,
                                      name: data.product!.business.details.name,
                                      currency: data
                                          .product!.business.details.currency
                                          .toCurrency(),
                                      acceptedPayments: PaymentInfo.fromData(
                                              stripeInfo: {},
                                              acceptedPayments: data
                                                  .product!
                                                  .business
                                                  .details
                                                  .accepted_payments)
                                          .acceptedPayments,
                                      detailsId:
                                          data.product!.business.details.id,
                                      image:
                                          data.product!.business.details.image,
                                    ),
                                    product: Product(
                                      category1: data.product!.details.category1
                                          .toProductCategory1(),
                                      details: BusinessItemDetails(
                                        id: data.product!.details.id,
                                        nameId: data.product!.details.name_id,
                                        descriptionId: data
                                            .product!.details.description_id,
                                        name: toLanguageMap(
                                            translations: data.product!.details
                                                .name.translations),
                                        businessId:
                                            data.product!.business.details.id,
                                        available:
                                            data.product!.details.available,
                                        image: data.product!.details.image
                                                ?.map<String>(
                                                    (e) => e.toString())
                                                .toList() ??
                                            [],
                                        cost: constructBusinessServiceCost(
                                            data.product!.details.cost),
                                        additionalParameters: data.product!
                                            .details.additional_parameters,
                                      ),
                                    ),
                                  )
                                : null,
                          ),
                        )
                        .toList(),
                  ))
              .toList();
        } else {
          return [];
        }
      }
    },
  );
}
