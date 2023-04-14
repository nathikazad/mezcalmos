import 'package:get/get.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/graphql/business/hsBusiness.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';

class AgencyController {
  Rx<Business?> agencyStoreData = Rx<Business?>(null);

  Future<void> getAgencyStoreData(String id) async {
    var data = await get_business_by_id(
      id: int.parse(id),
      withCache: true,
    );
    mezDbgPrint(
        "get_business_by_id ${data?.rentals?.map((e) => mezDbgPrint(e.category1.name))}");
    if (agencyStoreData.value == null) {
      agencyStoreData.value = data;
    } else {
      agencyStoreData.value = data;
    }
  }

  Future<void> getAgencyInfoData() async {}
}
