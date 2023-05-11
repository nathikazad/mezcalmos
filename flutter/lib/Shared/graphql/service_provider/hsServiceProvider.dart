import 'package:get/get.dart';
import 'package:graphql/client.dart';
import 'package:mezcalmos/CustomerApp/router/courierRoutes.dart';
import 'package:mezcalmos/CustomerApp/router/customerRoutes.dart';
import 'package:mezcalmos/CustomerApp/router/laundaryRoutes.dart';
import 'package:mezcalmos/CustomerApp/router/restaurantRoutes.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart' as cModels;
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/__generated/schema.graphql.dart';
import 'package:mezcalmos/Shared/graphql/hasuraTypes.dart';
import 'package:mezcalmos/Shared/graphql/service_provider/__generated/service_provider.graphql.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Service.dart';
import 'package:mezcalmos/Shared/models/User.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';
import 'package:mezcalmos/Shared/models/Utilities/PaymentInfo.dart';
import 'package:mezcalmos/Shared/models/Utilities/Schedule.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServiceLink.dart';

HasuraDb _db = Get.find<HasuraDb>();

// querries //
Future<ServiceLink?> get_service_link_by_id(
    {required int serviceLinkId, bool withCache = true}) async {
  final QueryResult<Query$getServiceProviderLinks> response =
      await _db.graphQLClient.query$getServiceProviderLinks(
    Options$Query$getServiceProviderLinks(
      fetchPolicy:
          withCache ? FetchPolicy.cacheAndNetwork : FetchPolicy.noCache,
      variables:
          Variables$Query$getServiceProviderLinks(serviceLinkId: serviceLinkId),
    ),
  );
  mezDbgPrint("👋 called get service link ===========>${response.data}");
  if (response.parsedData == null) {
    mezDbgPrint(
        "🚨🚨🚨 hasura query service links faild \n  Data from response \n ${response.data} \n Exceptions from hasura \n ${response.exception}");
  } else if (response.parsedData!.service_provider_service_link_by_pk != null) {
    Query$getServiceProviderLinks$service_provider_service_link_by_pk data =
        response.parsedData!.service_provider_service_link_by_pk!;
    mezDbgPrint("✅ Getting service links done ✅ \n ${data.toJson()}");
    return ServiceLink(
        id: data.id,
        driverDeepLink: data.driver_deep_link,
        driverQrImageLink: data.driver_qr_image_link,
        customerDeepLink: data.customer_deep_link,
        customerQrImageLink: data.customer_qr_image_link,
        operatorDeepLink: data.operator_deep_link,
        operatorQrImageLink: data.operator_qr_image_link);
  }

  return null;
}

Future<String?> get_service_link({required String uniqueId}) async {
  final QueryResult<Query$getServiceProviderType> response = await _db
      .graphQLClient
      .query$getServiceProviderType(Options$Query$getServiceProviderType(
          variables:
              Variables$Query$getServiceProviderType(unique_id: uniqueId)));
  if (response.parsedData == null) {
    mezDbgPrint(
        "🚨🚨🚨 hasura query service type faild \n  Data from response \n ${response.data} \n Exceptions from hasura \n ${response.exception}");
    return null;
  }
  if (response.parsedData!.service_provider_details.length == 0) return null;
  switch (response
      .parsedData?.service_provider_details.first.service_provider_type) {
    case "restaurant":
    // todo handle properly the routing
    // return getRestaurantRoute(
    //     response.parsedData!.service_provider_details.first.restaurant!.id);
    case "laundry":
    // return getLaundryRoute(response
    //     .parsedData!.service_provider_details.first.laundry_store!.id);
    default:
      return null;
  }
}

