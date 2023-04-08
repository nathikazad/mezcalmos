import 'dart:async';

import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:mezcalmos/Shared/graphql/laundry/hsLaundry.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Laundry.dart';

class CustLaundriesListViewController {
  // state vars //
  Rxn<List<Laundry>> laundries = Rxn();

  bool get hasData => laundries.value != null;
  Rxn<LocationData> customerCurrentLocation = Rxn();

  // methods //

  Future<void> init() async {
    laundries.value = await get_laundries(withCache: false);
    mezDbgPrint("laundries =======>${laundries.value?.length}");
    unawaited(_getCustomerCurrentLocation());
  }

  Future<LocationData?> _getCustomerCurrentLocation() async {
    mezDbgPrint("Getting user current location 😕😀😕😀😕😀😕😀");
    try {
      LocationData res = await Location().getLocation();
      customerCurrentLocation.value = res;
      mezDbgPrint("Getting user current location 😕😀😕😀😕😀😕😀 =====>$res");
      return res;
    } on Exception catch (e) {
      showErrorSnackBar(errorText: e.toString());
    }
    return null;
  }
}
