import 'dart:async';

import 'package:get/get.dart';
import 'package:mezcalmos/RestaurantApp/controllers/restaurantInfoController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';

class ROpMenuViewController {
  /// Handles ui logic of the menu view inside the restaurant app
  /// NB : This class is a normal dart class no extends no inheritance
//  Contructor
  ROpMenuViewController();

// instances and streams subscriptions
  RestaurantInfoController _restaurantInfoController =
      Get.find<RestaurantInfoController>();
  StreamSubscription? _restaurantListener;

  // state variables
  Rxn<Restaurant> restaurant = Rxn<Restaurant>();
  RxBool reOrderMode = RxBool(false);
  // rO stands for Reordable categories //
  RxList<Category> rOcategories = RxList<Category>([]);

// IMPORTANT //
  // This method needs to be called on the initState method of the view
  void init() {
    // assigning restaurant data and start the stream subscription //
    restaurant.value = _restaurantInfoController.restaurant.value;
    _restaurantListener =
        _restaurantInfoController.restaurant.stream.listen((Restaurant? event) {
      if (event != null) {
        restaurant.value = event;
      } else {
        // TODO handles when the restaurant data comming from the stream is null //
      }
    });
  }

  // IMPORTANT //
  // This method needs to be called on the dispose method of the view
  void dispose() {
    _restaurantListener?.cancel();
  }

  // Reorder methods //
// when user clicks on reorder button
  void startReoderMode() {
    if (reOrderMode.isFalse) {
      // sorting items first //
      for (int i = 0; i < restaurant.value!.getCategories.length; i++) {
        rOcategories.add(restaurant.value!.getCategories[i]);
        // sorting items inside category //
        for (int j = 0; j < rOcategories[i].items.length; j++) {
          rOcategories[i].items[j].position = j;
        }
      }

      reOrderMode.value = true;
    }
  }

  void rorderSingleItem(
      {required String catgeoryId,
      required int oldIndex,
      required int newIndex}) {
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
      await _restaurantInfoController.editCategoryPosition(
          position: rOcategories[i].position, categoryId: rOcategories[i].id!);
      for (int j = 0; j < rOcategories[i].items.length; j++) {
        await _restaurantInfoController.editItemPosition(
            position: rOcategories[i].items[j].position,
            categoryId: rOcategories[i].id!,
            itemId: rOcategories[i].items[j].id!);
      }
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
    await _restaurantInfoController.removeSpecial(item: item);
  }

  Future<void> addToSpecials({required Item item}) async {
    await _restaurantInfoController.addToSpecials(item: item);
  }
}
