import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/models/TaxiRequest.dart';
import 'package:mezcalmos/CustomerApp/pages/Taxi/TaxiOrderView/CustTaxiOrderView.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';

class TaxiConfirmOrderViewController {
  RxList<int> selectedCompanies = RxList.empty();
  RxNum estCost = RxNum(40);
  Rx<PaymentType> paymentType = Rx<PaymentType>(PaymentType.Cash);
  late TaxiRequest request;
  void init({required TaxiRequest request}) {
    this.request = request;
  }

  void confrimOrder() {
    final TaxiRequest newTaxiRequest = request;
    newTaxiRequest.estimatedPrice = estCost.value;
    newTaxiRequest.selectedCompanies = selectedCompanies;
    CustTaxiOrderView.navigate(orderId: 1, taxiRequest: newTaxiRequest);
  }
}
