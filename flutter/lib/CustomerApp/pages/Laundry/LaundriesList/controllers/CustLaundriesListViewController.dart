import 'package:get/get.dart';
import 'package:mezcalmos/Shared/graphql/laundry/hsLaundry.dart';
import 'package:mezcalmos/Shared/models/Services/Laundry.dart';

class CustLaundriesListViewController {
  // state vars //
  Rxn<List<Laundry>> laundries = Rxn();

  bool get hasData => laundries.value != null;

  // methods //

  Future<void> init() async {
    laundries.value = await get_laundries(withCache: false);
  }
}
