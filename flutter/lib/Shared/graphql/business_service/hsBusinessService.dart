import 'package:get/get.dart';
import 'package:graphql/client.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/__generated/schema.graphql.dart';
import 'package:mezcalmos/Shared/graphql/business_service/__generated/business_service.graphql.dart';
import 'package:mezcalmos/Shared/graphql/hasuraTypes.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Business/Business.dart';

HasuraDb _db = Get.find<HasuraDb>();

Future<List<ServiceCard>> get_service_by_category(
    {required List<String> categories1,
    required double distance,
    required Location fromLocation,
    List<String>? categories2,
    List<String>? tags,
    int? offset,
    int? limit,
    required bool withCache}) async {
  final List<ServiceCard> _services = <ServiceCard>[];

  final QueryResult<Query$get_service_by_category> response = await _db
      .graphQLClient
      .query$get_service_by_category(Options$Query$get_service_by_category(
          fetchPolicy:
              withCache ? FetchPolicy.cacheAndNetwork : FetchPolicy.networkOnly,
          variables: Variables$Query$get_service_by_category(
              categories1: categories1,
              distance: distance,
              from: Geography(
                  fromLocation.lat.toDouble(), fromLocation.lng.toDouble()),
              categories2: categories2,
              tags: tags ?? [],
              offset: offset,
              limit: limit)));

  if (response.parsedData?.business_service != null) {
    response.parsedData?.business_service
        .forEach((Query$get_service_by_category$business_service data) async {
      _services.add(ServiceCard(
          businessName: data.business.details.name,
          service: Service(
            category1: data.details.category1,
            details: BusinessItemDetails(
              id: data.id,
              name: toLanguageMap(translations: data.details.name.translations),
              position: data.details.position,
              businessId: data.business.id,
              available: data.details.available,
              image: data.details.image?.entries.map((e) => e.value).toList() ??
                  [],
              cost: constructBusinessServiceCost(data.details.cost),
              additionalParameters: data.details.additional_parameters,
              tags:
                  data.details.tags?.entries.map((e) => e.value).toList() ?? [],
            ),
          )));
    });
    return _services;
  } else {
    return [];
  }
}

Future<ServiceWithBusinessCard?> get_service_by_id(
    {required int id, required bool withCache}) async {
  final QueryResult<Query$get_service_by_id> response = await _db.graphQLClient
      .query$get_service_by_id(Options$Query$get_service_by_id(
          fetchPolicy:
              withCache ? FetchPolicy.cacheAndNetwork : FetchPolicy.networkOnly,
          variables: Variables$Query$get_service_by_id(id: id)));

  mezDbgPrint("[+] -> id : $id");
  if (response.parsedData?.business_service_by_pk == null) {
    throw Exception("🚨🚨🚨🚨 Hasura querry error : ${response.exception}");
  } else if (response.parsedData != null) {
    mezDbgPrint("✅✅✅✅ Hasura query success ");

    final Query$get_service_by_id$business_service_by_pk data =
        response.parsedData!.business_service_by_pk!;
    Map<PaymentType, bool> _acceptedPayments = {};
    data.business.details.accepted_payments.forEach((k, v) {
      _acceptedPayments[k.toString().toPaymentType()] = v;
    });
    List<String> images =
        data.details.image.map<String>((e) => e.toString()).toList();
    return ServiceWithBusinessCard(
        service: Service(
            category1: data.details.category1,
            details: BusinessItemDetails(
              id: id,
              name: toLanguageMap(translations: data.details.name.translations),
              businessId: data.business.id,
              available: data.details.available,
              cost: constructBusinessServiceCost(data.details.cost),
              description: toLanguageMap(
                  translations: data.details.description?.translations ?? []),
              additionalParameters: data.details.additional_parameters,
              image:
                  data.details.image?.map<String>((e) => e.toString()).toList(),

              // data.details.image?.entries.map((e) => e.value).toList() ??
              //     [],
              tags:
                  data.details.tags?.map<String>((e) => e.toString()).toList(),
            )),
        business: BusinessCard(
          id: data.business.id,
          detailsId: data.business.details.id,
          name: data.business.details.name,
          image: data.business.details.image,
          acceptedPayments: _acceptedPayments,
          // acceptedPayments: data.business.details.accepted_payments?.map(
          //     (k, v) => MapEntry<PaymentType, bool>(
          //         k.toString().toPaymentType(), v as bool)),
          avgRating: double.tryParse(
              data.business.reviews_aggregate.aggregate?.avg.toString() ??
                  '0.0'),
          reviewCount: data.business.reviews_aggregate.aggregate?.count,
        ));
  } else
    return null;
  return null;
}

Future<int?> add_one_service({required Service service}) async {
  // mezDbgPrint("Adding this service 🇹🇳 ${service.toJson()}");

  final QueryResult<Mutation$add_service> response = await _db.graphQLClient
      .mutate$add_service(Options$Mutation$add_service(
          variables: Variables$Mutation$add_service(
              object: Input$business_service_insert_input(
                  business_id: service.details.businessId.toInt(),
                  details: Input$business_item_details_obj_rel_insert_input(
                      data: Input$business_item_details_insert_input(
                          available: service.details.available,
                          category1: service.category1,
                          // category2: service.category2?.toFirebaseFormatString(),
                          cost: service.details.cost,
                          image: service.details.image,
                          name: Input$translation_obj_rel_insert_input(
                              data: Input$translation_insert_input(
                                  service_provider_id:
                                      service.details.businessId.toInt(),
                                  service_provider_type: ServiceProviderType
                                      .Business.toFirebaseFormatString(),
                                  translations:
                                      Input$translation_value_arr_rel_insert_input(
                                          data: <
                                              Input$translation_value_insert_input>[
                                        Input$translation_value_insert_input(
                                            language_id: Language.EN
                                                .toFirebaseFormatString(),
                                            value: service
                                                .details.name[Language.EN]),
                                        Input$translation_value_insert_input(
                                            language_id: Language.ES
                                                .toFirebaseFormatString(),
                                            value: service
                                                .details.name[Language.ES])
                                      ]))),
                          position: service.details.position?.toInt(),
                          additional_parameters:
                              service.details.additionalParameters,
                          description: (service.details.description != null)
                              ? Input$translation_obj_rel_insert_input(
                                  data: Input$translation_insert_input(
                                      service_provider_id:
                                          service.details.businessId.toInt(),
                                      service_provider_type: ServiceProviderType
                                          .Business.toFirebaseFormatString(),
                                      translations:
                                          Input$translation_value_arr_rel_insert_input(
                                              data: <Input$translation_value_insert_input>[
                                            Input$translation_value_insert_input(
                                                language_id: Language.EN
                                                    .toFirebaseFormatString(),
                                                value: service.details
                                                    .description?[Language.EN]),
                                            Input$translation_value_insert_input(
                                                language_id: Language.ES
                                                    .toFirebaseFormatString(),
                                                value: service.details
                                                    .description?[Language.ES])
                                          ])))
                              : null,
                          tags: service.details.tags))))));
  if (response.hasException) {
    mezDbgPrint(
        "🚨🚨🚨 Hasura add service mutation exception =>${response.exception}");
  } else {
    mezDbgPrint("✅✅✅ Hasura add service mutation success => ${response.data}");
    return response.parsedData?.insert_business_service_one?.id;
  }
  return null;
}
