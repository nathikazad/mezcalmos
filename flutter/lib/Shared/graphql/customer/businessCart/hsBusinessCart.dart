import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:get/get.dart';
import 'package:graphql/src/core/policies.dart';
import 'package:graphql/src/core/query_result.dart';
import 'package:mezcalmos/Shared/graphql/customer/businessCart/__generated/business_cart.graphql.dart';
import 'package:mezcalmos/Shared/graphql/hasuraTypes.dart';
import 'package:mezcalmos/Shared/models/Services/Business/Business.dart';
import 'package:mezcalmos/Shared/models/Utilities/Schedule.dart';
import 'package:mezcalmos/Shared/graphql/__generated/schema.graphql.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/CustomerApp/models/BusinessCartItem.dart';

final HasuraDb _hasuraDb = Get.find<HasuraDb>();

Future<BusinessCart?> get_business_cart({required int customerId}) async {
  final QueryResult<Query$getBusinessCart> getBusinessCartResp =
      await _hasuraDb.graphQLClient.query$getBusinessCart(
    Options$Query$getBusinessCart(
      fetchPolicy: FetchPolicy.noCache,
      variables: Variables$Query$getBusinessCart(customer_id: customerId),
    ),
  );

  if (getBusinessCartResp.parsedData?.business_cart == null) {
    return null;
    // throw Exception(
    //     "[🛑] get_customer_cart :: exception ===> ${getBusinessCartResp.exception}!");
  }

  final Query$getBusinessCart$business_cart? cartData =
      getBusinessCartResp.parsedData?.business_cart.isNotEmpty == true
          ? getBusinessCartResp.parsedData?.business_cart.first
          : null;

  return BusinessCart(
    customerId: cartData!.customer_id,
    businessId: cartData.business_id,
    cost: cartData.cost ?? 0,
    items: cartData.items
            .map(
              (data) => BusinessOrderItem(
                id: data.id,
                itemId: data.item_id,
                cost: data.cost,
                offeringType: data.offering_type.toOfferingType(),
                parameters: BusinessItemParameters(
                  guests: data.parameters?.guests,
                  numberOfUnits: data.parameters?.number_of_units,
                  previousCost: data.parameters?.previous_cost,
                  previoustime: data.parameters?.previoustime,
                  timeUnit: data.parameters?.time_unit,
                ),
                rental: RentalCard(
                    businessName: data.rental!.business.details.name,
                    currency:
                        data.rental!.business.details.currency.toCurrency(),
                    rental: Rental(
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
                      bathrooms: data.rental?.home_rental!.bathrooms,
                      bedrooms: data.rental?.home_rental!.bedrooms,
                      gpsLocation: Location(
                          lat:
                              data.rental?.home_rental!.gps_location.latitude ??
                                  0,
                          lng: data.rental?.home_rental!.gps_location
                                  .longitude ??
                              0,
                          address: data.rental?.home_rental!.address ?? ''),
                      homeType:
                          data.rental?.home_rental!.home_type.toHomeType(),
                    )),
                event: EventCard(
                  businessName: data.event!.business.details.name,
                  currency: data.event!.business.details.currency.toCurrency(),
                  event: Event(
                    scheduleType: data.event!.schedule_type.toScheduleType(),
                    startsAt: data.event!.starts_at,
                    endsAt: data.event!.ends_at,
                    schedule: (data.event!.schedule != null)
                        ? scheduleFromData(data.event!.schedule)
                        : null,
                    category1: data.event!.details.category1.toEventCategory1(),
                    details: BusinessItemDetails(
                      id: data.event!.details.id,
                      nameId: data.event!.details.name_id,
                      descriptionId: data.event!.details.description_id,
                      name: toLanguageMap(
                          translations: data.event!.details.name.translations),
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
                ),
                service: ServiceCard(
                  businessName: data.service!.business.details.name,
                  currency:
                      data.service!.business.details.currency.toCurrency(),
                  service: Service(
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
                ),
                product: ProductCard(
                  businessName: data.product!.business.details.name,
                  currency:
                      data.product!.business.details.currency.toCurrency(),
                  product: Product(
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
                ),
              ),
            )
            .toList() ??
        [],
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
        "🛑🛑🛑🛑 create_customer_cart :: exception ===> ${res.exception}!");
  } else {
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
