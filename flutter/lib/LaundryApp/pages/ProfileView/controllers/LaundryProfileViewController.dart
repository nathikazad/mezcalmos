import 'package:get/get.dart';
import 'package:mezcalmos/Shared/graphql/laundry/hsLaundry.dart';
import 'package:mezcalmos/Shared/models/Services/Laundry.dart';

class LaundryProfileViewController {
  // instances //

// vars //
  late int laundryStoreId;

// state vars //
  Rxn<Laundry> _laundry = Rxn();

// getters //
  Laundry? get laundry => _laundry.value;

// streams //

// methods //
  Future<void> init({required int laundryId}) async {
    laundryStoreId = laundryId;

    _laundry.value = await get_laundry_store_by_id(id: laundryId);
  }
}
