import 'package:get/get.dart';
import 'package:graphql/client.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/__generated/schema.graphql.dart';
import 'package:mezcalmos/Shared/graphql/hasuraTypes.dart';
import 'package:mezcalmos/Shared/graphql/laundry/__generated/laundry.graphql.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Laundry.dart';
import 'package:mezcalmos/Shared/models/Services/Service.dart';
import 'package:mezcalmos/Shared/models/User.dart';
import 'package:mezcalmos/Shared/models/Utilities/DeliveryCost.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';
import 'package:mezcalmos/Shared/models/Utilities/PaymentInfo.dart';
import 'package:mezcalmos/Shared/models/Utilities/Schedule.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServiceProviderType.dart';

HasuraDb _db = Get.find<HasuraDb>();

Future<Laundry?> get_laundry_store_by_id(
    {required int id, bool withCache = true}) async {
  final QueryResult<Query$getLaundryStoreById> response =
      await _db.graphQLClient.query$getLaundryStoreById(
    Options$Query$getLaundryStoreById(
      fetchPolicy:
          withCache ? FetchPolicy.cacheAndNetwork : FetchPolicy.noCache,
      variables: Variables$Query$getLaundryStoreById(id: id),
    ),
  );

  if (response.parsedData?.laundry_store_by_pk == null) {
    throw Exception("🚨🚨🚨🚨 Hasura querry error : ${response.exception}");
  } else if (response.parsedData != null) {
    mezDbgPrint(
        "✅✅✅✅ Hasura querry success, data : ${response.parsedData?.laundry_store_by_pk?.toJson()} ");
    Query$getLaundryStoreById$laundry_store_by_pk data =
        response.parsedData!.laundry_store_by_pk!;
    final PaymentInfo paymentInfo = PaymentInfo();
    if (data.accepted_payments != null) {
      paymentInfo.acceptedPayments =
          paymentInfo.parseAcceptedPayments(data.accepted_payments);
    }
    if (data.stripe_info != null) {
      paymentInfo.stripe = paymentInfo.parseServiceStripeInfo(data.stripe_info);
    }
    mezDbgPrint(
        "response data ====> ${response.data} 🧺🧺🧺 laundry data ${data.schedule}");
    return Laundry(
        deliveryDetailsId: data.delivery_details_id!,
        deliveryCost: DeliveryCost(
          id: data.delivery_details_of_deliverer!.first.id,
          freeDeliveryMinimumCost: data
              .delivery_details_of_deliverer!.first.free_delivery_minimum_cost,
          costPerKm: data.delivery_details_of_deliverer!.first.cost_per_km,
          minimumCost: data.delivery_details_of_deliverer!.first.minimum_cost,
          freeDeliveryKmRange:
              data.delivery_details_of_deliverer!.first.free_delivery_km_range,
        ),
        userInfo: ServiceInfo(
            locationId: data.location_id,
            hasuraId: data.id,
            image: data.image,
            description: (data.description?.translations != null)
                ? {
                    data.description!.translations.first.language_id
                            .toLanguageType():
                        data.description!.translations.first.value,
                    data.description!.translations[1].language_id
                            .toLanguageType():
                        data.description!.translations[1].value,
                  }
                : null,
            name: data.name,
            descriptionId: data.description_id,
            location: MezLocation.fromHasura(
                data.location.gps, data.location.address)),
        schedule:
            data.schedule != null ? Schedule.fromData(data.schedule) : null,
        paymentInfo: paymentInfo,
        selfDelivery: data.self_delivery,
        averageNumberOfDays: data.normal_delivery_time,
        laundryState:
            ServiceState(data.open_status.toServiceStatus(), data.approved),
        primaryLanguage: data.language_id.toString().toLanguageType(),
        secondaryLanguage:
            data.language_id.toString().toLanguageType().toOpLang(),
        laundryCosts: LaundryCosts());
  } else
    return null;
}

Future<ServiceStatus?> get_laundry_status({required int laundryID}) async {
  final QueryResult<Query$getLaundryStatus> response =
      await _db.graphQLClient.query$getLaundryStatus(
    Options$Query$getLaundryStatus(
      fetchPolicy: FetchPolicy.networkOnly,
      variables: Variables$Query$getLaundryStatus(id: laundryID),
    ),
  );
  if (response.parsedData?.laundry_store_by_pk == null) {
    throw Exception(
        "🚨🚨🚨 Getting restaurant $laundryID status exception \n ${response.exception}");
  } else {
    return response.parsedData!.laundry_store_by_pk!.open_status
        .toServiceStatus();
  }
}

