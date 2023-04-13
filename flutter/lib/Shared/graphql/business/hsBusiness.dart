import 'package:get/get.dart';
import 'package:graphql/client.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/business/__generated/business.graphql.dart';
import 'package:mezcalmos/Shared/graphql/hasuraTypes.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Business/Business.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';
import 'package:mezcalmos/Shared/models/Utilities/PaymentInfo.dart';

HasuraDb _db = Get.find<HasuraDb>();

Future<List<BusinessCardView>> get_business_by_rental_category1(
    {required RentalCategory1 category1,
    required double distance,
    required Location fromLocation,
    int? offset,
    int? limit,
    required bool withCache}) async {
  final List<BusinessCardView> _businesses = <BusinessCardView>[];

  final QueryResult<Query$get_business_by_rental_category1> response =
      await _db.graphQLClient.query$get_business_by_rental_category1(
          Options$Query$get_business_by_rental_category1(
              fetchPolicy: withCache
                  ? FetchPolicy.cacheAndNetwork
                  : FetchPolicy.networkOnly,
              variables: Variables$Query$get_business_by_rental_category1(
                  category1: category1.toFirebaseFormatString(),
                  distance: distance,
                  from: Geography(
                      fromLocation.lat as double, fromLocation.lng as double),
                  offset: offset,
                  limit: limit)));

  if (response.parsedData?.business_business != null) {
    response.parsedData?.business_business.forEach(
        (Query$get_business_by_rental_category1$business_business data) async {
      final PaymentInfo _paymentInfo = PaymentInfo.fromData(
          stripeInfo: {}, acceptedPayments: data.details.accepted_payments);
      _businesses.add(BusinessCardView(
        id: data.id,
        detailsId: data.details.id,
        name: data.details.name,
        image: data.details.image,
        acceptedPayments: _paymentInfo.acceptedPayments,
        avgRating: data.reviews_aggregate.aggregate?.avg?.rating,
        reviewCount: data.reviews_aggregate.aggregate?.count,
      ));
    });
    return _businesses;
  } else {
    return [];
  }
}

Future<Business?> get_business_by_id(
    {required int id, required bool withCache}) async {
  final QueryResult<Query$get_business_by_id> response =
      await _db.graphQLClient.query$get_business_by_id(
    Options$Query$get_business_by_id(
      fetchPolicy:
          withCache ? FetchPolicy.cacheAndNetwork : FetchPolicy.noCache,
      variables: Variables$Query$get_business_by_id(id: id),
    ),
  );

  mezDbgPrint("[+] -> id : $id $response");
  if (response.parsedData?.business_business_by_pk == null) {
    throw Exception("🚨🚨🚨🚨 Hasura querry error : ${response.exception}");
  } else if (response.parsedData != null) {
    mezDbgPrint("✅✅✅✅ Hasura query success ");
    final Query$get_business_by_id$business_business_by_pk? data =
        response.parsedData?.business_business_by_pk!;

    if (data != null) {
      final List<Rental> _rentals = <Rental>[];
      data.rentals.forEach(
          (Query$get_business_by_id$business_business_by_pk$rentals
              rental) async {
        _rentals.add(Rental(
            category1: rental.service.category1.toRentalCategory1(),
            details: BusinessService(
                id: rental.id,
                name: toLanguageMap(
                    translations: rental.service.name.translations),
                position: rental.service.position,
                businessId: data.id,
                available: rental.service.available,
                cost: constructBusinessServiceCost(rental.service.cost))));
      });
      final List<Class> _classes = <Class>[];
      data.classes.forEach(
          (Query$get_business_by_id$business_business_by_pk$classes
              _class) async {
        _classes.add(Class(
            category1: _class.service.category1.toClassCategory1(),
            scheduleType: _class.schedule_type.toScheduleType(),
            details: BusinessService(
                id: _class.id,
                name: toLanguageMap(
                    translations: _class.service.name.translations),
                position: _class.service.position,
                businessId: data.id,
                available: _class.service.available,
                cost: constructBusinessServiceCost(_class.service.cost))));
      });
      final List<Event> _events = <Event>[];
      data.events.forEach(
          (Query$get_business_by_id$business_business_by_pk$events
              event) async {
        _events.add(Event(
            category1: event.service.category1.toEventCategory1(),
            scheduleType: event.schedule_type.toScheduleType(),
            details: BusinessService(
                id: event.id,
                name: toLanguageMap(
                    translations: event.service.name.translations),
                position: event.service.position,
                businessId: data.id,
                available: event.service.available,
                cost: constructBusinessServiceCost(event.service.cost))));
      });
      return Business(
          profile: data.profile.toBusinessProfile(),
          details: ServiceProvider(
              id: data.id,
              serviceProviderDetailsId: data.details.id,
              name: data.details.name,
              image: data.details.image,
              location: constructLocation(
                  data.details.location.gps, data.details.location.address),
              language: convertToLanguages(data.details.language),
              deliveryDetails: DeliveryDetails(
                  deliveryAvailable: false,
                  customerPickup: false,
                  selfDelivery: false),
              serviceProviderType: ServiceProviderType.Business),
          rentals: _rentals,
          classes: _classes,
          events: _events);
    }
  } else
    return null;
  return null;
}
