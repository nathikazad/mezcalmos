import 'package:get/get.dart';
import 'package:mezcalmos/BusinessApp/controllers/BusinessOpAuthController.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/graphql/business_rental/hsBusinessRental.dart';

class BsServicesListViewController {
  // instances //
  BusinessOpAuthController _businessOpAuthController =
      Get.find<BusinessOpAuthController>();

  // streams //

  // variables //

  // states variables //
  RxList<Rental> homeRentals = RxList.empty();

  // methods //
  Future<void> init() async {
    homeRentals.value.clear();
    homeRentals.value = await get_business_home_rentals(
      busniessId: _businessOpAuthController.companyId!,
      withCache: false,
    );
  }

  void dispose() {}
}
