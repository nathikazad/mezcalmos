import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/LaundryApp/pages/CategoryView/controllers/addCategoryController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Generic.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['LaundryApp']['pages']
    ['CategoryView']["components"]["AddCategorySlide"];

class AddCategorySlide extends StatelessWidget {
  const AddCategorySlide({
    Key? key,
    required this.addCategoryController,
    required this.selectedTab,
  }) : super(key: key);

  final AddCategoryController addCategoryController;
  final SelectedTab selectedTab;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              (selectedTab == SelectedTab.Primary)
                  ? "${_i18n()["categoryName"]}"
                  : "${_i18n()["categoryNameIn"]} ${addCategoryController.secondaryLang.value!.toLanguageName() ?? ""} ",
              style: textTheme.headline4,
            ),
            if (selectedTab != SelectedTab.Primary)
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 6),
                  Text(
                    _getRightController().text,
                    style: textTheme.bodyText2,
                  ),
                ],
              ),
            const SizedBox(height: 8),
            _categoryNameComponent(),
            const SizedBox(height: 16),
            if (selectedTab != SelectedTab.Secondary) _categoryPriceComponent(),
          ],
        ),
      ),
    );
  }

  TextFormField _categoryNameComponent() {
    return TextFormField(
      controller: _getRightController(),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (String? v) {
        if (v != null && v.isNotEmpty) {
          return null;
        } else {
          return "Please add a category name";
        }
      },
      decoration: InputDecoration(
        isDense: true,
        filled: true,
        fillColor: Colors.white,
        hintText: '${_i18n()["categoryNameHint"]}',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }

  Widget _categoryPriceComponent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${_i18n()["categoryPrice"]}",
          style: Get.textTheme.headline4,
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: addCategoryController.categoryPricingController,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (String? v) {
            if (v != null && v.isNotEmpty) {
              return null;
            } else {
              return "Please add a price ";
            }
          },
          decoration: InputDecoration(
            isDense: true,
            filled: true,
            fillColor: Colors.white,
            hintText: '${_i18n()["categoryPriceHint"]}',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
      ],
    );
  }

  TextEditingController _getRightController() {
    switch (selectedTab) {
      case SelectedTab.Primary:
        return addCategoryController.primaryCategoryNameController;

      case SelectedTab.Secondary:
        return addCategoryController.secondaryCategoryNameController;
    }
  }
}