Future<Service?> get_service_details_by_id(
    {required int serviceDetailsId,
    required int serviceId,
    bool withCache = true}) async {
  QueryResult<Query$getServiceDetails> res =
      await _db.graphQLClient.query$getServiceDetails(
    Options$Query$getServiceDetails(
      fetchPolicy:
          withCache ? FetchPolicy.cacheAndNetwork : FetchPolicy.noCache,
      variables: Variables$Query$getServiceDetails(id: serviceDetailsId),
    ),
  );
  mezDbgPrint("👋 called get service details ===========>${res.data}");
  if (res.parsedData?.service_provider_details_by_pk == null) {
    throwError(res.exception);
  }

  Query$getServiceDetails$service_provider_details_by_pk data =
      res.parsedData!.service_provider_details_by_pk!;
  final PaymentInfo paymentInfo = PaymentInfo.fromData(
      acceptedPayments: data.accepted_payments, stripeInfo: data.stripe_info);

  return MainService(
      deliveryCost: null,
      info: ServiceInfo(
          descriptionId: data.description_id,
          description: (data.description?.translations != null)
              ? toLanguageMap(translations: data.description!.translations)
              : null,
          location:
              MezLocation.fromHasura(data.location.gps, data.location.address),
          hasuraId: serviceId,
          image: data.image,
          name: data.name),
      serviceDetailsId: data.id,
      state: ServiceState(data.open_status.toServiceStatus(), data.approved),
      languages: convertToLanguages(data.language),
      paymentInfo: paymentInfo,
      schedule: scheduleFromData(data.schedule),
      phoneNumber: data.phone_number,
      serviceLinkId: data.service_link_id,
      serviceProviderType: data.service_provider_type.toServiceProviderType());
}

Future<ServiceInfo?> get_service_info(
    {required int serviceDetailsId,
    required int serviceId,
    bool withCache = true}) async {
  QueryResult<Query$getServiceInfo> res =
      await _db.graphQLClient.query$getServiceInfo(
    Options$Query$getServiceInfo(
      fetchPolicy:
          withCache ? FetchPolicy.cacheAndNetwork : FetchPolicy.noCache,
      variables:
          Variables$Query$getServiceInfo(serviceDetailsId: serviceDetailsId),
    ),
  );
  if (res.parsedData?.service_provider_details_by_pk == null) {
    throwError(res.exception);
  }
  Query$getServiceInfo$service_provider_details_by_pk data =
      res.parsedData!.service_provider_details_by_pk!;

  return ServiceInfo(
      descriptionId: data.description_id,
      phoneNumber: data.phone_number,
      description: (data.description?.translations != null)
          ? toLanguageMap(translations: data.description!.translations)
          : null,
      location:
          MezLocation.fromHasura(data.location.gps, data.location.address),
      hasuraId: serviceId,
      image: data.image,
      name: data.name,
      languages: convertToLanguages(data.language));
}

Future<PaymentInfo?> get_service_payment_info(
    {required int serviceDetailsId, bool withCache = true}) async {
  QueryResult<Query$getServicePaymentInfo> res =
      await _db.graphQLClient.query$getServicePaymentInfo(
    Options$Query$getServicePaymentInfo(
      fetchPolicy:
          withCache ? FetchPolicy.cacheAndNetwork : FetchPolicy.noCache,
      variables: Variables$Query$getServicePaymentInfo(
          serviceDetailsId: serviceDetailsId),
    ),
  );
  if (res.parsedData?.service_provider_details_by_pk == null) {
    throwError(res.exception);
  }
  Query$getServicePaymentInfo$service_provider_details_by_pk data =
      res.parsedData!.service_provider_details_by_pk!;

  final PaymentInfo paymentInfo = PaymentInfo.fromData(
      acceptedPayments: data.accepted_payments, stripeInfo: data.stripe_info);

  return paymentInfo;
}

Future<MezLocation?> get_service_location(
    {required int serviceDetailsId, bool withCache = true}) async {
  QueryResult<Query$getServiceInfo> res =
      await _db.graphQLClient.query$getServiceInfo(
    Options$Query$getServiceInfo(
      fetchPolicy:
          withCache ? FetchPolicy.cacheAndNetwork : FetchPolicy.noCache,
      variables:
          Variables$Query$getServiceInfo(serviceDetailsId: serviceDetailsId),
    ),
  );
  if (res.parsedData?.service_provider_details_by_pk == null) {
    throwError(res.exception);
  }
  mezDbgPrint("👋 called get location ===========>${res.data}");
  Query$getServiceInfo$service_provider_details_by_pk data =
      res.parsedData!.service_provider_details_by_pk!;

  MezLocation mezLocation =
      MezLocation.fromHasura(data.location.gps, data.location.address);

  return mezLocation;
}

