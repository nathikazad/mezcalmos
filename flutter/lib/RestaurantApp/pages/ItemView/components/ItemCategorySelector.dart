import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/RestaurantApp/pages/ItemView/controllers/ItemViewController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Generic.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['LaundryApp']['pages']
    ['EditInfoView']['components']['LanguageSelectorComponent'];

class ROpItemCategorySelector extends StatelessWidget {
  const ROpItemCategorySelector({Key? key, required this.viewController})
      : super(key: key);

  final ItemViewController viewController;
  static final LanguageType userLanguage =
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
          value: viewController.currentCategory.value,
          onChanged: (Category? newValue) {
            if (newValue != null) {
              viewController.currentCategory.value = newValue;
            }
          },
          validator: (Category? value) {
            if (value == null) {
              return "Please select a category";
            } else {
              return null;
            }
          },
          items: viewController.categories
              .map<DropdownMenuItem<Category>>((Category value) {
            return DropdownMenuItem<Category>(
                value: value,
                // enabled: (widget.oppositeLanguageValue != null &&
                //     widget.oppositeLanguageValue!.value != value),
                child: Text(value.name![userLanguage] ?? "Category name error",
                    style: Get.textTheme.bodyText2?.copyWith(
                      fontWeight: FontWeight.w700,
                      // // color: (widget.oppositeLanguageValue != null &&
                      // //         widget.oppositeLanguageValue!.value == value)
                      //     ? Colors.grey
                      //     : Colors.black),
                    )));
          }).toList(),
        ),
      ),
    );
  }
}
