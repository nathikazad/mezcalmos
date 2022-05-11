/*
* Created By Mirai Devs.
* On 4/11/2022.
*/
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/LaundryApp/controllers/laundryInfoController.dart';
import 'package:mezcalmos/LaundryApp/router.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Generic.dart';
import 'package:mezcalmos/Shared/models/Services/Laundry.dart';

class CategoryCard extends StatelessWidget {
  CategoryCard({
    Key? key,
    required this.laundryCostLineItem,
  }) : super(key: key);

  final LaundryCostLineItem laundryCostLineItem;
  final LanguageType userLanguage =
      Get.find<LanguageController>().userLanguageKey;
  final LaundryInfoController _laundryInfoController =
      Get.find<LaundryInfoController>();
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Card(
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              laundryCostLineItem.name[userLanguage] ?? "",
              style: textTheme.bodyText1,
            ),
            Spacer(),
            RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: '${laundryCostLineItem.cost}\$ ',
                    style: textTheme.bodyText1?.copyWith(
                      color: Theme.of(context).primaryColorLight,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextSpan(
                    text: ' /kg',
                    style: textTheme.bodyText2?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 5,
            ),
            IconButton(
                padding: EdgeInsets.zero,
                splashRadius: 25,
                iconSize: 25,
                onPressed: () {
                  final String? categoryId = laundryCostLineItem.name[
                      _laundryInfoController.laundry.value!.primaryLanguage];
                  if (categoryId != null) {
                    Get.toNamed(getCategoryEditRoute(categoryId));
                  }
                },
                icon: Icon(
                  Icons.edit,
                  color: keyAppColor,
                ))
          ],
        ),
      ),
    );
  }
}
