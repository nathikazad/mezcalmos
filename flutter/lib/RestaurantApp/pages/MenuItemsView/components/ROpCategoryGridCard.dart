import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/RestaurantApp/controllers/restaurantInfoController.dart';
import 'package:mezcalmos/RestaurantApp/router.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/models/Services/Laundry.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["RestaurantApp"]
    ["pages"]["MenuItemsView"]["components"]["ROpCategoryGridCard"];

class ROpCategoryGridCard extends StatefulWidget {
  const ROpCategoryGridCard({Key? key, required this.category})
      : super(key: key);
  final Category category;

  @override
  State<ROpCategoryGridCard> createState() => _ROpCategoryGridCardState();
}

class _ROpCategoryGridCardState extends State<ROpCategoryGridCard> {
  final LanguageType userLanguage =
      Get.find<LanguageController>().userLanguageKey;
  RestaurantInfoController restaurantInfoController =
      Get.find<RestaurantInfoController>();
  late LanguageType primaryLang;
  RxBool nameMissing = RxBool(false);
  late LanguageType? secondaryLang;
  @override
  void initState() {
    primaryLang = restaurantInfoController.restaurant.value!.primaryLanguage;
    secondaryLang =
        restaurantInfoController.restaurant.value!.secondaryLanguage;
    _getRightName();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(
                width: 1,
                color: nameMissing.value
                    ? Colors.redAccent
                    : Colors.grey.shade100)),
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Text(
                  _getRightName(),
                  style: Get.textTheme.bodyText1,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    customBorder: CircleBorder(),
                    onTap: () {
                      Get.toNamed(getCategoryEditRoute(widget.category.id!));
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
                        // ignore: unawaited_futures
                        restaurantInfoController
                            .deleteCategory(categoryId: widget.category.id!)
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
      ),
    );
  }



  String _getRightName() {
    final String availableName =
        widget.category.name![widget.category.name!.keys.first]!;
    if (widget.category.name![primaryLang] != null) {
      nameMissing.value = false;
      return widget.category.name![primaryLang]!;
    } else {
      nameMissing.value = true;
      return availableName;
    }
  }
}
