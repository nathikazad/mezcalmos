import 'package:get/get.dart';
import 'package:graphql/client.dart';
import 'package:mezcalmos/CustomerApp/models/Customer.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/customer/stripe_cards/__generated/customer_stripe_cards.graphql.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/thirdParty/StripeHelper.dart';

HasuraDb _db = Get.find<HasuraDb>();

Future<List<CreditCard>> get_customer_cards(
    {required int customerId, bool withCache = true}) async {
  QueryResult<Query$getCustomerCards> res = await _db.graphQLClient
      .query$getCustomerCards(Options$Query$getCustomerCards(
          fetchPolicy:
              withCache ? FetchPolicy.cacheAndNetwork : FetchPolicy.networkOnly,
          variables: Variables$Query$getCustomerCards(custId: customerId)));
  if (res.parsedData?.customer_stripe_cards == null) {
    throwError(res.exception);
  }
  List<Query$getCustomerCards$customer_stripe_cards> data =
      res.parsedData!.customer_stripe_cards;
  return data
      .map((Query$getCustomerCards$customer_stripe_cards card) => CreditCard(
          id: card.id,
          cardId: card.card_id,
          brand: card.brand.toString().toCardBrand() ?? CardBrand.Mastercard,
          expYear: card.exp_year!,
          expMonth: card.exp_month!,
          last4: card.last_4!))
      .toList();
}
