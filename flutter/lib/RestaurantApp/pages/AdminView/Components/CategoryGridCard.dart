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

class CategoryGridCard extends StatefulWidget {
  const CategoryGridCard({Key? key, required this.item}) : super(key: key);
  final LaundryCostLineItem item;

  @override
  State<CategoryGridCard> createState() => _CategoryGridCardState();
}

class _CategoryGridCardState extends State<CategoryGridCard> {
  final LanguageType userLanguage =
      Get.find<LanguageController>().userLanguageKey;
  LaundryInfoController laundryInfoController =
      Get.find<LaundryInfoController>();
  late LanguageType primaryLang;
  RxBool nameMissing = RxBool(false);
  late LanguageType? secondaryLang;
  @override
  void initState() {
    primaryLang = laundryInfoController.laundry.value!.primaryLanguage;
    secondaryLang = laundryInfoController.laundry.value!.secondaryLanguage;
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
              if (nameMissing.isTrue)
                Container(
                  alignment: Alignment.topRight,
                  child: Tooltip(
                    message: "${_i18n()["nameTooltip"]}",
                    triggerMode: TooltipTriggerMode.tap,
                    child: Icon(
                      Icons.help,
                      size: 18,
                      color: Colors.red,
                    ),
                  ),
                ),
              Flexible(
                child: Text(
                  _getRightName(),
                  style: Get.textTheme.bodyText1,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text("\$${widget.item.cost}/Kg"),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    customBorder: CircleBorder(),
                    onTap: () {
                      Get.toNamed(getCategoryEditRoute(widget.item.id));
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
                        await deleteCategory(item: widget.item)
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

  String _getRightName() {
    final String availableName = widget.item.name[widget.item.name.keys.first]!;
    if (widget.item.name[primaryLang] != null) {
      nameMissing.value = false;
      return widget.item.name[primaryLang]!;
    } else {
      nameMissing.value = true;
      return availableName;
    }
  }
}
