import 'package:get/get.dart';
import 'package:graphql/client.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/__generated/schema.graphql.dart';
import 'package:mezcalmos/Shared/graphql/business_product/__generated/business_product.graphql.dart';
import 'package:mezcalmos/Shared/graphql/hasuraTypes.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Business/Business.dart';
import 'package:mezcalmos/Shared/models/Utilities/PaymentInfo.dart';

HasuraDb _db = Get.find<HasuraDb>();

Future<List<ProductCard>> get_product_by_category(
    {required List<ProductCategory1> categories1,
    required double distance,
    required Location fromLocation,
    List<String>? categories2,
    List<String>? tags,
    int? offset,
    int? limit,
    required bool withCache}) async {
  final List<ProductCard> _products = <ProductCard>[];

  final QueryResult<Query$get_product_by_category> response = await _db
      .graphQLClient
      .query$get_product_by_category(Options$Query$get_product_by_category(
          fetchPolicy:
              withCache ? FetchPolicy.cacheAndNetwork : FetchPolicy.networkOnly,
          variables: Variables$Query$get_product_by_category(
              categories1: categories1
                  .map((ProductCategory1 e) => e.toFirebaseFormatString())
                  .toList(),
              distance: distance,
              from: Geography(
                  fromLocation.lat.toDouble(), fromLocation.lng.toDouble()),
              categories2: categories2 ?? ["uncategorized"],
              tags: tags ?? [],
              offset: offset,
              limit: limit)));

  if (response.parsedData?.business_product != null) {
    response.parsedData?.business_product
        .forEach((Query$get_product_by_category$business_product data) async {
      _products.add(ProductCard(
          businessName: data.business.details.name,
          currency: data.business.details.currency.toCurrency(),
          product: Product(
            category1: data.details.category1.toProductCategory1(),
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
            ),
          )));
    });
    return _products;
  } else {
    return [];
  }
}

Future<ProductWithBusinessCard?> get_product_by_id(
    {required int id, required bool withCache}) async {
  final QueryResult<Query$get_product_by_id> response = await _db.graphQLClient
      .query$get_product_by_id(Options$Query$get_product_by_id(
          fetchPolicy:
              withCache ? FetchPolicy.cacheAndNetwork : FetchPolicy.networkOnly,
          variables: Variables$Query$get_product_by_id(id: id)));

  mezDbgPrint("[+] -> id : $id");
  if (response.parsedData?.business_product_by_pk == null) {
    throw Exception("🚨🚨🚨🚨 Hasura querry error : ${response.exception}");
  } else if (response.parsedData != null) {
    mezDbgPrint("✅✅✅✅ Hasura query success ");
    final Query$get_product_by_id$business_product_by_pk? data =
        response.parsedData?.business_product_by_pk!;

    if (data != null) {
      return ProductWithBusinessCard(
          product: Product(
              category1: data.details.category1.toProductCategory1(),
              details: BusinessItemDetails(
                id: id,
                nameId: data.details.name_id,
                descriptionId: data.details.description_id,
                name:
                    toLanguageMap(translations: data.details.name.translations),
                businessId: data.business.id,
                available: data.details.available,
                cost: constructBusinessServiceCost(data.details.cost),
                description: toLanguageMap(
                    translations: data.details.description?.translations ?? []),
                additionalParameters: data.details.additional_parameters,
                image: data.details.image
                        ?.map<String>((e) => e.toString())
                        .toList() ??
                    [],
              )),
          business: BusinessCard(
            id: data.business.id,
            detailsId: data.business.details.id,
            name: data.business.details.name,
            image: data.business.details.image,
            currency: data.business.details.currency.toCurrency(),
            acceptedPayments: PaymentInfo.fromData(
                    stripeInfo: {},
                    acceptedPayments: data.business.details.accepted_payments)
                .acceptedPayments,
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

Future<int?> get_number_of_products(
    {required double distance,
    required Location fromLocation,
    required bool withCache}) async {
  final QueryResult<Query$number_of_products> response = await _db.graphQLClient
      .query$number_of_products(Options$Query$number_of_products(
          fetchPolicy:
              withCache ? FetchPolicy.cacheAndNetwork : FetchPolicy.networkOnly,
          variables: Variables$Query$number_of_products(
              distance: distance,
              from: Geography(
                  fromLocation.lat.toDouble(), fromLocation.lng.toDouble()))));

  if (response.parsedData?.business_product_aggregate.aggregate != null) {
    return response.parsedData!.business_product_aggregate.aggregate!.count;
  } else if (response.hasException) {
    throw Exception("🚨🚨🚨🚨 Hasura querry error : ${response.exception}");
  } else {
    return null;
  }
}

Future<int?> add_one_product({required Product product}) async {
  // mezDbgPrint("Adding this product 🇹🇳 ${product.toJson()}");

  final QueryResult<Mutation$add_product> response = await _db.graphQLClient
      .mutate$add_product(Options$Mutation$add_product(
          variables: Variables$Mutation$add_product(
              object: Input$business_product_insert_input(
                  business_id: product.details.businessId.toInt(),
                  details: Input$business_item_details_obj_rel_insert_input(
                      data: Input$business_item_details_insert_input(
                          available: product.details.available,
                          category1: product.category1.toFirebaseFormatString(),
                          // category2: product.category2?.toFirebaseFormatString(),
                          cost: product.details.cost,
                          image: product.details.image,
                          name: Input$translation_obj_rel_insert_input(
                              data: Input$translation_insert_input(
                                  service_provider_id:
                                      product.details.businessId.toInt(),
                                  service_provider_type: ServiceProviderType
                                      .Business.toFirebaseFormatString(),
                                  translations:
                                      Input$translation_value_arr_rel_insert_input(
                                          data: <
                                              Input$translation_value_insert_input>[
                                        Input$translation_value_insert_input(
                                            language_id: Language.EN
                                                .toFirebaseFormatString(),
                                            value: product
                                                .details.name[Language.EN]),
                                        Input$translation_value_insert_input(
                                            language_id: Language.ES
                                                .toFirebaseFormatString(),
                                            value: product
                                                .details.name[Language.ES])
                                      ]))),
                          position: product.details.position?.toInt(),
                          additional_parameters:
                              product.details.additionalParameters,
                          description: (product.details.description != null)
                              ? Input$translation_obj_rel_insert_input(
                                  data: Input$translation_insert_input(
                                      service_provider_id:
                                          product.details.businessId.toInt(),
                                      service_provider_type: ServiceProviderType
                                          .Business.toFirebaseFormatString(),
                                      translations:
                                          Input$translation_value_arr_rel_insert_input(
                                              data: <Input$translation_value_insert_input>[
                                            Input$translation_value_insert_input(
                                                language_id: Language.EN
                                                    .toFirebaseFormatString(),
                                                value: product.details
                                                    .description?[Language.EN]),
                                            Input$translation_value_insert_input(
                                                language_id: Language.ES
                                                    .toFirebaseFormatString(),
                                                value: product.details
                                                    .description?[Language.ES])
                                          ])))
                              : null))))));
  if (response.hasException) {
    mezDbgPrint(
        "🚨🚨🚨 Hasura add product mutation exception =>${response.exception}");
  } else {
    mezDbgPrint("✅✅✅ Hasura add product mutation success => ${response.data}");
    return response.parsedData?.insert_business_product_one?.id;
  }
  return null;
}