Future<bool?> get_laundry_approved({required int laundryID}) async {
  final QueryResult<Query$getLaundryStoreById> response =
      await _db.graphQLClient.query$getLaundryStoreById(
    Options$Query$getLaundryStoreById(
      fetchPolicy: FetchPolicy.networkOnly,
      variables: Variables$Query$getLaundryStoreById(id: laundryID),
    ),
  );
  if (response.parsedData?.laundry_store_by_pk == null) {
    throw Exception(
        "🚨🚨🚨 Getting restaurant $laundryID status exception \n ${response.exception}");
  } else {
    mezDbgPrint(
        "laundry approved =====> ✅ ${response.parsedData!.laundry_store_by_pk!.approved}");
    return response.parsedData!.laundry_store_by_pk!.approved;
  }
}

Future<ServiceStatus> update_laundry_status(
    {required int id, required ServiceStatus status}) async {
  final QueryResult<Mutation$updateLaundryInfo> response =
      await _db.graphQLClient.mutate$updateLaundryInfo(
    Options$Mutation$updateLaundryInfo(
      fetchPolicy: FetchPolicy.networkOnly,
      variables: Variables$Mutation$updateLaundryInfo(
        id: id,
        data: Input$laundry_store_set_input(
          open_status: status.toFirebaseFormatString(),
        ),
      ),
    ),
  );
  if (response.parsedData?.update_laundry_store_by_pk == null) {
    throw Exception(
        "🚨🚨🚨 Hasura status mutation exception =>${response.exception}");
  } else {
    mezDbgPrint("✅✅✅ Hasura mutation success => ${response.data}");
    Mutation$updateLaundryInfo$update_laundry_store_by_pk data =
        response.parsedData!.update_laundry_store_by_pk!;
    return data.open_status.toServiceStatus();
  }
}

Future<int> update_laundry_delivery_days(
    {required int id, required int days}) async {
  final QueryResult<Mutation$updateLaundryInfo> response =
      await _db.graphQLClient.mutate$updateLaundryInfo(
    Options$Mutation$updateLaundryInfo(
      fetchPolicy: FetchPolicy.networkOnly,
      variables: Variables$Mutation$updateLaundryInfo(
        id: id,
        data: Input$laundry_store_set_input(
          normal_delivery_time: days,
        ),
      ),
    ),
  );
  if (response.parsedData?.update_laundry_store_by_pk == null) {
    throw Exception(
        "🚨🚨🚨 Hasura days mutation exception =>${response.exception}");
  } else {
    mezDbgPrint("✅✅✅ Hasura mutation success => ${response.data}");
    Mutation$updateLaundryInfo$update_laundry_store_by_pk data =
        response.parsedData!.update_laundry_store_by_pk!;
    return data.normal_delivery_time;
  }
}

Future<List<LaundryCostLineItem>> get_laundry_categories(
    {required int storeId, bool withCache = true}) async {
  QueryResult<Query$getLaundryCategories> res = await _db.graphQLClient
      .query$getLaundryCategories(Options$Query$getLaundryCategories(
          fetchPolicy:
              withCache ? FetchPolicy.cacheAndNetwork : FetchPolicy.noCache,
          variables: Variables$Query$getLaundryCategories(storeId: storeId)));

  if (res.parsedData?.laundry_category == null) {
    throwError(res.exception);
  }
  return res.parsedData!.laundry_category
      .map((Query$getLaundryCategories$laundry_category element) {
    return LaundryCostLineItem(
        name: toLanguageMap(translations: element.name.translations),
        cost: element.cost_by_kilo,
        id: element.id,
        nameId: element.name_id,
        storeId: element.store_id);
  }).toList();
}

Future<LaundryCostLineItem> get_laundry_category_by_id(
    {required int categoryId, bool withCache = true}) async {
  QueryResult<Query$getLaundryCategoryById> res = await _db.graphQLClient
      .query$getLaundryCategoryById(Options$Query$getLaundryCategoryById(
          fetchPolicy:
              withCache ? FetchPolicy.cacheAndNetwork : FetchPolicy.noCache,
          variables:
              Variables$Query$getLaundryCategoryById(categoryId: categoryId)));

  if (res.parsedData?.laundry_category_by_pk == null) {
    throwError(res.exception);
  }
  Query$getLaundryCategoryById$laundry_category_by_pk data =
      res.parsedData!.laundry_category_by_pk!;

  return LaundryCostLineItem(
      name: toLanguageMap(translations: data.name.translations),
      cost: data.cost_by_kilo,
      id: data.id,
      nameId: data.name_id,
      storeId: data.store_id);
}

