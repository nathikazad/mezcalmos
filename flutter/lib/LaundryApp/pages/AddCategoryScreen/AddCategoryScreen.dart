/*
* Created By Mirai Devs.
* On 4/11/2022.
*/
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/LaundryApp/pages/AddCategoryScreen/controllers/addCategoryController.dart';
import 'package:mezcalmos/LaundryApp/pages/AddCategoryScreen/components/AddCategoryAppBar.dart';

class AddCategoryScreen extends StatefulWidget {
  const AddCategoryScreen({Key? key}) : super(key: key);

  @override
  State<AddCategoryScreen> createState() => _AddCategoryScreenState();
}

class _AddCategoryScreenState extends State<AddCategoryScreen>
    with TickerProviderStateMixin {
  /// AddCategoryController
  final AddCategoryController _addCategoryController =
      Get.find<AddCategoryController>();

  @override
  void initState() {
    super.initState();
    _addCategoryController.tabController = TabController(
      vsync: this,
      length: 2,
    );
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    _addCategoryController.getTabs();
    _addCategoryController.getTabPages();
    return Scaffold(
      appBar: addCategoryAppBar(
        addCategoryController: _addCategoryController,
        textTheme: textTheme,
        context: context,
      ),
      body: TabBarView(
        controller: _addCategoryController.tabController,
        children: _addCategoryController.tabPages,
      ),
    );
  }
}
