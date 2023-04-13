import 'package:get/get.dart';
import 'package:mezcalmos/Shared/graphql/business_rental/hsBusinessRental.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';

class AssetDetailsController {
  Rx<RentalWithBusiness?>? assetData = null;
  Future<void> getAssetById(String id) async {
    var data = await get_rental_by_id(
      id: int.parse(id),
      withCache: true,
    );
    mezDbgPrint("get_rental_by_id ${data?.details.name}");
    if (assetData == null) {
      assetData = data.obs;
    } else {
      assetData!.value = data;
    }
  }
}
