import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/LaundryApp/controllers/laundryInfoController.dart';
import 'package:mezcalmos/LaundryApp/router.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/models/Generic.dart';
import 'package:mezcalmos/Shared/models/Services/Laundry.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["LaundryApp"]["pages"]
    ["AdminView"]["components"]["CategoryGridCard"];

class CategoryGridCard extends StatelessWidget {
  const CategoryGridCard({Key? key, required this.item}) : super(key: key);
  final LaundryCostLineItem item;
  static final LanguageType userLanguage =
      Get.find<LanguageController>().userLanguageKey;
  static LaundryInfoController laundryInfoController =
      Get.find<LaundryInfoController>();
  static final LanguageType primaryLang =
      laundryInfoController.laundry.value!.primaryLanguage;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Text(
                item.name[primaryLang] ?? "",
                style: Get.textTheme.bodyText1,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text("\$${item.cost}/Kg"),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  customBorder: CircleBorder(),
                  onTap: () {
                    if (item.name[primaryLang] != null) {
                      Get.toNamed(
                          getCategoryEditRoute(item.name[primaryLang]!));
                    }
                  },
                  child: Ink(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200, shape: BoxShape.circle),
                    child: Icon(
                      Icons.edit_outlined,
                      size: 20,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                InkWell(
                  customBorder: CircleBorder(),
                  onTap: () {
                    showConfirmationDialog(context,
                        title: "${_i18n()["deleteTitle"]}",
                        helperText: "${_i18n()["deleteHelperText"]}",
                        primaryButtonText: "${_i18n()["yesDelete"]}",
                        onYesClick: () async {
                      await deleteCategory(item: item)
                          .then((value) => Get.back());
                    });
                  },
                  child: Ink(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.red.shade100, shape: BoxShape.circle),
                    child: Icon(
                      Icons.delete_outline,
                      size: 20,
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Future<void> deleteCategory({required LaundryCostLineItem item}) async {
    final List<LaundryCostLineItem> categories = [];
    final LaundryCosts laundryCosts =
        laundryInfoController.laundry.value!.laundryCosts;

    laundryInfoController.laundry.value!.laundryCosts.lineItems
        .forEach((LaundryCostLineItem element) {
      categories.add(element.copyWith());
    });

    categories.removeWhere((LaundryCostLineItem element) =>
        element.name[primaryLang] == item.name[primaryLang]);

    laundryCosts.lineItems = categories;

    await laundryInfoController.setCosts(laundryCosts);
  }
}
