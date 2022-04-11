/*
* Created By Mirai Devs.
* On 4/11/2022.
*/
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/LaundryApp/pages/AddCategoryScreen/controllers/addCategoryController.dart';
import 'package:mezcalmos/Shared/constants/global.dart';

AppBar addCategoryAppBar({
  required AddCategoryController addCategoryController,
  required TextTheme textTheme,
  required BuildContext context,
}) {
  return AppBar(
    elevation: 0,
    centerTitle: true,
    backgroundColor: Colors.white,
    leading: IconButton(
      padding: EdgeInsets.zero,
      constraints: const BoxConstraints(),
      onPressed: () {
        Get.back<void>();
      },
      icon: Icon(Icons.arrow_back_ios),
    ),
    title: Text(
      'Add category',
      style: Get.theme.textTheme.headline3,
    ),
    bottom: TabBar(
      controller: addCategoryController.tabController,
      labelPadding: const EdgeInsets.symmetric(horizontal: 8),
      unselectedLabelColor: Colors.black,
      indicatorColor: Theme.of(context).primaryColorLight,
      labelStyle: textTheme.bodyText1?.copyWith(
        //  fontSize: 14,
        fontWeight: FontWeight.w700,
        height: .15,
      ),
      unselectedLabelStyle: textTheme.bodyText1?.copyWith(
        // fontSize: 14,
        fontWeight: FontWeight.w600,
        height: .15,
      ),
      tabs: addCategoryController.tabs,
    ),
  );
}
