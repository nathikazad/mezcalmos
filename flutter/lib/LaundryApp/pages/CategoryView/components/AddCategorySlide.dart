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
              (selectedTab != SelectedTab.Secondary &&
                      addCategoryController.secondaryLang.value == null)
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
                    (selectedTab == SelectedTab.Secondary)
                        ? addCategoryController
                            .primaryCategoryNameController.text
                        : addCategoryController
                            .secondaryCategoryNameController.text,
                    style: textTheme.bodyText2,
                  ),
                ],
              ),
            const SizedBox(height: 8),
            _customTextInput(
              controller: selectedTab == SelectedTab.Primary
                  ? addCategoryController.primaryCategoryNameController
                  : addCategoryController.secondaryCategoryNameController,
              hint: '${_i18n()["categoryNameHint"]}',
              showNext: selectedTab == SelectedTab.Secondary,
            ),
            const SizedBox(height: 16),
            if (selectedTab != SelectedTab.Secondary)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${_i18n()["categoryPrice"]}",
                    style: textTheme.headline4,
                  ),
                  const SizedBox(height: 8),
                  _customTextInput(
                    controller: addCategoryController.categoryPricingController,
                    hint: '${_i18n()["categoryPriceHint"]}',
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }

  Widget _customTextInput({
    required TextEditingController controller,
    required String hint,
    bool showNext = false,
  }) {
    return SizedBox(
      height: 54,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          isDense: true,
          filled: true,
          fillColor: Colors.white,
          hintText: hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        textInputAction: showNext ? TextInputAction.next : TextInputAction.done,
      ),
    );
  }
}
