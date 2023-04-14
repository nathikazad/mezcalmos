import 'package:get/get.dart';
import 'package:mezcalmos/Shared/graphql/business_rental/hsBusinessRental.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Business/Business.dart';

class AssetDetailsController {
  Rx<RentalWithBusinessCard?> assetData = Rx<RentalWithBusinessCard?>(null);
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
