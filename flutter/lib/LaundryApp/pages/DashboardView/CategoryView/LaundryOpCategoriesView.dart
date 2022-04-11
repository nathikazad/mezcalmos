import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/LaundryApp/pages/DashboardView/CategoryView/components/CategoryCard.dart';
import 'package:mezcalmos/LaundryApp/router.dart';
import 'package:mezcalmos/Shared/constants/global.dart';

class LaundryOpCategoriesView extends StatelessWidget {
  const LaundryOpCategoriesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Scrollbar(
      child: ListView(
        padding: const EdgeInsets.all(26),
        children: <Widget>[
          Text(
            "My categories",
            style: textTheme.headline3,
          ),
          const SizedBox(height: 26),
          SizedBox(
            height: 52,
            child: ElevatedButton(
              onPressed: () => Get.toNamed(kAddCategoryScreen),
              child: Text(
                "Add new category",
                style: textTheme.bodyText1?.copyWith(
                  color: Colors.white,
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(keyAppColor),
                elevation: MaterialStateProperty.all(0),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
          CategoryCard(title: 'Pulls', weight: '12', textTheme: textTheme),
          CategoryCard(title: 'Pantelons', weight: '12', textTheme: textTheme),
          CategoryCard(
            title: 'Category name ',
            weight: '12',
            textTheme: textTheme,
          ),
          CategoryCard(
            title: 'Category name ',
            weight: '12',
            textTheme: textTheme,
          ),
        ],
      ),
    );
  }
}
