/*
* Created By Mirai Devs.
* On 4/11/2022.
*/
import 'package:flutter/material.dart';
import 'package:mezcalmos/LaundryApp/pages/AddCategoryScreen/controllers/addCategoryController.dart';

class AddCategoryScreen extends StatefulWidget {
  const AddCategoryScreen({Key? key}) : super(key: key);

  @override
  State<AddCategoryScreen> createState() => _AddCategoryScreenState();
}

class _AddCategoryScreenState extends State<AddCategoryScreen>
    with TickerProviderStateMixin {
  /// AddCategoryController
  AddCategoryController _addCategoryController = AddCategoryController();

  @override
  void initState() {
    _addCategoryController.init();
    _addCategoryController.tabController = TabController(
      vsync: this,
      length: 2,
    );
    _addCategoryController.getTabs();

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
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text("Add category"),
        bottom: TabBar(
            controller: _addCategoryController.tabController,
            tabs: _addCategoryController.getTabs()),
      ),
      body: TabBarView(
        controller: _addCategoryController.tabController,
        children: _addCategoryController.tabPages(),
      ),
    );
  }
}
