import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mezcalmos/LaundryApp/pages/CategoryView/components/AddCategorySlide.dart';
import 'package:mezcalmos/LaundryApp/pages/CategoryView/controllers/addCategoryController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Generic.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['LaundryApp']['pages']
    ['CategoryView'];

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
    categoryName = Get.parameters["categoryId"];

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
            child: Text((_addCategoryController.editMode.value)
                ? "${_i18n()["editCategory"]}"
                : "${_i18n()["addCategory"]}"),
          )),
    );
  }

  AppBar _addCategoryAppBar() {
    return AppBar(
      title: Text((_addCategoryController.editMode.value)
          ? _addCategoryController.copyOfCategory.value!.name[userLanguage]!
          : "${_i18n()["addCategory"]}"),
      actions: [
        if (_addCategoryController.editMode.value)
          IconButton(
              onPressed: () {
                _addCategoryController.deleteCategory();
              },
              icon: Icon(Ionicons.trash))
      ],
      bottom: (_addCategoryController.languages.value.length > 1)
          ? TabBar(
              controller: _addCategoryController.tabController,
              tabs: _getTabs())
          : null,
    );
  }

  Widget _getRightBody() {
    if (_addCategoryController.languages.value.length > 1) {
      return TabBarView(
        controller: _addCategoryController.tabController,
        children: _tabPages(),
      );
    } else {
      return AddCategorySlide(
          addCategoryController: _addCategoryController,
          selectedTab: SelectedTab.Primary);
    }
  }

  List<Tab> _getTabs() {
    return List.generate(
        _addCategoryController.languages.value.length,
        (int index) => Tab(
              text: _addCategoryController.languages.value[index]
                  .toLanguageName(),
            ));
  }

  List<Widget> _tabPages() {
    return List.generate(
        _addCategoryController.languages.value.length,
        (int index) => AddCategorySlide(
            addCategoryController: _addCategoryController,
            selectedTab: _getSelectedTabs(index)));
  }

  SelectedTab _getSelectedTabs(int index) {
    switch (index) {
      case 0:
        return SelectedTab.Primary;
      case 1:
        return SelectedTab.Secondary;
      default:
        return SelectedTab.Primary;
    }
  }
}