Future<cModels.Schedule?> get_service_schedule(
    {required int serviceDetailsId, bool withCache = true}) async {
  QueryResult<Query$getServiceSchedule> res =
      await _db.graphQLClient.query$getServiceSchedule(
    Options$Query$getServiceSchedule(
      fetchPolicy:
          withCache ? FetchPolicy.cacheAndNetwork : FetchPolicy.noCache,
      variables: Variables$Query$getServiceSchedule(
          serviceDetailsId: serviceDetailsId),
    ),
  );
  mezDbgPrint("👋 called get schedule ===========>${res.data}");
  if (res.parsedData?.service_provider_details_by_pk == null) {
    throwError(res.exception);
  }
  Query$getServiceSchedule$service_provider_details_by_pk data =
      res.parsedData!.service_provider_details_by_pk!;

  if (data.schedule != null) {
    return scheduleFromData(data.schedule!);
  }
  return null;
}

Future<String?> get_service_provider_route(
    {required String uniqueId, bool withCache = true}) async {
  QueryResult<Query$getServiceProviderId> res =
      await _db.graphQLClient.query$getServiceProviderId(
    Options$Query$getServiceProviderId(
      fetchPolicy:
          withCache ? FetchPolicy.cacheAndNetwork : FetchPolicy.noCache,
      variables: Variables$Query$getServiceProviderId(uniqueId: uniqueId),
    ),
  );
  if (res.parsedData == null ||
      res.parsedData!.service_provider_details.isEmpty) {
    throwError(res.exception);
  }
  final cModels.ServiceProviderType serviceProviderType = res
      .parsedData!.service_provider_details[0].service_provider_type
      .toServiceProviderType();
  mezDbgPrint("🈚️🈚️🈚️🈚️🈚️ $serviceProviderType");
  String? route;
  switch (serviceProviderType) {
    case cModels.ServiceProviderType.Restaurant:
      route = RestaurantRoutes.restaurantViewRoute.replaceAll(
          ":restaurantId",
          res.parsedData!.service_provider_details[0].restaurant!.id
              .toString());
      break;
    case cModels.ServiceProviderType.Laundry:
      route = LaundryRoutes.singleLaundryRoute.replaceAll(
          ":laundryId",
          res.parsedData!.service_provider_details[0].laundry_store!.id
              .toString());
      break;
    case cModels.ServiceProviderType.DeliveryCompany:
      route = CourierRoutes.kCourierServiceRoute.replaceAll(
          ":deliveryCompanyId",
          res.parsedData!.service_provider_details[0].delivery_company!.id
              .toString());
      break;
    case cModels.ServiceProviderType.Business:
      route = CustomerRoutes.custBusinessRoute.replaceFirst(
          ':businessId',
          res.parsedData!.service_provider_details[0].delivery_company!.id
              .toString());
      break;
    case cModels.ServiceProviderType.DeliveryDriver:
    case cModels.ServiceProviderType.Customer:
      break;
  }
  return route;
}

Future<ServiceInfo> update_service_info(
    {required ServiceInfo serviceInfo, required int detailsId}) async {
  QueryResult<Mutation$updateServiceDetails> res =
      await _db.graphQLClient.mutate$updateServiceDetails(
    Options$Mutation$updateServiceDetails(
      fetchPolicy: FetchPolicy.noCache,
      variables: Variables$Mutation$updateServiceDetails(
        detailsId: detailsId,
        data: Input$service_provider_details_set_input(
            name: serviceInfo.name,
            image: serviceInfo.image,
            phone_number: serviceInfo.phoneNumber,
            language: serviceInfo.languages?.toFirebaseFormattedString(),
            description_id: serviceInfo.descriptionId,
            currency: serviceInfo.currency?.toFirebaseFormatString()),
      ),
    ),
  );
  mezDbgPrint("error $detailsId ==========>${res.data}");
  if (res.parsedData?.update_service_provider_details_by_pk == null) {
    throwError(res.exception);
  }
  Mutation$updateServiceDetails$update_service_provider_details_by_pk data =
      res.parsedData!.update_service_provider_details_by_pk!;
  return ServiceInfo(
      descriptionId: data.description_id,
      description: (data.description?.translations != null)
          ? toLanguageMap(translations: data.description!.translations)
          : null,
      location:
          MezLocation.fromHasura(data.location.gps, data.location.address),
      hasuraId: 1,
      image: data.image,
      name: data.name);
}

