import 'package:get/get.dart';
import 'package:mezcalmos/Shared/graphql/business_rental/hsBusinessRental.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';

class AssetDetailsController {
  Rx<RentalWithBusiness?> assetData = Rx<RentalWithBusiness?>(null);
  Future<void> getAssetById(String id) async {
    var data = await get_rental_by_id(
      id: int.parse(id),
      withCache: true,
    );
    mezDbgPrint(
        "get_rental_by_id ${data?.toFirebaseFormattedJson()} ${data?.details.toFirebaseFormattedJson()}");
    if (assetData.value == null) {
      assetData.value = data;
    } else {
      assetData.value = data;
    }
  }
}