Future<int?> add_laundry_category(
    {required LaundryCostLineItem category, required int storeId}) async {
  QueryResult<Mutation$addLaundryCategory> res =
      await _db.graphQLClient.mutate$addLaundryCategory(
    Options$Mutation$addLaundryCategory(
      variables: Variables$Mutation$addLaundryCategory(
        data: Input$laundry_category_insert_input(
            name: Input$translation_obj_rel_insert_input(
              data: Input$translation_insert_input(
                service_provider_id: storeId,
                service_provider_type:
                    ServiceProviderType.Laundry.toFirebaseFormatString(),
                translations: Input$translation_value_arr_rel_insert_input(
                    data: <Input$translation_value_insert_input>[
                      Input$translation_value_insert_input(
                          language_id: LanguageType.EN.toFirebaseFormatString(),
                          value: category.name[LanguageType.EN]),
                      Input$translation_value_insert_input(
                          language_id: LanguageType.ES.toFirebaseFormatString(),
                          value: category.name[LanguageType.ES]),
                    ]),
              ),
            ),
            cost_by_kilo: category.cost.toDouble(),
            position: category.position,
            store_id: storeId),
      ),
    ),
  );
  if (res.parsedData?.insert_laundry_category_one == null) {
    mezDbgPrint("Exceptions 🛑=> ${res.exception}");
    throwError(res.exception);
  }
  return res.parsedData!.insert_laundry_category_one!.id;
}

Future<LaundryCostLineItem?> update_laundry_category(
    {required LaundryCostLineItem newCategory}) async {
  QueryResult<Mutation$updateLaundryCategory> res =
      await _db.graphQLClient.mutate$updateLaundryCategory(
    Options$Mutation$updateLaundryCategory(
      variables: Variables$Mutation$updateLaundryCategory(
        categoryId: newCategory.id,
        data: Input$laundry_category_set_input(
            cost_by_kilo: newCategory.cost.toDouble()),
      ),
    ),
  );

  if (res.parsedData?.update_laundry_category_by_pk == null) {
    throwError(res.exception);
  }
  Mutation$updateLaundryCategory$update_laundry_category_by_pk data =
      res.parsedData!.update_laundry_category_by_pk!;
  return LaundryCostLineItem(
      name: toLanguageMap(translations: data.name.translations),
      cost: data.cost_by_kilo,
      id: data.id,
      nameId: data.name_id,
      storeId: data.store_id);
}

Future<List<Laundry>> get_laundries({bool withCache = true}) async {
  QueryResult<Query$getLaundries> res = await _db.graphQLClient
      .query$getLaundries(Options$Query$getLaundries(
          fetchPolicy:
              withCache ? FetchPolicy.cacheAndNetwork : FetchPolicy.noCache));
  if (res.parsedData?.laundry_store == null) {
    throwError(res.exception);
  }
  List<Laundry> laundries = res.parsedData!.laundry_store
      .map((Query$getLaundries$laundry_store data) {
    final PaymentInfo paymentInfo = PaymentInfo();
    if (data.accepted_payments != null) {
      paymentInfo.acceptedPayments =
          paymentInfo.parseAcceptedPayments(data.accepted_payments);
    }
    if (data.stripe_info != null) {
      paymentInfo.stripe = paymentInfo.parseServiceStripeInfo(data.stripe_info);
    }
    mezDbgPrint(
        "response data ====> ${res.data} 🍔🍔🍔 Restaurant data ${data.schedule}");
    return Laundry(
        deliveryDetailsId: data.delivery_details_id!,
        deliveryCost: DeliveryCost(
          id: data.delivery_details_of_deliverer!.first.id,
          freeDeliveryMinimumCost: data
              .delivery_details_of_deliverer!.first.free_delivery_minimum_cost,
          costPerKm: data.delivery_details_of_deliverer!.first.cost_per_km,
          minimumCost: data.delivery_details_of_deliverer!.first.minimum_cost,
          freeDeliveryKmRange:
              data.delivery_details_of_deliverer!.first.free_delivery_km_range,
        ),
        userInfo: ServiceInfo(
            locationId: data.location_id,
            hasuraId: data.id,
            image: data.image,
            description: (data.description?.translations != null)
                ? {
                    data.description!.translations.first.language_id
                            .toLanguageType():
                        data.description!.translations.first.value,
                    data.description!.translations[1].language_id
                            .toLanguageType():
                        data.description!.translations[1].value,
                  }
                : null,
            name: data.name,
            descriptionId: data.description_id,
            location: MezLocation.fromHasura(
                data.location.gps, data.location.address)),
        schedule:
            data.schedule != null ? Schedule.fromData(data.schedule) : null,
        paymentInfo: paymentInfo,
        selfDelivery: data.self_delivery,
        averageNumberOfDays: data.normal_delivery_time,
        laundryState:
            ServiceState(data.open_status.toServiceStatus(), data.approved),
        primaryLanguage: data.language_id.toString().toLanguageType(),
        secondaryLanguage:
            data.language_id.toString().toLanguageType().toOpLang(),
        laundryCosts: LaundryCosts());
  }).toList();
  return laundries;
}
