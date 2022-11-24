import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/RestaurantApp/pages/ItemView/controllers/ItemViewController.dart';
import 'package:mezcalmos/RestaurantApp/router.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Category.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["RestaurantApp"]
    ["pages"]["ROpItemView"]["components"]["ROpItemCategorySelector"];

class ROpItemCategorySelector extends StatefulWidget {
  const ROpItemCategorySelector({Key? key, required this.viewController})
      : super(key: key);

  final ROpItemViewController viewController;

  @override
  State<ROpItemCategorySelector> createState() =>
      _ROpItemCategorySelectorState();
}

class _ROpItemCategorySelectorState extends State<ROpItemCategorySelector> {
  final LanguageType userLanguage =
      Get.find<LanguageController>().userLanguageKey;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Obx(
        () => DropdownButtonFormField<Category>(
          decoration: InputDecoration(
            filled: true,
            isDense: false,
            fillColor: Colors.grey.shade200,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide.none),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide.none),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide.none),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide.none),
            label: Text("${_i18n()["none"]}"),
            floatingLabelBehavior: FloatingLabelBehavior.never,
          ),
          value: widget.viewController.currentCategory.value,
          onChanged: (Category? newValue) async {
            if (newValue != null) {
              if (newValue.id == "addNew") {
                // ignore: unawaited_futures
                final Category? newCat = await Get.toNamed(
                    getROpCategoryRoute(
                        restaurantId: widget
                            .viewController.restaurant.value!.info.firebaseId),
                    arguments: {"shouldSave": false}) as Category?;

                if (newCat != null) {
                  widget.viewController.categories.add(newCat);
                  widget.viewController.categories.refresh();
                  widget.viewController.newCategoryAdded.value = true;
                  widget.viewController.addNewCatgeory = newCat;
                  widget.viewController.currentCategory.value = newCat;

                  // widget.viewController.newCategoryAdded.value = true;
                  // widget.viewController.addedCatgeory.value = newCat;
                }
              } else {
                widget.viewController.currentCategory.value = newValue;
              }
            }
          },
          validator: (Category? value) {
            if (value == null) {
              return '${_i18n()["errorText"]}';
            } else {
              return null;
            }
          },
          items: widget.viewController.categories
              .map<DropdownMenuItem<Category>>((Category value) {
            return DropdownMenuItem<Category>(
                value: value,
                // enabled: (widget.oppositeLanguageValue != null &&
                //     widget.oppositeLanguageValue!.value != value),
                child: Text(value.name![userLanguage] ?? "error",
                    style: Get.textTheme.bodyText2?.copyWith(
                      fontWeight: FontWeight.w700,
                    )));
          }).toList(),
        ),
      ),
    );
  }
}
