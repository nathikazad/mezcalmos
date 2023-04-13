import 'package:get/get.dart';
import 'package:graphql/client.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/__generated/schema.graphql.dart';
import 'package:mezcalmos/Shared/graphql/delivery_company/__generated/delivery_company.graphql.dart';
import 'package:mezcalmos/Shared/graphql/hasuraTypes.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Services/DeliveryCompany/DeliveryCompany.dart';
import 'package:mezcalmos/Shared/models/Services/Service.dart';
import 'package:mezcalmos/Shared/models/User.dart';
import 'package:mezcalmos/Shared/models/Utilities/DeliveryCost.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';
import 'package:mezcalmos/Shared/models/Utilities/Schedule.dart';

HasuraDb _hasuraDb = Get.find<HasuraDb>();

Future<DeliveryCompany?> get_delivery_company({required int companyId}) async {
  final QueryResult<Query$getDeliveryCompanyById> res =
      await _hasuraDb.graphQLClient.query$getDeliveryCompanyById(
    Options$Query$getDeliveryCompanyById(
      variables: Variables$Query$getDeliveryCompanyById(id: companyId),
    ),
  );
  if (res.parsedData?.delivery_company_by_pk == null) {
    throwError(res.exception);
  }
  final Query$getDeliveryCompanyById$delivery_company_by_pk data =
      res.parsedData!.delivery_company_by_pk!;
  return DeliveryCompany(
      deliveryCost: DeliveryCost(
        id: data.delivery_details.id,
        selfDelivery: data.delivery_details.self_delivery,
        freeDeliveryMinimumCost:
            data.delivery_details.free_delivery_minimum_cost,
        costPerKm: data.delivery_details.cost_per_km,
        minimumCost: data.delivery_details.minimum_cost,
        freeDeliveryKmRange: data.delivery_details.free_delivery_km_range,
      ),
      creationTime: DateTime.parse(data.details!.creation_time),
      schedule: Schedule.fromData(data.details!.schedule),
      deliveryDetailsId: data.delivery_details.id,
      info: ServiceInfo(
        hasuraId: data.id,
        locationId: data.details!.location_id,
        image: data.details!.image,
        description: (data.details!.description?.translations != null)
            ? toLanguageMap(
                translations: data.details!.description!.translations)
            : null,
        descriptionId: data.details!.description_id,
        location: MezLocation.fromHasura(
            data.details!.location.gps, data.details!.location.address),
        name: data.details!.name,
      ),
      state: ServiceState(
          data.details!.open_status.toString().toServiceStatus(),
          data.details!.approved),
      languages: convertToLanguages(data.details!.language),
      serviceDetailsId: data.details!.id);
}

// Future<DeliveryCompany?> update_delivery_company(
//     {required int companyId, required DeliveryCompany deliveryCompany}) async {
//   final QueryResult<Mutation$updateDeliveryCompany> res =
//       await _hasuraDb.graphQLClient.mutate$updateDeliveryCompany(
//     Options$Mutation$updateDeliveryCompany(
//       variables: Variables$Mutation$updateDeliveryCompany(
//         id: companyId,
//         data: Input$delivery_company_set_input(
//             name: deliveryCompany.info.name,
//             image: deliveryCompany.info.image,
//             description_id: deliveryCompany.info.descriptionId,
//             open_status: deliveryCompany.state.status.toFirebaseFormatString()),
//       ),
//     ),
//   );
//   if (res.parsedData?.update_delivery_company_by_pk == null) {
//     throwError(res.exception);
//   }
//   final Mutation$updateDeliveryCompany$update_delivery_company_by_pk data =
//       res.parsedData!.update_delivery_company_by_pk!;
//   return DeliveryCompany(
//       creationTime: DateTime.parse(data.details!.creation_time),
//       info: ServiceInfo(
//         hasuraId: data.details!.id,
//         image: data.details!.image,
//         locationId: data.details!.location_id,
//         descriptionId: data.details!.description_id,
//         description: (data.details!.description?.translations != null)
//             ? toLanguageMap(translations: data.details!.description!.translations)
//             : null,
//         location:
//             MezLocation.fromHasura(data.details!.location.gps, data.details!.location.address),
//         name: data.details!.name,
//       ),
//       state: ServiceState(
//           data.details!.open_status.toString().toServiceStatus(), data.details!.approved),
//       primaryLanguage: LanguageType.EN);
// }

