import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/LaundryApp/pages/AdminView/controllers/LaundryOpAdminViewController.dart';
import 'package:mezcalmos/LaundryApp/router.dart';
import 'package:mezcalmos/Shared/MezRouter.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Laundry.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["LaundryApp"]["pages"]
    ["AdminView"]["components"]["CategoryGridCard"];

class CategoryGridCard extends StatefulWidget {
  const CategoryGridCard(
      {Key? key,
      required this.item,
      required this.laundry,
      required this.viewController})
      : super(key: key);
  final LaundryCostLineItem item;
  final Laundry laundry;
  final LaundryOpAdminViewController viewController;
  @override
  State<CategoryGridCard> createState() => _CategoryGridCardState();
}

class _CategoryGridCardState extends State<CategoryGridCard> {
  final LanguageType userLanguage =
      Get.find<LanguageController>().userLanguageKey;

  late LanguageType primaryLang;
  RxBool nameMissing = RxBool(false);
  late LanguageType? secondaryLang;
  @override
  void initState() {
    primaryLang = widget.laundry.primaryLanguage;
    secondaryLang = widget.laundry.secondaryLanguage;
    _getRightName();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              _getRightName().inCaps,
              style: Get.textTheme.displaySmall?.copyWith(fontSize: 12.sp),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
            ),
            Text("\$${widget.item.cost}/Kg"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  customBorder: CircleBorder(),
                  onTap: () async {
                    bool? refetch = await MezRouter.toNamed(getCategoryRoute(
                        laundryId: widget.laundry.info.hasuraId,
                        categoryId: widget.item.id)) as bool?;

                    mezDbgPrint("RESULT ======>$refetch");
                    if (refetch == true) {
                      await widget.viewController.fetchCategories();
                    }
                  },
                  child: Ink(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.grey.shade100, shape: BoxShape.circle),
                    child: Center(
                      child: Icon(
                        Icons.edit_outlined,
                        size: 22,
                        color: Color(0xFF5B5A5A),
                      ),
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
                          .then((value) => MezRouter.back());
                    });
                  },
                  child: Ink(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.red.shade100, shape: BoxShape.circle),
                    child: Center(
                      child: Icon(
                        Icons.delete_outline,
                        size: 22,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> deleteCategory({required LaundryCostLineItem item}) async {
    // Get.put(OpLaundryInfoController(), permanent: false);
    // final OpLaundryInfoController _laundryInfoController =
    //     Get.find<OpLaundryInfoController>();
    // final List<LaundryCostLineItem> categories = [];
    // final LaundryCosts laundryCosts = widget.laundry.laundryCosts;

    // widget.laundry.laundryCosts.lineItems
    //     .forEach((LaundryCostLineItem element) {
    //   categories.add(element.copyWith());
    // });

    // categories.removeWhere((LaundryCostLineItem element) =>
    //     element.name[primaryLang] == item.name[primaryLang]);

    // laundryCosts.lineItems = categories;

    // await _laundryInfoController.setCosts(
    //     laundryCosts: laundryCosts,
    //     laundryId: widget.laundry.info.hasuraId.toString());

    // await Get.delete<OpLaundryInfoController>(force: true);
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
