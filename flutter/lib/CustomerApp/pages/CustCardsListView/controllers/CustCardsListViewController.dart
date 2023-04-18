import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/models/Customer.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/graphql/customer/stripe_cards/hsCustomerStripeCards.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';

class CustCardsListViewController {
  // instances //
  AuthController _authController = Get.find<AuthController>();

  // state variables //
  Rxn<List<CreditCard>> _cards = Rxn();

  // getters //
  bool get hasData => _cards.value != null;
  List<CreditCard> get cards => _cards.value!;

  Future<void> init() async {
   
    await fetchCards();
  }

  Future<void> fetchCards() async {
    try {
      _cards.value = await get_customer_cards(
          customerId: _authController.hasuraUserId!, withCache: false);
    } catch (e, stk) {
      mezDbgPrint(e);
      mezDbgPrint(stk);
    }
  }

  Future<bool> deleteCard({required String cardId}) async {
    // stripeInfo.value?.cards
    //     .removeWhere((CreditCard element) => element.id == cardId);
    // stripeInfo.value = await update_customer_stripe_info(
    //     stripeInfo: stripeInfo.value!,
    //     customer_id: _authController.hasuraUserId!);

    return true;
  }

  void dispose() {}
}
