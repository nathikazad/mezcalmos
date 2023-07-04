import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/controllers/custBusinessCartController.dart';
import 'package:mezcalmos/CustomerApp/models/BusinessCartItem.dart';
import 'package:mezcalmos/Shared/graphql/customer/businessCart/hsBusinessCart.dart';

class AdminOrderViewController extends CustBusinessCartController {
  Rxn<CustBusinessCart> currentOrderInView = Rxn<CustBusinessCart>();
  Rxn<int> currentOrderIdInView = Rxn<int>();
  Future<void> setCurrentOrderInView(int orderId) async {
    currentOrderIdInView.value = orderId;
    currentOrderInView.value = await get_business_order_request(
      orderId: orderId,
    );
  }
}
