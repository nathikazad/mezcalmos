/*
* Created By Mirai Devs.
* On 4/11/2022.
*/
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/LaundryApp/pages/AddCategoryScreen/controllers/addCategoryController.dart';

class AddCategorySlide extends StatelessWidget {
  const AddCategorySlide({
    Key? key,
    required this.categoryNameController,
    required this.categoryPricingController,
    required this.selectedTab,
  }) : super(key: key);

  final TextEditingController categoryNameController;
  final TextEditingController categoryPricingController;
  final SelectedTab selectedTab;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: <Widget>[
              Text(
                selectedTab != SelectedTab.Spanish
                    ? "Category name"
                    : "Category name in spanish ",
                style: textTheme.headline4,
              ),
              if (selectedTab != SelectedTab.English)
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(height: 6),
                    Text(
                      Get.find<AddCategoryController>()
                          .categoryNameControllerEnglish
                          .text,
                      style: textTheme.bodyText2,
                    ),
                  ],
                ),
              const SizedBox(height: 8),
              _CustomTextField(
                controller: categoryNameController,
                hint: 'Enter a category name...',
                showNext: selectedTab != SelectedTab.Spanish,
              ),
              const SizedBox(height: 16),
              if (selectedTab != SelectedTab.Spanish)
                Text(
                  "Category pricing per kilogramme",
                  style: textTheme.headline4,
                ),
              const SizedBox(height: 8),
              if (selectedTab != SelectedTab.Spanish)
                _CustomTextField(
                  controller: categoryPricingController,
                  hint: 'Enter category pricing per kilogramme...',
                ),
            ],
          ),
        ),
        TextButton(
            onPressed: () {},
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(8),
              child: Text("Add category"),
            ))
      ],
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
