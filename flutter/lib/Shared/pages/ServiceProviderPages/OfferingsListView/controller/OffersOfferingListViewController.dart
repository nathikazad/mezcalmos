import 'package:get/get.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';

import 'package:mezcalmos/Shared/pages/ServiceProviderPages/ServiceOfferEditView/controllers/ServiceOfferEditViewController.dart';

class OffersOfferingListViewController {
  RxList<OfferingData> allOfferings = RxList.empty();

  void init({
    List<OfferingData>? selectedOfferingData,
  }) {
    allOfferings.value = selectedOfferingData ?? [];
    mezDbgPrint("selectedOfferingData: ${selectedOfferingData?.length}");
  }

  void changeOfferingSelection({
    required OfferingData offeringData,
    required bool value,
  }) {
    allOfferings.firstWhere((element) => element.id == offeringData.id).value =
        value;
    allOfferings.refresh();
  }
}
