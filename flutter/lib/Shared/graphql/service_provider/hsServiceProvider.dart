import 'package:get/get.dart';
import 'package:graphql/client.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
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
import 'package:mezcalmos/Shared/models/Utilities/ServiceProviderType.dart';

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
        operatorDeepLink: data.operator_deep_link,
        operatorQrImageLink: data.operator_qr_image_link);
  }

  return null;
}

Future<MainService?> get_service_details_by_id(
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
      schedule: Schedule.fromData(data.schedule),
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
      name: data.name);
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

Future<Schedule?> get_service_schedule(
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
  if (res.parsedData?.service_provider_details_by_pk == null) {
    throwError(res.exception);
  }
  Query$getServiceSchedule$service_provider_details_by_pk data =
      res.parsedData!.service_provider_details_by_pk!;

  if (data.schedule != null) {
    return Schedule.fromData(data.schedule!);
  }
  return null;
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
            description_id: serviceInfo.descriptionId),
      ),
    ),
  );
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

Future<Schedule?> update_service_schedule(
    {required Schedule schedule, required int detailsId}) async {
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
  return Schedule.fromData(data!.schedule);
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
    {required Map<PaymentType, bool> payments, required int detailsId}) async {
  QueryResult<Mutation$updateServiceDetails> res =
      await _db.graphQLClient.mutate$updateServiceDetails(
    Options$Mutation$updateServiceDetails(
      variables: Variables$Mutation$updateServiceDetails(
        detailsId: detailsId,
        data: Input$service_provider_details_set_input(accepted_payments:
            payments.map<String, bool>((PaymentType key, bool value) {
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
