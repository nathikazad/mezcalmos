import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/controllers/customerAuthController.dart';
import 'package:mezcalmos/CustomerApp/models/Customer.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/CustomerApp/router/pickLocationRoutes.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:sizer/sizer.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';

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
      elevation: 1.0,
      margin: const EdgeInsets.all(8),
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
                  width: 4,
                ),
                Flexible(
                  fit: FlexFit.tight,
                  child: Text(savelocation.name.capitalizeFirst.toString(),
                      style: Get.textTheme.headlineMedium),
                ),
                InkWell(
                  onTap: () {
                    Get.find<CustomerAuthController>()
                        .setAsDefaultLocation(savelocation);
                  },
                  //borderRadius: BorderRadius.circular(16),
                  child: Ink(
                    // height: 25,
                    // width: Get.find<LanguageController>().userLanguageKey ==
                    //         LanguageType.EN
                    //     ? 20.w
                    //     : 28.w,
                    padding:
                        EdgeInsets.only(bottom: 2.5, right: 8, left: 8, top: 1),
                    decoration: BoxDecoration(
                        color: (savelocation.defaultLocation)
                            ? primaryBlueColor
                            : backgroundShadeColor,
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    child: Text(
                      '${_i18n()["defaultAddressText"]}',
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        color: (savelocation.defaultLocation)
                            ? Colors.white
                            : Color(0xFF787878),
                        fontWeight: FontWeight.w600,
                        fontSize: 11.sp,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 11,
                ),
                InkWell(
                  onTap: () {
                    MezRouter.toNamed<void>(
                      PickLocationRoutes.pickLocationEditRoute,
                      arguments: <String, String>{
                        // TODO:544D-HASURA
// added to.String()
                        "id": savelocation.id!.toString()
                      },
                    );
                  },
                  customBorder: CircleBorder(),
                  child: Ink(
                      // height: 3.h,
                      // width: 3.h,
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: backgroundShadeColor,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.edit_outlined,
                          color: Color(0xFF787878),
                          size: 15,
                        ),
                      )),
                ),
                SizedBox(
                  width: 11,
                ),
                InkWell(
                  onTap: () {
                    _customerAuthController.deleteLocation(savelocation);
                  },
                  customBorder: CircleBorder(),
                  child: Ink(
                      // height: 18,
                      // width: 3.h,
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: offRedColor,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.delete_outline,
                          color: Color(0xFFE21132),
                          size: 15,
                        ),
                      )),
                ),
              ],
            ),
            SizedBox(
              height: 4,
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(top: 5),
              child: Text(
                savelocation.location.address,
                style: Get.textTheme.titleMedium?.copyWith(
                  color: offShadeGreyColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(
              height: 4,
            ),
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
