import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/models/BusinessCartItem.dart';
import 'package:mezcalmos/Shared/cloudFunctions/index.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/graphql/customer/businessCart/hsBusinessCart.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';

class CustBusinessOrderViewController {
  Rxn<CustBusinessCart> currentOrderInView = Rxn<CustBusinessCart>();
  Rxn<int> currentOrderIdInView = Rxn<int>();
  bool get isCanceled => <BusinessOrderRequestStatus>[
        BusinessOrderRequestStatus.CancelledByBusiness,
        BusinessOrderRequestStatus.CancelledByCustomer
      ].contains(currentOrderInView.value!.status!);
  Future<void> setCurrentOrderInView(int orderId) async {
    currentOrderIdInView.value = orderId;
    currentOrderInView.value = await get_business_order_request(
      orderId: orderId,
    );
  }

  Future<void> acceptOrderRequest() async {
    await CloudFunctions.business_handleOrderRequestFromCustomer(
      orderRequestId: currentOrderIdInView.value!,
      newStatus: BusinessOrderRequestStatus.Confirmed,
    );
    showSavedSnackBar(
      title: "You have accepted the order request",
    );
  }

  Future<void> cancelOrderRequest() async {
    await CloudFunctions.business_handleOrderRequestFromCustomer(
      orderRequestId: currentOrderIdInView.value!,
      newStatus: BusinessOrderRequestStatus.CancelledByCustomer,
    );
    showSavedSnackBar(
      title: "You have cancelled the order request",
    );
  }
}

class AdminOrderViewController extends CustBusinessOrderViewController {
  Rxn<CustBusinessCart> currentOrderInView = Rxn<CustBusinessCart>();
  Rxn<int> currentOrderIdInView = Rxn<int>();
  Future<void> setCurrentOrderInView(int orderId) async {
    currentOrderIdInView.value = orderId;
    currentOrderInView.value = await get_business_order_request(
      orderId: orderId,
    );
  }
}
