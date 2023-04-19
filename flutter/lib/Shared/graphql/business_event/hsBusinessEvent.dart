import 'package:get/get.dart';
import 'package:graphql/client.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/__generated/schema.graphql.dart';
import 'package:mezcalmos/Shared/graphql/business_event/__generated/business_event.graphql.dart';
import 'package:mezcalmos/Shared/graphql/hasuraTypes.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Business/Business.dart';

HasuraDb _db = Get.find<HasuraDb>();

Future<List<EventCard>> get_event_by_category(
    {required List<EventCategory1> categories1,
    required double distance,
    required Location fromLocation,
    required List<ScheduleType> scheduleType,
    List<EventCategory2>? categories2,
    List<String>? tags,
    int? offset,
    int? limit,
    required bool withCache}) async {
  final List<EventCard> _events = <EventCard>[];

  final QueryResult<Query$get_event_by_category> response = await _db
      .graphQLClient
      .query$get_event_by_category(Options$Query$get_event_by_category(
          fetchPolicy:
              withCache ? FetchPolicy.cacheAndNetwork : FetchPolicy.networkOnly,
          variables: Variables$Query$get_event_by_category(
              categories1: categories1
                  .map((EventCategory1 e) => e.toFirebaseFormatString())
                  .toList(),
              // distance: distance,
              // from: Geography(
              //     fromLocation.lat.toDouble(), fromLocation.lng.toDouble()),
              categories2: categories2
                      ?.map((EventCategory2 e) => e.toFirebaseFormatString())
                      .toList() ??
                  ["uncategorized"],
              schedule_type: scheduleType
                  .map((ScheduleType e) => e.toFirebaseFormatString())
                  .toList(),
              tags: tags ?? [],
              offset: offset,
              limit: limit)));
  mezDbgPrint("Event response ======>${response.data}");
  if (response.parsedData?.business_event != null) {
    response.parsedData?.business_event
        .forEach((Query$get_event_by_category$business_event data) async {
      _events.add(EventCard(
          businessName: data.business.details.name,
          event: Event(
            category1: data.details.category1.toEventCategory1(),
            gpsLocation: data.gps_location != null
                ? Location(
                    lat: data.gps_location!.latitude,
                    lng: data.gps_location!.longitude)
                : null,
            time: data.time,
            details: BusinessItemDetails(
              id: data.id,
              name: toLanguageMap(translations: data.details.name.translations),
              position: data.details.position,
              businessId: data.business.id,
              available: data.details.available,
              image: data.details.image
                      ?.map<String>((e) => e.toString())
                      .toList() ??
                  [],
              cost: constructBusinessServiceCost(data.details.cost),
              additionalParameters: data.details.additional_parameters,
              tags: data.details.tags
                      ?.map<String>((e) => e.toString())
                      .toList() ??
                  [],
            ),
            scheduleType: data.schedule_type.toScheduleType(),
            schedule: data.schedule,
          )));
    });
    return _events;
  } else {
    throw Exception("🚨🚨🚨🚨 Hasura querry error : ${response.exception}");
  }
}

Future<EventWithBusinessCard?> get_event_by_id(
    {required int id, required bool withCache}) async {
  final QueryResult<Query$get_event_by_id> response = await _db.graphQLClient
      .query$get_event_by_id(Options$Query$get_event_by_id(
          fetchPolicy:
              withCache ? FetchPolicy.cacheAndNetwork : FetchPolicy.networkOnly,
          variables: Variables$Query$get_event_by_id(id: id)));

  mezDbgPrint("[+] -> id : $id");
  if (response.parsedData?.business_event_by_pk == null) {
    throw Exception("🚨🚨🚨🚨 Hasura querry error : ${response.exception}");
  } else if (response.parsedData != null) {
    mezDbgPrint("✅✅✅✅ Hasura query success ");
    final Query$get_event_by_id$business_event_by_pk? data =
        response.parsedData?.business_event_by_pk!;

    if (data != null) {
      return EventWithBusinessCard(
          event: Event(
              category1: data.details.category1.toEventCategory1(),
              category2: data.details.category2.toEventCategory2(),
              gpsLocation: data.gps_location != null
                  ? Location(
                      lat: data.gps_location!.latitude,
                      lng: data.gps_location!.longitude)
                  : null,
              time: data.time,
              details: BusinessItemDetails(
                id: id,
                name:
                    toLanguageMap(translations: data.details.name.translations),
                position: data.details.position,
                businessId: data.business.id,
                available: data.details.available,
                cost: constructBusinessServiceCost(data.details.cost),
                description: toLanguageMap(
                    translations: data.details.description?.translations ?? []),
                additionalParameters: data.details.additional_parameters,
                image:
                    data.details.image?.entries.map((e) => e.value).toList() ??
                        [],
                tags: data.details.tags?.entries.map((e) => e.value).toList() ??
                    [],
              ),
              scheduleType: data.schedule_type.toScheduleType(),
              schedule: data.schedule),
          business: BusinessCard(
            id: data.business.id,
            detailsId: data.business.details.id,
            name: data.business.details.name,
            image: data.business.details.image,
            acceptedPayments: data.business.details.accepted_payments,
            avgRating: double.tryParse(
                data.business.reviews_aggregate.aggregate?.avg.toString() ??
                    '0.0'),
            reviewCount: data.business.reviews_aggregate.aggregate?.count,
          ));
    }
  } else
    return null;
  return null;
}

