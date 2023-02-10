import 'package:get/get.dart';
import 'package:mezcalmos/Shared/graphql/laundry/hsLaundry.dart';
import 'package:mezcalmos/Shared/models/Services/Laundry.dart';

class LaundryOpAdminViewController {
// instances //

// vars //
  late int laundryStoreId;

// state vars //
  Rxn<Laundry> _laundry = Rxn();
  Rxn<List<LaundryCostLineItem>> _categories = Rxn();
  RxBool daysClicked = RxBool(false);
  RxnInt _days = RxnInt();

// getters //
  Laundry? get laundry => _laundry.value;
  List<LaundryCostLineItem>? get categories => _categories.value;
  int get days => _days.value ?? 0;

// streams //

// methods //
  Future<void> init({required int laundryId}) async {
    laundryStoreId = laundryId;

    _laundry.value = await get_laundry_store_by_id(id: laundryId);
    _days.value = _laundry.value!.averageNumberOfDays.toInt();
    await fetchCategories();
  }

  Future<void> fetchCategories() async {
    _categories.value =
        await get_laundry_categories(storeId: laundryStoreId, withCache: false);
  }

  Future<void> incrementDays() async {
    daysClicked.value = true;
    _days.value = await update_laundry_delivery_days(
        id: laundryStoreId, days: (_days.value! + 1));
    daysClicked.value = false;
  }

  Future<void> decrementDays() async {
    daysClicked.value = true;

    _days.value = await update_laundry_delivery_days(
        id: laundryStoreId, days: (_days.value! - 1));
    daysClicked.value = false;
  }
}
