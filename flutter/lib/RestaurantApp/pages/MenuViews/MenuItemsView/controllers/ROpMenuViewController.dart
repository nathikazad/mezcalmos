import 'dart:async';

import 'package:get/get.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart' as cModels;
import 'package:mezcalmos/Shared/graphql/category/hsCategory.dart';
import 'package:mezcalmos/Shared/graphql/item/hsItem.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Category.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Item.dart';
import 'package:mezcalmos/Shared/models/Utilities/ItemType.dart';

class ROpMenuViewController {
  /// Handles ui logic of the menu view inside the restaurant app
  /// NB : This class is a normal dart class no extends no inheritance
//  Contructor
  ROpMenuViewController();

// instances and streams subscriptions

  // state variables
  RxBool reOrderMode = RxBool(false);
  RxBool fetching = RxBool(false);
  //main categories //
  RxList<Category> mainCategories = RxList<Category>([]);
  RxList<Item> currentSpec = RxList<Item>([]);
  RxList<Item> pastSpec = RxList<Item>([]);
  Rx<Category> noCategory = Rx<Category>(Category());
// rO stands for Reordable categories //
  RxList<Category> rOcategories = RxList<Category>([]);
  late int restaurnatId;
  RxBool pageLoaded = RxBool(false);
// IMPORTANT //
  // This method needs to be called on the initState method of the view
  Future<void> init({required int restId}) async {
    restaurnatId = restId;
    // assigning restaurant data and start the stream subscription //
    mezDbgPrint("INIT MENU VIEW FROM CONTROLLER =======>$restaurnatId");
    await fetchCategories();
    pageLoaded.value = true;
    mezDbgPrint("Main Categories length ====>${mainCategories.length}");
  }

  Future<void> fetchCategories() async {
    fetching.value = true;
    final List<Item> itemsWithNoCat =
        await get_restaurant_items_without_cat(restaurnatId, withCache: false);

    final List<Category>? _categories =
        await get_restaurant_categories_by_id(restaurnatId, withCache: false);
    noCategory.value.items.clear();
    noCategory.value.items = itemsWithNoCat
        .where((Item element) => element.itemType != cModels.ItemType.Special)
        .toList();
    noCategory.refresh();
    if (_categories != null) {
      mainCategories.clear();
      mainCategories.value.addAll(_categories);
    }
    fetching.value = false;
  }

  Future<void> fetchSpecials() async {
    mezDbgPrint("Fetching specials again ==========>>>🚀🚀🚀🚀🚀🚀");
    final List<Item> spc =
        await get_restaurant_special_items(restaurnatId, withCache: false);
    mezDbgPrint("Fetching specials==========>>>🚀🚀🚀🚀🚀🚀 ${spc.length}");

    currentSpec.value = spc
        .where((Item element) =>
            (element.endsAt!.toLocal().isAfter(DateTime.now().toLocal()) ||
                element.endsAt!
                    .toLocal()
                    .isAtSameMomentAs(DateTime.now().toLocal())))
        .toList();
    pastSpec.value = spc
        .where((Item element) =>
            !(element.endsAt!.toLocal().isAfter(DateTime.now().toLocal()) ||
                element.endsAt!
                    .toLocal()
                    .isAtSameMomentAs(DateTime.now().toLocal())))
        .toList();
  }

  // IMPORTANT //
  // This method needs to be called on the dispose method of the view
  void dispose() {}

  // Catgeory methods //
  Future<bool> deleteCategory({required int categoryId}) async {
    mezDbgPrint("Deleting category ========>>>$categoryId");
    final bool result = await delete_category(categoryId);
    if (result) {
      await fetchCategories();
    }
    return result;
  }

  // Reorder methods //
// when user clicks on reorder button
  void startReoderMode() {
    if (reOrderMode.isFalse) {
      // sorting items first //
      for (int i = 0; i < mainCategories.length; i++) {
        rOcategories.add(mainCategories[i]);
        // sorting items inside category //
        for (int j = 0; j < rOcategories[i].items.length; j++) {
          rOcategories[i].items[j].position = j;
        }
      }

      reOrderMode.value = true;
    }
  }

  void rorderSingleItem(
      {required int catgeoryId, required int oldIndex, required int newIndex}) {
    Category category;

    mezDbgPrint("Reorder Item of old index : $oldIndex ");
    mezDbgPrint("To new index : $newIndex ");
    // getting category //
    category =
        rOcategories.firstWhere((Category element) => element.id == catgeoryId);

    // reorrdering //
    final Item currentItem = category.items.removeAt(oldIndex);
    category.items.insert(newIndex, currentItem);
    for (int i = 0; i < category.items.length; i++) {
      category.items[i].position = i;
    }

    rOcategories.refresh();
  }

  void rorderSingleCategory({required int oldIndex, required int newIndex}) {
    mezDbgPrint("Reorder Category of old index : $oldIndex ");
    mezDbgPrint("To new index : $newIndex ");
    // getting category //

    // reorrdering //
    final Category currentItem = rOcategories.removeAt(oldIndex);
    rOcategories.insert(newIndex, currentItem);
    for (int i = 0; i < rOcategories.length; i++) {
      rOcategories[i].position = i;
    }

    rOcategories.refresh();
  }

  Future<bool> saveReorder() async {
    try {
      final bool catRes =
          await update_category_positions(data: rOcategories.value);
      return catRes;
    } catch (e, stk) {
      showErrorSnackBar(errorText: e.toString());
      mezDbgPrint(stk);
      return false;
    }
  }

  void switchItemAv({
    required Item item,
    required bool value,
  }) {
    update_item_by_id(itemId: item.id!, item: item.copyWith(available: value))
        .then((bool value) =>
            item.isSpecial ? fetchSpecials() : fetchCategories());
  }

  // when user clicks on the back button on reorder mode
  void cancelReoderMode() {
    mezDbgPrint("Canceliing reorder mode");
    if (reOrderMode.isTrue) {
      rOcategories.clear();
      reOrderMode.value = false;
    }
  }

  // ----------------------------------------------------- Specials ----------------------------------------------------- //
}
