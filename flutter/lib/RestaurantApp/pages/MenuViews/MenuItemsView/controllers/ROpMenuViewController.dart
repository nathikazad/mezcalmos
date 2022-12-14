import 'dart:async';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/graphql/category/hsCategory.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Category.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Item.dart';

class ROpMenuViewController {
  /// Handles ui logic of the menu view inside the restaurant app
  /// NB : This class is a normal dart class no extends no inheritance
//  Contructor
  ROpMenuViewController();

// instances and streams subscriptions

  // state variables
  RxBool reOrderMode = RxBool(false);
  //main categories //
  RxList<Category> mainCategories = RxList<Category>([]);
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
    final List<Category>? _categories =
        await get_restaurant_categories_by_id(restaurnatId, withCache: false);
    if (_categories != null) {
      mainCategories.clear();
      mainCategories.value.addAll(_categories);
    }
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

  Future<void> saveReorder() async {
    for (int i = 0; i < rOcategories.length; i++) {
      // await restaurantInfoController!.editCategoryPosition(
      //     position: rOcategories[i].position, categoryId: rOcategories[i].id!);
      // for (int j = 0; j < rOcategories[i].items.length; j++) {
      //   await restaurantInfoController!.editItemPosition(
      //       position: rOcategories[i].items[j].position,
      //       categoryId: rOcategories[i].id!,
      //       itemId: rOcategories[i].items[j].id!);
      // }
    }
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
  Future<void> removeFromSpecials({required Item item}) async {
    //  await restaurantInfoController!.removeSpecial(item: item);
  }

  Future<void> addToSpecials({
    required Item item,
  }) async {
    //  await restaurantInfoController!.addToSpecials(item: item);
  }

  Future<void> switchSpecialItemAv(
      {required bool v,
      required String itemId,
      required bool isCurrent}) async {
    //  await restaurantInfoController!
    //      .switchSpecialItemAv(itemId: itemId, value: v, isCurrent: isCurrent);
  }
}