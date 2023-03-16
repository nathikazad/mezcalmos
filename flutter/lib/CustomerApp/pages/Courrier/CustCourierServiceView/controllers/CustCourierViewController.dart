import 'package:get/get.dart';
import 'package:mezcalmos/Shared/graphql/delivery_company/hsDeliveryCompany.dart';
import 'package:mezcalmos/Shared/models/Services/DeliveryCompany/DeliveryCompany.dart';

class CustCourierServiceViewController {
  // instances //

  // states vars //
  Rxn<DeliveryCompany> _deliveryCompany = Rxn();

  // getters //
  bool get hasData => _deliveryCompany.value != null;
  DeliveryCompany get company => _deliveryCompany.value!;

  // methods //

  Future<void> init({required int companyId}) async {
    _deliveryCompany.value = await get_delivery_company(companyId: companyId);
  }

  void dispose() {}
}
