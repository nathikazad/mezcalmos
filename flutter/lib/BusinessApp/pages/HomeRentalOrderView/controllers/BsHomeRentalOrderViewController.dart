import 'package:get/get.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/graphql/business_rental/hsBusinessRental.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';

class BsHomeRentalOrderViewController {
  Rxn<BusinessOrder> _order = Rxn<BusinessOrder>();
  RxBool _isLoading = false.obs;
  bool get isLoading => _isLoading.value;
  BusinessOrder? get order => _order.value;
  late int orderId;
  Future<void> init({required int orderId}) async {
    _isLoading.value = true;
    this.orderId = orderId;
    BusinessOrder? res = await get_home_rental_order_req(orderId: orderId);
    if (res == null) {
      showErrorSnackBar(
          errorText: "Invalid order id", duration: const Duration(seconds: 3));
    } else {
      _order.value = res;
      mezDbgPrint(_order.value!.toFirebaseFormattedJson());
    }
    _isLoading.value = false;
  }
}
