import 'package:get/get.dart';
import 'package:graphql/src/core/query_result.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/__generated/schema.graphql.dart';
import 'package:mezcalmos/Shared/graphql/delivery_company/__generated/delivery_company.graphql.dart';
import 'package:mezcalmos/Shared/graphql/hasuraTypes.dart';
import 'package:mezcalmos/Shared/helpers/ErrorHandlingHelpers.dart';
import 'package:mezcalmos/Shared/models/Services/DeliveryCompany/DeliveryCompany.dart';
import 'package:mezcalmos/Shared/models/Services/Service.dart';
import 'package:mezcalmos/Shared/models/User.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';

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
      info: ServiceInfo(
        hasuraId: data.id,
        image: data.image,
        description: (data.description?.translations != null)
            ? toLanguageMap(translations: data.description!.translations)
            : null,
        descriptionId: data.description_id,
        location:
            Location.fromLocationData(Location.buildLocationData(33.2, 44.5)),
        name: data.name,
      ),
      state: ServiceState(
          data.open_status.toString().toServiceStatus(), data.approved),
      primaryLanguage: LanguageType.EN);
}

Future<DeliveryCompany?> update_delivery_company(
    {required int companyId, required DeliveryCompany deliveryCompany}) async {
  final QueryResult<Mutation$updateDeliveryCompany> res =
      await _hasuraDb.graphQLClient.mutate$updateDeliveryCompany(
    Options$Mutation$updateDeliveryCompany(
      variables: Variables$Mutation$updateDeliveryCompany(
        id: companyId,
        data: Input$delivery_company_set_input(
            name: deliveryCompany.info.name,
            image: deliveryCompany.info.image,
            description_id: deliveryCompany.info.descriptionId,
            open_status: deliveryCompany.state.status.toFirebaseFormatString()),
      ),
    ),
  );
  if (res.parsedData?.update_delivery_company_by_pk == null) {
    throwError(res.exception);
  }
  final Mutation$updateDeliveryCompany$update_delivery_company_by_pk data =
      res.parsedData!.update_delivery_company_by_pk!;
  return DeliveryCompany(
      info: ServiceInfo(
        hasuraId: data.id,
        image: data.image,
        descriptionId: data.description_id,
        description: (data.description?.translations != null)
            ? toLanguageMap(translations: data.description!.translations)
            : null,
        location:
            Location.fromLocationData(Location.buildLocationData(33.2, 44.5)),
        name: data.name,
      ),
      state: ServiceState(
          data.open_status.toString().toServiceStatus(), data.approved),
      primaryLanguage: LanguageType.EN);
}
