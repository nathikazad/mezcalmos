/*
* Created By Mirai Devs.
* On 4/11/2022.
*/
import 'package:flutter/material.dart';
import 'package:mezcalmos/LaundryApp/pages/CategoryScreens/controllers/addCategoryController.dart';
import 'package:mezcalmos/Shared/models/Generic.dart';

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
              selectedTab != SelectedTab.Secondary
                  ? "Category name"
                  : "Category name in ${addCategoryController.secondaryLang.value!.toLanguageName() ?? ""} ",
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
            _CustomTextField(
              controller: selectedTab == SelectedTab.Primary
                  ? addCategoryController.primaryCategoryNameController
                  : addCategoryController.secondaryCategoryNameController,
              hint: 'Enter a category name...',
              showNext: selectedTab == SelectedTab.Secondary,
            ),
            const SizedBox(height: 16),
            if (selectedTab != SelectedTab.Secondary)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Category pricing per kilogramme",
                    style: textTheme.headline4,
                  ),
                  const SizedBox(height: 8),
                  _CustomTextField(
                    controller: addCategoryController.categoryPricingController,
                    hint: 'Enter category pricing per kilogramme...',
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

class _CustomTextField extends StatelessWidget {
  const _CustomTextField({
    Key? key,
    required this.controller,
    required this.hint,
    this.showNext = false,
  }) : super(key: key);

  final TextEditingController controller;
  final String hint;
  final bool showNext;

  @override
  Widget build(BuildContext context) {
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