Future<int?> add_one_event({required Event event}) async {
  // mezDbgPrint("Adding this rental 🇹🇳 ${rental.toJson()}");

  final QueryResult<Mutation$add_event> response = await _db.graphQLClient
      .mutate$add_event(Options$Mutation$add_event(
          variables: Variables$Mutation$add_event(
              object: Input$business_event_insert_input(
                  business_id: event.details.businessId.toInt(),
                  gps_location: (event.gpsLocation != null)
                      ? Geography(event.gpsLocation!.lat.toDouble(),
                          event.gpsLocation!.lng.toDouble())
                      : null,
                  schedule_type: event.scheduleType.toFirebaseFormatString(),
                  schedule: event.schedule,
                  time: event.time,
                  details: Input$business_item_details_obj_rel_insert_input(
                      data: Input$business_item_details_insert_input(
                          available: event.details.available,
                          category1: event.category1.toFirebaseFormatString(),
                          category2: event.category2?.toFirebaseFormatString(),
                          cost: event.details.cost,
                          image: event.details.image,
                          name: Input$translation_obj_rel_insert_input(
                              data: Input$translation_insert_input(
                                  service_provider_id:
                                      event.details.businessId.toInt(),
                                  service_provider_type: ServiceProviderType
                                      .Business.toFirebaseFormatString(),
                                  translations:
                                      Input$translation_value_arr_rel_insert_input(data: <
                                          Input$translation_value_insert_input>[
                                    Input$translation_value_insert_input(
                                        language_id: Language.EN
                                            .toFirebaseFormatString(),
                                        value: event.details.name[Language.EN]),
                                    Input$translation_value_insert_input(
                                        language_id: Language.ES
                                            .toFirebaseFormatString(),
                                        value: event.details.name[Language.ES])
                                  ]))),
                          position: event.details.position?.toInt(),
                          additional_parameters:
                              event.details.additionalParameters,
                          description: (event.details.description != null)
                              ? Input$translation_obj_rel_insert_input(
                                  data: Input$translation_insert_input(
                                      service_provider_id:
                                          event.details.businessId.toInt(),
                                      service_provider_type: ServiceProviderType
                                          .Business.toFirebaseFormatString(),
                                      translations:
                                          Input$translation_value_arr_rel_insert_input(
                                              data: <Input$translation_value_insert_input>[
                                            Input$translation_value_insert_input(
                                                language_id: Language.EN
                                                    .toFirebaseFormatString(),
                                                value: event.details
                                                    .description?[Language.EN]),
                                            Input$translation_value_insert_input(
                                                language_id: Language.ES
                                                    .toFirebaseFormatString(),
                                                value: event.details
                                                    .description?[Language.ES])
                                          ])))
                              : null,
                          tags: event.details.tags))))));
  if (response.hasException) {
    mezDbgPrint(
        "🚨🚨🚨 Hasura add event mutation exception =>${response.exception}");
  } else {
    mezDbgPrint("✅✅✅ Hasura add event mutation success => ${response.data}");
    return response.parsedData?.insert_business_event_one?.id;
  }
  return null;
}
