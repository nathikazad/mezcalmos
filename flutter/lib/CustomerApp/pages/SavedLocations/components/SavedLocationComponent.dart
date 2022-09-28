import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/controllers/customerAuthController.dart';
import 'package:mezcalmos/CustomerApp/models/Customer.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
    ["pages"]["SavedLocations"]["components"]["SavedLocationComponent"];

class SavedLocationComponent extends StatelessWidget {
  const SavedLocationComponent({
    required this.savelocation,
    Key? key,
  }) : super(key: key);

  final SavedLocation savelocation;

  // final GestureTapCallback onPress;
  /// CustomerAuthController
  static final CustomerAuthController _customerAuthController =
      Get.find<CustomerAuthController>();

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(5),
      child: Container(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.place,
                  color: primaryBlueColor,
                  size: 18,
                ),
                SizedBox(
                  width: 3,
                ),
                Flexible(
                    fit: FlexFit.tight,
                    child: Text(
                      savelocation.name,
                      style: Get.textTheme.bodyText1,
                    )),
                InkWell(
                  onTap: () {
                    Get.find<CustomerAuthController>()
                        .setAsDefaultLocation(savelocation);
                  },
                  borderRadius: BorderRadius.circular(16),
                  child: Ink(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                    decoration: BoxDecoration(
                        color: (savelocation.defaultLocation)
                            ? primaryBlueColor
                            : Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(16)),
                    child: Text(
                      "Default",
                      style: Get.textTheme.bodyText2?.copyWith(
                          color: (savelocation.defaultLocation)
                              ? Colors.white
                              : Colors.black),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {
                    Get.toNamed<void>(
                      kPickLocationEditRoute,
                      parameters: <String, String>{"id": savelocation.id!},
                    );
                  },
                  customBorder: CircleBorder(),
                  child: Ink(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.edit_outlined,
                          color: Colors.black,
                          size: 17.sp,
                        ),
                      )),
                ),
                SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {
                    _customerAuthController.deleteLocation(savelocation);
                  },
                  customBorder: CircleBorder(),
                  child: Ink(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: offRedColor,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.delete_outline,
                          color: Colors.red,
                          size: 17.sp,
                        ),
                      )),
                ),
              ],
            ),
            if (savelocation.location != null)
              Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(top: 5),
                  child: Text(savelocation.location!.address))
          ],
        ),
      ),
    );
  }
}

class IconSavedLocationButton extends StatelessWidget {
  const IconSavedLocationButton({
    required this.iCon,
    required this.ontap,
    required this.title,
    required this.iconColor,
    Key? key,
  }) : super(key: key);

  final Widget iCon;
  final String title;
  final Color iconColor;
  final GestureTapCallback ontap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: const Color(0xffffffff),
        ),
        child: Row(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                color: iconColor,
                borderRadius: BorderRadius.circular(25),
              ),
              child: iCon,
            ),
            const SizedBox(width: 5),
            Flexible(
              //width: Get.width * 0.25,
              child: Text(
                "$title",
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ),
      onTap: ontap,
    );
  }
}