Future<List<DeliveryCompany>> get_nearby_companies(
    {required MezLocation location}) async {
  final QueryResult<Query$getNearByCompanies> res =
      await _hasuraDb.graphQLClient.query$getNearByCompanies(
    Options$Query$getNearByCompanies(
      fetchPolicy: FetchPolicy.noCache,
      variables: Variables$Query$getNearByCompanies(
          args: Input$delivery_get_delivery_companies_args(
              location: location.toGeography())),
    ),
  );
  mezDbgPrint(
      "Get nearby companies =========================>>>>>>>>>>${res.data}");
  if (res.parsedData?.delivery_get_delivery_companies == null) {
    throwError(res.exception);
  }
  mezDbgPrint("Nearby companies ================>>>>${res.data}");
  List<DeliveryCompany> returnedList = [];
  final List<Query$getNearByCompanies$delivery_get_delivery_companies>
      dataList = res.parsedData!.delivery_get_delivery_companies;
  returnedList = dataList
      .map((Query$getNearByCompanies$delivery_get_delivery_companies data) {
    return DeliveryCompany(
      deliveryCost: DeliveryCost(
        id: data.delivery_details.id,
        selfDelivery: data.delivery_details.self_delivery,
        freeDeliveryMinimumCost:
            data.delivery_details.free_delivery_minimum_cost,
        costPerKm: data.delivery_details.cost_per_km,
        minimumCost: data.delivery_details.minimum_cost,
        freeDeliveryKmRange: data.delivery_details.free_delivery_km_range,
      ),
      schedule: Schedule.fromData(data.details!.schedule),
      creationTime: DateTime.parse(data.details!.creation_time),
      info: ServiceInfo(
        hasuraId: data.id,
        image: data.details!.image,
        description: (data.details!.description?.translations != null)
            ? toLanguageMap(
                translations: data.details!.description!.translations)
            : null,
        descriptionId: data.details!.description_id,
        location: MezLocation.fromHasura(
            data.details!.location.gps, data.details!.location.address),
        name: data.details!.name,
      ),
      state: ServiceState(
          data.details!.open_status.toString().toServiceStatus(),
          data.details!.approved),
      languages: convertToLanguages(data.details!.language),
      serviceDetailsId: data.details!.id,
    );
  }).toList();
  return returnedList;
}

Future<List<DeliveryCompany>?> get_dv_companies() async {
  final QueryResult<Query$getDeliveryCompanies> res =
      await _hasuraDb.graphQLClient.query$getDeliveryCompanies(
    Options$Query$getDeliveryCompanies(
      fetchPolicy: FetchPolicy.noCache,
    ),
  );
  mezDbgPrint(
      "Get nearby companies =========================>>>>>>>>>>${res.data}");
  if (res.parsedData?.delivery_company == null) {
    throwError(res.exception);
  }
  List<DeliveryCompany> returnedList = [];
  List<Query$getDeliveryCompanies$delivery_company> dataList =
      res.parsedData!.delivery_company;
  returnedList =
      dataList.map((Query$getDeliveryCompanies$delivery_company data) {
    return DeliveryCompany(
      schedule: Schedule.fromData(data.details!.schedule),
      rate: data.reviews_aggregate.aggregate?.avg?.rating,
      numberOfReviews: data.reviews_aggregate.aggregate?.count,
      deliveryCost: DeliveryCost(
        id: data.delivery_details.id,
        selfDelivery: data.delivery_details.self_delivery,
        freeDeliveryMinimumCost:
            data.delivery_details.free_delivery_minimum_cost,
        costPerKm: data.delivery_details.cost_per_km,
        minimumCost: data.delivery_details.minimum_cost,
        freeDeliveryKmRange: data.delivery_details.free_delivery_km_range,
      ),
      creationTime: DateTime.parse(data.details!.creation_time),
      info: ServiceInfo(
        hasuraId: data.id,
        image: data.details!.image,
        description: (data.details!.description?.translations != null)
            ? toLanguageMap(
                translations: data.details!.description!.translations)
            : null,
        descriptionId: data.details!.description_id,
        location: MezLocation.fromHasura(
            data.details!.location.gps, data.details!.location.address),
        name: data.details!.name,
      ),
      state: ServiceState(
          data.details!.open_status.toString().toServiceStatus(),
          data.details!.approved),
      languages: convertToLanguages(data.details!.language),
      serviceDetailsId: data.details!.id,
    );
  }).toList();
  return returnedList;
}

// Future<ServiceStatus> update_deliveryCompany_status(
//     {required int id, required ServiceStatus status}) async {
//   final QueryResult<Mutation$updateDeliveryCompany> response =
//       await _hasuraDb.graphQLClient.mutate$updateDeliveryCompany(
//     Options$Mutation$updateDeliveryCompany(
//       fetchPolicy: FetchPolicy.networkOnly,
//       variables: Variables$Mutation$updateDeliveryCompany(
//         id: id,
//         data: Input$delivery_company_set_input(
//           open_status: status.toFirebaseFormatString(),
//         ),
//       ),
//     ),
//   );
//   if (response.parsedData?.update_delivery_company_by_pk == null) {
//     throw Exception(
//         "🚨🚨🚨 Hasura status mutation exception =>${response.exception}");
//   } else {
//     mezDbgPrint(
//         "✅✅✅ Hasura mutation success => ${response.parsedData?.update_delivery_company_by_pk?.open_status}");
//     final Mutation$updateDeliveryCompany$update_delivery_company_by_pk data =
//         response.parsedData!.update_delivery_company_by_pk!;
//     return data.details!.open_status.toServiceStatus();
//   }
// }
