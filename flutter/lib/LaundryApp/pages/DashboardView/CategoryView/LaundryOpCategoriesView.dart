import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/LaundryApp/pages/DashboardView/CategoryView/components/CategoryCard.dart';
import 'package:mezcalmos/LaundryApp/router.dart';

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
          TextButton(
              onPressed: () {
                Get.toNamed(kAddCategoryScreen);
              },
              child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(8),
                  child: Text('Add new category'))),
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
