import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/models/CustStripeInfo.dart';
import 'package:mezcalmos/CustomerApp/models/Customer.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/graphql/customer/hsCustomer.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';

class CustCardsListViewController {
  // instances //
  AuthController _authController = Get.find<AuthController>();

  // state variables //
  Rxn<CustStripeInfo> stripeInfo = Rxn();

  // getters //
  List<CreditCard> get cards => stripeInfo.value!.cards;

  Future<void> init() async {
    await fetchCards();
  }

  Future<void> fetchCards() async {
    try {
      stripeInfo.value = await get_customer_stripe_info(
          userId: _authController.hasuraUserId!, withCache: false);
      stripeInfo.refresh();
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
    stripeInfo.refresh();
    return true;
  }
}
