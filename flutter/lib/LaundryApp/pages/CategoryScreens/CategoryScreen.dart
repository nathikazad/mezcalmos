/*
* Created By Mirai Devs.
* On 4/11/2022.
*/
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mezcalmos/LaundryApp/pages/CategoryScreens/controllers/addCategoryController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Generic.dart';

class LaundryOpCategoryScreen extends StatefulWidget {
  const LaundryOpCategoryScreen({Key? key}) : super(key: key);

  @override
  State<LaundryOpCategoryScreen> createState() =>
      _LaundryOpCategoryScreenState();
}

class _LaundryOpCategoryScreenState extends State<LaundryOpCategoryScreen>
    with TickerProviderStateMixin {
  /// AddCategoryController
  AddCategoryController _addCategoryController = AddCategoryController();
  final LanguageType userLanguage =
      Get.find<LanguageController>().userLanguageKey;
  String? categoryName;

  @override
  void initState() {
    categoryName = Get.parameters["id"];
    mezDbgPrint("-------------->>> $categoryName");

    _addCategoryController.init(categoryId: categoryName);
    _addCategoryController.tabController = TabController(
      vsync: this,
      length: _addCategoryController.languages.value.length,
    );

    super.initState();
  }

  @override
  void dispose() {
    _addCategoryController.tabController?.dispose();
    _addCategoryController.tabController = null;

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _addCategoryAppBar(),
      body: _getRightBody(),
      bottomNavigationBar: _addCategoryFooterButton(),
    );
  }

  Widget _addCategoryFooterButton() {
    return Container(
      height: 60,
      child: TextButton(
          onPressed: () {
            _addCategoryController.handleFooterButtonClick();
          },
          style: TextButton.styleFrom(shape: RoundedRectangleBorder()),
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8),
            child: Text((_addCategoryController.copyOfCategory.value != null)
                ? "Edit Category"
                : "Add category"),
          )),
    );
  }

  AppBar _addCategoryAppBar() {
    return AppBar(
      title: Text((_addCategoryController.copyOfCategory.value != null)
          ? _addCategoryController.copyOfCategory.value!.name[userLanguage]!
          : "Add category"),
      actions: [
        if (_addCategoryController.copyOfCategory.value != null)
          IconButton(
              onPressed: () {
                _addCategoryController.deleteCategory();
              },
              icon: Icon(Ionicons.trash))
      ],
      bottom: (_addCategoryController.languages.value.length > 1)
          ? TabBar(
              controller: _addCategoryController.tabController,
              tabs: _addCategoryController.getTabs())
          : null,
    );
  }

  Widget _getRightBody() {
    if (_addCategoryController.languages.value.length > 1) {
      return TabBarView(
        controller: _addCategoryController.tabController,
        children: _addCategoryController.tabPages(),
      );
    } else {
      return _addCategoryController.getSingleLanguageView();
    }
  }
}
