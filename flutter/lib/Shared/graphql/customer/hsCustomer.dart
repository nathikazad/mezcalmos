import 'package:get/get.dart';
import 'package:graphql/client.dart';
import 'package:mezcalmos/CustomerApp/models/Cart.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/customer/__generated/customer.graphql.dart';

final GraphQLClient _graphClient = Get.find<HasuraDb>().graphQLClient;

Future<void> set_customer_app_version(
    {required String appVersion, required int customerId}) async {
  QueryResult<Mutation$setCusAppVersion> _set_app_version =
      await _graphClient.mutate$setCusAppVersion(
    Options$Mutation$setCusAppVersion(
      variables: Variables$Mutation$setCusAppVersion(
        customer_id: customerId,
        version: appVersion,
      ),
    ),
  );
}

Future<Cart?> getCustomerCart({required int customerId}) async {
  Cart? cart;

  final QueryResult<Query$getCustomerCart> _hasura_cart =
      await _graphClient.query$getCustomerCart(
    Options$Query$getCustomerCart(
      variables: Variables$Query$getCustomerCart(customer_id: customerId),
    ),
  );

  if (_hasura_cart.parsedData != null) {}
}