Future<cModels.Schedule?> update_service_schedule(
    {required cModels.Schedule schedule, required int detailsId}) async {
  QueryResult<Mutation$updateServiceDetails> res =
      await _db.graphQLClient.mutate$updateServiceDetails(
    Options$Mutation$updateServiceDetails(
      variables: Variables$Mutation$updateServiceDetails(
        detailsId: detailsId,
        data: Input$service_provider_details_set_input(
            schedule: schedule.toFirebaseFormattedJson()),
      ),
    ),
  );
  if (res.parsedData?.update_service_provider_details_by_pk == null) {
    throwError(res.exception);
  }
  Mutation$updateServiceDetails$update_service_provider_details_by_pk? data =
      res.parsedData!.update_service_provider_details_by_pk;
  return scheduleFromData(data!.schedule);
}

Future<bool> update_service_state({
  required ServiceStatus? status,
  required bool? approved,
  required int detailsId,
}) async {
  QueryResult<Mutation$updateServiceDetails> res =
      await _db.graphQLClient.mutate$updateServiceDetails(
    Options$Mutation$updateServiceDetails(
      variables: Variables$Mutation$updateServiceDetails(
        detailsId: detailsId,
        data: Input$service_provider_details_set_input(
            approved: approved, open_status: status?.toFirebaseFormatString()),
      ),
    ),
  );
  if (res.parsedData?.update_service_provider_details_by_pk == null) {
    mezDbgPrint("Error =======>${res.data}");
    throwError(res.exception);
  }
  Mutation$updateServiceDetails$update_service_provider_details_by_pk? data =
      res.parsedData!.update_service_provider_details_by_pk;
  return data != null;
}

Future<bool> update_service_accepted_payments(
    {required Map<cModels.PaymentType, bool> payments,
    required int detailsId}) async {
  QueryResult<Mutation$updateServiceDetails> res =
      await _db.graphQLClient.mutate$updateServiceDetails(
    Options$Mutation$updateServiceDetails(
      variables: Variables$Mutation$updateServiceDetails(
        detailsId: detailsId,
        data: Input$service_provider_details_set_input(accepted_payments:
            payments.map<String, bool>((cModels.PaymentType key, bool value) {
          return MapEntry(key.toFirebaseFormatString(), value);
        })),
      ),
    ),
  );
  if (res.parsedData?.update_service_provider_details_by_pk == null) {
    throwError(res.exception);
  }
  Mutation$updateServiceDetails$update_service_provider_details_by_pk? data =
      res.parsedData!.update_service_provider_details_by_pk;
  return data != null;
}

Future<bool> update_service_charge_fees_fro_customer(
    {required bool value, required int detailsId}) async {
  QueryResult<Mutation$updateServiceDetails> res =
      await _db.graphQLClient.mutate$updateServiceDetails(
    Options$Mutation$updateServiceDetails(
      variables: Variables$Mutation$updateServiceDetails(
          detailsId: detailsId,
          data: Input$service_provider_details_set_input()),
    ),
  );
  if (res.parsedData?.update_service_provider_details_by_pk == null) {
    throwError(res.exception);
  }
  Mutation$updateServiceDetails$update_service_provider_details_by_pk? data =
      res.parsedData!.update_service_provider_details_by_pk;
  return data != null;
}

Future<cModels.ServiceProviderLanguage?> get_service_lang(
    {required int detailsId}) async {
  final QueryResult<Query$getServiceLanguage> response = await _db.graphQLClient
      .query$getServiceLanguage(Options$Query$getServiceLanguage(
          fetchPolicy: FetchPolicy.cacheFirst,
          variables:
              Variables$Query$getServiceLanguage(serviceDetailsId: detailsId)));
  if (response.hasException) {
    mezDbgPrint("🚨🚨🚨 service lang query errors : ${response.exception}");
  } else if (response.parsedData?.service_provider_details_by_pk != null) {
    mezDbgPrint("✅✅✅ restuarnt primay lang query success");

    return convertToLanguages(
        response.parsedData?.service_provider_details_by_pk!.language);
  }
  return null;
}
