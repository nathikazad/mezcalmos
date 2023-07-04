import 'package:get/get.dart';
import 'package:graphql/client.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/__generated/schema.graphql.dart';
import 'package:mezcalmos/Shared/graphql/service_provider/stripe_info/__generated/stripe_info.graphql.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';

HasuraDb _db = Get.find<HasuraDb>();

// Future<StripeInfo> add_stripe_info({required StripeInfo})

Future<bool> update_charge_fees_on_costumer({
  required int stripeId,
  required bool value,
}) async {
  QueryResult<Mutation$updateStripePaymentInfo> res =
      await _db.graphQLClient.mutate$updateStripePaymentInfo(
    Options$Mutation$updateStripePaymentInfo(
      fetchPolicy: FetchPolicy.networkOnly,
      variables: Variables$Mutation$updateStripePaymentInfo(
          data: Input$service_provider_stripe_info_set_input(
            charge_fees_on_customer: value,
          ),
          sp_id: stripeId),
    ),
  );
  if (res.parsedData?.update_service_provider_stripe_info_by_pk == null) {
    throwError(res.exception);
  }
  return res.parsedData!.update_service_provider_stripe_info_by_pk!
      .charge_fees_on_customer!;
}
